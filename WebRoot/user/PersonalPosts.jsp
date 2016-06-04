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
			<blockquote class="grey-text flow-text card-panel">${user.username}帖子列表</blockquote>
		</div>
		<div class="row">
			<c:forEach var="post" items="${modposts}">
				<div class="col s12 m6">
					<div class="card hoverable">
						<div class="card-content">
							<span class="card-title  truncate"><a
								href="comment_postDetailComment.action?postid=${post.id}"><c:if
										test="${post.position==1}">
										<i class="material-icons">present_to_all</i>
									</c:if>${post.title}</a></span><i class="activator material-icons right">more_vert</i>
							<p class="grey-text">${post.user.username}
								发表于 ${post.postdate}
								<c:if test="${post.position==1}">[置顶帖]</c:if>
							</p>
						</div>
						<div class="card-reveal">
							<span class="card-title grey-text text-darken-4"><i class=" material-icons">loyalty</i>帖子详细信息<i
								class="material-icons right">close</i></span>
							<p>
								<i class=" material-icons">chat_bubble</i>所属版块:${post.plate.platename}
							</p>
							<p>
								<i class=" material-icons">turned_in_not</i>帖子ID:${post.id}
							</p>
							<p>
								<i class=" material-icons">label_outline</i>标题:${post.title}
							</p>
							<p>
								<i class=" material-icons">perm_identity</i>用户:${post.user.username}
							</p>
							<p>
								<i class=" material-icons">alarm_on</i>日期:${post.postdate}
							</p>
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
