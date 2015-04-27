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

def companyResponse(company,directorsArray)
  returnData = {}
  convertCompanyObjectToHash(returnData,company)
  returnData["directors"] = directorsArray
  return returnData
end