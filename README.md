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

	スプレッドシートにまとめた要件定義を記述。
実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。
実装予定の機能	洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。


データベース設計	ER図等を添付。
ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）



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

