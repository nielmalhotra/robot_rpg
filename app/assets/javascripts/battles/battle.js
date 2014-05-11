angular.module('robot_rpg')
.factory('Battle', ['$resource', function($resource) {
    return function(fightId) {
        var actions = {
            'test': {method: 'GET', params: {action: 'test'}}
        };
        return $resource('/fights/:id/battle/:action.:format',
            {format: 'json', id: fightId},
            actions);
    }
}]);