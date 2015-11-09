function controller($scope, $http) {

	$scope.listOfPizza = [];

	$scope.pageToGet = 0;

	$scope.state = 'busy';

	$scope.lastAction = '';

	$scope.url = "/pizza/";

	$scope.item = "";
	$scope.itemPrice = "";
	$scope.itemCategory = "";
	$scope.pizzas_ids = [];

	$scope.listOfCart = [];
	$scope.totalPrice = 0;

	$scope.errorOnSubmit = false;
	$scope.errorIllegalAccess = false;
	$scope.displayMessageToUser = false;
	$scope.displayValidationError = false;
	$scope.displaySearchMessage = false;
	$scope.displaySearchButton = false;
	$scope.displayCreateContactButton = false;

	$scope.contact = {};

	$scope.searchFor = "";

	$scope.getContactList = function () {

		var url = $scope.url;

		$scope.lastAction = 'list';

		$scope.startDialogAjaxRequest();

		var config = {params: {page: $scope.pageToGet}};

		$http.get(url, config)
		.success(function (data) {
			$scope.finishAjaxCallOnSuccess(data, null, false);
		})
		.error(function(data, status, headers, config) {
			$scope.state = 'error';
			$scope.displayCreateContactButton = false;
		});
	};

	$scope.populateTable = function (data) {

		$scope.state = 'list';

		$scope.page = {source: data.pizzas, 
				sourceDessert: data.desserts, 
				sourceDrinks: data.drinks,
				sourceSO: data.serviceOrders, 
				currentPage: $scope.pageToGet, 
				pagesCount: data.pagesCount, 
				totalContacts : data.totalContacts};

		if($scope.page.pagesCount <= $scope.page.currentPage){
			$scope.pageToGet = $scope.page.pagesCount - 1;
			$scope.page.currentPage = $scope.page.pagesCount - 1;
		}

		$scope.displayCreateContactButton = true;
		$scope.displaySearchButton = true;

		if (data.actionMessage || data.searchMessage) {
			$scope.displayMessageToUser = $scope.lastAction != 'search';

			$scope.page.actionMessage = data.actionMessage;
			$scope.page.searchMessage = data.searchMessage;
		} else {
			$scope.displayMessageToUser = false;
		}
	};

	$scope.exit = function (modalId) {
		$(modalId).modal('hide');

		$scope.contact = {};
		$scope.errorOnSubmit = false;
		$scope.errorIllegalAccess = false;
		$scope.displayValidationError = false;
	};

	$scope.finishAjaxCallOnSuccess = function (data, modalId, isPagination) {
		$scope.populateTable(data);
		//$("#loadingModal").modal('hide');

		if(!isPagination){
			if(modalId){
				$scope.exit(modalId);
			}
		}

		$scope.lastAction = '';
	};

	$scope.startDialogAjaxRequest = function () {
		$scope.displayValidationError = false;
		//$("#loadingModal").modal('show');
		$scope.previousState = $scope.state;
		$scope.state = 'busy';
	};

	$scope.handleErrorInDialogs = function (status) {
		//$("#loadingModal").modal('hide');
		$scope.state = $scope.previousState;

		// illegal access
		if(status == 403){
			$scope.errorIllegalAccess = true;
			return;
		}

		$scope.errorOnSubmit = true;
		$scope.lastAction = '';
	};

	$scope.addSearchParametersIfNeeded = function(config, isPagination) {
		if(!config.params){
			config.params = {};
		}

		config.params.page = $scope.pageToGet;

		if($scope.searchFor){
			config.params.searchFor = $scope.searchFor;
		}
	};

	$scope.resetContact = function(){
		$scope.contact = {};
	};

	$scope.updateSO = function (so) {

		$scope.lastAction = 'update';

		var url = $scope.url + so.id;

		$scope.startDialogAjaxRequest();

		var config = {};

		$scope.addSearchParametersIfNeeded(config, false);

		$http.put(url, so, config)
		.success(function (data) {
			$scope.getContactList();
		})
		.error(function(data, status, headers, config) {
			$scope.getContactList();
		});
	};

	$scope.checkQuantity = function (pizza) {

		for(var i=0; i < $scope.listOfPizza.length; i++) {
			$scope.listOfPizza[i].selected = $scope.allChecked;
		}

		if($scope.listOfPizza.indexOf(pizza) == -1) {
			$scope.listOfPizza.push(pizza);    		
			if ($scope.listOfPizza.length > 4) {
				alert('Choose more than 4 flavors is not allowed');        		
			}    		
		} else {
			for(i = 0; i < $scope.listOfPizza.length; i++) {    			
				if($scope.listOfPizza[i].id == pizza.id) {
					$scope.listOfPizza.splice(i, 1);
				}    			
			}    		
		}

		$scope.pizza = '';
	};

	$scope.addPizza = function () {

		if ($scope.listOfPizza.length <= 4) {
			$scope.pizzas_ids = [];

			$scope.itemPrice = $scope.listOfPizza[0].price;
			$scope.itemCategory = $scope.listOfPizza[0].category;
			
			$scope.item = ' * ';

			for(i = 0; i < $scope.listOfPizza.length; i++) {

				$scope.item = $scope.item + $scope.listOfPizza[i].flavor + '|';

				if($scope.listOfPizza[i].price > $scope.itemPrice) {
					$scope.itemPrice = $scope.listOfPizza[i].price;    			
				}
			}

			$scope.cart = { 
					flavor: $scope.item, 
					price: $scope.itemPrice,
			};

			$scope.listOfCart.push($scope.cart);

			$scope.totalPrice = $scope.totalPrice + $scope.itemPrice;

			$scope.item = '';
			$scope.itemPrice = '';
			$scope.listOfPizza = [];
		} else {
			alert('Choose more than 4 flavors is not allowed');
		}
	};

	$scope.addOthers = function (item) {

		$scope.cart = { 
				flavor: ' * '+item.flavor, 
				price: item.price				
		};

		$scope.listOfCart.push($scope.cart);

		$scope.totalPrice = $scope.totalPrice + item.price;

	};

	$scope.tab = 1;

	$scope.setTab = function(newTab) {
		
		$scope.getContactList();
		
		$scope.tab = newTab;
	};

	$scope.isSet = function(tabNum){
		return $scope.tab === tabNum;
	};
		
	$scope.addServiceOrder = function(listOfCart) {

		$scope.lastAction = 'createSO';

		var url = $scope.url;

		$scope.startDialogAjaxRequest();

		$http.post(url, listOfCart)
		.success(function (data) {
			
			$scope.finishAjaxCallOnSuccess(data, "#addContactsModal", false);			
			$scope.listOfCart = [];
			$scope.totalPrice = 0;	
			$scope.getContactList();
			alert('Order was created!!!');
		})
		.error(function(data, status, headers, config) {
			$scope.handleErrorInDialogs(status);
		});

	};
	
	$scope.getContactList();
}