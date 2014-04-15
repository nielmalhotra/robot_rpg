angular.module('robot_rpg')
.controller('FightController', ['$scope', '$http', 'fights', function($scope, $http, fights) {
    $scope.fights = fights.query()
    $scope.invited_fights = fights.invited();

    $scope.create_fight = function(fight) {
        fights.save(fight, function(data) {
            $scope.newFight = angular.copy({});
            $('#ng-notice').html(data.success);
        });
    };
}]);
