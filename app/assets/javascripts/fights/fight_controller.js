angular.module('robot_rpg')
.controller('FightController', ['$scope', '$http', 'fights', function($scope, $http, fights) {
    $scope.fights = fights.query()
    $scope.invited_fights = fights.invited();

    $scope.create_fight = function(fight) {
        fights.save(fight, function(value, headers) {
            $scope.newFight = angular.copy({});
            $('#notice').html(value.success);
        }, function(headers) {
            $('#notice').html(headers.data.fail);
        });
    };
}]);
