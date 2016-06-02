<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>发表帖子</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<div class="container">
		<br> <br>
		<div class="row center">
			<i class="medium material-icons prefix">playlist_add</i>
			<h5 class="header col s12 light">发表帖子</h5>
		</div>
		<br>
		<div class="row">
			<form class="col s12" action="${pageContext.request.contextPath}/user/post_addPost"
				method="post">
				<div class="row">
					<div class="input-field col s12">
						<i class="large material-icons prefix">label_outline</i> <input id="username"
							name="title" type="text" class="validate"> <label for="username">请输入标题</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="large material-icons prefix">translate</i>
						<textarea id="icon_prefix2" class="materialize-textarea" name="content"></textarea>
						<label for="icon_prefix2">请输入帖子内容</label>
					</div>
				</div>
				<br>
				<div class="row center">
					<blockquote class="flow-text">
						<s:fielderror></s:fielderror>
					</blockquote>
				</div>
				<br>
				<div class="row center">
					<div class="col s12 m4 l2">
						<button class="btn waves-effect light-blue lighten-1 btn-large" type="submit"
							name="action">
							确定 <i class="material-icons right">send</i>
						</button>
					</div>
					<div class="col s12 m4 l8">
						<a class="waves-effect light-blue lighten-1 btn-large"
							href="post_displayPosts?plateid=${nowppppp}">返回版块主页 <i
							class="material-icons right">toc</i>
						</a>
					</div>
					<div class="col s12 m4 l2">
						<button class="btn waves-effect light-blue lighten-1 btn-large" type="reset"
							name="action">
							重置 <i class="material-icons right">clear_all</i>
						</button>
					</div>
				</div>
			</form>
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
