// 自動生成（aipictors/aipictors の app/utils/leave-survey.ts から tool/gen_leave_survey.ts で書き出し）。手で直さず Web 側を直して書き出し直す
// ignore_for_file: lines_longer_than_80_chars
part of 'leave_survey.dart';

const int leaveSurveyMinText = 5;

const List<LeaveSurveyReason> subscriptionLeaveReasons = [
  LeaveSurveyReason(value: 'not_using', label: ('あまり使わなかった', 'I didn\'t use it much'), groups: [
    LeaveSurveyGroup(id: 'why', question: ('あてはまるものを選んでください', 'Which of these apply?'), options: [
      LeaveSurveyOption('no_time', ('時間がなかった', 'I didn\'t have time')),
      LeaveSurveyOption('how_to', ('使い方が分からなかった', 'I didn\'t know how to use it')),
      LeaveSurveyOption('not_as_expected', ('思った絵が出なかった', 'I couldn\'t get the images I wanted')),
      LeaveSurveyOption('no_model', ('欲しいモデル・画風がなかった', 'The model or style I wanted wasn\'t there')),
      LeaveSurveyOption('for_posting', ('投稿・閲覧が目的だった', 'I mainly came to post or browse')),
      LeaveSurveyOption('forgot', ('加入していたのを忘れていた', 'I forgot I was subscribed')),
    ]),
  ]),
  LeaveSurveyReason(value: 'coins', label: ('コインが足りなかった', 'I ran out of coins'), groups: [
    LeaveSurveyGroup(id: 'why', question: ('どんなときに足りませんでしたか？', 'When did you run short?'), options: [
      LeaveSurveyOption('daily_short', ('毎日のコインがすぐなくなる', 'Daily coins run out quickly')),
      LeaveSurveyOption('hires_cost', ('高画質化・高解像度のコインが重い', 'Upscale / high resolution costs too much')),
      LeaveSurveyOption('special_model_cost', ('Flux・Gemini などのコインが重い', 'Special models (Flux, Gemini) cost too much')),
      LeaveSurveyOption('buy_expensive', ('コインを買い足すのが高い', 'Buying extra coins is expensive')),
    ]),
    LeaveSurveyGroup(id: 'price_ok', question: ('月いくらなら続けたいですか？', 'What monthly price would keep you?'), options: [
      LeaveSurveyOption('jpy300', ('300円くらい', 'About ¥300')),
      LeaveSurveyOption('jpy500', ('500円くらい', 'About ¥500')),
      LeaveSurveyOption('jpy1000', ('1,000円くらい', 'About ¥1,000')),
      LeaveSurveyOption('jpy2000', ('2,000円くらい', 'About ¥2,000')),
      LeaveSurveyOption('not_price', ('値段の問題ではない', 'It\'s not about the price')),
    ]),
  ]),
  LeaveSurveyReason(value: 'price', label: ('料金が高い', 'It\'s too expensive'), groups: [
    LeaveSurveyGroup(id: 'why', question: ('あてはまるものを選んでください', 'Which of these apply?'), options: [
      LeaveSurveyOption('budget', ('今は出費を減らしたい', 'I need to cut spending for now')),
      LeaveSurveyOption('value', ('内容に対して高い', 'Not worth the price')),
      LeaveSurveyOption('compare', ('ほかのサービスより高い', 'More expensive than other services')),
      LeaveSurveyOption('discount', ('年払い・割引があれば続けた', 'I\'d stay with a yearly plan or discount')),
    ]),
    LeaveSurveyGroup(id: 'price_ok', question: ('月いくらなら続けたいですか？', 'What monthly price would keep you?'), options: [
      LeaveSurveyOption('jpy300', ('300円くらい', 'About ¥300')),
      LeaveSurveyOption('jpy500', ('500円くらい', 'About ¥500')),
      LeaveSurveyOption('jpy1000', ('1,000円くらい', 'About ¥1,000')),
      LeaveSurveyOption('jpy2000', ('2,000円くらい', 'About ¥2,000')),
      LeaveSurveyOption('not_price', ('値段の問題ではない', 'It\'s not about the price')),
    ]),
  ]),
  LeaveSurveyReason(value: 'quality', label: ('生成の品質・不具合が気になった', 'Quality problems or bugs'), groups: [
    LeaveSurveyGroup(id: 'problem', question: ('どんなところが気になりましたか？', 'What bothered you?'), options: [
      LeaveSurveyOption('face_hand', ('顔や手が崩れる', 'Faces or hands look broken')),
      LeaveSurveyOption('errors', ('エラーで失敗した', 'Generations failed with errors')),
      LeaveSurveyOption('style', ('画風が合わない', 'The art style didn\'t suit me')),
      LeaveSurveyOption('prompt', ('プロンプト通りにならない', 'Results didn\'t follow my prompt')),
      LeaveSurveyOption('wait', ('待ち時間が長い', 'Long waits')),
      LeaveSurveyOption('feature', ('特定の機能がうまく動かない', 'A specific feature didn\'t work well')),
    ]),
    LeaveSurveyGroup(id: 'feature', question: ('どの機能ですか？', 'Which feature?'), showIf: ('problem', 'feature'), options: [
      LeaveSurveyOption('txt2img', ('ふつうの生成', 'Regular generation')),
      LeaveSurveyOption('img2img', ('画像から生成（i2i）', 'Image to image')),
      LeaveSurveyOption('inpaint', ('部分修正（インペイント）', 'Inpainting')),
      LeaveSurveyOption('upscale', ('高画質化・高解像度', 'Upscale / high resolution')),
      LeaveSurveyOption('controlnet', ('ポーズ指定（ControlNet）', 'Pose control (ControlNet)')),
      LeaveSurveyOption('lora', ('LoRA・みんなのモデル', 'LoRA / community models')),
      LeaveSurveyOption('special_model', ('Flux・Gemini などの特別なモデル', 'Special models (Flux, Gemini, etc.)')),
      LeaveSurveyOption('mosaic', ('自動モザイク', 'Auto mosaic')),
      LeaveSurveyOption('post', ('投稿・作品ページ', 'Posting / work pages')),
      LeaveSurveyOption('other_feature', ('その他', 'Other')),
    ]),
  ], text: LeaveSurveyText(label: ('どんな状況でしたか（任意）', 'What happened? (optional)'), placeholder: ('例: 高画質化すると毎回エラーになる', 'e.g. Upscaling always fails'), required: false)),
  LeaveSurveyReason(value: 'slow', label: ('生成が遅い・待ち時間が長い', 'Generation is slow or the wait is long'), groups: [
    LeaveSurveyGroup(id: 'when', question: ('どんなときに遅いと感じましたか？', 'When did it feel slow?'), options: [
      LeaveSurveyOption('always', ('いつも', 'Always')),
      LeaveSurveyOption('peak', ('夜など混む時間', 'Busy hours such as evenings')),
      LeaveSurveyOption('hires', ('高解像度・特定のモデルのとき', 'High resolution or specific models')),
      LeaveSurveyOption('queue', ('順番待ちが長い', 'Long queue before starting')),
    ]),
    LeaveSurveyGroup(id: 'acceptable', question: ('1 回の生成で待てるのはどれくらいですか？', 'How long can you wait per generation?'), options: [
      LeaveSurveyOption('wait_30s', ('30秒くらい', 'About 30 seconds')),
      LeaveSurveyOption('wait_1m', ('1分くらい', 'About 1 minute')),
      LeaveSurveyOption('wait_3m', ('3分くらい', 'About 3 minutes')),
    ]),
  ]),
  LeaveSurveyReason(value: 'one_month', label: ('1か月だけ使うつもりだった', 'I only planned to use it for a month'), groups: [
    LeaveSurveyGroup(id: 'purpose', question: ('何のために使いましたか？', 'What did you use it for?'), options: [
      LeaveSurveyOption('trial', ('お試し', 'Just trying it')),
      LeaveSurveyOption('event', ('イベント・企画に参加するため', 'To join an event or contest')),
      LeaveSurveyOption('project', ('作品・同人誌などの制作のため', 'For a project (artwork, doujinshi, etc.)')),
      LeaveSurveyOption('specific_model', ('特定のモデル・機能を使うため', 'To use a specific model or feature')),
      LeaveSurveyOption('bonus', ('コイン・特典のため', 'For coins or perks')),
    ]),
    LeaveSurveyGroup(id: 'comeback', question: ('また使うとしたら、何があればいいですか？', 'What would bring you back?'), options: [
      LeaveSurveyOption('new_models', ('新しいモデルが増えたら', 'New models')),
      LeaveSurveyOption('campaign', ('割引・キャンペーン', 'Discounts or campaigns')),
      LeaveSurveyOption('event', ('次のイベント', 'The next event')),
      LeaveSurveyOption('feature', ('欲しい機能が増えたら', 'Features I want')),
      LeaveSurveyOption('short_plan', ('数日だけのプラン', 'A plan for just a few days')),
      LeaveSurveyOption('no_plan', ('今のところ予定はない', 'No plans for now')),
    ]),
  ]),
  LeaveSurveyReason(value: 'other_service', label: ('ほかのサービスに移る', 'I\'m moving to another service'), groups: [
    LeaveSurveyGroup(id: 'dest', question: ('どこに移りますか？', 'Where are you moving to?'), options: [
      LeaveSurveyOption('novelai', ('NovelAI', 'NovelAI')),
      LeaveSurveyOption('nijijourney', ('にじジャーニー', 'niji・journey')),
      LeaveSurveyOption('midjourney', ('Midjourney', 'Midjourney')),
      LeaveSurveyOption('local', ('自分の PC（WebUI・ComfyUI など）', 'My own PC (WebUI, ComfyUI, etc.)')),
      LeaveSurveyOption('pixai', ('PixAI', 'PixAI')),
      LeaveSurveyOption('tensor', ('Tensor.Art', 'Tensor.Art')),
      LeaveSurveyOption('seaart', ('SeaArt', 'SeaArt')),
      LeaveSurveyOption('chatgpt', ('ChatGPT・Gemini などの画像生成', 'ChatGPT, Gemini, etc.')),
      LeaveSurveyOption('other_dest', ('その他', 'Other')),
    ]),
    LeaveSurveyGroup(id: 'why', question: ('そちらのどこが良かったですか？', 'What does it do better?'), options: [
      LeaveSurveyOption('quality_better', ('絵の品質', 'Image quality')),
      LeaveSurveyOption('cheaper', ('料金が安い', 'Cheaper')),
      LeaveSurveyOption('models', ('モデル・LoRA が多い', 'More models / LoRAs')),
      LeaveSurveyOption('freedom', ('制限が少ない', 'Fewer restrictions')),
      LeaveSurveyOption('speed', ('速い', 'Faster')),
      LeaveSurveyOption('community', ('投稿・交流の場がある', 'Better community / posting')),
      LeaveSurveyOption('friends', ('知り合いが使っている', 'My friends use it')),
    ]),
  ], text: LeaveSurveyText(label: ('サービス名・理由など（任意）', 'Service name or details (optional)'), placeholder: ('例: ○○の新しいモデルが使いたい', 'e.g. I want to try a new model on ...'), required: false)),
  LeaveSurveyReason(value: 'other', label: ('その他', 'Something else'), groups: [

  ], text: LeaveSurveyText(label: ('理由を教えてください', 'Please tell us why'), placeholder: ('例: しばらく忙しくなるため', 'e.g. I\'ll be busy for a while'), required: true)),
];

const List<LeaveSurveyReason> accountLeaveReasons = [
  LeaveSurveyReason(value: 'not_using', label: ('あまり使わなくなった', 'I don\'t use it much anymore'), groups: [
    LeaveSurveyGroup(id: 'why', question: ('あてはまるものを選んでください', 'Which of these apply?'), options: [
      LeaveSurveyOption('no_time', ('時間がない', 'I don\'t have time')),
      LeaveSurveyOption('lost_interest', ('AI イラストへの興味が薄れた', 'I lost interest in AI art')),
      LeaveSurveyOption('hard_to_use', ('使い方が分かりにくい', 'It\'s hard to use')),
      LeaveSurveyOption('only_generate', ('生成だけで十分だった', 'I only needed generation')),
    ]),
  ]),
  LeaveSurveyReason(value: 'privacy', label: ('身バレ・個人情報が心配', 'I\'m worried about privacy'), groups: [
    LeaveSurveyGroup(id: 'what', question: ('どんなことが心配ですか？', 'What worries you?'), options: [
      LeaveSurveyOption('known', ('知り合いに見られたくない', 'I don\'t want people I know to see it')),
      LeaveSurveyOption('works_public', ('作品を公開したままにしたくない', 'I don\'t want my works to stay public')),
      LeaveSurveyOption('ai_use', ('AI を使っていると知られたくない', 'I don\'t want people to know I use AI')),
      LeaveSurveyOption('data', ('データの扱いが心配', 'I\'m worried about how data is handled')),
    ]),
  ]),
  LeaveSurveyReason(value: 'harassment', label: ('嫌なコメント・やりとりがあった', 'I had unpleasant comments or interactions'), groups: [
    LeaveSurveyGroup(id: 'what', question: ('どこでありましたか？', 'Where did it happen?'), options: [
      LeaveSurveyOption('comments', ('コメント', 'Comments')),
      LeaveSurveyOption('messages', ('メッセージ', 'Messages')),
      LeaveSurveyOption('requests', ('リクエスト', 'Requests')),
      LeaveSurveyOption('repost', ('無断転載・なりすまし', 'Reposting or impersonation')),
      LeaveSurveyOption('outside', ('サイトの外（SNS など）', 'Outside the site (social media, etc.)')),
    ]),
  ], text: LeaveSurveyText(label: ('よければ状況を教えてください（任意）', 'Tell us what happened if you like (optional)'), placeholder: ('運営で確認して対応します', 'We\'ll look into it'), required: false)),
  LeaveSurveyReason(value: 'community', label: ('サイトの雰囲気・ルールが合わない', 'The atmosphere or rules don\'t suit me'), groups: [
    LeaveSurveyGroup(id: 'what', question: ('どんなところですか？', 'What exactly?'), options: [
      LeaveSurveyOption('rules', ('ルール・審査が厳しい', 'Rules or moderation are too strict')),
      LeaveSurveyOption('r18', ('R-18 作品が目に入る', 'I see too much R-18 content')),
      LeaveSurveyOption('ranking', ('ランキング・推しの雰囲気', 'Rankings or the support (oshi) culture')),
      LeaveSurveyOption('low_quality', ('作品の質が合わない', 'The works aren\'t my taste')),
      LeaveSurveyOption('ads', ('広告が多い', 'Too many ads')),
    ]),
  ]),
  LeaveSurveyReason(value: 'not_popular', label: ('作品を見てもらえない・反応が少ない', 'My works don\'t get seen or get little response'), groups: [
    LeaveSurveyGroup(id: 'why', question: ('あてはまるものを選んでください', 'Which of these apply?'), options: [
      LeaveSurveyOption('few_views', ('閲覧が少ない', 'Few views')),
      LeaveSurveyOption('few_likes', ('いいね・コメントが少ない', 'Few likes or comments')),
      LeaveSurveyOption('ranking', ('ランキングに載らない', 'I never make the rankings')),
      LeaveSurveyOption('discover', ('見つけてもらう方法が分からない', 'I don\'t know how to get discovered')),
    ]),
  ]),
  LeaveSurveyReason(value: 'quality', label: ('生成の品質・不具合が気になった', 'Quality problems or bugs'), groups: [
    LeaveSurveyGroup(id: 'problem', question: ('どんなところが気になりましたか？', 'What bothered you?'), options: [
      LeaveSurveyOption('face_hand', ('顔や手が崩れる', 'Faces or hands look broken')),
      LeaveSurveyOption('errors', ('エラーで失敗した', 'Generations failed with errors')),
      LeaveSurveyOption('style', ('画風が合わない', 'The art style didn\'t suit me')),
      LeaveSurveyOption('prompt', ('プロンプト通りにならない', 'Results didn\'t follow my prompt')),
      LeaveSurveyOption('wait', ('待ち時間が長い', 'Long waits')),
      LeaveSurveyOption('feature', ('特定の機能がうまく動かない', 'A specific feature didn\'t work well')),
    ]),
    LeaveSurveyGroup(id: 'feature', question: ('どの機能ですか？', 'Which feature?'), showIf: ('problem', 'feature'), options: [
      LeaveSurveyOption('txt2img', ('ふつうの生成', 'Regular generation')),
      LeaveSurveyOption('img2img', ('画像から生成（i2i）', 'Image to image')),
      LeaveSurveyOption('inpaint', ('部分修正（インペイント）', 'Inpainting')),
      LeaveSurveyOption('upscale', ('高画質化・高解像度', 'Upscale / high resolution')),
      LeaveSurveyOption('controlnet', ('ポーズ指定（ControlNet）', 'Pose control (ControlNet)')),
      LeaveSurveyOption('lora', ('LoRA・みんなのモデル', 'LoRA / community models')),
      LeaveSurveyOption('special_model', ('Flux・Gemini などの特別なモデル', 'Special models (Flux, Gemini, etc.)')),
      LeaveSurveyOption('mosaic', ('自動モザイク', 'Auto mosaic')),
      LeaveSurveyOption('post', ('投稿・作品ページ', 'Posting / work pages')),
      LeaveSurveyOption('other_feature', ('その他', 'Other')),
    ]),
  ]),
  LeaveSurveyReason(value: 'cost', label: ('料金・コインが合わない', 'Pricing or coins don\'t work for me'), groups: [
    LeaveSurveyGroup(id: 'what', question: ('あてはまるものを選んでください', 'Which of these apply?'), options: [
      LeaveSurveyOption('plan', ('有料プランが高い', 'Paid plans are expensive')),
      LeaveSurveyOption('coins', ('コインがすぐなくなる', 'Coins run out quickly')),
      LeaveSurveyOption('free_less', ('無料でできることが少ない', 'Not enough for free')),
    ]),
  ]),
  LeaveSurveyReason(value: 'other_service', label: ('ほかのサービスに移る', 'I\'m moving to another service'), groups: [
    LeaveSurveyGroup(id: 'dest', question: ('どこに移りますか？', 'Where are you moving to?'), options: [
      LeaveSurveyOption('novelai', ('NovelAI', 'NovelAI')),
      LeaveSurveyOption('nijijourney', ('にじジャーニー', 'niji・journey')),
      LeaveSurveyOption('midjourney', ('Midjourney', 'Midjourney')),
      LeaveSurveyOption('local', ('自分の PC（WebUI・ComfyUI など）', 'My own PC (WebUI, ComfyUI, etc.)')),
      LeaveSurveyOption('pixai', ('PixAI', 'PixAI')),
      LeaveSurveyOption('tensor', ('Tensor.Art', 'Tensor.Art')),
      LeaveSurveyOption('seaart', ('SeaArt', 'SeaArt')),
      LeaveSurveyOption('chatgpt', ('ChatGPT・Gemini などの画像生成', 'ChatGPT, Gemini, etc.')),
      LeaveSurveyOption('other_dest', ('その他', 'Other')),
    ]),
    LeaveSurveyGroup(id: 'why', question: ('そちらのどこが良かったですか？', 'What does it do better?'), options: [
      LeaveSurveyOption('quality_better', ('絵の品質', 'Image quality')),
      LeaveSurveyOption('cheaper', ('料金が安い', 'Cheaper')),
      LeaveSurveyOption('models', ('モデル・LoRA が多い', 'More models / LoRAs')),
      LeaveSurveyOption('freedom', ('制限が少ない', 'Fewer restrictions')),
      LeaveSurveyOption('speed', ('速い', 'Faster')),
      LeaveSurveyOption('community', ('投稿・交流の場がある', 'Better community / posting')),
      LeaveSurveyOption('friends', ('知り合いが使っている', 'My friends use it')),
    ]),
  ], text: LeaveSurveyText(label: ('サービス名・理由など（任意）', 'Service name or details (optional)'), placeholder: ('例: ○○の新しいモデルが使いたい', 'e.g. I want to try a new model on ...'), required: false)),
  LeaveSurveyReason(value: 'new_account', label: ('アカウントを作り直したい', 'I want to start a new account'), groups: [
    LeaveSurveyGroup(id: 'why', question: ('あてはまるものを選んでください', 'Which of these apply?'), options: [
      LeaveSurveyOption('rename', ('名前・ID を変えたい', 'I want a different name or ID')),
      LeaveSurveyOption('fresh', ('作品を整理して始め直したい', 'I want a fresh start')),
      LeaveSurveyOption('merge', ('別のアカウントにまとめたい', 'I want to merge into another account')),
    ]),
  ]),
  LeaveSurveyReason(value: 'other', label: ('その他', 'Something else'), groups: [

  ], text: LeaveSurveyText(label: ('理由を教えてください', 'Please tell us why'), placeholder: ('例: しばらく創作から離れるため', 'e.g. I\'m taking a break from creating'), required: true)),
];
