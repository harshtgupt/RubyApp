var app = angular.module('myApp', []);
app.controller('getCompany', function($scope, $http) {

	$scope.onsubmit = function() {
		$http.get('companies/' + $scope.companyId).success(function(result) {
			$scope.company = result;
			$scope.hide = true;
			$scope.loadError = false;
		}).error(function() {
			$scope.loadError = true;
		});
	}
}); 