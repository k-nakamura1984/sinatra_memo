# sinatra_memo
ブラウザで利用できるメモアプリです。
メモの新規作成・編集・削除ができます。

# Features
- メモの新規作成・編集・削除ができます。
- 登録可能な項目はシンプルにTitleとContentのみです。
- 新規作成や編集した内容を確認せずに、即時保存できます。

# Requirement
- pg (1.2.3)
- postgres (PostgreSQL) 13.3
- ruby (3.0)
- sinatra (2.1.0)
- sinatra-contrib (2.1.0)
- webrick (1.7.0)

# Installation
- 全ファイルを、任意のディレクトリに保存、またはGit cloneする。
- ターミナルから、sinatra_memoディレクトリに移動する。
- `bundle install`を実行する。
  Gemfile記載の下記Gemがインストールされます。
  - 'pg'
  - 'sinatra'
  - 'sinatra-contrib'
  - 'webrick'

- Postgresをインストールする。
- Postgresで下記を作成する。
  - データベース名：sinatra_memo_db
  - 下記のSQLを実行する。
    `CREATE TABLE sinatra_memo (id TEXT, title TEXT NOT NULL, content TEXT);`
- sinatra_memoディレクトリで`bundle exec ruby main.rb`を実行する。
- 任意のブラウザで、http://localhost:4567/memosにアクセスする。

# Usage
- トップ画面からメモの「新規作成」が可能です。
- 新規作成で保存したメモのタイトルがトップ画面に一覧されます。
- 一覧されたメモのタイトルをクリックすると、メモの詳細が表示されます。
- メモの詳細から、メモを編集・削除できます。

# Author
k-nakamura1984

# License
"メモアプリ" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).
