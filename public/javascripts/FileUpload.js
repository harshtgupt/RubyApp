var app = angular.module('myApp', []);

app.config(function($httpProvider) {
	//Enable cross domain calls
	$httpProvider.defaults.useXDomain = true;
	$httpProvider.defaults.headers.post["Content-Type"] = "application/pdf";
	//Remove the header used to identify ajax call  that would prevent CORS from working
	delete $httpProvider.defaults.headers.common['X-Requested-With'];
});

// app.controller('enterform', function($scope, $http) {
// 
	// $scope.uploadFile = function(files) {
		// var fd = new FormData();
		// //Take the first selected file
		// fd.append("file", files[0]);
// 
		// $http.post('/upload', fd, {
			// withCredentials : true,
			// headers : {
				// 'Content-Type' : undefined
			// },
			// transformRequest : angular.identity
		// }).success().error()
	// };
// 
// }); 


app.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;
            
            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);

app.service('fileUpload', ['$http', function ($http) {
    this.uploadFileToUrl = function(file, uploadUrl){
        var fd = new FormData();
        fd.append('file', file);
        $http.post(uploadUrl, fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
        .success(function(data){
        	var a;
        })
        .error(function(data){
        	var b;
        });
    }
}]);

app.controller('enterform', ['$scope', 'fileUpload', function($scope, fileUpload){
    
    $scope.uploadFile = function(){
        var file = $scope.myFile;
        console.log('file is ' + JSON.stringify(file));
        var uploadUrl = "/upload";
        fileUpload.uploadFileToUrl(file, uploadUrl);
    };
    
}]);