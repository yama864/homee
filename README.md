# アプリケーション名
homee-app

# アプリケーション概要
小学生以上の子供と親のコミュニケーション（子供の帰宅やお出かけ）や、その日の習い事などのイベント管理ができるアプリケーション

# URL
### https://homee-app.herokuapp.com/

### テスト用アカウント
【ユーザー】

メールアドレス: test@test

パスワード: testtest1

【グループ】

グループ名: テスト

グループパスワード: testtest2

# 利用方法
ユーザー登録からパスワードで保護されたグループを作成または参加し、グループ内でスケジュール管理、チャット機能を使用することができます。


# 目指した課題解決
共働き等で、子供が帰宅時に自宅に誰もいない家庭も多く、子供にキッズ携帯などを持たせていない家庭も多いため、帰宅したことが分からないことが多くあります。また、帰宅後に遊びに出掛けたりすることがある際、どこに遊びに行っているのかが分からず、心配になることがあります。通信手段を持たない子供に対して家庭内のデバイス機器（家族共有タブレット、PC）でコミュニケーションが取れないかを考え、このアプリケーションを作成しました。

# ペルソナ
〈保護者〉
- 20〜40代男女
- スマートフォンを持っている
- 小学生の子供がいる
- 共働きで帰宅が遅くなることもある
- 50~60代祖父母
- 自宅に共有タブレット、PC等webアクセス可能な環境がある

〈子供〉
- 子ども用携帯、スマホを持っていない
- 習い事をしている

# 洗い出した要件
- 招待機能

  登録済みユーザーはメールアドレスを入力し、招待メールを送信できます。招待されたユーザーはメールアドレス以外を入力し、ユーザー登録ができます。

![image](https://user-images.githubusercontent.com/89680282/147396675-ea9cbcfb-23ca-432f-9261-718a7435d0e4.jpg)

- グループ機能

  登録済みユーザーは誰でもパスワードで保護されたグループを作成、参加ができます。

![image](https://user-images.githubusercontent.com/89680282/147396831-0dcd69c4-3899-43b4-818e-e4785fa41e83.jpg)

  グループログイン時はグループ内でのチャット機能、スケジュール機能を実装しています。グループトップ画面では今日の予定が表示されます。

![image](https://user-images.githubusercontent.com/89680282/147397044-acc68439-2db7-47f3-ab11-0a5e244d0a4e.png)

  チャット機能はテキストに加え、画像投稿ができます。

![image](https://user-images.githubusercontent.com/89680282/147397121-123768ac-4d3b-4cc3-91d5-2c7512379b62.jpg)

  スケジュール機能は一覧とともにカレンダー表示をおこなっています。

![image](https://user-images.githubusercontent.com/89680282/147397220-d1f6e547-1696-4cc6-87ac-18e035f71e5c.jpg)

- レスポンシブ対応

  タブレット、スマホ表示に対応する実装をおこなっています・

![image](https://user-images.githubusercontent.com/89680282/147397336-8694ff21-aab0-466d-bc07-b71b65b7b667.jpg)

![image](https://user-images.githubusercontent.com/89680282/147397350-7f0d8bda-c1b5-4e57-9da7-5ad2e143e58d.jpg)

# データベース設計

![ER](https://user-images.githubusercontent.com/89680282/147397537-1307cc34-1609-4947-965d-64b919968fa3.png)

ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）

# 開発環境
  Ruby 2.6.5 / Ruby on rails 6.1.4.1

# テーブル設計

## users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| last_name          | string     | null: false               |
| first_name         | string     | null: false               |
| last_name_kana     | string     | null: false               |
| first_name_kana    | string     | null: false               |
| relation_id        | integer    | null: false               |
| group              | references | foreign_key: true         |

### Association

- has_many :comments
- has_many :events
- has_one :group

## groups テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| group_name          | string     | null: false                    |
| group_password      | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| text                | text       | null: false                    |
| user                | references | null: false, foreign_key: true |
| group               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group

## events テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| person              | string     | null: false                    |
| start               | datetime   | null: false                    |
| end                 | datetime   | null: false                    |
| group               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group