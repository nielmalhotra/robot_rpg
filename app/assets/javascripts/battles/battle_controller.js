angular.module('robot_rpg')
.controller('BattleController', ['$scope', '$routeParams', 'AutoClearingQueue', function($scope, $routeParams, AutoClearingQueue) {
    $scope.fight_id = $routeParams.fightId;

    $scope.battle_notices = new AutoClearingQueue();
    $scope.$on('battle_notice', function(event, args) {
        $scope.battle_notices.add('a wild battle appears: ' + args.battle_name);
        event.stopPropagation();
    });

}])