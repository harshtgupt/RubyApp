get '/' do
  erb :AddCompany
end

get '/GetCompany' do
  erb :GetCompany
end

get '/GetAllCompanies' do
  erb :GetAllCompanies
end

get '/UpdateCompany' do
  erb :UpdateCompany
end

get '/FileUpload' do
  erb :FileUpload
end

get '/DeleteCompany' do
  erb :DeleteCompany
end
