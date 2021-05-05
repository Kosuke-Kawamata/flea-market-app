# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Admin.create!(
#   name: 'testtest',
#   email: 'test@test.com',
#   password: 'testtest',
# )
 
#レディースブロック
lady_child_array = ["トップス","ジャケット/アウター","パンツ","スカート","ワンピース","その他"]
#レディースの孫カテゴリー配列
lady_grandchild_array = [["Tシャツ/カットソー(半袖/袖なし)","Tシャツ/カットソー(七分/長袖)","シャツ/ブラウス(半袖/袖なし)","シャツ/ブラウス(七分/長袖)","ポロシャツ","キャミソール","タンクトップ","ホルターネック","ニット/セーター","チュニック","カーディガン/ボレロ","アンサンブル","ベスト/ジレ","パーカー","トレーナー/スウェット","ベアトップ/チューブトップ","ジャージ","その他"],["テーラードジャケット","ノーカラージャケット","Gジャン/デニムジャケット","レザージャケット","ダウンジャケット","ライダースジャケット","ミリタリージャケット","ダウンベスト","ジャンパー/ブルゾン","ポンチョ","ロングコート","トレンチコート","ダッフルコート","ピーコート","チェスターコート","モッズコート","スタジャン","毛皮/ファーコート","スプリングコート","スカジャン","その他"],["デニム/ジーンズ","ショートパンツ","カジュアルパンツ","ハーフパンツ","チノパン","ワークパンツ/カーゴパンツ","クロップドパンツ","サロペット/オーバーオール","オールインワン","サルエルパンツ","ガウチョパンツ","その他"],["ミニスカート","ひざ丈スカート","ロングスカート","キュロット","その他"],["ミニワンピース","ひざ丈ワンピース","ロングワンピース","その他"],["スカートスーツ上下","パンツスーツ上下","ドレス","パーティーバッグ","シューズ","ウェディング"]]

parent = Category.create(name: 'レディース')
lady_child_array.each_with_index do |child, i|
 child = parent.children.create(name: child)
 lady_grandchild_array[i].each do |grandchild|
   child.children.create(name: grandchild)
 end
end

# メンズの子カテゴリ
mens_child_array = ["トップス","ジャケット/アウター","パンツ","スーツ","その他"]
# メンズの孫カテゴリ
mens_grandchild_array = ["アウター","パンツ","おくるみ","下着/肌着","パジャマ","ロンパース","その他"],["コート","ジャケット/上着","トップス(Tシャツ/カットソー)","トップス(トレーナー)","トップス(チュニック)","トップス(タンクトップ)","トップス(その他)"],["デニム/ジーンズ","ショートパンツ","カジュアルパンツ","ハーフパンツ","チノパン","ワークパンツ/カーゴパンツ","クロップドパンツ","サロペット/オーバーオール","オールインワン","サルエルパンツ","ガウチョパンツ","その他"],["パンツ","セットアップ","パジャマ","フォーマル/ドレス","和服","浴衣","甚平","水着","その他"],["スニーカー","サンダル","ブーツ","長靴","靴下/スパッツ","帽子","エプロン","サスペンダー","タイツ","ハンカチ","バンダナ","ベルト","マフラー","傘","手袋","スタイ","バッグ","その他"]

parent = Category.create(name: 'メンズ')
mens_child_array.each.each_with_index do |child, i|
 child = parent.children.create(name: child)
 mens_grandchild_array[i].each do |grandchild|
   child.children.create(name: grandchild)
 end
end

# ベビーの子カテゴリ
baby_child_array = ["ベビー服(女の子用)","ベビー服(男の子用)","子ども用ファッション小物","おむつ/トイレ/バス","その他"]
# ベビーの孫カテゴリ
baby_grandchild_array = [["コート","ジャケット/上着","トップス(Tシャツ/カットソー)","トップス(トレーナー)","トップス(その他)","ボトムス","パジャマ","その他"],["コート","ジャケット/上着","トップス(Tシャツ/カットソー)","トップス(トレーナー)","トップス(その他)","ボトムス","パジャマ","その他"],["おふろのおもちゃ","がらがら","オルゴール","ベビージム","手押し車/カタカタ","知育玩具","その他"],["おむつ用品","おまる/補助便座","トレーニングパンツ","ベビーバス","お風呂用品","その他"],["お宮参り用品","お食い初め用品","アルバム","手形/足形","その他"]]

parent = Category.create(name: 'ベビー・キッズ')
baby_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  baby_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 家庭用品の子カテゴリ
homes_child_array = ["キッチン/食器","ベッド/マットレス","ソファ/ソファベッド","椅子/チェア","机/テーブル","その他"]
# 家庭用品の孫カテゴリ
homes_grandchild_array = ["食器","調理器具","収納/キッチン雑貨","弁当用品","カトラリー(スプーン等)","テーブル用品","容器","エプロン","アルコールグッズ","浄水機","その他"],["セミシングルベッド","シングルベッド","セミダブルベッド","ダブルベッド","ワイドダブルベッド","クイーンベッド","キングベッド","脚付きマットレスベッド","マットレス","すのこベッド","ロフトベッド/システムベッド","簡易ベッド/折りたたみベッド","収納付き","その他"],["ソファセット","シングルソファ","ラブソファ","トリプルソファ","オットマン","コーナーソファ","ビーズソファ/クッションソファ","ローソファ/フロアソファ","ソファベッド","応接セット","ソファカバー","リクライニングソファ","その他"],["一般","スツール","ダイニングチェア","ハイバックチェア","ロッキングチェア","座椅子","折り畳みイス","デスクチェア","その他"],["こたつ","カウンターテーブル","サイドテーブル","センターテーブル","ダイニングテーブル","座卓/ちゃぶ台","アウトドア用","パソコン用","事務机/学習机","その他"],["正月","成人式","バレンタインデー","ひな祭り","子どもの日","母の日","父の日","サマーギフト/お中元","夏/夏休み","ハロウィン","敬老の日","七五三","お歳暮","クリスマス","冬一般","その他"]

parent = Category.create(name: 'インテリア・住まい・小物')
homes_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  homes_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 本の子カテゴリ
books_child_array = ["本","漫画","CD","テレビゲーム"]
# 本の孫カテゴリ
books_grandchild_array = ["文学/小説","人文/社会","ノンフィクション/教養","地図/旅行ガイド","ビジネス/経済","健康/医学","コンピュータ/IT","趣味/スポーツ/実用","住まい/暮らし/子育て","アート/エンタメ","洋書","絵本","参考書","その他"],["全巻セット","少年漫画","少女漫画","青年漫画","女性漫画","同人誌","その他"],["邦楽","洋楽","アニメ","クラシック","K-POP/アジア","キッズ/ファミリー","その他"],["家庭用ゲーム本体","家庭用ゲームソフト","携帯用ゲーム本体","携帯用ゲームソフト","PCゲーム","その他"]

parent = Category.create(name: '本・音楽・ゲーム')
books_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  books_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 趣味の子カテゴリ
hobby_child_array = ["おもちゃ","トレーディングカード","フィギュア","楽器/器材","その他"]
# 趣味の孫カテゴリ
hobby_grandchild_array = [["キャラクターグッズ","ぬいぐるみ","小物/アクセサリー","模型/プラモデル","ミニカー","トイラジコン","プラモデル","ホビーラジコン","鉄道模型","その他"],["遊戯王","マジック：ザ・ギャザリング","ポケモンカードゲーム","デュエルマスターズ","バトルスピリッツ","プリパラ","アイカツ","カードファイト!!ヴァンガード","ヴァイスシュヴァルツ","プロ野球オーナーズリーグ","ベースボールヒーローズ","ドラゴンボール","スリーブ","その他"],["コミック/アニメ","特撮","ゲームキャラクター","SF/ファンタジー/ホラー","アメコミ","スポーツ","ミリタリー","その他"],["エレキギター","アコースティックギター","ベース","エフェクター","アンプ","弦楽器","管楽器","鍵盤楽器","打楽器","和楽器","楽譜/スコア","レコーディング/PA機器","DJ機器","DTM/DAW","その他"],["トランプ/UNO","カルタ/百人一首","ダーツ","ビリヤード","麻雀","パズル/ジグソーパズル","囲碁/将棋","オセロ/チェス","人生ゲーム","野球/サッカーゲーム","スポーツ","三輪車/乗り物","模型製作用品","鉄道","航空機","アマチュア無線","その他"]]

parent = Category.create(name: 'おもちゃ・ホビー・グッズ')
hobby_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  hobby_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 美容の子カテゴリ
beauty_child_array = ["ベースメイク","メイクアップ","その他"]
# 美容の孫カテゴリ
beauty_grandchild_array = [["ファンデーション","化粧下地","コントロールカラー","BBクリーム","CCクリーム","コンシーラー","フェイスパウダー","トライアルセット/サンプル","その他"],["アイシャドウ","口紅","リップグロス","リップライナー","チーク","フェイスカラー","マスカラ","アイライナー","つけまつげ","アイブロウペンシル","パウダーアイブロウ","眉マスカラ","トライアルセット/サンプル","メイク道具/化粧小物","美顔用品/美顔ローラー","その他"],["健康用品","看護/介護用品","救急/衛生用品","その他"]]

parent = Category.create(name: 'コスメ・香水・美容')
beauty_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  beauty_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 機械の子カテゴリ
machine_child_array = ["スマートフォン/携帯電話","PC/タブレット","カメラ","その他"]
# 機械の孫カテゴリ
machine_grandchild_array = [["スマートフォン本体","バッテリー/充電器","携帯電話本体","PHS本体","その他"],["タブレット","ノートPC","デスクトップ型PC","ディスプレイ","電子ブックリーダー","PC周辺機器","PCパーツ","その他"],["デジタルカメラ","ビデオカメラ","レンズ(単焦点)","レンズ(ズーム)","フィルムカメラ","防犯カメラ","その他"],["ポータブルプレーヤー","イヤフォン","ヘッドフォン","アンプ","スピーカー","ケーブル/シールド","ラジオ","その他"]]

parent = Category.create(name: '家電・スマホ・カメラ')
machine_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  machine_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# スポーツの子カテゴリ
sports_child_array = ["フィッシング","トレーニング/エクササイズ","サッカー/フットサル","その他"]
# スポーツの孫カテゴリ
sports_grandchild_array = [["ロッド","リール","ルアー用品","ウエア","釣り糸/ライン","その他"],["ランニング","ウォーキング","ヨガ","トレーニング用品","その他"],["ウェア","シューズ","ボール","アクセサリー","記念グッズ","応援グッズ","その他"],["ダンス/バレエ","サーフィン","バスケットボール","バドミントン","バレーボール","スケートボード","陸上競技","ラグビー","アメリカンフットボール","ボクシング","ボウリング","その他"]]

parent = Category.create(name: 'スポーツ・レジャー')
sports_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  sports_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# ハンドメイドの子カテゴリ
handmade_child_array = ["ファッション/小物","アクセサリー/時計","日用品/インテリア","その他"]
# ハンドメイドの孫カテゴリ
handmade_grandchild_array = [["ピアス","イヤリング","ネックレス","ブレスレット","リング","チャーム","ヘアゴム","アンクレット","その他"],["アクセサリー(男性用)","時計(女性用)","時計(男性用)","その他"],["クラフト/布製品","おもちゃ/人形","その他"],["バッグ(女性用)","バッグ(男性用)","財布(女性用)","財布(男性用)","ファッション雑貨","その他"]]
parent = Category.create(name: 'ハンドメイド')
handmade_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  handmade_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# チケットの子カテゴリ
ticket_child_array = ["音楽","スポーツ","演劇/芸能","その他"]
# チケットの孫カテゴリ
ticket_grandchild_array = [["男性アイドル","女性アイドル","韓流","国内アーティスト","海外アーティスト","音楽フェス","声優/アニメ","その他"],["サッカー","野球","テニス","格闘技/プロレス","相撲/武道","ゴルフ","バレーボール","バスケットボール","モータースポーツ","ウィンタースポーツ","その他"],["ミュージカル","演劇","伝統芸能","落語","お笑い","オペラ","サーカス","バレエ","その他"],["ショッピング","レストラン/食事券","フード/ドリンク券","宿泊券","その他"]]

parent = Category.create(name: 'チッケト')
ticket_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  ticket_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 自動車の子カテゴリ
mobil_child_array = ["自動車本体","自動車アクセサリー","オートバイ車体","その他"]
# 自動車の孫カテゴリ
mobil_grandchild_array = [["国内自動車本体","外国自動車本体","タイヤ/ホイールセット","タイヤ","ホイール","その他"],["車内アクセサリー","カーナビ","カーオーディオ","車外アクセサリー","メンテナンス用品","チャイルドシート","ドライブレコーダー","レーダー探知機","カタログ/マニュアル","セキュリティ","ETC","その他"],["国内車本体","外国車本体","タイヤ","マフラー","エンジン、冷却装置","外国オートバイ用パーツ","その他"],["ヘルメット/シールド","バイクウエア/装備","アクセサリー","メンテナンス","カタログ/マニュアル","その他"]]

parent = Category.create(name: '自動車・オートバイ')
mobil_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  mobil_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# その他の子カテゴリ
others_child_array = ["まとめ売り","食品","飲料/酒","その他"]
# その他の孫カテゴリ
others_grandchild_array = [["ペットフード","犬用品","猫用品","魚用品/水草","小動物用品","爬虫類/両生類用品","かご/おり","鳥用品","虫類用品","その他"],["菓子","米","野菜","果物","調味料","魚介類(加工食品)","肉類(加工食品)","その他 加工食品","その他"],["コーヒー","ソフトドリンク","ミネラルウォーター","茶","ウイスキー","ワイン","ブランデー","焼酎","日本酒","ビール、発泡酒","その他"],["オフィス用品一般","オフィス家具","店舗用品","OA機器","ラッピング/包装","その他"]]

parent = Category.create(name: 'その他')
others_child_array.each.each_with_index do |child, i|
  child = parent.children.create(name: child)
  others_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end
