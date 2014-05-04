angular.module('robot_rpg')
.controller('BattleController', ['$scope', '$routeParams', function($scope, $routeParams) {
    $scope.fight_id = $routeParams.fightId;
}])