<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row-fluid" ng-controller="controller">
	<!-- Modal -->
	<div id="pizzaModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<form novalidate class="simple-form">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<spring:message code="home.item.title"></spring:message>
						</h4>
					</div>

					<div class="modal-body">

						<table width="100%">
							<tr>
								<td>
									<div class="row" ng-repeat="pizza in page.source">
										<div class="col-md-1">
											<div class="checkbox">
												<label><input type="checkbox"
													ng-click="checkQuantity(pizza)"
													ng-model="pizzas_ids[pizza.id]"
													ng-checked="pizzas_ids[pizza.id]"> {{pizza.flavor}}
													- {{pizza.price}},00 </label>
											</div>
										</div>
									</div>
								</td>
								<td>
									<div class="panel panel-primary">
										<div id="divTotal" class="panel-heading">
											<h3 class="panel-title">
												<spring:message code="pizza.label.title" />
											</h3>
										</div>
										<ul>
											<li ng-repeat="item in listOfPizza">{{ item.flavor }}</li>
										</ul>
									</div>
								</td>
							</tr>
						</table>
					</div>

					<div class="modal-footer">
						<input type="submit" class="btn btn-default" ng-click="addPizza()"
							value="Include" />
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Modal -->
	<div id="drinkModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<form novalidate class="simple-form">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<spring:message code="home.item.title"></spring:message>
						</h4>
					</div>

					<div class="modal-body">

						<table width="100%">
							<tr>
								<td>
									<div class="row" ng-repeat="item in page.sourceDrinks">
										<div class="col-md-1">
											<div class="checkbox">
												<label> <input type="submit" class="btn btn-default"
													ng-click="addOthers(item)" value="Include" />
													{{item.flavor}} - {{item.price}},00
												</label>
											</div>
										</div>
									</div>
								</td>

							</tr>
						</table>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Modal -->
	<div id="dessertModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<form novalidate class="simple-form">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<spring:message code="home.item.title"></spring:message>
						</h4>
					</div>

					<div class="modal-body">

						<table width="100%">
							<tr>
								<td>
									<div class="row" ng-repeat="item in page.sourceDessert">
										<div class="col-md-1">
											<div class="checkbox">
												<label> <input type="submit" class="btn btn-default"
													ng-click="addOthers(item)" value="Include" />
													{{item.flavor}} - {{item.price}},00
												</label>
											</div>
										</div>
									</div>
								</td>

							</tr>
						</table>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="col-md-2">
		<ul class="nav nav-pills nav-stacked">
			<li ng-class="{ active: isSet(1) }"><a href ng-click="setTab(1)">Consumer</a></li>
			<li ng-class="{ active: isSet(2) }"><a href ng-click="setTab(2)">Store</a></li>
		</ul>
	</div>
	<div class="col-md-8">

		<div ng-show="isSet(1)">

			<!-- start store -->

			<div class="row">

				<div class="col-xs-7 col-md-8 col-sm-8 col-lg-8">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">
								<spring:message code='home.item' />
							</h3>
						</div>
						<div class="panel-body">

							<button type="button" class="btn btn-info btn-lg"
								data-toggle="modal" data-target="#pizzaModal">
								<spring:message code='home.item.pizzas' />
							</button>

							<button type="button" class="btn btn-info btn-lg"
								data-toggle="modal" data-target="#drinkModal">
								<spring:message code='home.item.drinks' />
							</button>

							<button type="button" class="btn btn-info btn-lg"
								data-toggle="modal" data-target="#dessertModal">
								<spring:message code='home.item.dessert' />
							</button>
						</div>
					</div>

					<div class="col-xs-5 col-md-4 col-sm-4 col-lg-4" data-spy="affix"
						data-offset-top="20">
						<div class="panel panel-primary">
							<div id="divTotal" class="panel-heading">
								<h3 class="panel-title">Total - {{totalPrice}},00</h3>
							</div>
							<div class="panel-body">
								<table>
									<tr ng-repeat="cart in listOfCart">
										<td align="right">{{cart.price}},00</td>
										<td>&nbsp;{{cart.flavor}}</td>
									<tr>
								</table>
							</div>
						</div>
						<div class="text-center">
							<a href="#" ng-click="addServiceOrder(listOfCart)"
								class="btn btn-danger">Checkout<span aria-hidden="true"></span></a>
						</div>

					</div>
				</div>
				<!-- /.row  -->
			</div>

			<!-- end store -->

		</div>

		<div ng-show="isSet(2)">
		
			<h1>Service Orders</h1>
<br>
			<!-- start list of order -->

			<table class="table table-striped table-condensed table-hover">
				<thead>
					<tr>
						<th></th>
						<th class="description" custom-sort order="'description'" sort="sort">Description&nbsp;</th>
						<th class="price" custom-sort order="'price'" sort="sort">Price&nbsp;</th>
						<th class="status" custom-sort order="'status'" sort="sort">SO. Status&nbsp;</th>
					</tr>
				</thead>

				<tbody>
					<tr ng-repeat="so in page.sourceSO">
						<td></td>			
						<td>{{so.description}}</td>
						<td>{{so.price}},00</td>
						<td ng-switch="so.open">							
							<input type="submit" ng-switch-when="true" class="btn btn-default" ng-click="updateSO(so)" value="Close Order" />  
							<input type="submit" ng-switch-when="false" class="btn btn-default" ng-click="updateSO(so)" value="Closed" disabled="disabled"/>
						</td>
																
					</tr>
				</tbody>
			</table>

			<!-- end list of order -->

		</div>

	</div>
</div>


<script src="<c:url value="/resources/js/pages/welcomePage.js" />"></script>