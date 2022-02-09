(function(angular) {
  'use strict';
  var app = angular.module("myApp", ["ngRoute"]);
app.run(function($rootScope){
$rootScope.myData = {username : "default",id:'0',password: "nothing"}
})
  app.controller("loginCtrl", function($scope, $http,$rootScope,$window) {

 $scope.Register = function() {
 var url = "http://localhost:3000/api/v1/users/login", data ={"username":$scope.name,"password":$scope.password},config='application/json';
$http.post(url, data, config).then(function (response) {

  $scope.message = response.data.message
  $scope.myData.username = $scope.name
  $scope.myData.id = response.data.data
  $scope.myData.password = $scope.password
  $window.location.href = "#!show"
}, function (response) {

  $scope.message = response.data.message
});
};
  });
})(window.angular);
