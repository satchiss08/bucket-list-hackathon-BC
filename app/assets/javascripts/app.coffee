bucket_list = angular.module('bucket_list',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

bucket_list.config([ '$routeProvider', 'flashProvider',
  ($routeProvider,flashProvider)->

    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")

    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'BucketListController'
      ).when('/activities/new',
        templateUrl: "form.html"
        controller: 'ActivityController'
      ).when('/activities/:activityId',
        templateUrl: "show.html"
        controller: 'ActivityController'
      ).when('/activities/:activitiesId/edit',
        templateUrl: "form.html"
        controller: 'ActivityController'
      )
])

controllers = angular.module('controllers',[])
