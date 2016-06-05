<%@ page language="java" import="java.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>帖子详情-${PostDetail.title}</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<c:if test="${nowppppp!=NULL&&user.username ne 'anonymous'}">
		<div class="fixed-action-btn" style="bottom: 25px; right: 25px;">
			<a href="#edit" class="btn-floating btn-large red"> <i class="large material-icons">mode_edit</i>
			</a>
		</div>
	</c:if>
	<c:if test="${nowppppp!=NULL&&user.username eq 'anonymous'}">
		<div class="fixed-action-btn" style="bottom: 25px; right: 25px;">
			<a href="post_displayPosts.action?plateid=${nowppppp}"
				class="btn-floating btn-large red"> <i class="large material-icons">call_missed</i>
			</a>
		</div>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col s12">
				Title:
				<blockquote style="word-wrap: break-word;">${PostDetail.title}</blockquote>
				<div class="divider"></div>
				User:
				<blockquote>${PostDetail.user.username}</blockquote>
				<div class="divider"></div>
				Date:
				<blockquote>${PostDetail.postdate}</blockquote>
				<div class="divider"></div>
				Content:
				<blockquote style="word-wrap: break-word;white-space: pre-wrap">${PostDetail.content}</blockquote>
				<div class="divider"></div>
			</div>
			<c:if test="${nowppppp!=NULL}">
				<c:if test="${user.username ne 'anonymous'}">
					<div class="row">
						<form class="col s12"
							action="${pageContext.request.contextPath}/user/comment_addComment" method="post">
							<div class="row">
								<div id="edit" class="section scrollspy"></div>
								<div class="input-field col s12">
									<i class="material-icons prefix">mode_edit</i>
									<textarea id="icon_prefix2" class="materialize-textarea" name="lcomment"></textarea>
									<label for="icon_prefix2">请输入回帖内容</label>
								</div>
							</div>
							<div class="col s12">
								<blockquote>
									<s:fielderror>
									</s:fielderror>
								</blockquote>
							</div>
							<div class="input-field col s6 center ">
								<button class="btn waves-effect waves-light light-blue lighten-1" type="submit"
									name="action">
									回复 <i class="material-icons right">send</i>
								</button>
							</div>
							<div class="input-field col s6 center ">
								<a href="post_displayPosts.action?plateid=${nowppppp}"
									class="btn waves-effect waves-light light-blue lighten-1"><i
									class="material-icons right">settings_backup_restore</i>返回</a>
							</div>
						</form>
					</div>
				</c:if>
			</c:if>
			<div class="col s12">
				<c:forEach var="comment" items="${Postcomments}">
					<div class="card-panel hoverable">
						<div class="left">${comment.user.username}</div>
						<div class="right">${comment.date}</div>
						<br>
						<div class="divider"></div>
						<br>
						<div style="word-wrap: break-word;">
							<div style="white-space: pre-wrap">${comment.content}</div>
						</div>
						<br>
						<c:if
							test="${user.id==comment.user.id||user.rank==1||(user.plateid==nowppppp&&user.rank==2)}">
							<div class="right">
								<a class="waves-effect  orange darken-4 btn"
									href="comment_deleteComment.action?commentid=${comment.id}"><i
									class="material-icons right">delete</i>删除</a>
							</div>
						</c:if>
					</div>
					<br>
				</c:forEach>
			</div>
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
