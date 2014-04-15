angular.module('robot_rpg')
.service('mechs', ['$resource', function($resource) {
    return $resource('/mechs/:id.:format', { format: 'json' , id: '@id'});
}]);
