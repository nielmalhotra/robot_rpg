angular.module('robot_rpg')
.factory('AutoClearingQueue', ['$timeout', function ($timeout) {
    var DEFAULT_TIMEOUT = 3000;
    return function(timeout) {
        // TODO this should extend Array (easier said than done...)
        var queue = [];
        var timeout = typeof timeout !== 'undefined' ? timeout : DEFAULT_TIMEOUT;
        return {
            queue: function() { return queue; },
            add: function(item) {
                queue.push(item);
                $timeout(function() {
                    queue.shift();
                }, timeout);
            }
        }
    }
}]);