angular.module('robot_rpg')
.service('$messages', ['$resource', function($resource) {
    return $resource('/messages.:format', { format: 'json' });
}]);