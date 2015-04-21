# encoding: UTF-8

get '/companies/test' do
  return "Test Sucsessful"
end

get '/companies' do
  format_response(Company.all, request.accept)
end

get '/companies/:id' do
  Company ||= Company.get(params[:id]) || halt(404)
  format_response(Company, request.accept)
end

post '/companies' do
  body = JSON.parse request.body.read
  Company = Company.create(
    name:   	body['name'],
    address: 	body['address'],
    city: 		body['city'],
    country:    body['country'],
	email: 		body['email'],
    phno:     	body['phno']
  )
  status 201
  format_response(Company, request.accept)
end

put '/companies/:id' do
  body = JSON.parse request.body.read
  Company ||= Company.get(params[:id]) || halt(404)
  halt 500 unless Company.update(
    name:    	body['name'],
    address: 	body['address'],
    city: 		body['city'],
    country:    body['country'],
	email: 		body['email'],
    phno:     	body['phno']
  )
  format_response(Company, request.accept)
end

delete '/companies/:id' do
  Company ||= Company.get(params[:id]) || halt(404)
  halt 500 unless Company.destroy
end

options '/companies' do
  '*'
end