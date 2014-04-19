// TODO refactored into nonexistence - this shouldnt be its own controller, probably can just use http interceptor instead somewhere else
angular.module('robot_rpg')
.controller('ApplicationController', ['$scope', '$rootScope', '$http', function($scope, $rootScope, $http) {
    $rootScope.$on('$locationChangeSuccess', function (event) {
        $('#notice').html('');
        $http({
            method : 'GET',
            url : 'messages/unread_count.json'
        }).success(function(data, status, headers, config) {
            $scope.unread_messages_count = data.unread_count
        });
    });
}]);