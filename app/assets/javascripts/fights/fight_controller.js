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

    $scope.accept_fight = function(fight) {
        fights.accept({id: fight.id}, fight, function(value, headers) {
            $('#notice').html(value.success);
        });
    }

    $scope.deny_fight = function(fight) {
        fights.deny({id: fight.id}, function(value, headers) {
            $('#notice').html(value.success);
        });
    }
}]);
