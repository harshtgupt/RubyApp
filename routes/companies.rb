# encoding: UTF-8

get '/companies/test' do
  return "Test Sucsessful"
end

get '/companies' do
  format_response(Company.all, request.accept)
end

get '/companies/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  format_response(company, request.accept)
end

post '/companies' do
  body = JSON.parse request.body.read
  company = Company.create(
    name:   	body['name'],
    address: 	body['address'],
    city: 		body['city'],
    country:    body['country'],
	email: 		body['email'],
    phno:     	body['phno']
  )
  status 201
  format_response(company, request.accept)
end

put '/companies/:id' do
  body = JSON.parse request.body.read
  company ||= Company.get(params[:id]) || halt(404)
  halt 500 unless company.update(
    name:    	body['name'],
    address: 	body['address'],
    city: 		body['city'],
    country:    body['country'],
	email: 		body['email'],
    phno:     	body['phno']
  )
  format_response(company, request.accept)
end

delete '/companies/:id' do
  company ||= Company.get(params[:id]) || halt(404)
  halt 500 unless company.destroy
end

options '/companies' do
  '*'
end