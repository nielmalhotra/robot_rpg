angular.module('robot_rpg')
.controller('MessageController', ['$scope', '$http', '$messages', function($scope, $http, $messages) {
    $scope.messages = $messages.query();

    $scope.create_message = function(msg) {
        console.log($messages);
        $messages.save(msg, function(data){
            $scope.newmsg = angular.copy({});
            $('#ng-notice').html(data.success);
        });
    };

    $scope.delete_message = function(msg) {
        $messages.delete(msg, function(data) {
            $scope.messages.splice($scope.messages.indexOf(msg), 1);
            $('#ng-notice').html(data.success);
        });
    };
}]);
