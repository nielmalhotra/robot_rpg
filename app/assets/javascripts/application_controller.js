// TODO refactored into nonexistence - this shouldnt be its own controller, probably can just use http interceptor instead somewhere else
angular.module('robot_rpg')
.controller('ApplicationController', ['$scope', '$rootScope', '$http', '$timeout', '$route', 'events', function($scope, $rootScope, $http, $timeout, $route, events) {
    $rootScope.$on('$locationChangeSuccess', function (event) {
        $('#notice').html('');
        $http({
            method : 'GET',
            url : 'messages/unread_count.json'
        }).success(function(data, status, headers, config) {
            $scope.unread_messages_count = data.unread_count
        });
    });

    $rootScope.$on('root_notice', function(event, args) {
        console.log('got root_notice. name: ', args.name);
    });

    $rootScope.$on('battle_notice', function(event, args) {
        console.log('ApplicationController got battle_notice - name: ', args.battle_name);
    });

    function events_query() {
        events.query(function(events) {
            if(events.length > 0) {
                angular.forEach(events, function(event) {
                    $route.current.scope.$emit(event.type, JSON.parse(event.data));
                });
            }
        });
    }

    (function poll() {
        $timeout(
            function() {
                events_query();
                poll();
            },
            2500
        );
    })();

}]);