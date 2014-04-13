angular.module('robot_rpg')
.service('$fights', ['$resource', function($resource) {
    return $resource('/fights/:id.:format', { format: 'json' , id: '@id'});
}]);
