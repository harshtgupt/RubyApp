var app = angular.module('myApp', []);
app.controller('deleteCompany', function($scope, $http) {

	$scope.onsubmit = function() {
		$http.delete('companies/' + $scope.companyId).success(function(result) {

			$scope.Result = "Delete Successful";
		}).error(function() {
			$scope.Result = "Delete UnSuccessful";
		});
	}
}); 