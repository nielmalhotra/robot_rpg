function RobotController($scope, $http) {
    $scope.update = function(robot) {
        $http({
            method : 'POST',
            url : 'robots.html',
            data : angular.copy(robot)
        }).success(function(data, status, headers, config){
            $('#header').html(data);
        });
    };

    $scope.load_robots = function() {
        $scope.robots = [];
        $http({
            method : 'GET',
            url : 'robots.json',
        }).success(function(data, status, headers, config){
            data.forEach(function(r) {
                $scope.robots.push(r);
            });
        });
    };
}