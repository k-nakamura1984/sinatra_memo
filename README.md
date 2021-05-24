# sinatra_memo
ブラウザで利用できるメモアプリです。
メモの新規作成・編集・削除ができます。

# Features
- メモの新規作成・編集・削除ができます。
- 登録可能な項目はシンプルにTitleとContentのみです。
- 新規作成や編集した内容を確認せずに、即時保存できます。

# Requirement
- ruby (3.0)
- sinatra (2.1.0)
- sinatra-contrib (2.1.0)
- webrick (1.7.0)
  
# Installation
- 全ファイルを、任意のディレクトリに保存、またはGit cloneする。
- ターミナルから、sinatra_memoディレクトリに移動する。
- `bundle install`を実行する。
  Gemfile記載の下記Gemがインストールされます。
    - 'sinatra'
    - 'webrick'
    - 'sinatra-contrib'
- sinatra_memoディレクトリで`bundle exec ruby main.rb`を実行する。
- 任意のブラウザで、http://localhost:4567/memosにアクセスする。

# Usage
- トップ画面からメモの「新規作成」が可能です。
- 新規作成で保存したメモのタイトルがトップ画面に一覧されます。
- 一覧されたメモのタイトルをクリックすると、メモの詳細が表示されます。
- メモの詳細から、メモを編集・削除できます。

# Note
- メモのタイトルは、新規作成・編集した日時が新しい順に表示されます。
- メモはdataディレクトリにjson形式で保存・管理されます。
確認用のファイルが保存されていますので、適宜削除してご利用ください。

# Author
k-nakamura1984

# License
"メモアプリ" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).
