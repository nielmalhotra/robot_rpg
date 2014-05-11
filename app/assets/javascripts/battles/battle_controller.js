angular.module('robot_rpg')
.controller('BattleController', ['$scope', '$routeParams', '$timeout', function($scope, $routeParams, $timeout) {
    $scope.fight_id = $routeParams.fightId;

    $scope.battle_notices = [];

    $scope.$on('battle_notice', function(event, args) {
        $scope.battle_notices.push('a wild battle appears: ' + args.battle_name);
        $timeout(function() {
            $scope.battle_notices.shift();
        }, 3000);
        event.stopPropagation();
    });

}])