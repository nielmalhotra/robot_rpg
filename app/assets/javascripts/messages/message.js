angular.module('robot_rpg')
.service('messages', ['$resource', function($resource) {
    return $resource('/messages/:id.:format', { format: 'json' , id: '@id'});
}]);
