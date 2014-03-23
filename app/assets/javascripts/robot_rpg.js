angular
.module('robot_rpg', ['ngRoute', 'ngResource'])
.config(['$httpProvider', function($httpProvider){
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
}])
.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/', {templateUrl: 'angular_templates/home'})
        .when('/messages', {controller: 'MessageController', templateUrl: 'angular_templates/messages'})
        .when('/mechs', {controller: 'MechController', templateUrl: 'angular_templates/mechs'})
}]);