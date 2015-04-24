# encoding: UTF-8
class Company
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String, :required => true
  property :address,    Text,   :required => true
  property :city,       String, :required => true
  property :country,    String, :required => true
  property :email,      String
  property :phno,       String
  
  has n, :directors
end


class Director
  include DataMapper::Resource

  property :id,         Serial
  property :name,       String, :required => true
  property :fileLoc,    String, :required => true

  belongs_to :company
end


def convertCompanyObjectToHash(hash,company)
    hash["id"] = company[:id]
    hash["name"] = company[:name]
    hash["address"] = company[:address]
    hash["city"] = company[:city]
    hash["country"] = company[:country]
    hash["email"] = company[:email]
    hash["phno"] = company[:phno]
end

    # create_table :company do |t|
      # t.string :name
	  # t.string :address
	  # t.string :city
	  # t.string :country
    # end
#  
    # create_table :directors do |t|
      # t.belongs_to :company, index:true
      # t.string :name
      # t.string : fileLoc
    # end
  # end
# end
# 
# 
# class CreateCustomers < ActiveRecord::Migration
  # def change
    # create_table :customers do |t|
      # t.string :name
      # t.timestamps null: false
    # end
#  
    # create_table :orders do |t|
      # t.belongs_to :customer, index:true
      # t.datetime :order_date
      # t.timestamps null: false
    # end
  # end
# end