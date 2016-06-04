<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>搜索帖子</title>
</head>
<body>
	<%@include file="PostPlateHead.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row center card-panel hoverable">
			<form action="SearchAction" method="post">
				<div class="input-field col s8">
					<i class="material-icons prefix">search</i> <input id="icon_telephone" type="text"
						name="search" class="validate"> <label for="icon_telephone">输入搜索关键字</label>
				</div>
				<div class="input-field col s4">
					<button class="btn-large waves-effect waves-light" type="submit" name="action">
						确定 <i class="material-icons right">send</i>
					</button>
				</div>
			</form>
		</div>
		<div class="row center">
			<blockquote class="flow-text">
				<s:fielderror></s:fielderror>
			</blockquote>
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
