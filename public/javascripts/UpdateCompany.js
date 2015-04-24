var app = angular.module('myApp', []);
app.controller('updateform', function($scope, $http) {
	$scope.loadError = false;
	$scope.resultData = '';
	$scope.onsubmit = function() {
		$scope.resultData = '';
		$http.get('companies/' + $scope.companyId).success(function(result) {
			$scope.company = result;
			$scope.directors = $scope.company.directors;
			$scope.showData = true;
			$scope.loadError = false;
		}).error(function() {
			$scope.loadError = true;
		});
	}

	$scope.update = function() {
		var finaldata = {};
		finaldata["company"] = $scope.company;
		finaldata["directors"] = $scope.directors;

		$http.put("companies/" + $scope.company.id, JSON.stringify(finaldata)).success(function(result) {
			console.log("Success", result);
			$scope.resultData = "Update Successful";
			$scope.result = result;
		}).error(function() {
			$scope.resultData = "Update Failed";
		});
	}
});