angular.module('ngTokenAuth.controller', ['ng-token-auth'])
  .config(function($authProvider) {
    $authProvider.configure({
      apiUrl: '/api/v1',
      omniauthWindowType: 'newWindow'
    });
  })
  .controller('ngTokenAuthController', ['$scope', '$auth', function ($scope, $auth) {

    $scope.googleLogin = function () {
      $auth.authenticate('google').then(function(data) {
        console.log('connected');
        location.reload(true); // not working, dont know why
      }, function(error) {
        console.log('error during connection');
      });
    };

  }]);