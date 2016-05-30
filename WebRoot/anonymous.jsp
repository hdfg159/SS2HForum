<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>anonymous</title>
</head>
<body>
	<%
		response.sendRedirect("bbs_login.action?username=anonymous&pwd=anonymous");
	%>
</body>
</html>
