# encoding: UTF-8

get '/companies' do
  format_response(getAllCompanies(), request.accept)
end

get '/directors' do
  format_response(Director.all, request.accept)
end

get '/companies/:id' do
  format_response(getCompanyById(params[:id]), request.accept)
end

options '/companies' do
  200
end


#This API will add a new Company record
post '/companies' do
  # begin
    # params.merge! JSON.parse(request.env["rack.input"].read)
  # rescue JSON::ParserError
    # logger.error "Cannot parse request body." 
  # end
  body = JSON.parse request.body.read
  company = Company.create(
    name:     body['company']['name'],
    address:  body['company']['address'],
    city:     body['company']['city'],
    country:  body['company']['country'],
    email:    body['company']['email'],
    phno:     body['company']['phno']
  )
  # Below Insertions should happen in one query in case there is big list.
  # Datamapper Does't support adding multiple records in one call so we can write the sql query for this
  body['directors'].each do |child|
    company.directors << Director.create(
    name:   child['name'],
    fileLoc: ""
    )
  end
  company.save
  status 201
  format_response("success", request.accept)
end

options '/companies/:id' do
  200
end

put '/companies/:id' do
  body = JSON.parse request.body.read
  company ||= Company.get(params[:id]) || halt(404)
  halt 500 unless company.update(
    name:    	body['company']['name'],
    address: 	body['company']['address'],
    city: 		body['company']['city'],
    country:  body['company']['country'],
	  email: 		body['company']['email'],
    phno:     body['company']['phno']
  )
  body['directors'].each do |child|
    director ||= Director.get(child['id']) || halt(404)
      halt 500 unless director.update(
    name:   child['name'],
    fileLoc: child['fileLoc']
  )
  end
  status 201
  format_response("sucess", request.accept)
end

delete '/companies/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  company.directors.each do |child|
    deleteFileIfExist(child[:id].to_s,child[:fileLoc])
  end
  halt 500 unless company.directors.destroy
  halt 500 unless company.destroy
end

def getAllCompanies()
  companiesList = Company.all
  directorsList = Director.all
  
 directorsByCompany = {}
  directorsList.each do |child|
    
    companyId = child[:company_id]
    
    if(!directorsByCompany.has_key?(companyId))
      directorsByCompany[companyId] = Array.new
    end
      
    directorsByCompany[companyId].push(child)
  end
  
  companyArray = Array.new
  
  companiesList.each do |child|
    
    companyId = child[:id]
    
    finalhash = {}
    
    convertCompanyObjectToHash(finalhash,child)
    finalhash["directors"] = directorsByCompany[companyId]
    
    companyArray.push(finalhash)
  end
  
  # Insert multiple records with one statement (MySQL)
  return companyArray
end

def getCompanyById(companyId)
  company ||= Company.get(params[:id]) || halt(404)
  directors ||= Director.all(:company_id => companyId) || halt(404)
  
  finalhash = {}
  convertCompanyObjectToHash(finalhash,company)
  finalhash["directors"] = directors
  
  return finalhash
end
