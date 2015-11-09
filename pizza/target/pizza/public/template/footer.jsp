<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script src="<c:url value='/resources/js/pages/header.js' />"></script>
<br><br><br><br>
<footer>
	<p class="pull-left">
		&copy; <a href="#" target="_blank"><spring:message  code="general.company" /></a>
		2014
	</p>
	<p class="pull-right">
		<spring:message  code="general.power" />&nbsp;<a href="#"><spring:message  code="general.area" /></a>
	</p>
</footer>