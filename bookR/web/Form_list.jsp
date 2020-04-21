<%@ page language="java" contentType="text/html; ISO-8859-1ml; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8" name = "viewport" content = "width= device-width,initial-scale = 1.0">
	<title>芜湖南通网上购书平台</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="Weblib/bower_components/bootstrap/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="Weblib/bower_components/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="Weblib/bower_components/Ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="Weblib/dist/css/AdminLTE.min.css">
	<link rel="stylesheet" href="Weblib/dist/css/skins/skin-blue.min.css">
<%--用于弹出框的样式--%>
	<style type="text/css">
		#choiceWindow {
			display: none;
			position: absolute;
			top: 25%;
			left: 25%;
			width: 480px;
			height: 340px;
			padding: 20px;
			border: 3px solid #ccc;
			background-color: white;
			z-index:2;
			overflow: auto;
		}
		 li{
			 list-style: none;
		 }
		#next{
			display:block;
			margin:0 auto;
		}
	</style>

</head>
<body>
<H2 align="center"><B>书籍信息</B></H2>
<button id = "test" class="btn btn-Success">添加出售书籍</button>
<table class = "table table-hover" id = "product_list" border="1">

<caption>出售书籍一览</caption>

<thead>
	<tr>
	<th>ID</th>
	<th>名字</th>
	<th>类型</th>
	<th>数量</th>
		<th>单价(旧)</th>
		<th>单价(新)</th>
	<th>操作</th>

	</tr>
</thead>

</table>
<button id="next" class="btn-primary">加载更多</button>
<%--弹出框--%>
<div id="choiceWindow">
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title" align="center">商品信息修改</h3>
			<div class="box-tools pull-right">
				<!-- Buttons, labels, and many other things can be placed here! -->
				<!-- Here is a label for example -->
			</div><!-- /.box-tools -->
		</div><!-- /.box-header -->
		<div class="box-body" align="left">
				<ul>
					<li>书籍ID    : <Input type=text id = "item_Id" name="item_Id"  value=""/></li>
					<li>书籍名称:<Input type=text id = "item_Name" name="item_Name" value=""/></li>
					<li>书籍类型:<Input type=text id = "type" name="type" value=""></li>
					<li>书籍数量:<Input type=text id = "quantity" name="quantity" value=""/></li>
					<li>书籍价格(旧):<Input type=text id = "oldPrice" name="oldPrice" value=""/></li>
                    <li>书籍价格(新):<Input type=text id = "newPrice" name="newPrice" value=""/></li>
					<li>书籍简介:<br><textarea  name="introduction" style="width:220px;height:80px;" value=""/></li>
					<li>书籍详情:<br><textarea  name="detail" style="width:220px;height:80px;" value=""/></li>
					<li>
						<Button id = "ok" class = "btn  btn-Success">确定</Button>
						<Button class = "btn  btn-Default">取消</Button>
					</li>
				</ul>

		</div><!-- /.box-body -->
		<div class="box-footer">
			<!--                        The footer of the box-->
		</div><!-- box-footer -->
	</div><!-- /.box -->
</div>
<%--<button class="btn btn-block btn-success" id="nmsl">hehehe4</button>--%>

<%--用于弹出框的--%>
<link rel="stylesheet"
	  href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="Weblib/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="Weblib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="Weblib/dist/js/adminlte.min.js"></script>
<script src="product_listOperations.js"></script>
<%--<script src="sqlOperations.js"></script>--%>
</body>
</html>
