// TODO refactored into nonexistence - this shouldnt be its own controller, probably can just use http interceptor instead somewhere else
angular.module('robot_rpg')
.controller('ApplicationController', ['$scope', '$rootScope', '$http', '$timeout', 'events', function($scope, $rootScope, $http, $timeout, events) {
    $rootScope.$on('$locationChangeSuccess', function (event) {
        $('#notice').html('');
        $http({
            method : 'GET',
            url : 'messages/unread_count.json'
        }).success(function(data, status, headers, config) {
            $scope.unread_messages_count = data.unread_count
        });
    });

    function events_query() {
        events.query(function(events) {
            if(events.length > 0) {
                angular.forEach(events, function(event) {
                    var event_data = JSON.parse(event.data);
                    // TODO dispatch events
                    console.log('got event: ' + event.type + ' | event_data: ' + event_data);
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
            5000
        );
    })();

}]);