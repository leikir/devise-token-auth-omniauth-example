//= require angular
//= require angular-cookie
//= require ng-token-auth
//= require_tree .

angular.module('ngTokenAuth', ['ngTokenAuth.controller'])
  .config([
    '$httpProvider',
    '$locationProvider',
  function ($httpProvider, $locationProvider) {

    // Send CSRF token with every http request
    $httpProvider.defaults.headers.common["X-CSRF-Token"] = $("meta[name=csrf-token]").attr("content");

    $locationProvider.html5Mode({
      enabled: true,
      requireBase: false
    });

  }]);
