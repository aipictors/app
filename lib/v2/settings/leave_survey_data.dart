// 自動生成（aipictors/aipictors の app/utils/leave-survey.ts から tool/gen_leave_survey.ts で書き出し）。手で直さず Web 側を直して書き出し直す
// ignore_for_file: lines_longer_than_80_chars
part of 'leave_survey.dart';

const int leaveSurveyMinText = 10;

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
  ], text: LeaveSurveyText(label: ('使わなくなった理由を具体的に教えてください', 'Tell us more about why you didn\'t use it'), placeholder: ('例: 仕事が忙しく、週末に少し触っただけだった', 'e.g. Work got busy and I only tried it on weekends'), required: true)),
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
  ], text: LeaveSurveyText(label: ('どの機能を、どれくらい使うと足りなくなりましたか', 'Which features, and how much, before you ran out?'), placeholder: ('例: 高画質化を1日20回ほど使うと昼にはなくなる', 'e.g. About 20 upscales a day and I\'m out by noon'), required: true)),
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
  ], text: LeaveSurveyText(label: ('具体的に教えてください（比べたサービスや、続けられる金額など）', 'Tell us more (services you compared, a price you\'d pay, etc.)'), placeholder: ('例: 他社は同じ値段で生成し放題。月500円なら続けたい', 'e.g. Others offer unlimited generation for the same price'), required: true)),
  LeaveSurveyReason(value: 'image_quality', label: ('生成した絵の品質が合わなかった', 'The generated images weren\'t good enough'), groups: [
    LeaveSurveyGroup(id: 'problem', question: ('どんなところが気になりましたか？', 'What bothered you?'), options: [
      LeaveSurveyOption('face_hand', ('顔・手・体が崩れる', 'Faces, hands or bodies look broken')),
      LeaveSurveyOption('style', ('画風・絵柄が好みと違う', 'The art style isn\'t what I like')),
      LeaveSurveyOption('prompt', ('プロンプト通りにならない', 'Results didn\'t follow my prompt')),
      LeaveSurveyOption('low_res', ('画質が粗い・ぼやける', 'Images look rough or blurry')),
      LeaveSurveyOption('same', ('似た絵ばかり出る', 'Results all look the same')),
      LeaveSurveyOption('worse_than', ('ほかのサービスより見劣りする', 'Worse than other services')),
      LeaveSurveyOption('no_model', ('欲しいモデル・LoRA がない', 'The model or LoRA I wanted isn\'t there')),
    ]),
    LeaveSurveyGroup(id: 'genre', question: ('どんな絵を作りたかったですか？', 'What kind of images did you want?'), options: [
      LeaveSurveyOption('anime', ('アニメ・イラスト調', 'Anime / illustration')),
      LeaveSurveyOption('real', ('リアル・写真風', 'Realistic / photo')),
      LeaveSurveyOption('character', ('特定のキャラクター', 'A specific character')),
      LeaveSurveyOption('scenery', ('背景・風景', 'Backgrounds / scenery')),
      LeaveSurveyOption('r18', ('R-18', 'R-18')),
      LeaveSurveyOption('other_genre', ('その他', 'Other')),
    ]),
    LeaveSurveyGroup(id: 'feature', question: ('どの機能・モデルで気になりましたか？', 'With which feature or model?'), options: [
      LeaveSurveyOption('txt2img', ('ふつうの生成', 'Regular generation')),
      LeaveSurveyOption('img2img', ('画像から生成（i2i）', 'Image to image')),
      LeaveSurveyOption('inpaint', ('部分修正（インペイント）', 'Inpainting')),
      LeaveSurveyOption('upscale', ('高画質化・高解像度', 'Upscale / high resolution')),
      LeaveSurveyOption('controlnet', ('ポーズ指定（ControlNet）', 'Pose control (ControlNet)')),
      LeaveSurveyOption('lora', ('LoRA・みんなのモデル', 'LoRA / community models')),
      LeaveSurveyOption('special_model', ('Flux・Gemini などの特別なモデル', 'Special models (Flux, Gemini, etc.)')),
      LeaveSurveyOption('mosaic', ('自動モザイク', 'Auto mosaic')),
      LeaveSurveyOption('unknown', ('分からない・全体的に', 'Not sure / overall')),
    ]),
  ], text: LeaveSurveyText(label: ('作りたかった絵と、実際の仕上がりの違いを教えてください', 'How did the results differ from what you wanted?'), placeholder: ('例: アニメ調の全身絵で、指が6本になることが多い', 'e.g. Full-body anime images often had six fingers'), required: true)),
  LeaveSurveyReason(value: 'bugs', label: ('不具合・エラーで使えなかった', 'Bugs or errors got in the way'), groups: [
    LeaveSurveyGroup(id: 'symptom', question: ('どんな不具合でしたか？', 'What went wrong?'), options: [
      LeaveSurveyOption('gen_error', ('エラーで生成が失敗する', 'Generations fail with an error')),
      LeaveSurveyOption('stuck', ('生成が終わらない・途中で止まる', 'Generations never finish or get stuck')),
      LeaveSurveyOption('coin_lost', ('コインが減ったのに画像が出ない', 'Coins were spent but no image appeared')),
      LeaveSurveyOption('no_image', ('画像が表示されない・保存できない', 'Images don\'t show or can\'t be saved')),
      LeaveSurveyOption('ui_broken', ('画面が崩れる・ボタンが反応しない', 'The page breaks or buttons don\'t respond')),
      LeaveSurveyOption('app_crash', ('アプリが落ちる・固まる', 'The app crashes or freezes')),
      LeaveSurveyOption('login_pay', ('ログイン・支払いがうまくいかない', 'Problems with login or payment')),
      LeaveSurveyOption('post_fail', ('投稿・編集ができない', 'Can\'t post or edit works')),
    ]),
    LeaveSurveyGroup(id: 'feature', question: ('どの機能で起きましたか？', 'Which feature?'), options: [
      LeaveSurveyOption('txt2img', ('ふつうの生成', 'Regular generation')),
      LeaveSurveyOption('img2img', ('画像から生成（i2i）', 'Image to image')),
      LeaveSurveyOption('inpaint', ('部分修正（インペイント）', 'Inpainting')),
      LeaveSurveyOption('upscale', ('高画質化・高解像度', 'Upscale / high resolution')),
      LeaveSurveyOption('controlnet', ('ポーズ指定（ControlNet）', 'Pose control (ControlNet)')),
      LeaveSurveyOption('lora', ('LoRA・みんなのモデル', 'LoRA / community models')),
      LeaveSurveyOption('special_model', ('Flux・Gemini などの特別なモデル', 'Special models (Flux, Gemini, etc.)')),
      LeaveSurveyOption('mosaic', ('自動モザイク', 'Auto mosaic')),
      LeaveSurveyOption('post', ('投稿・作品ページ', 'Posting / work pages')),
      LeaveSurveyOption('payment', ('支払い・プラン', 'Payment / plans')),
      LeaveSurveyOption('other_feature', ('その他', 'Other')),
    ]),
    LeaveSurveyGroup(id: 'device', question: ('どの端末で使っていましたか？', 'Which device?'), options: [
      LeaveSurveyOption('pc_browser', ('パソコンのブラウザ', 'Computer browser')),
      LeaveSurveyOption('phone_browser', ('スマホのブラウザ', 'Phone browser')),
      LeaveSurveyOption('ios_app', ('iPhone アプリ', 'iPhone app')),
      LeaveSurveyOption('android_app', ('Android アプリ', 'Android app')),
    ]),
    LeaveSurveyGroup(id: 'frequency', question: ('どれくらい起きましたか？', 'How often did it happen?'), options: [
      LeaveSurveyOption('every_time', ('毎回', 'Every time')),
      LeaveSurveyOption('often', ('よく起きる', 'Often')),
      LeaveSurveyOption('sometimes', ('ときどき', 'Sometimes')),
      LeaveSurveyOption('once', ('1〜2回だけ', 'Once or twice')),
    ]),
  ], text: LeaveSurveyText(label: ('どの画面で何をしたら、どうなりましたか（エラーの文があれば）', 'What did you do, and what happened? (include any error message)'), placeholder: ('例: スマホで高画質化を押すと「生成に失敗しました」と出て、コインだけ減った', 'e.g. On my phone, upscaling showed "Generation failed" and still used coins'), required: true)),
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
  ], text: LeaveSurveyText(label: ('いつ・どのモデルで・どれくらい待ちましたか', 'When, with which model, and how long did you wait?'), placeholder: ('例: 夜21時ごろ、SDXL で1枚に5分以上かかった', 'e.g. Around 9pm, over 5 minutes per image with SDXL'), required: true)),
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
  ], text: LeaveSurveyText(label: ('この1か月で何を作りましたか・また使うとしたらどんなときですか', 'What did you make this month, and when would you come back?'), placeholder: ('例: イベント用に10枚作った。新しいモデルが来たらまた入りたい', 'e.g. Made 10 images for an event; I\'d come back for new models'), required: true)),
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
  ], text: LeaveSurveyText(label: ('移る先のサービス名と、そちらを選んだ理由を教えてください', 'Which service, and why did you choose it?'), placeholder: ('例: ○○。同じ値段で新しいモデルが使える', 'e.g. ... — it has newer models for the same price'), required: true)),
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
  ], text: LeaveSurveyText(label: ('使わなくなった理由を具体的に教えてください', 'Tell us more about why you stopped using it'), placeholder: ('例: 仕事が忙しく、しばらく創作できない', 'e.g. I\'m too busy to create for a while'), required: true)),
  LeaveSurveyReason(value: 'privacy', label: ('身バレ・個人情報が心配', 'I\'m worried about privacy'), groups: [
    LeaveSurveyGroup(id: 'what', question: ('どんなことが心配ですか？', 'What worries you?'), options: [
      LeaveSurveyOption('known', ('知り合いに見られたくない', 'I don\'t want people I know to see it')),
      LeaveSurveyOption('works_public', ('作品を公開したままにしたくない', 'I don\'t want my works to stay public')),
      LeaveSurveyOption('ai_use', ('AI を使っていると知られたくない', 'I don\'t want people to know I use AI')),
      LeaveSurveyOption('data', ('データの扱いが心配', 'I\'m worried about how data is handled')),
    ]),
  ], text: LeaveSurveyText(label: ('差し支えない範囲で、心配なことを具体的に教えてください', 'Tell us what worries you, as far as you\'re comfortable'), placeholder: ('例: 職場の人にアカウントを見つけられた', 'e.g. Someone from work found my account'), required: true)),
  LeaveSurveyReason(value: 'harassment', label: ('嫌なコメント・やりとりがあった', 'I had unpleasant comments or interactions'), groups: [
    LeaveSurveyGroup(id: 'what', question: ('どこでありましたか？', 'Where did it happen?'), options: [
      LeaveSurveyOption('comments', ('コメント', 'Comments')),
      LeaveSurveyOption('messages', ('メッセージ', 'Messages')),
      LeaveSurveyOption('requests', ('リクエスト', 'Requests')),
      LeaveSurveyOption('repost', ('無断転載・なりすまし', 'Reposting or impersonation')),
      LeaveSurveyOption('outside', ('サイトの外（SNS など）', 'Outside the site (social media, etc.)')),
    ]),
  ], text: LeaveSurveyText(label: ('差し支えない範囲で、状況を教えてください（運営で確認して対応します）', 'Tell us what happened, as far as you\'re comfortable (we\'ll look into it)'), placeholder: ('例: 投稿のたびに同じ人から嫌なコメントが来る', 'e.g. The same person leaves rude comments on every post'), required: true)),
  LeaveSurveyReason(value: 'community', label: ('サイトの雰囲気・ルールが合わない', 'The atmosphere or rules don\'t suit me'), groups: [
    LeaveSurveyGroup(id: 'what', question: ('どんなところですか？', 'What exactly?'), options: [
      LeaveSurveyOption('rules', ('ルール・審査が厳しい', 'Rules or moderation are too strict')),
      LeaveSurveyOption('r18', ('R-18 作品が目に入る', 'I see too much R-18 content')),
      LeaveSurveyOption('ranking', ('ランキング・推しの雰囲気', 'Rankings or the support (oshi) culture')),
      LeaveSurveyOption('low_quality', ('作品の質が合わない', 'The works aren\'t my taste')),
      LeaveSurveyOption('ads', ('広告が多い', 'Too many ads')),
    ]),
  ], text: LeaveSurveyText(label: ('どんなところが合わなかったか、具体的に教えてください', 'Tell us more about what didn\'t suit you'), placeholder: ('例: ランキングが同じ人ばかりで見る気がしない', 'e.g. The rankings are always the same people'), required: true)),
  LeaveSurveyReason(value: 'not_popular', label: ('作品を見てもらえない・反応が少ない', 'My works don\'t get seen or get little response'), groups: [
    LeaveSurveyGroup(id: 'why', question: ('あてはまるものを選んでください', 'Which of these apply?'), options: [
      LeaveSurveyOption('few_views', ('閲覧が少ない', 'Few views')),
      LeaveSurveyOption('few_likes', ('いいね・コメントが少ない', 'Few likes or comments')),
      LeaveSurveyOption('ranking', ('ランキングに載らない', 'I never make the rankings')),
      LeaveSurveyOption('discover', ('見つけてもらう方法が分からない', 'I don\'t know how to get discovered')),
    ]),
  ], text: LeaveSurveyText(label: ('どんな作品を、どれくらい投稿していましたか', 'What kind of works did you post, and how often?'), placeholder: ('例: 週3枚ほどアニメ調を投稿して、いいねは毎回1〜2', 'e.g. About 3 anime works a week, 1–2 likes each'), required: true)),
  LeaveSurveyReason(value: 'image_quality', label: ('生成した絵の品質が合わなかった', 'The generated images weren\'t good enough'), groups: [
    LeaveSurveyGroup(id: 'problem', question: ('どんなところが気になりましたか？', 'What bothered you?'), options: [
      LeaveSurveyOption('face_hand', ('顔・手・体が崩れる', 'Faces, hands or bodies look broken')),
      LeaveSurveyOption('style', ('画風・絵柄が好みと違う', 'The art style isn\'t what I like')),
      LeaveSurveyOption('prompt', ('プロンプト通りにならない', 'Results didn\'t follow my prompt')),
      LeaveSurveyOption('low_res', ('画質が粗い・ぼやける', 'Images look rough or blurry')),
      LeaveSurveyOption('same', ('似た絵ばかり出る', 'Results all look the same')),
      LeaveSurveyOption('worse_than', ('ほかのサービスより見劣りする', 'Worse than other services')),
      LeaveSurveyOption('no_model', ('欲しいモデル・LoRA がない', 'The model or LoRA I wanted isn\'t there')),
    ]),
    LeaveSurveyGroup(id: 'genre', question: ('どんな絵を作りたかったですか？', 'What kind of images did you want?'), options: [
      LeaveSurveyOption('anime', ('アニメ・イラスト調', 'Anime / illustration')),
      LeaveSurveyOption('real', ('リアル・写真風', 'Realistic / photo')),
      LeaveSurveyOption('character', ('特定のキャラクター', 'A specific character')),
      LeaveSurveyOption('scenery', ('背景・風景', 'Backgrounds / scenery')),
      LeaveSurveyOption('r18', ('R-18', 'R-18')),
      LeaveSurveyOption('other_genre', ('その他', 'Other')),
    ]),
    LeaveSurveyGroup(id: 'feature', question: ('どの機能・モデルで気になりましたか？', 'With which feature or model?'), options: [
      LeaveSurveyOption('txt2img', ('ふつうの生成', 'Regular generation')),
      LeaveSurveyOption('img2img', ('画像から生成（i2i）', 'Image to image')),
      LeaveSurveyOption('inpaint', ('部分修正（インペイント）', 'Inpainting')),
      LeaveSurveyOption('upscale', ('高画質化・高解像度', 'Upscale / high resolution')),
      LeaveSurveyOption('controlnet', ('ポーズ指定（ControlNet）', 'Pose control (ControlNet)')),
      LeaveSurveyOption('lora', ('LoRA・みんなのモデル', 'LoRA / community models')),
      LeaveSurveyOption('special_model', ('Flux・Gemini などの特別なモデル', 'Special models (Flux, Gemini, etc.)')),
      LeaveSurveyOption('mosaic', ('自動モザイク', 'Auto mosaic')),
      LeaveSurveyOption('unknown', ('分からない・全体的に', 'Not sure / overall')),
    ]),
  ], text: LeaveSurveyText(label: ('作りたかった絵と、実際の仕上がりの違いを教えてください', 'How did the results differ from what you wanted?'), placeholder: ('例: アニメ調の全身絵で、指が6本になることが多い', 'e.g. Full-body anime images often had six fingers'), required: true)),
  LeaveSurveyReason(value: 'bugs', label: ('不具合・エラーで使えなかった', 'Bugs or errors got in the way'), groups: [
    LeaveSurveyGroup(id: 'symptom', question: ('どんな不具合でしたか？', 'What went wrong?'), options: [
      LeaveSurveyOption('gen_error', ('エラーで生成が失敗する', 'Generations fail with an error')),
      LeaveSurveyOption('stuck', ('生成が終わらない・途中で止まる', 'Generations never finish or get stuck')),
      LeaveSurveyOption('coin_lost', ('コインが減ったのに画像が出ない', 'Coins were spent but no image appeared')),
      LeaveSurveyOption('no_image', ('画像が表示されない・保存できない', 'Images don\'t show or can\'t be saved')),
      LeaveSurveyOption('ui_broken', ('画面が崩れる・ボタンが反応しない', 'The page breaks or buttons don\'t respond')),
      LeaveSurveyOption('app_crash', ('アプリが落ちる・固まる', 'The app crashes or freezes')),
      LeaveSurveyOption('login_pay', ('ログイン・支払いがうまくいかない', 'Problems with login or payment')),
      LeaveSurveyOption('post_fail', ('投稿・編集ができない', 'Can\'t post or edit works')),
    ]),
    LeaveSurveyGroup(id: 'feature', question: ('どの機能で起きましたか？', 'Which feature?'), options: [
      LeaveSurveyOption('txt2img', ('ふつうの生成', 'Regular generation')),
      LeaveSurveyOption('img2img', ('画像から生成（i2i）', 'Image to image')),
      LeaveSurveyOption('inpaint', ('部分修正（インペイント）', 'Inpainting')),
      LeaveSurveyOption('upscale', ('高画質化・高解像度', 'Upscale / high resolution')),
      LeaveSurveyOption('controlnet', ('ポーズ指定（ControlNet）', 'Pose control (ControlNet)')),
      LeaveSurveyOption('lora', ('LoRA・みんなのモデル', 'LoRA / community models')),
      LeaveSurveyOption('special_model', ('Flux・Gemini などの特別なモデル', 'Special models (Flux, Gemini, etc.)')),
      LeaveSurveyOption('mosaic', ('自動モザイク', 'Auto mosaic')),
      LeaveSurveyOption('post', ('投稿・作品ページ', 'Posting / work pages')),
      LeaveSurveyOption('payment', ('支払い・プラン', 'Payment / plans')),
      LeaveSurveyOption('other_feature', ('その他', 'Other')),
    ]),
    LeaveSurveyGroup(id: 'device', question: ('どの端末で使っていましたか？', 'Which device?'), options: [
      LeaveSurveyOption('pc_browser', ('パソコンのブラウザ', 'Computer browser')),
      LeaveSurveyOption('phone_browser', ('スマホのブラウザ', 'Phone browser')),
      LeaveSurveyOption('ios_app', ('iPhone アプリ', 'iPhone app')),
      LeaveSurveyOption('android_app', ('Android アプリ', 'Android app')),
    ]),
    LeaveSurveyGroup(id: 'frequency', question: ('どれくらい起きましたか？', 'How often did it happen?'), options: [
      LeaveSurveyOption('every_time', ('毎回', 'Every time')),
      LeaveSurveyOption('often', ('よく起きる', 'Often')),
      LeaveSurveyOption('sometimes', ('ときどき', 'Sometimes')),
      LeaveSurveyOption('once', ('1〜2回だけ', 'Once or twice')),
    ]),
  ], text: LeaveSurveyText(label: ('どの画面で何をしたら、どうなりましたか（エラーの文があれば）', 'What did you do, and what happened? (include any error message)'), placeholder: ('例: スマホで高画質化を押すと「生成に失敗しました」と出て、コインだけ減った', 'e.g. On my phone, upscaling showed "Generation failed" and still used coins'), required: true)),
  LeaveSurveyReason(value: 'cost', label: ('料金・コインが合わない', 'Pricing or coins don\'t work for me'), groups: [
    LeaveSurveyGroup(id: 'what', question: ('あてはまるものを選んでください', 'Which of these apply?'), options: [
      LeaveSurveyOption('plan', ('有料プランが高い', 'Paid plans are expensive')),
      LeaveSurveyOption('coins', ('コインがすぐなくなる', 'Coins run out quickly')),
      LeaveSurveyOption('free_less', ('無料でできることが少ない', 'Not enough for free')),
    ]),
  ], text: LeaveSurveyText(label: ('具体的に教えてください（足りない機能や、払える金額など）', 'Tell us more (what you\'d need, what you\'d pay, etc.)'), placeholder: ('例: 無料のコインでは1日5枚しか作れない', 'e.g. Free coins only cover about 5 images a day'), required: true)),
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
  ], text: LeaveSurveyText(label: ('移る先のサービス名と、そちらを選んだ理由を教えてください', 'Which service, and why did you choose it?'), placeholder: ('例: ○○。同じ値段で新しいモデルが使える', 'e.g. ... — it has newer models for the same price'), required: true)),
  LeaveSurveyReason(value: 'new_account', label: ('アカウントを作り直したい', 'I want to start a new account'), groups: [
    LeaveSurveyGroup(id: 'why', question: ('あてはまるものを選んでください', 'Which of these apply?'), options: [
      LeaveSurveyOption('rename', ('名前・ID を変えたい', 'I want a different name or ID')),
      LeaveSurveyOption('fresh', ('作品を整理して始め直したい', 'I want a fresh start')),
      LeaveSurveyOption('merge', ('別のアカウントにまとめたい', 'I want to merge into another account')),
    ]),
  ], text: LeaveSurveyText(label: ('作り直したい理由を具体的に教えてください', 'Tell us more about why you want a new account'), placeholder: ('例: 名前を変えたいが、ID を変える方法が分からない', 'e.g. I want a new name but couldn\'t find how to change my ID'), required: true)),
  LeaveSurveyReason(value: 'other', label: ('その他', 'Something else'), groups: [

  ], text: LeaveSurveyText(label: ('理由を教えてください', 'Please tell us why'), placeholder: ('例: しばらく創作から離れるため', 'e.g. I\'m taking a break from creating'), required: true)),
];
