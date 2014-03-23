angular
.module('robot_rpg', ['ngRoute', 'ngResource'])
.config(['$httpProvider', function($httpProvider){
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}])
.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/', {templateUrl: 'angular_views/home'})
        .when('/messages', {controller: 'MessageController', templateUrl: 'angular_views/messages'})
        .when('/mechs', {controller: 'MechController', templateUrl: 'angular_views/mechs'})
}]);