angular.module('robot_rpg')
.controller('MechController', ['$scope', '$http', '$mechs', function($scope, $http, $mechs) {
    $scope.create_mech = function(mech) {
        $mechs.save(mech, function(data){
            $scope.newmech = angular.copy({});
            $scope.load_mechs();
            $('#ng-notice').html(data.success);
        });
    };

    $scope.load_mechs = function() {
        $scope.mechs = $mechs.query();
    };
}]);
