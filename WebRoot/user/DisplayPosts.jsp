<%@ page language="java" import="java.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>帖子列表</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="card-panel center card-panel hoverable">
			<span class="black-text flow-text">帖子列表</span>
		</div>
		<div class="row">
			<c:forEach var="post" items="${displaypost}">
				<div class="col s12 m6">
					<div class="card card-panel hoverable">
						<div class="card-content">
							<span class="card-title truncate"><a
								href="comment_postDetailComment.action?postid=${post.id}"><c:if
										test="${post.position==1}">
										<i class="material-icons left">present_to_all</i>
									</c:if>${post.title}</a></span>
							<p>用户：${post.user.username}</p>
							<p>时间：${post.postdate}</p>
							<p>版块：${post.plate.platename}</p>
						</div>
						<c:if
							test="${user.id==post.user.id||user.rank==1||(user.plateid==nowppppp&&user.rank==2)}">
							<div class="card-action">
								<a href="post_deletePost.action?postid=${post.id}" class="waves-effect btn-flat">删除帖子</a>
								<c:if test="${user.rank==1||(user.plateid==nowppppp&&user.rank==2)}">
									<a href="post_top.action?postid=${post.id}" class="waves-effect btn-flat "><c:if
											test="${post.position==0}">置顶帖子</c:if> <c:if test="${post.position!=0}">取消置顶</c:if></a>
								</c:if>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${user.rank!=1&&user.username ne 'anonymous'}">
			<div class="col s12 center">
				<a class="waves-effect light-blue lighten-1 btn-large" href="AddPosts.jsp"> <i
					class="material-icons right">playlist_add</i>发表帖子
				</a>
			</div>
		</c:if>
		<c:if test="${user.rank==1}">
			<div class="row">
				<div class="col s12 m6">
					<a class="waves-effect light-blue lighten-1 btn-large" href="AddPosts.jsp"> <i
						class="material-icons right">playlist_add</i>发表帖子
					</a>
				</div>
				<div class="col s12 m6">
					<a class="waves-effect light-blue lighten-1 btn-large"
						href="admin_PgetUserList.action"> <i class="material-icons right">settings</i>设置版主
					</a>
				</div>
			</div>
		</c:if>
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