# encoding: UTF-8
require 'sinatra'
require 'rubygems'
require 'json'
require 'data_mapper'
require 'dm-migrations'

get '/' do
  "Hello World!"
end

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