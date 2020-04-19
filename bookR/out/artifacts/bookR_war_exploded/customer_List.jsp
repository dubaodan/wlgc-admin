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
            width: 410px;
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
    </style>
</head>
<body>
<H1 align="center"><B>顾客</B>信息界面</H1>
<table class = "table table-hover" id = "customer_list" border="1">

    <caption>顾客信息表</caption>
    <thead>
    <tr>
        <th>ID</th>
        <th>昵称</th>
        <th>电话</th>
        <th>操作</th>
    </tr>
    </thead>

</table>


<%--弹出框--%>
<div id="choiceWindow">
    <div class="box">
        <div class="box-header with-border">
            <h3 align="center">顾客信息修改</h3>
            <div class="box-tools pull-right">
                <!-- Buttons, labels, and many other things can be placed here! -->
                <!-- Here is a label for example -->
            </div><!-- /.box-tools -->
        </div><!-- /.box-header -->
        <div class="box-body">
            <ul>
                <li>顾客ID  :</pre><Input type=text id = "cu_Id" name="cu_Id"  value=""/></li>
                <li>顾客昵称:<Input type=text id = "cu_Name" name="cu_Name" value=""/></li>
                <li>顾客电话:<Input type=text id = "telephone" name="telephone" value=""></li>
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
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="Weblib/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="Weblib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="Weblib/dist/js/adminlte.min.js"></script>
<script src="customer_listOperations.js"></script>
</body>
</html>
