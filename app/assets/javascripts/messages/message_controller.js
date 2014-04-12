angular.module('robot_rpg')
.controller('MessageController', ['$scope', '$http', '$messages', function($scope, $http, $messages) {
    $scope.create_message = function(msg) {
        $messages.save(msg, function(data){
            $scope.newmsg = angular.copy({});
            $scope.load_messages();
            $('#ng-notice').html(data.success);
        });
    };

    $scope.load_messages = function() {
        $scope.messages = $messages.query();
    };

    $scope.delete_message = function(msg) {
        $messages.delete(msg);
        $scope.messages.splice($scope.messages.indexOf(msg), 1);
    };
}]);
