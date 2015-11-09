<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="pt-BR" id="ng-app" ng-app="">
<head>
<title><spring:message code="home.name" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	padding-top: 50px;
}

#divTotal {
	background-color: green;
}

.affix {
	right: 0px;
}

.affix-top {
	right: 0px;
	position: fixed;
}

.scroll-debug {
	position: fixed;
	bottom: 10px;
	right: 10px;
}
</style>

<script src="<c:url value='/resources/js/angular.min.js' />"></script>

</head>
<meta http-equiv="refresh">
<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />


<body>
	<div class="container">
		<tiles:insertAttribute name="header" />

		<tiles:insertAttribute name="body" />
	</div>

	<script src="<c:url value='/resources/js/cart.js' />"></script>
	<script src="<c:url value='/resources/js/checkout.js' />"></script>

</body>
</html>