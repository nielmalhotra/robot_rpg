angular.module('robot_rpg')
.controller('MechController', ['$scope', '$http', 'mechs', function($scope, $http, mechs) {
    $scope.mechs = mechs.query();

    $scope.create_mech = function(mech) {
        mechs.save(mech, function(value, headers) {
            $scope.newmech = angular.copy({});
            $scope.mechs = mechs.query();
            $('#notice').html(value.success);
        });
    };
}]);
