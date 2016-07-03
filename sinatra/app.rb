require 'sinatra'
require 'sinatra/sequel'
require 'json'

set :database, 'postgres://hiemanshu@localhost/server_benchmarks'

get '/hello' do
  'Hello, World!'
end

get '/fortunes' do
  @fortunes = database[:fortunes].all
  erb :fortunes
end

get '/fortunes.json' do
  @fortunes = database[:fortunes].all
  @fortunes.to_json
end