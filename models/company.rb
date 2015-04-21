# encoding: UTF-8
class Company
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String, :required => true
  property :address,    Text, :required => true
  property :city,       String, :required => true
  property :country,    String, :required => true
  property :email,      String
  property :phno,       String
end
