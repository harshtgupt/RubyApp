# encoding: UTF-8

get '/companies' do
  format_response(getAllCompanies(), request.accept)
end

get '/directors' do
  format_response(Director.all, request.accept)
end

get '/companies/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  directors ||= Director.all(:company_id => params[:id]) || halt(404)
  format_response(companyResponse(company,directors), request.accept)
end

options '/companies' do
  200
end


#This API will add a new Company record
post '/companies' do
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
  directorsArray = Array.new
  body['directors'].each do |child|
   director = Director.create(
      name:   child['name'],
      fileLoc: "NoFile",
      company: company
    )
    directorsArray.push(director)
  end
  status 201
  format_response(companyResponse(company,directorsArray), request.accept)
end

options '/companies/:id' do
  200
end

put '/companies/:id' do
  body = JSON.parse request.body.read
  company ||= Company.get(params[:id]) || halt(404)
  halt 500 unless company.update(
    name:     body['company']['name'],
    address:  body['company']['address'],
    city:     body['company']['city'],
    country:  body['company']['country'],
    email:    body['company']['email'],
    phno:     body['company']['phno']
  )
  directorsArray = Array.new
  body['directors'].each do |child|
    director ||= Director.get(child['id']) || halt(404)
    halt 500 unless director.update(
      name:   child['name'],
      fileLoc: child['fileLoc']
    )
    directorsArray.push(director)
  end
  status 201
  format_response(companyResponse(company,directorsArray), request.accept)
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

    directors = directorsByCompany[companyId]
    companyData = companyResponse(child,directors)
    
    companyArray.push(companyData)
  end
  
  return companyArray
end

