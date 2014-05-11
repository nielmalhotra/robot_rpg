angular.module('robot_rpg')
.service('events', ['$resource', function($resource) {
    return $resource('/events/:id.:format', { format: 'json' , id: '@id'});
}]);