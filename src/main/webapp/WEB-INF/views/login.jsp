<%-- 
    Document   : Login
    Created on : Feb 25, 2011, 3:59:47 PM
    Author     : Richard Scott Smith <scott.smith@isostech.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Begin login.jsp -->
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head> 
		<meta name="google-site-verification" content="IMZae2DVA8c6D8m8qPwyoHFDRQBkFxm62Uard67XoJw" />

		<title>Selenium Example - Login</title>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="description" content="add" /> 
		<meta name="robots" content="noodp" /> 
		<meta name="verify-v1" content="get-code" /> 
		<meta name="google-site-verification" content="get-code" /> 
		<meta name="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=1.0; user-scalable=1;" /> 

		<meta name="author" content="Richard Scott Smith, Raescott, LLC." />
		<meta name="copyright" content="Raescott, LLC Copyright (c) 2014" />
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/style.css" />

        <link rel="apple-touch-icon" href="/resources/images/icon-2.png" />
		<link rel="icon" href="/resources/images/icon-2.png" type="image/x-icon" />

    </head>
	<body class="main-content">
	<h2>Enter your username and password to login.</h2>

	<form name="login" action="<c:url value="/" />user/login" method="POST">
		<%-- Indicate what failed for the user --%>
		<%-- TODO: Add a decent error message for login failure --%>
		<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'Bad credentials'}">
			<div class="yellow-message-login error">
					${emailInvalid}
					${passwordInvalid}
					${fn:replace(SPRING_SECURITY_LAST_EXCEPTION.message, 'Bad credentials', 'Username/Password are incorrect. Please try again.')}
			</div>
		</c:if>
		<input id="username" name="username" size="30" type="text" placeholder="Username" />
		<br/>
		<input id="password" name="password" type="password" size="30" placeholder="Password" />

		<div class="buttonwrap" >
			<input type="submit" value="Login"/>
		</div>
	</form>
	</body>
</html>

<!-- End login.jsp -->