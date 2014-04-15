angular.module('robot_rpg')
.controller('MechController', ['$scope', '$http', 'mechs', function($scope, $http, mechs) {
    $scope.mechs = mechs.query();

    $scope.create_mech = function(mech) {
        mechs.save(mech, function(data) {
            $scope.newmech = angular.copy({});
            $('#ng-notice').html(data.success);
        });
    };
}]);
