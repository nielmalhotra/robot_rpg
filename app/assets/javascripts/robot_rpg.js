angular
.module('robot_rpg', ['ngRoute', 'ngResource', 'ngAnimate'])
.config(['$httpProvider', function($httpProvider){
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

    $httpProvider.interceptors.push(['$q', '$rootScope', '$timeout', function($q, $rootScope, $timeout) {
        $rootScope.error_messages = [];
        return {
            'responseError': function(response) {
                if (response.status == 500 || response.status == 400) {
                    $rootScope.error_messages.push(response.data);
                }
                $timeout(function() {
                    $rootScope.error_messages.shift();
                }, 3000);
                return $q.reject(response);
            }
        };
    }]);
}])
.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/', {templateUrl: 'angular_templates/home'})
        .when('/messages', {controller: 'MessageController', templateUrl: 'angular_templates/messages'})
        .when('/mechs', {controller: 'MechController', templateUrl: 'angular_templates/mechs'})
        .when('/fights', {controller: 'FightController', templateUrl: 'angular_templates/fights'})
        .when('/battle/:fightId', {controller: 'BattleController', templateUrl: 'angular_templates/battle'})
}]);