<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>${user.username}个人帖子管理</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="center hoverable">
			<blockquote class="flow-text card-panel">${user.username}帖子列表</blockquote>
		</div>
		<div class="row">
			<c:forEach var="post" items="${modposts}">
				<div class="col s12 m6">
					<div class="card card-panel hoverable">
						<div class="card-content">
							<span class="card-title  truncate"><a
								href="comment_postDetailComment.action?postid=${post.id}"><c:if
										test="${post.position==1}">
										<i class="material-icons left">present_to_all</i>
									</c:if>${post.title}</a></span>
							<p>用户：${post.user.username}</p>
							<p>时间：${post.postdate}</p>
							<p>版块：${post.plate.platename}</p>
						</div>
						<div class="card-action">
							<a href="personal_deletePost.action?postid=${post.id}"
								class="waves-effect btn-flat">删除帖子</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%@include file="../LoginRegisterTail.jsp"%>
</body>
</html>
