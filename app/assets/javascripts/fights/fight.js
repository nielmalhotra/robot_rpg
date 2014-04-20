angular.module('robot_rpg')
.service('fights', ['$resource', function($resource) {
    var actions = {
        'past':    {method: 'GET', isArray: true, params: {action: 'past'}},
        'invited': {method: 'GET', isArray: true, params: {action: 'invited'}},
        'owned':   {method: 'GET', isArray: true, params: {action: 'owned'}},
        'upcoming':{method: 'GET', isArray: true, params: {action: 'upcoming'}},
        'begin':   {method: 'GET', params: {action: 'begin'}},
        'invite':  {method: 'POST', params: {action: 'invite'}},
        'accept':  {method: 'POST', params: {action: 'accept'}},
        'deny':    {method: 'GET', params: {action: 'deny'}}
    };
    return $resource('/fights/:id/:action.:format',
                     {format: 'json' , id: '@id'},
                     actions);
}]);