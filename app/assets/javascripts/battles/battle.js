angular.module('robot_rpg')
.factory('Battle', ['$resource', function($resource) {
    return function(fightId) {
        var actions = {
            'status': {method: 'GET', params: {action: 'status'}}
        };
        return $resource('/fights/:id/battle/:action.:format',
            {format: 'json', id: fightId},
            actions);
    }
}]);