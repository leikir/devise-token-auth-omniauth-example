angular.module('ngTokenAuth.controller', ['ng-token-auth'])
  .config(function($authProvider) {
    $authProvider.configure({
      apiUrl: '/api/v1'
    });
  })
  .controller('ngTokenAuthController', ['$scope', '$auth', function ($scope, $auth) {

    $scope.googleLogin = function () {
      $auth.authenticate('google').then(function(data) {
        console.log('connected');
      }, function(error) {
        console.log('error during connection');
      });
    };

  }]);