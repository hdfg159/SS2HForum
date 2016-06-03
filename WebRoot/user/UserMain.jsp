<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>版块列表</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="center hoverable">
			<blockquote class="flow-text card-panel">版块列表</blockquote>
		</div>
		<div class="row">
			<c:forEach var="plate" items="${PlateList}">
				<div class="col s12 m6">
					<div class="card card-panel hoverable">
						<div class="card-content">
							<span class="card-title truncate"><a
								href="post_displayPosts?plateid=${plate.id}">${plate.platename} </a></span>
							<p>ID：${plate.id}</p>
						</div>
						<c:if test="${user.rank==1}">
							<div class="card-action">
								<a href="plate_deletePlate?plateid=${plate.id}">删除版块</a> <a
									href="plate_entermodinfo.action?plateid=${plate.id}">修改信息</a>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
			<c:if test="${user.rank==1}">
				<div class="col s12 center">
					<a class="waves-effect waves-light btn-large light-blue lighten-1"><i
						class="material-icons right">playlist_add</i>添加版块</a>
				</div>
			</c:if>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="../LoginRegisterTail.jsp"%>
</body>
</html>
