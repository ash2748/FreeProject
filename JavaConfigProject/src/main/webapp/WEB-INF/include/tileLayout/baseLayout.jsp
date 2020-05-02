<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="UTF-8">

<head>
	<!-- library -->
	<tiles:insertAttribute name="library"/>
</head>

<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <!-- ash : navi header -->
			<tiles:insertAttribute name="header"/>
			<!-- ash : Left navi bar -->
			<tiles:insertAttribute name="leftbar"/>
        </nav>
		
		<tiles:insertAttribute name="body"/>
    </div>
</body>

</html>
