angular.module('robot_rpg')
.controller('MessageController', ['$scope', '$http', function($scope, $http) {
    $scope.create_message = function(msg) {
        $http({
            method : 'POST',
            url : 'messages.json',
            data : angular.copy(msg)
        }).success(function(data, status, headers, config){
            $('#ng-notice').html(data.success);
        });
    };

    $scope.load_messages = function() {
        $scope.messages = [];
        $http({
            method : 'GET',
            url : 'messages.json'
        }).success(function(data, status, headers, config){
            data.forEach(function(r) {
                $scope.messages.push(r);
            });
        });
    };

    $scope.set_message_body = function(message_body) {
        $scope.message_body = message_body;
    };
}]);