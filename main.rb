# frozen_string_literal: true

require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'json'

helpers do
  def escape_html(text)
    Rack::Utils.escape_html(text)
  end
end

not_found do
  '404 Page Not Found'
end

class Memo
  DB_NAME = 'sinatra_memo_db'
  TABLE_NAME = 'sinatra_memo'
  @connection = PG.connect(dbname: DB_NAME)

  class << self
    def show
      show_query = "SELECT * FROM #{TABLE_NAME}"
      @connection.exec(show_query).map
    end

    def read(id:)
      read_query = "SELECT * FROM #{TABLE_NAME} WHERE id = $1"
      @connection.exec(read_query, [id])
    end

    def create(id:, title:, content:)
      create_query = "INSERT INTO #{TABLE_NAME} (id, title, content) VALUES ($1, $2, $3)"
      @connection.exec(create_query, [id, title, content])
    end

    def edit(id:, title:, content:)
      edit_query = "UPDATE #{TABLE_NAME} SET (title, content) = ($2, $3) WHERE id = $1"
      @connection.exec(edit_query, [id, title, content])
    end

    def delete(id:)
      delete_query = "DELETE FROM #{TABLE_NAME} WHERE id = $1"
      @connection.exec(delete_query, [id])
    end
  end
end

get '/memos' do
  @rows = Memo.show
  erb :memos
end

post '/memos/new' do
  uuid = SecureRandom.uuid
  Memo.create(id: uuid, title: params[:title], content: params[:content])
  redirect to("/memos/#{uuid}")
end

patch '/memos/:id/edit' do
  Memo.edit(id: params[:id], title: params[:title], content: params[:content])
  redirect to("/memos/#{params['id']}")
end

delete '/memos/:id' do
  begin
    Memo.delete(id: params[:id])
  rescue StandardError
    p $ERROR_INFO
  end
  redirect to('/memos')
end

get '/memos/new' do
  erb :new
end

get '/memos/:id' do
  Memo.read(id: params[:id]).each do |row|
    @id = row['id']
    @title = row['title']
    @content = row['content']
  end
  erb :show
end

get '/memos/:id/edit' do
  Memo.read(id: params[:id]).each do |row|
    @id = row['id']
    @title = row['title']
    @content = row['content']
  end
  erb :edit
end
