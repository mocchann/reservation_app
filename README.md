# Potepan Share
プログラミングスクール ポテパンキャンプで作成した「宿泊・予約サービス」です。<br>
レスポンシブ対応しているため、スマホからもご確認頂けます。

https://obscure-fjord-38948.herokuapp.com/
<img width="2048" alt="トップページ" src="https://user-images.githubusercontent.com/78259954/122678530-4697b300-d222-11eb-94fe-6455139dac5e.png">

# 使用技術
・Ruby 2.6.6<br>
・Ruby on Rails 6.1.3<br>
・PostgreSQL(production)<br>
・SQLite3(development,test)<br>
・Puma<br>
・Heroku<br>
・RSpec<br>

# 機能一覧
・検索機能
  -エリア検索
  -フリーワード検索
・ユーザー登録機能(devise)
  -アイコン設定、自己紹介、ユーザー名登録
・登録機能
  -貸したい部屋を登録
・予約機能
  -借りたい部屋を予約
・一覧表示
  -登録した部屋
  -予約した部屋

# テスト
・RSpec
  -factories
  -models
  -requets
  -routing
  -support
