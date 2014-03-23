angular.module('robot_rpg')
.controller('MechController', ['$scope', '$http', function($scope, $http) {
    $scope.update = function(mech) {
        $http({
            method : 'POST',
            url : 'mechs.html',
            data : angular.copy(mech)
        }).success(function(data, status, headers, config){
            $('#ng-notice').html(data);
            $scope.load_mechs();
        });
    };

    $scope.load_mechs = function() {
        $scope.mechs = [];
        $http({
            method : 'GET',
            url : 'mechs.json',
        }).success(function(data, status, headers, config){
            data.forEach(function(r) {
                $scope.mechs.push(r);
            });
        });
    };
}]);