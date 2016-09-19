'use strict';

angular.module('marketplace.home', ['bw.paging'])

.controller('HomeCtrl', ['$scope', 'util', 'ShoppingCart', function ($scope, util, cart) {
    // Data model binding
    $scope.loadData = function (pNumber, pSize) {
        util.callRequest('products', "GET", {pageNumber: pNumber, pageSize: pSize}).then(function (data) {
            $scope.products = data.result;
            $scope.totalPage = data.total_records;
        });
    };

    $scope.loadPage = function (page) {
        $scope.loadData(page - 1, $scope.pageSize);
    };

    $scope.addToCart = function (product) {
        cart.addItem(product);
    };

    $scope.loadData(0, $scope.pageSize);
    
    // angular event listener for event of search box directive
    $scope.$on( 'searchResult', function( event, data ) {
        console.debug( data );
        // binding search data into product list
        $scope.products = data.result;
        $scope.totalPage = data.total_records;
    });
                
    // jquery slider event listener
    $(document).on('slideStop', function ( event ) {
        // it work incorrect, may be we will change to angular directive
        var minPrice = event.value[0],
            maxPrice = event.value[1];
            
        // *********Todo implement*************    
        // call API and set data response into 'result' variable
        // util.callRequest(...)
        
        // $scope.products = data.result;
        // $scope.totalPage = data.total_records;
        console.debug( minPrice, maxPrice );
    });
    
}]);

