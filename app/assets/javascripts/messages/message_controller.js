angular.module('robot_rpg')
.controller('MessageController', ['$scope', '$http', '$messages', function($scope, $http, $messages) {
    $scope.create_message = function(msg) {
        $messages.save(msg, function(data){
            $('#ng-notice').html(data.success);
        });
    };

    $scope.load_messages = function() {
        $scope.messages = $messages.query();
    };

    $scope.set_message_body = function(message_body) {
        $scope.message_body = message_body;
    };
}]);