#Project Documentation
***
*Project Name:* Ruby API Project  
*Author:* Harshit Gupta  
*Created:* 04/26/2014 
*Version:* 1.0.1  
***
If you have any questions about this project, feel free to e-mail me at **harshit_gupta@ymail.com**
***
##Table of Contents
1. Introduction
2. Installation
3. Rest API's
4. Front End UI

***

##1. Introduction
This Is a sample Application Containing the Rest API's and Web based client to use it

 ***
 
##2. Installation
- Install the required gems.
- Run "bundle install" to install the bundle
- Run "rake migrate" to create the databases
- Run "ruby main.rb" to run the application

***

##3. Rest API's
Below are the rest API's

***

### get '/companies'
Get All Companies Detail
#####Sample Curl Call
curl -X GET https://peaceful-falls-8534.herokuapp.com/companies
#####Web Page Client Deployement on Heroku
https://peaceful-falls-8534.herokuapp.com/GetAllCompanies
***
### get '/companies/:id'
Get Detail of company by Id
#####Sample Curl Call
curl -X GET https://peaceful-falls-8534.herokuapp.com/companies/1
#####Web Page Client Deployement on Heroku
https://peaceful-falls-8534.herokuapp.com/GetCompany
***
### post '/companies'
Insert a new company detail
#####Sample Curl Call
curl -X POST -d "{\"company\":{\"name\":\"Disney\",\"address\":\"Residency\",\"city\":\"Bangalore\",\"country\":\"india\",\"email\":\"info@Disney.com\",\"phno\":\"020-290-32-123\"},\"directors\":[{\"name\":\"AAA\"},{\"name\":\"BBB\"}]}" http://peaceful-falls-8534.herokuapp.com/companies

####Sample Object format for INPUT JSON DATA
{
"company":{
  "name": "Disney", 
  "address": "Residency", 
  "city": "Bangalore ", 
  "country": "india",
  "email": "info@Disney.com",
  "phno" : "020-290-32-123"
},
"directors":[{"name":"AAA"},{"name":"BBB"}] 
}
#####Web Page Client Deployement on Heroku
https://peaceful-falls-8534.herokuapp.com
***
###put '/companies/:id
Update the Company details for given Id
#####Sample Curl Call
curl -X PUT -d "{\"company\":{\"id\":8,\"name\":\"Disney11\",\"address\":\"Residency\",\"city\":\"Bangalore\",\"country\":\"india\",\"email\":\"info@Disney.com\",\"phno\":\"020-290-32-123\"},\"directors\":[{\"id\":1,\"name\":\"AAA\"},{\"id\":2,\"name\":\"BBB\"}]}" http://peaceful-falls-8534.herokuapp.com/companies/1

####Sample Object format for INPUT JSON DATA
{
"company":{
  "id": 1,
  "name": "Disney", 
  "address": "Residency", 
  "city": "Bangalore ", 
  "country": "india",
  "email": "info@Disney.com",
  "phno" : "020-290-32-123"
},
"directors":[{"id":1,"name":"AAA"},{"id":2,"name":"BBB"}] 
}
#####Web Page Client Deployement on Heroku
https://peaceful-falls-8534.herokuapp.com/UpdateCompany
***
###delete '/companies/:id'
Delete the company details for the given Id
#####Sample Curl Call
curl -X DELETE https://peaceful-falls-8534.herokuapp.com/companies/1
#####Web Page Client Deployement on Heroku
https://peaceful-falls-8534.herokuapp.com/DeleteCompany
***
###post '/upload/:id'
Posting the Pdf file with Director or Sponsor Id
#####Sample Curl Call
curl -i -X POST -H "Content-Type: application/pdf" -F "myfile=@test.pdf" https://peaceful-falls-8534.herokuapp.com/upload/1
#####File Save Location
All Files will be saved under folder 'public/uploads'. Currently One Director can have only one File to upload. Director Id will be concatenated to Filename to differentiate between multiple directors uploading files with same File name. File will be saved as {id} + '_' + {Filename}
#####Web Page Client Deployement on Heroku
https://peaceful-falls-8534.herokuapp.com/FileUpload

***

##4. Front End UI
Corresponding to Each API There is a Web Page built using Angular Js for its implementation. These web pages utilises the Rest API's for the operations on data. These web pages are deployed on heroku server. The Urls are mention in above section with the API's
 
- GetAllCompanies - View File : views/GetAllCompanies.erb  <br>  
JavaScript File : public/javascripts/GetAllCompanies.js, public/javascripts/angular.js <br>  
Heroku Deployement URL : https://peaceful-falls-8534.herokuapp.com/GetAllCompanies

- GetCompany <br> View File : views/GetCompany.erb  <br>  
JavaScript File : public/javascripts/GetCompany.js, public/javascripts/angular.js<br>  
Heroku Deployement URL : https://peaceful-falls-8534.herokuapp.com/GetCompany

- AddCompany <br> View File : views/AddCompany.erb  <br>  
JavaScript File : public/javascripts/AddCompany.js, public/javascripts/angular.js <br>  
Heroku Deployement URL : https://peaceful-falls-8534.herokuapp.com

- UpdateCompany <br> View File : views/UpdateCompany.erb  <br>  
JavaScript File : public/javascripts/UpdateCompany.js, public/javascripts/angular.js <br>  
Heroku Deployement URL : https://peaceful-falls-8534.herokuapp.com/UpdateCompany

- DeleteCompany <br> View File : views/DeleteCompany.erb  <br>  
JavaScript File : public/javascripts/DeleteCompany.js, public/javascripts/angular.js <br>  
Heroku Deployement URL : https://peaceful-falls-8534.herokuapp.com/DeleteCompany

- FileUpload <br> View File : views/FileUpload.erb  <br>  
JavaScript File : public/javascripts/FileUpload.js, public/javascripts/angular.js <br>  
Heroku Deployement URL : https://peaceful-falls-8534.herokuapp.com/FileUpload
 

***
####Project by Harshit Gupta