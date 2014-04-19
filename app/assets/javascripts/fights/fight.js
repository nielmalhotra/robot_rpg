angular.module('robot_rpg')
.service('fights', ['$resource', function($resource) {
    var actions = {
        'invited': {method: 'GET', isArray: true, params: {action: 'invited'}},
        'accept':  {method: 'POST', params: {action: 'accept'}},
        'deny':    {method: 'GET', params: {action: 'deny'}}
    };
    return $resource('/fights/:id/:action.:format',
                     {format: 'json' , id: '@id'},
                     actions);
}]);