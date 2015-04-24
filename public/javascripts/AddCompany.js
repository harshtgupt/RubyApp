var app = angular.module('myApp', []);

app.config(function($httpProvider) {
	//Enable cross domain calls
	$httpProvider.defaults.useXDomain = true;
	$httpProvider.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
	//Remove the header used to identify ajax call  that would prevent CORS from working
	delete $httpProvider.defaults.headers.common['X-Requested-With'];
});

app.controller('enterform', function($scope, $http) {

	$scope.submit = function() {
		var finaldata = {};
		finaldata["company"] = $scope.company;
		finaldata["directors"] = $scope.directors;

		$http.post("companies", JSON.stringify(finaldata)).success(function(result) {
			console.log("Success", result);
			$scope.resultData = "Successfully Added";
			$scope.result = result;
		}).error(function() {
			$scope.resultData = "Addition Failed";
			console.log("error");
		});

	};
	$scope.directors = [];

	$scope.addInputItem = function() {
		$scope.directors.push({
			name : '',
			fileLoc : ''
		});
	};
});

