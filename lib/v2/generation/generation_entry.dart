import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// はじめての人向けの「かんたん入口」の保存まわり（Web の utils/generation-simple-entry.ts と同じ）
/// - 入口の選択（通常の画面で開くか）は端末に覚える
/// - 「生成する」を押したあとに生成を始めるプロンプトも置く（ログインをはさんでも消さない）
class GenEntry {
  GenEntry._();

  /// 'advanced'（通常の画面）か 'simple'（自分でかんたんを選んだ）。無ければ履歴の数で決める
  static const modeKey = 'v2.generation.entryMode';

  static const pendingKey = 'v2.generation.simpleEntry.pendingPrompt';

  /// ログインに時間がかかっても待つ長さ。過ぎたものは使わない（あとで急に生成が始まらないように）
  static const pendingTtl = Duration(minutes: 30);

  static Future<String?> readMode() async {
    try {
      return (await SharedPreferences.getInstance()).getString(modeKey);
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveMode(String mode) async {
    try {
      await (await SharedPreferences.getInstance()).setString(modeKey, mode);
    } catch (_) {
      // 保存できなくても入口は使える
    }
  }

  static Future<String?> readPending() async {
    try {
      final raw = (await SharedPreferences.getInstance()).getString(pendingKey);
      return parsePending(raw, DateTime.now().millisecondsSinceEpoch);
    } catch (_) {
      return null;
    }
  }

  static Future<void> savePending(String prompt) async {
    try {
      await (await SharedPreferences.getInstance()).setString(pendingKey, jsonEncode({'prompt': prompt, 'createdAt': DateTime.now().millisecondsSinceEpoch}));
    } catch (_) {
      // 保存できなくてもログイン後に入力し直せる
    }
  }

  static Future<void> clearPending() async {
    try {
      await (await SharedPreferences.getInstance()).remove(pendingKey);
    } catch (_) {
      // 保存できない環境では何もしない
    }
  }

  /// 保存しておいたプロンプトを読む。形が違うもの・古いものは null
  static String? parsePending(String? raw, int now) {
    if (raw == null) return null;
    try {
      final data = jsonDecode(raw);
      if (data is! Map) return null;
      final prompt = data['prompt'];
      final createdAt = data['createdAt'];
      if (prompt is! String || prompt.trim().isEmpty) return null;
      if (createdAt is! int) return null;
      if (now - createdAt > pendingTtl.inMilliseconds) return null;
      if (createdAt > now + 60 * 1000) return null;
      return prompt;
    } catch (_) {
      return null;
    }
  }
}

final _japanese = RegExp(r'[\p{Script=Hiragana}\p{Script=Katakana}\p{Script=Han}]', unicode: true);

/// 日本語を含むか（含むなら「日本語で入力する」をオンにして生成する。Web の containsJapanese と同じ）
bool containsJapanese(String text) => _japanese.hasMatch(text);

/// 作品の公開プロンプトを入力欄に入れる形にする（Web の toHomeExamplePrompt と同じ）
/// - LoRA などの指定（<lora:名前:1>）は外す（使える LoRA は人によって違う）
/// - 外したあとに残る空の区切り・余分な空白をまとめる
String toEntryExamplePrompt(String prompt) {
  return prompt
      .replaceAll(RegExp(r'<(?:lora|lyco|hypernet|embedding):[^>]*>', caseSensitive: false), '')
      .replaceAll(RegExp(r'[ \t]+'), ' ')
      .split(RegExp(r'\r?\n'))
      .map((line) => line.split(',').map((part) => part.trim()).where((part) => part.isNotEmpty).join(', '))
      .where((line) => line.isNotEmpty)
      .join('\n')
      .trim();
}

/// 作例の絞り込み（Web の home-works-where.ts と同じ）
class GenEntryFilter {
  const GenEntryFilter.popular() : kind = 'popular', tag = null;
  const GenEntryFilter.latest() : kind = 'latest', tag = null;
  const GenEntryFilter.tag(String this.tag) : kind = 'tag';

  final String kind;
  final String? tag;

  /// 並べるタグ（全年齢・プロンプト公開の生成作品がある程度あるもの）
  static const tags = <(String, String)>[
    ('女の子', 'Girls'),
    ('ファンタジー', 'Fantasy'),
    ('制服', 'Uniform'),
    ('メイド', 'Maid'),
    ('夜景', 'Night view'),
    ('猫', 'Cats'),
    ('和服', 'Kimono'),
    ('ロボット', 'Robots'),
    ('ちびキャラ', 'Chibi'),
  ];

  static const pageSize = 40;

  /// 「もっと見る」で読む最大のページ数（重い読み込みを続けないように）
  static const maxPages = 4;

  @override
  bool operator ==(Object other) => other is GenEntryFilter && other.kind == kind && other.tag == tag;

  @override
  int get hashCode => Object.hash(kind, tag);

  /// 期間を日単位（UTC）で区切って、同じ日のあいだは同じ条件にする（キャッシュが効く）
  static String _daysAgo(DateTime now, int days) {
    final u = now.toUtc();
    return DateTime.utc(u.year, u.month, u.day).subtract(Duration(days: days)).toIso8601String();
  }

  /// 全年齢・センシティブではない・Aipictors で生成した作品で、プロンプトを公開しているものだけ
  Map<String, dynamic> where(DateTime now) {
    const base = {
      'ratings': ['G'],
      'isSensitive': false,
      'isFeatured': true,
      'hasPrompt': true,
      'isPromptPublic': true,
    };
    return switch (kind) {
      'latest' => {...base, 'orderBy': 'DATE_CREATED', 'createdAtAfter': _daysAgo(now, 7)},
      'tag' => {
        ...base,
        'tagNames': [tag],
        'orderBy': 'LIKES_COUNT',
        'createdAtAfter': _daysAgo(now, 90),
      },
      _ => {...base, 'orderBy': 'LIKES_COUNT', 'createdAtAfter': _daysAgo(now, 30)},
    };
  }
}

/// かんたん入口の作例（Web の generation-simple-entry-examples.ts と同じ。作品が読めなかったときに出す）
class GenEntryExample {
  const GenEntryExample({required this.workId, required this.imageUrl, required this.width, required this.height, required this.title, required this.enTitle, required this.prompt});

  final String workId;
  final String imageUrl;
  final int width;
  final int height;
  final String title;
  final String enTitle;

  /// 押すと入力欄に入るプロンプト
  final String prompt;

  static const all = [
    GenEntryExample(
      workId: '361648',
      imageUrl: 'https://files.aipictors.com/0cc71f47-9301-453b-862f-1119564f7966',
      width: 410,
      height: 600,
      title: '水彩でお料理',
      enTitle: 'Watercolor cooking',
      prompt: 'kawaii, pastel colour, soft light, watercolor, cooking, girl, smile',
    ),
    GenEntryExample(
      workId: '285774',
      imageUrl: 'https://files.aipictors.com/8ab89afa-cedf-4ae6-bd07-aa7d7862f03c',
      width: 600,
      height: 1440,
      title: '宇宙の猫タワー',
      enTitle: 'Cat tower in space',
      prompt: 'chibi, many cute cats piled up on a cat tower, outer space, planets, stars, happy, smile',
    ),
    GenEntryExample(
      workId: '318306',
      imageUrl: 'https://files.aipictors.com/3f8a29c7-6cfc-4860-a68e-d29670bb6655',
      width: 400,
      height: 600,
      title: '宇宙旅行へ',
      enTitle: 'Off to space',
      prompt: 'kawaii, pastel colour, soft light, space travel, spaceship, earth in the background, girl, skirt, smile, waving, upper body',
    ),
    GenEntryExample(
      workId: '242233',
      imageUrl: 'https://files.aipictors.com/b28eb3a9-38cb-48d6-b62a-6ea284e7e39f',
      width: 400,
      height: 600,
      title: '雪の神社ときつね',
      enTitle: 'Fox at a snowy shrine',
      prompt: '1girl, fox ears, fox tail, shrine maiden outfit, torii gate, snowing, winter sunrise, gloves, smile',
    ),
    GenEntryExample(
      workId: '306511',
      imageUrl: 'https://files.aipictors.com/6aecae32-36cd-422b-b660-0b8a96484a0a',
      width: 600,
      height: 410,
      title: 'ケーキ屋さん',
      enTitle: 'Cake shop',
      prompt: 'cute cake shop, pastry chef costume, making sweets, strawberry cakes, warm light, happy, smile',
    ),
    GenEntryExample(
      workId: '263991',
      imageUrl: 'https://files.aipictors.com/7f5c1f7c-f008-42bb-be3a-f09196e030c1',
      width: 400,
      height: 600,
      title: '花びらの舞う丘',
      enTitle: 'Petals in the wind',
      prompt: '1girl, white dress, long hair, flower field, falling petals, looking up at the sky, windy, soft light',
    ),
    GenEntryExample(
      workId: '424807',
      imageUrl: 'https://files.aipictors.com/f0086f57-b57c-483f-9ec2-a6c078d60938',
      width: 410,
      height: 600,
      title: '海の見えるお寿司屋さん',
      enTitle: 'Sushi by the sea',
      prompt: '1girl, elf, black cat on head, sushi restaurant, plates of sushi and sashimi, ocean view from the window, summer sunlight, smile',
    ),
    GenEntryExample(
      workId: '508346',
      imageUrl: 'https://files.aipictors.com/5e37913f-835a-440b-8815-8bad7a35c6a5',
      width: 600,
      height: 410,
      title: '宇宙ねこ',
      enTitle: 'Space cat',
      prompt: '1girl, cat ears, pink space suit, cat ear space helmet, floating in space, galaxy, meteor shower, spread arms, smile',
    ),
  ];
}
