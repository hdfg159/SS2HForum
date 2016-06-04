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
		<div class="center hoverable">
			<blockquote class="grey-text flow-text card-panel">帖子列表</blockquote>
		</div>
		<div class="row">
			<c:forEach var="post" items="${displaypost}">
				<div class="col s12 m6">
					<div class="card hoverable">
						<div class="card-content">
							<span class="card-title truncate"><a
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
							<p class=" truncate">
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
							<c:if
								test="${user.id!=post.user.id&&user.rank!=1&&(user.plateid!=nowppppp&&user.rank!=2)}">
								<a class="waves-effect btn-flat truncate"
									href="comment_postDetailComment.action?postid=${post.id}">点击标题查看帖子</a>
							</c:if>
							<c:if
								test="${user.id==post.user.id||user.rank==1||(user.plateid==nowppppp&&user.rank==2)}">
								<a href="post_deletePost.action?postid=${post.id}" class="waves-effect btn-flat">删除帖子</a>
								<c:if test="${user.rank==1||(user.plateid==nowppppp&&user.rank==2)}">
									<a href="post_top.action?postid=${post.id}" class="waves-effect btn-flat "><c:if
											test="${post.position==0}">置顶帖子</c:if> <c:if test="${post.position!=0}">取消置顶</c:if></a>
								</c:if>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<c:if test="${user.rank!=1&&user.username ne 'anonymous'}">
			<div class="row">
				<div class="col s6 center">
					<a class="waves-effect light-blue lighten-1 btn-large" href="AddPosts.jsp"> <i
						class="material-icons right">playlist_add</i>发表帖子
					</a>
				</div>
				<div class="col s6 center">
					<a class="waves-effect light-blue lighten-1 btn-large" href="MainAction.action">
						<i class="material-icons right">settings_backup_restore</i>返回主页
					</a>
				</div>
			</div>
		</c:if>
		<c:if test="${user.rank==1}">
			<div class="row">
				<div class="col s4 center">
					<a class="waves-effect light-blue lighten-1 btn-large" href="AddPosts.jsp"> <i
						class="material-icons right">playlist_add</i>发表帖子
					</a>
				</div>
				<div class="col s4 center">
					<a class="waves-effect light-blue lighten-1 btn-large"
						href="admin_PgetUserList.action"> <i class="material-icons right">settings</i>设置版主
					</a>
				</div>
				<div class="col s4 center">
					<a class="waves-effect light-blue lighten-1 btn-large" href="MainAction.action">
						<i class="material-icons right">settings_backup_restore</i>返回主页
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