# encoding: UTF-8
require 'sinatra'
require 'rubygems'
require 'json'
require 'data_mapper'
require 'dm-migrations'
require 'sinatra/cross_origin'

before do
   # content_type :json   
   headers 'Access-Control-Allow-Origin' => '*', 
            'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST', 'PUT', 'DELETE'] ,
            'Access-Control-Allow-Headers' => 'Content-Type'    
end

set :protection, false

configure :development do
  enable :cross_origin
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(
    :default,
    ENV['DATABASE_URL'] || 'postgres://localhost/mydb'
  )
end

configure :production do
  enable :cross_origin
  DataMapper.setup(
    :default,
    ENV['DATABASE_URL'] || 'postgres://localhost/mydb'
  )
end

require './models/init'
require './helpers/init'
require './routes/init'

DataMapper.finalize




