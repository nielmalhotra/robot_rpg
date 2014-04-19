angular.module('robot_rpg')
.controller('MessageController', ['$scope', '$http', 'messages', function($scope, $http, messages) {
    $scope.messages = messages.query();

    $scope.create_message = function(msg) {
        messages.save(msg, function(value, headers) {
            $scope.newmsg = angular.copy({});
            $('#notice').html(value.success);
        }, function(headers) {
            $('#notice').html(headers.data.fail);
        });
    };

    $scope.delete_message = function(msg) {
        messages.delete({id: msg.id}, function(value, headers) {
            $scope.messages.splice($scope.messages.indexOf(msg), 1);
            $('#notice').html(value.success);
        });
    };
}]);
