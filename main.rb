# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'json'

helpers do
  def escape_html(text)
    Rack::Utils.escape_html(text)
  end
end

before do
  @directory = Dir.glob('data/*')
end

not_found do
  '404 Page Not Found'
end

get '/memos' do
  erb :memos
end

get '/memos/new' do
  erb :new
end

post '/memos/new' do
  hash = { id: SecureRandom.uuid, title: params[:title], content: params[:content] }
  File.open("data/#{hash[:id]}.json", 'w') do |file|
    file.puts JSON.pretty_generate(hash)
  end
  redirect '/memos'
end

get '/memos/:id' do
  @id = params['id']
  erb :show
end

get '/memos/:id/edit' do
  @id = params['id']
  erb :edit
end

patch '/memos/:id/edit' do
  @id = params['id']
  hash = { id: @id, title: params[:title], content: params[:content] }
  File.open("data/#{hash[:id]}.json", 'w') do |file|
    file.puts JSON.pretty_generate(hash)
  end
  redirect "/memos/#{params['id']}"
end

delete '/memos/:id' do
  @id = params['id']
  begin
    File.delete("data/#{@id}.json")
  rescue StandardError
    p $ERROR_INFO
  end
  redirect '/memos'
end
