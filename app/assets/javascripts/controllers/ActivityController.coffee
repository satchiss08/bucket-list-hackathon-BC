controllers = angular.module('controllers')
controllers.controller("ActivityController", [ '$scope', '$routeParams', '$resource', '$location', 'flash',
  ($scope,$routeParams,$resource,$location, flash)->
    Activity = $resource('/activities/:activityId', { activityId: "@id", format: 'json' },
      {
        'save':   {method:'PUT'},
        'create': {method:'POST'}
      }
    )

    if $routeParams.activityId
      Activity.get({activityId: $routeParams.activityId},
        ( (activity)-> $scope.activity = activity ),
        ( (httpResponse)->
          $scope.activity = null
          flash.error   = "There is no activity with ID #{$routeParams.activityId}"
        )
      )
    else
      $scope.activity = {}

    $scope.back   = -> $location.path("/")
    $scope.edit   = -> $location.path("/activities/#{$scope.activity.id}/edit")
    $scope.cancel = ->
      if $scope.activity.id
        $location.path("/activities/#{$scope.activity.id}")
      else
        $location.path("/")

    $scope.save = ->
      onError = (_httpResponse)-> flash.error = "Something went wrong"
      if $scope.activity.id
        $scope.activity.$save(
          ( ()-> $location.path("/activities/#{$scope.activity.id}") ),
          onError)
      else
        Activity.create($scope.activity,
          ( (newActivity)-> $location.path("/activities/#{newActivity.id}") ),
          onError
        )

    $scope.delete = ->
      $scope.activity.$delete()
      $scope.back()


])
