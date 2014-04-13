angular.module('robot_rpg')
.controller('FightController', ['$scope', '$http', '$fights', function($scope, $http, $fights) {
    $scope.create_fight = function(fight) {
        console.log(fight);
        console.log($fights);
        $fights.save(fight);
    };

    $scope.current_fights = function() {
        $fights = $fights.query()
    };
}]);
