angular.module('robot_rpg')
.controller('FightController', ['$scope', '$http', '$fights', function($scope, $http, $fights) {
    $scope.create_fight = function(fight) {
        $fights.save(fight, function(data){
            $scope.newFight = angular.copy({});
            $scope.current_fights();
            $('#ng-notice').html(data.success);
        });
    };

    $scope.current_fights = function() {
        $scope.fights = $fights.query()
        $scope.invited_fights = $fights.invited();
    };
}]);
