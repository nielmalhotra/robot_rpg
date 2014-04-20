angular.module('robot_rpg')
.controller('FightController', ['$scope', '$http', 'fights', function($scope, $http, fights) {
    $scope.owned_fights = fights.owned();
    $scope.invited_fights = fights.invited();
    $scope.upcoming_fights = fights.upcoming();

    $scope.create_fight = function(fight) {
        fights.save(fight, function(value, headers) {
            $scope.newFight = angular.copy({});
            $scope.owned_fights = fights.owned(); // TODO not necessary...
            $scope.upcoming_fights = fights.upcoming(); // TODO not necessary...
            $('#notice').html(value.success);
        }, function(headers) {
            $('#notice').html(headers.data.fail);
        });
    };

    $scope.accept_fight = function(fight) {
        fights.accept({id: fight.id}, fight, function(value, headers) {
            $scope.invited_fights = fights.invited(); // TODO not necessary...
            $scope.upcoming_fights = fights.upcoming(); // TODO not necessary...
            $('#notice').html(value.success);
        });
    }

    $scope.deny_fight = function(fight) {
        fights.deny({id: fight.id}, function(value, headers) {
            $scope.invited_fights = fights.invited(); // TODO not necessary...
            $('#notice').html(value.success);
        });
    }
}]);
