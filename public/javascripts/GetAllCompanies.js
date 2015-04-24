var app = angular.module('myApp', []);
app.controller('getAllCompanies', function($scope,$http) {

       $http.get('companies').success(function(result) {
          $scope.companies = result;
          $scope.hide = true;
          $scope.loadError = false;
      }).error(function() {
          $scope.loadError = true;
      });
    
	
});
