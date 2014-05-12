angular.module('robot_rpg')
.controller('BattleController', ['$scope', '$routeParams', 'AutoClearingQueue', 'Battle', function($scope, $routeParams, AutoClearingQueue, Battle) {
    $scope.fight_id = $routeParams.fightId;
    $scope.battle_notices = new AutoClearingQueue();
    var battle = new Battle($scope.fight_id);

    function refresh() {
        battle.status(function(response) {
            $scope.battle_msg = response.msg;
            $scope.my_mechs = response.my_mechs;
            $scope.enemy_mechs = response.enemy_mechs;
        });
    }

    $scope.$on('battle_notice', function(event, args) {
        $scope.battle_notices.add('a wild battle appears: ' + args.battle_name);
        refresh();
        event.stopPropagation();
    });

    refresh();
}]);