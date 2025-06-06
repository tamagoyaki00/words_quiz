# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
z_category = Category.find_or_create_by!(name: "Z世代")
h_category = Category.find_or_create_by!(name: "平成")
s_category = Category.find_or_create_by!(name: "昭和")
twochannel_category = Category.find_or_create_by!(name: "2ちゃんねる")

# Z世代クイズ
z_category_questions = [
  {
    term: "「ちょえ〜」の意味はどれ？",
    correct: "驚いたときや信じられないことがあったときに使う言葉",
    choices: [
      "おいしいものを食べたときに使う言葉",
      "驚いたときや信じられないことがあったときに使う言葉",
      "怒っているときの表現",
      "めんどくさいという気持ちを表す言葉"
    ]
  },
  {
    term: "「秒で○○」の「秒で」の意味は？",
    correct: "一瞬で・すぐにという意味",
    choices: [
      "少しずつという意味",
      "一瞬で・すぐにという意味",
      "しっかりと準備してという意味",
      "躊躇いながらという意味"
    ]
  },
  {
    term: "「きまZ」の「Z」は何を意味してる？",
    correct: "めっちゃキマってるという強調",
    choices: [
      "Z世代っぽいという意味",
      "「決まってるぜ！」の略",
      "めっちゃキマってるという強調",
      "深夜にテンションが上がってる様子"
    ]
  },
  {
    term: "「タイパ」の意味は？",
    correct: "タイムパフォーマンス（時間効率）",
    choices: [
      "体力配分",
      "タイムパラドックス",
      "タイムパフォーマンス（時間効率）",
      "タイトルパターン"
    ]
  },
  {
    term: "「ギャルピ」って何？",
    correct: "ギャルの精神性（ギャルマインド）を持ってる人",
    choices: [
      "ギャルっぽいプリクラ",
      "ギャル風のフィルターアプリ",
      "ギャルが使うピースサイン",
      "ギャルの精神性（ギャルマインド）を持ってる人"
    ]
  },
  {
    term: "「きゅんです」の意味は？",
    correct: "胸がときめいたときの感情表現",
    choices: [
      "怒っている気持ちを表す",
      "胸がときめいたときの感情表現",
      "面倒くさい気持ち",
      "恥ずかしい気持ち"
    ]
  },
  {
    term: "「量産型女子」とはどんな意味？",
    correct: "同じような服やメイクの女子を指す言葉",
    choices: [
      "アイドルになりたい女子",
      "働きすぎの女子",
      "同じような服やメイクの女子を指す言葉",
      "スポーツが得意な女子"
    ]
  },
  {
    term: "「〇〇しか勝たん」の意味は？",
    correct: "それが一番好き・推しているという意味",
    choices: [
      "それしかできないという意味",
      "強制的に選ばされるときの言い回し",
      "それが一番好き・推しているという意味",
      "負けないように努力している様子"
    ]
  },
  {
    term: "「ぴえん超えてぱおん」とは？",
    correct: "とても悲しい・落ち込んでいる様子",
    choices: [
      "笑いすぎて泣いている様子",
      "興奮しすぎた状態",
      "とても悲しい・落ち込んでいる様子",
      "感謝して泣いている様子"
    ]
  },
  {
    term: "「ひよってるやついる？」とは？",
    correct: "ビビってる人いる？という煽り表現",
    choices: [
      "元気がない人を励ます言葉",
      "ビビってる人いる？という煽り表現",
      "迷子の人を探すときの言葉",
      "チームワークを促す掛け声"
    ]
  },
  {
    term: "「バブい」の意味は？",
    correct: "赤ちゃんっぽくてかわいい",
    choices: [
      "古臭い感じ",
      "バブル時代っぽい",
      "テンションが高い",
      "赤ちゃんっぽくてかわいい"
    ]
  },
  {
    term: "「てぇてぇ」とは何を表す？",
    correct: "尊くて心が満たされる様子",
    choices: [
      "イライラしている様子",
      "テンションが高い状態",
      "尊くて心が満たされる様子",
      "お腹が空いたときの言葉"
    ]
  },
  {
    term: "「マ？」の意味は？",
    correct: "マジで？の略で本当？という意味",
    choices: [
      "まあまあという意味",
      "マジで？の略で本当？という意味",
      "間違ってるという意味",
      "またねの略"
    ]
  },
  {
    term: "「おしゃかわ」とは？",
    correct: "おしゃれでかわいいこと",
    choices: [
      "おしゃべりがかわいい",
      "おしゃれなカフェ",
      "おしゃれでかわいいこと",
      "おしゃれな革製品"
    ]
  },
  {
    term: "「バ先？」とは？",
    correct: "バイトをしているお店や職場",
    choices: [
      "バスの停留所",
      "バーベキューの場所",
      "バイトをしているお店や職場",
      "バランスの取れた性格の人"
    ]
  },
  {
    term: "「ぜっき（絶起）」とは？",
    correct: "寝坊して予定に遅れること",
    choices: [
      "絶対に起きること",
      "起きるのが楽しみな日",
      "寝坊して予定に遅れること",
      "早起きしすぎること"
    ]
  },
  {
    term: "「エモい」とは？",
    correct: "感情が揺さぶられて心にしみる様子",
    choices: [
      "怖い感じのこと",
      "テンションが上がること",
      "感情が揺さぶられて心にしみる様子",
      "面白いこと"
    ]
  }
]

z_category_questions.each do |q|
  question = Question.create!(
    term: q[:term],
    category: z_category

  )

  q[:choices].each do |choice_text|
    question.choices.create!(
      content: choice_text,
      correct: choice_text == q[:correct]
    )
  end
end

# 平成クイズ

h_category_questions =[
  {
    term: "「KY」とは何の略？",
    correct: "空気読めない",
    choices: [
      "海洋予報士",
      "空気読めない",
      "急にやってくる",
      "軽やかな陽気さ"
    ]
  },
  {
    term: "「イケメン」とはどんな人？",
    correct: "ハンサムな男性",
    choices: [
      "行け行けな人",
      "勢いのある営業マン",
      "ハンサムな男性",
      "元気な中年男性"
    ]
  },
    {
    term: "「アムラー」とは誰のファン？",
    correct: "安室奈美恵",
    choices: [
      "安室奈美恵",
      "あむあむ星人",
      "天海祐希",
      "浜崎あゆみ"
    ]
  },
  {
    term: "「タピる」とは何をすること？",
    correct: "タピオカドリンクを飲む",
    choices: [
      "タピオカドリンクを飲む",
      "タップダンスをする",
      "タピオカを作る",
      "時間を浪費すること"
    ]
  },
  {
    term: "「写メ」とは何のこと？",
    correct: "写真付きのメール",
    choices: [
      "写真をSNSに投稿すること",
      "写真付きのメール",
      "写真加工アプリ",
      "自撮りを印刷すること"
    ]
  },
  {
    term: "「ポケベル」が使われていたのは何のため？",
    correct: "数字や簡単な文字のメッセージを送受信するため",
    choices: [
      "音楽を録音するため",
      "携帯電話でメールするため",
      "数字や簡単な文字のメッセージを送受信するため",
      "銀行の認証システムとして使うため"
    ]
  },
  {
    term: "「オワコン」とは何の略？",
    correct: "終わったコンテンツ",
    choices: [
      "終わったコンサート",
      "終わったコンテンツ",
      "お笑いコンテンツ",
      "驚きのコンテンツ"
    ]
  },
  {
    term: "「メンヘラ」の意味は？",
    correct: "精神的に不安定な状態や人を指す",
    choices: [
      "メンバーに入れない人",
      "目が疲れている人",
      "精神的に不安定な状態や人を指す",
      "メンタルが強い人"
    ]
  },
  {
    term: "「バリ３」とは？",
    correct: "電波の強さ（アンテナ3本）",
    choices: [
      "電波の強さ（アンテナ3本）",
      "バリバリ働く30代",
      "バリカタラーメンが3杯無料",
      "バリ島に3回旅行したことがある人"
    ]
  },
  {
    term: "「チョベリバ」とは？",
    correct: "とても悪い",
    choices: [
      "ちょっと寝坊した",
      "とても悪い",
      "超ベリーバナナ",
      "すごく楽しい"
    ]
  },
  {
    term: "「MK5」とは何の略？",
    correct: "マジでキレる5秒前",
    choices: [
      "マジでキレる5秒前",
      "マジで帰りたい5分前",
      "マジでかわいすぎて無理の略",
      "マジで混んでる5丁目"
    ]
  }
]

h_category_questions.each do |q|
  question = Question.create!(
    term: q[:term],
    category: h_category

  )

  q[:choices].each do |choice_text|
    question.choices.create!(
      content: choice_text,
      correct: choice_text == q[:correct]
    )
  end
end

# 昭和クイズ
s_category_questions = [
  {
    term: "「一億玉砕」とは何を意味する？",
    correct: "全員で最後まで戦い抜くこと",
    choices: [
      "全員で最後まで戦い抜くこと",
      "大金を使い果たすこと",
      "日本全国でお祭りをすること",
      "一斉に辞めること"
    ]
  },
  {
    term: "「チャンバラ」とは？",
    correct: "刀や木の棒を使った戦いごっこ",
    choices: [
      "お祭りの踊り",
      "刀や木の棒を使った戦いごっこ",
      "料理の名前",
      "歌のジャンル"
    ]
  },
  {
    term: "「銀ブラ」とは何の略？",
    correct: "銀座をぶらぶら歩くこと",
    choices: [
      "銀色のブラジャー",
      "銀座をぶらぶら歩くこと",
      "銀河を旅すること",
      "銀メダルを取ること"
    ]
  },
  {
    term: "「ズッコケ三人組」とは何？",
    correct: "漫画や小説の主人公たちのグループ名",
    choices: [
      "コメディアンの名前",
      "漫画や小説の主人公たちのグループ名",
      "お笑いトリオの名前",
      "バンド名"
    ]
  },
  {
    term: "「スチュワーデス」とは現在の何？",
    correct: "客室乗務員（フライトアテンダント）",
    choices: [
      "料理人",
      "客室乗務員（フライトアテンダント）",
      "ホテルの受付",
      "看護師"
    ]
  },
  {
    term: "「セーラー服と機関銃」とは？",
    correct: "1980年代の人気映画タイトル",
    choices: [
      "人気アイドルの曲名",
      "1980年代の人気映画タイトル",
      "マンガのタイトル",
      "流行のファッション"
    ]
  },
  {
    term: "「ガッツポーズ」とはどんな意味？",
    correct: "成功したときの喜びのポーズ",
    choices: [
      "疲れたときの休憩ポーズ",
      "失敗したときのポーズ",
      "成功したときの喜びのポーズ",
      "相手に敬意を表すポーズ"
    ]
  },
  {
    term: "「サザエさん症候群」とは？",
    correct: "休日終わりの憂鬱な気分",
    choices: [
      "楽しい休日のこと",
      "休日終わりの憂鬱な気分",
      "忙しい平日のこと",
      "家族団欒の時間"
    ]
  },
  {
    term: "「カセットテープ」とは何？",
    correct: "音楽や音声を録音・再生する磁気テープ",
    choices: [
      "映像を録画するテープ",
      "音楽や音声を録音・再生する磁気テープ",
      "写真を保存するフィルム",
      "ラジオの周波数"
    ]
  },
  {
    term: "「ポケベル」とは？",
    correct: "携帯電話が普及する前の呼び出し機器",
    choices: [
      "携帯電話の一種",
      "無線で通話する機器",
      "携帯電話が普及する前の呼び出し機器",
      "電子メールの前身"
    ]
  },
    {
    term: "「アベック」とは何の意味？",
    correct: "男女のカップル・ペアのこと",
    choices: [
      "男女のカップル・ペアのこと",
      "一人で遊ぶこと",
      "大人数のグループ",
      "親子の呼び方"
    ]
  },
  {
    term: "「バッチグー」とはどういう意味？",
    correct: "非常に良い・完璧なこと",
    choices: [
      "失敗したこと",
      "非常に良い・完璧なこと",
      "面倒くさいこと",
      "疲れた状態"
    ]
  },
  {
    term: "「アッシー君」とは誰のこと？",
    correct: "女性の送り迎えをする男性のこと",
    choices: [
      "女性の送り迎えをする男性のこと",
      "バスの運転手",
      "仕事の部下",
      "学生のあだ名"
    ]
  }
]

s_category_questions.each do |q|
  question = Question.create!(
    term: q[:term],
    category: s_category

  )

  q[:choices].each do |choice_text|
    question.choices.create!(
      content: choice_text,
      correct: choice_text == q[:correct]
    )
  end
end

# 2ちゃんクイズ
twochannel_category_questions = [
  {
    term: "「gkbr」は何の略？",
    correct: "ガクガクブルブル（震えている様子）",
    choices: [
      "ガクガクブルブル（震えている様子）",
      "激辛ボロネーゼ",
      "がっかりブラザーズ",
      "ごく普通のブログ"
    ]
  },
  {
    term: "「wktk」の意味は？",
    correct: "ワクワクテカテカ（期待して楽しみにしている）",
    choices: [
      "ワクワクテカテカ（期待して楽しみにしている）",
      "わからないことを聞くときに使う",
      "早口で話している様子",
      "わりと困ってるとき"
    ]
  },
  {
    term: "「～するしかないな!」にAA（アスキーアート）がついて語られるキャラは？",
    correct: "やる夫",
    choices: [
      "やる夫",
      "のまネコ",
      "ショボーン",
      "キリト"
    ]
  },
  {
    term: "「スレ」とは2ちゃんねるにおける何のこと？",
    correct: "スレッド（話題ごとの投稿集）",
    choices: [
      "スレッド（話題ごとの投稿集）",
      "スレてる人の話題",
      "ストレスの略",
      "スクリーンレコーダー"
    ]
  },
  {
    term: "「釣り」という行為は2ちゃんねるではどんな意味？",
    correct: "わざと嘘を書いて反応を楽しむこと",
    choices: [
      "本当に魚を釣ること",
      "誰かを招待すること",
      "わざと嘘を書いて反応を楽しむこと",
      "ネットで買い物すること"
    ]
  },
  {
    term: "「リア厨」とは何を指す言葉？",
    correct: "リアル中学生のこと",
    choices: [
      "リアル中学生のこと",
      "料理が苦手な人",
      "現実逃避する人",
      "リアルに怒っている人"
    ]
  },
  {
    term: "「厨房（ちゅうぼう）」という言葉の意味は？",
    correct: "迷惑な書き込みをする人への蔑称",
    choices: [
      "迷惑な書き込みをする人への蔑称",
      "中華料理好きの人",
      "インターネット初心者",
      "料理板の住人"
    ]
  },
  {
    term: "「記念パピコ」の意味は？",
    correct: "スレが立った記念に書き込む意味の定型文",
    choices: [
      "スレが立った記念に書き込む意味の定型文",
      "アイスが食べたいという意味",
      "夏に使われるネット俳句",
      "誕生日を祝うスラング"
    ]
  },
  {
    term: "「厨二病」とはどんな状態のこと？",
    correct: "中学2年生くらいにありがちな中二っぽい黒歴史を指す言葉",
    choices: [
      "中学2年生くらいにありがちな中二っぽい黒歴史を指す言葉",
      "ご飯を残す癖がある人",
      "精神的に未熟な大人",
      "二重人格のキャラのこと"
    ]
  },
  {
    term: "「orz」はどんな意味を表している？",
    correct: "落ち込んでいる人の姿を表すアスキーアート",
    choices: [
      "落ち込んでいる人の姿を表すアスキーアート",
      "おおらかな人を表す絵文字",
      "何かに驚いた人の顔文字",
      "怒っている人の略語"
    ]
  }
]

twochannel_category_questions.each do |q|
  question = Question.create!(
    term: q[:term],
    category: twochannel_category

  )

  q[:choices].each do |choice_text|
    question.choices.create!(
      content: choice_text,
      correct: choice_text == q[:correct]
    )
  end
end
