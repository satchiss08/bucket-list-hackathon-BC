controllers = angular.module('controllers')
controllers.controller("BucketListController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope,$routeParams,$location,$resource)->
    Activity = $resource('/activities/:activityId', { activityId: "@id", format: 'json' })

    Activity.query(keywords: $routeParams.keywords, (results)-> $scope.activities = results)

    $scope.view = (activityId)-> $location.path("/activities/#{activityId}")

    $scope.newActivity = -> $location.path("/activities/new")
])