require 'sinatra'
require 'slim'
require 'sqlite3'
require 'sinatra/reloader'
require 'bcrypt'
require "sinatra/json"
require 'sinatra/cross_origin'

configure do
 enable :cross_origin
end
before do
 response.headers['Access-Control-Allow-Origin'] = '*'
end

# API-endpoint
get("/api/data") do

 json({message: "Hello from Sinatra", timestamp: Time.now})
end

#testing database
get("/api/creators") do
  db = SQLite3::Database.new("databas.db")
  db.results_as_hash = true
    json exempel
end
