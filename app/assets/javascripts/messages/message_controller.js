angular.module('robot_rpg')
.controller('MessageController', ['$scope', '$http', 'messages', function($scope, $http, messages) {
    $scope.messages = messages.query();

    $scope.create_message = function(msg) {
        messages.save(msg, function(data){
            $scope.newmsg = angular.copy({});
            $('#notice').html(data.success);
        });
    };

    $scope.delete_message = function(msg) {
        messages.delete(msg, function(data) {
            $scope.messages.splice($scope.messages.indexOf(msg), 1);
            $('#notice').html(data.success);
        });
    };
}]);
