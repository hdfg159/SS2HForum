<%@ page language="java" import="java.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>帖子详情-${PostDetail.title}</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col s12">
				<blockquote class="flow-text" style="word-wrap: break-word;">${PostDetail.title}</blockquote>
				<blockquote>${PostDetail.postdate}</blockquote>
				<div class="col s12">
					<div class="card-panel hoverable flow-text" style="word-wrap: break-word;">${PostDetail.content}</div>
				</div>
			</div>
			<c:if test="${nowppppp!=NULL}">
				<c:if test="${user.username ne 'anonymous'}">
					<div class="row">
						<form class="col s12"
							action="${pageContext.request.contextPath}/user/comment_addComment" method="post">
							<div class="row">
								<div class="input-field col s12">
									<i class="material-icons prefix">mode_edit</i>
									<textarea id="icon_prefix2" class="materialize-textarea" name="lcomment"></textarea>
									<label for="icon_prefix2">请输入回帖内容</label>
								</div>
								<div class="col s12">
									<blockquote class="flow-text">
										<s:fielderror>
										</s:fielderror>
									</blockquote>
								</div>
							</div>
							<div class="input-field col s6 center ">
								<button class="btn-large waves-effect waves-light light-blue lighten-1"
									type="submit" name="action">
									回复 <i class="material-icons right">send</i>
								</button>
							</div>
							<div class="input-field col s6 center ">
								<a href="post_displayPosts.action?plateid=${nowppppp}"
									class="btn-large waves-effect waves-light light-blue lighten-1"><i
									class="material-icons right">settings_backup_restore</i>返回</a>
							</div>
						</form>
					</div>
				</c:if>
			</c:if>
			<c:if test="${nowppppp!=NULL&&user.username eq 'anonymous'}">
				<div class="input-field col s12 center ">
					<a href="post_displayPosts.action?plateid=${nowppppp}"
						class="btn-large waves-effect waves-light light-blue lighten-1"><i
						class="material-icons right">settings_backup_restore</i>返回</a>
				</div>
			</c:if>
			<div class="col s12">
				<c:forEach var="comment" items="${Postcomments}">
					<div class="card-panel hoverable">
						<div class="left">${comment.user.username}</div>
						<div class="right">${comment.date}</div>
						<br>
						<div class="divider"></div>
						<br>
						<div style="word-wrap: break-word;">${comment.content}</div>
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
