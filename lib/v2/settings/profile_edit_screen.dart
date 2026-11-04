import 'dart:typed_data';

import 'package:aipictors/v2/core/api.dart';
import 'package:aipictors/v2/core/design.dart';
import 'package:aipictors/v2/settings/settings_api.dart';
import 'package:aipictors/v2/settings/settings_widgets.dart';
import 'package:aipictors/v2/settings/status_sheet.dart';
import 'package:aipictors/v2/widgets/common.dart';
import 'package:aipictors/v2/widgets/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// プロフィールの編集（Web の /settings/profile）
class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  ProfileForm? _form;
  String? _error;
  bool _saving = false;
  Uint8List? _icon;
  Uint8List? _header;

  final _name = TextEditingController();
  final _bio = TextEditingController();
  final _enBio = TextEditingController();
  final _website = TextEditingController();
  final _mail = TextEditingController();
  final _twitter = TextEditingController();
  final _instagram = TextEditingController();
  final _github = TextEditingController();
  final _thankYou = TextEditingController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    for (final c in [_name, _bio, _enBio, _website, _mail, _twitter, _instagram, _github, _thankYou]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final f = await SettingsApi.profile();
      if (!mounted) return;
      setState(() {
        _form = f;
        _name.text = f.name;
        _bio.text = f.biography;
        _enBio.text = f.enBiography;
        _website.text = f.website;
        _mail.text = f.mail;
        _twitter.text = f.twitter;
        _instagram.text = f.instagram;
        _github.text = f.github;
        _thankYou.text = f.thankYou;
      });
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    }
  }

  Future<void> _pick({required bool icon}) async {
    try {
      final file = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: icon ? 800 : 2000,
        maxHeight: icon ? 800 : 2000,
        imageQuality: 90,
        requestFullMetadata: false,
      );
      if (file == null) return;
      final bytes = await file.readAsBytes();
      if (!mounted) return;
      setState(() {
        if (icon) {
          _icon = bytes;
        } else {
          _header = bytes;
        }
      });
    } catch (_) {
      if (mounted) context.toast('画像を読み込めませんでした。写真へのアクセスを確認してください', error: true);
    }
  }

  /// 画像の中身から種類を決める（端末によって JPEG 以外のまま返る）
  String _contentType(Uint8List b) {
    if (b.length > 3 && b[0] == 0x89 && b[1] == 0x50) return 'image/png';
    if (b.length > 11 && b[8] == 0x57 && b[9] == 0x45 && b[10] == 0x42 && b[11] == 0x50) return 'image/webp';
    return 'image/jpeg';
  }

  Future<void> _save() async {
    final f = _form;
    if (f == null || _saving) return;
    final name = _name.text.trim();
    if (name.isEmpty) {
      context.toast('名前を入力してください', error: true);
      return;
    }
    setState(() => _saving = true);
    try {
      final iconUrl = _icon == null ? null : await SettingsApi.uploadImage(_icon!, _contentType(_icon!));
      final headerUrl = _header == null ? null : await SettingsApi.uploadImage(_header!, _contentType(_header!));
      await SettingsApi.updateProfile({
        'displayName': name,
        'biography': _bio.text,
        'enBiography': _enBio.text,
        'homeUrl': _website.text.trim(),
        'mailAddress': _mail.text.trim(),
        'twitterAccountId': _twitter.text.trim(),
        'instagramAccountId': _instagram.text.trim(),
        'githubAccountId': _github.text.trim(),
        if (iconUrl != null) 'iconUrl': iconUrl,
        if (headerUrl != null) 'headerImageUrl': headerUrl,
        'featuredWorkIds': f.featuredIds,
        'featuredSensitiveWorkIds': f.featuredSensitiveIds,
      });
      if (_thankYou.text != f.thankYou) {
        await SettingsApi.updateSetting({'supportThankYouMessage': _thankYou.text});
      }
      if (!mounted) return;
      Ds.success();
      context.toast('プロフィールを更新しました');
      Navigator.of(context).maybePop(true);
    } on ApiException catch (e) {
      if (mounted) context.toast(e.message, error: true);
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final f = _form;
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィールを編集', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          TextButton(
            onPressed: f == null || _saving ? null : _save,
            child: Text(_saving ? '保存中…' : '保存', style: const TextStyle(fontWeight: FontWeight.w800)),
          ),
        ],
      ),
      body: f == null
          ? (_error != null
              ? Center(child: StateView.error(_error!, onRetry: _load))
              : const Padding(padding: EdgeInsets.all(Ds.s16), child: Column(children: [Skeleton(height: 150, radius: 18), SizedBox(height: Ds.s16), Skeleton(height: 56, radius: 14), SizedBox(height: Ds.s12), Skeleton(height: 120, radius: 14)])))
          : ContentWidth(
              child: ListView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.fromLTRB(Ds.s16, Ds.s8, Ds.s16, 60),
                children: [
                  _images(context, f),
                  const SizedBox(height: Ds.s8),
                  OutlinedButton.icon(
                    onPressed: () => showStatusSheet(context),
                    icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
                    label: const Text('ステータス（吹き出し）を設定'),
                  ),
                  const SizedBox(height: Ds.s16),
                  _field(_name, '名前', maxLength: 32),
                  _field(_bio, '自己紹介', maxLength: 320, lines: 5),
                  _field(_enBio, '自己紹介（英語）', maxLength: 640, lines: 3),
                  _field(_thankYou, '応援のお礼メッセージ', maxLength: 120, lines: 2),
                  Padding(
                    padding: const EdgeInsets.only(left: Ds.s4, top: Ds.s8, bottom: Ds.s12),
                    child: Text('リンク・連絡先', style: TextStyle(color: context.muted, fontWeight: FontWeight.w700, fontSize: 13)),
                  ),
                  _field(_website, 'Webサイト', maxLength: 1000, keyboard: TextInputType.url),
                  _field(_mail, 'メールアドレス', maxLength: 320, keyboard: TextInputType.emailAddress),
                  _field(_twitter, 'X（旧Twitter）', maxLength: 255),
                  _field(_instagram, 'Instagram', maxLength: 255),
                  _field(_github, 'GitHub', maxLength: 255),
                ],
              ),
            ),
    );
  }

  Widget _field(TextEditingController c, String label, {int? maxLength, int lines = 1, TextInputType? keyboard}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Ds.s8),
      child: TextField(
        controller: c,
        maxLength: maxLength,
        minLines: lines,
        maxLines: lines == 1 ? 1 : lines + 3,
        keyboardType: keyboard ?? (lines > 1 ? TextInputType.multiline : TextInputType.text),
        decoration: settingsField(context, label),
      ),
    );
  }

  Widget _images(BuildContext context, ProfileForm f) {
    const iconSize = 84.0;
    return SizedBox(
      height: 150 + iconSize / 2,
      child: Stack(children: [
        Positioned.fill(
          bottom: iconSize / 2,
          child: Pressable(
            scale: 0.99,
            onTap: () => _pick(icon: false),
            child: ClipRRect(
              borderRadius: Ds.br(18),
              child: Stack(fit: StackFit.expand, children: [
                if (_header != null)
                  Image.memory(_header!, fit: BoxFit.cover)
                else if (f.headerUrl != null)
                  AppImage(f.headerUrl, memCacheWidth: 900)
                else
                  const DecoratedBox(decoration: BoxDecoration(gradient: Ds.brandGradient)),
                const Positioned(right: Ds.s8, top: Ds.s8, child: _CameraBadge()),
              ]),
            ),
          ),
        ),
        Positioned(
          left: Ds.s16,
          bottom: 0,
          child: Pressable(
            onTap: () => _pick(icon: true),
            child: Stack(clipBehavior: Clip.none, children: [
              _icon != null
                  ? ClipOval(child: Image.memory(_icon!, width: iconSize, height: iconSize, fit: BoxFit.cover))
                  : UserAvatar(url: f.iconUrl, frame: f.frame, size: iconSize),
              const Positioned(right: -2, bottom: -2, child: _CameraBadge()),
            ]),
          ),
        ),
      ]),
    );
  }
}

class _CameraBadge extends StatelessWidget {
  const _CameraBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
      child: const Icon(Icons.photo_camera_rounded, color: Colors.white, size: 15),
    );
  }
}
