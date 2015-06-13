bucket_list = angular.module('bucket_list',[
  'templates',
  'ngRoute',
  'controllers',
])

bucket_list.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'HomeController'
      )
])

controllers = angular.module('controllers',[])
controllers.controller("HomeController", [ '$scope',
  ($scope)->
])