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
            position: fixed;
            top: 25%;
            left: 25%;
            width: 680px;
            height: 540px;
            padding: 20px;
            border: 3px solid #ccc;
            background-color: white;
            z-index:2;
            overflow: auto;
        }
        #next{
            display:block;
            margin:0 auto;
        }
    </style>

</head>
<body>
<H1 align="center"><B>购书记录</B></H1>
<table class = "table table-hover" id = "Record_list" border="1">

    <caption>购书记录</caption>
    <thead>
    <tr>
        <th>用户ID</th>
        <th>用户昵称</th>
        <th>书籍ID</th>
        <th>书籍名称</th>
        <th>数量</th>
        <th>购买日期</th>
        <th>评分</th>
    </tr>
    </thead>
</table>
<button id="next" class="btn-primary">加载更多</button>
        </div><!-- /.box-body -->
    </div><!-- /.box -->
</div>
<%--<button class="btn btn-block btn-success" id="nmsl">hehehe4</button>--%>

<%--用于弹出框的--%>
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="Weblib/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="Weblib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="Weblib/dist/js/adminlte.min.js"></script>
<script src="Record_listOperation.js"></script>
<%--<script src="sqlOperations.js"></script>--%>
</body>
</html>
