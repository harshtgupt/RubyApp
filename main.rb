# encoding: UTF-8
require 'json'
require 'sinatra'
require 'data_mapper'
require 'dm-migrations'

configure :development do
  enable :cross_origin
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(
    :default,
    'postgres://loprqdusbqcoyr:xfvbD5aE0RkF7OZ8GQFEpSgr9X@ec2-50-17-192-136.compute-1.amazonaws.com:5432/d7i4sid944mqig'
  )
end

configure :production do
  enable :cross_origin
  DataMapper.setup(
    :default,
    'postgres://loprqdusbqcoyr:xfvbD5aE0RkF7OZ8GQFEpSgr9X@ec2-50-17-192-136.compute-1.amazonaws.com:5432/d7i4sid944mqig'
  )
end

require './models/init'
require './helpers/init'
require './routes/init'

DataMapper.finalize