<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>芜湖南通网上购书平台</title>
    <link rel="stylesheet" href="Weblib/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="Weblib/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="Weblib/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="Weblib/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter>
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect. -->
    <link rel="stylesheet" href="Weblib/dist/css/skins/skin-blue.min.css">
</head>

<body class="hold-transition skin-blue  sidebar-mini">
<!-- 整个界面的布局-->
<div class="wrapper">
    <!-- 导航栏左边的logo-->
    <header class="main-header">
        <a href="index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <!--         缩小后的-->
            <span class="logo-mini"><b>购书管理</b></span>
            <!-- logo for regular state and mobile devices -->
            <!--         放大后的-->
            <span class="logo-lg"><b>购书管理</b></span>
        </a>
        <!--      导航栏的横条-->
        <nav class="navbar navbar-static-top" role="navigation">
            <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!--         把东西放在导航栏的右边-->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <img src="Weblib/dist/img/dubaodan.jpg" class="user-image" alt="User Image">
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">dubaodan</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <li class="user-header">
                                <img src="Weblib/dist/img/123.jpg" class="img-circle" alt="User Image">

                                <p>
                                    dubaodan
                                    <small>Member since july. 2019</small>
                                </p>
                            </li>
                            <!--                 菜单栏-->
                            <li class="user-body">
                                <div class="row">
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Followers</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Sales</a>
                                    </div>
                                    <div class="col-xs-4 text-center">
                                        <a href="#">Friends</a>
                                    </div>
                                </div>
                                <!-- /.row -->
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <!-- Control Sidebar Toggle Button -->
                </ul>
                </li>
            </div>

        </nav>
        <!--    <div class="topnav">-->
        <!--        <ul class= "nav nav-tabs">&lt;!&ndash;-->
        <!--            &ndash;&gt;<li class = "active"><a href="../LoginServlet?list=homepage" target="mainframe">查看商品</a></li>&lt;!&ndash;-->
        <!--            &ndash;&gt;<li><a href="../LoginServlet?list=photos" target="mainframe">商品推荐</a></li>&lt;!&ndash;-->
        <!--        &ndash;&gt;</ul>-->
        <!--    </div>-->
    </header>
    <!--     左边的导航栏-->
    <aside class="main-sidebar">
        <section class="sidebar">
            <!--                用户的小容器-->
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="Weblib/dist/img/dubaodan.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>dubaodan</p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>
            <!--             树形列表-->
            <ul class="sidebar-menu" data-widget="tree">
                <li class="header">购书管理系统</li>
                <!-- Optionally, you can add icons to the links -->
                <li><a id = "toProduct_list" ><i class="fa fa-truck"></i> <span>书籍一览</span></a></li>
                <li><a id = "toSale_sta"><i class="fa fa-bar-chart"></i> <span>销售统计</span></a></li>
                <li><a id = "toCustomer"><i class = "fa  fa-male"></i><span>顾客信息表</span></a></li>
                <li><a id = "toRecord"><i class="fa fa-shopping-cart"></i> <span>购书记录表</span></a></li>
<%--                        <span class="pull-right-container">--%>
<%--                <i class="fa fa-angle-left pull-right"></i>--%>
<%--              </span>--%>
<%--                    </a>--%>
<%--                    <ul class="treeview-menu">--%>
<%--                        <li><a href="#">Link in level 2</a></li>--%>
<%--                        <li><a href="#">Link in level 2</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
            </ul>
        </section>
    </aside>
    <!--     主页界面-->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 购书管理</a></li>
            </ol>
            <div id = "main_body">

            </div>
        </section>

        <!-- Main content -->
        <section class="content container-fluid">

            <!--------------------------
              | Your Page Content Here |
              -------------------------->

        </section>
        <!-- /.content -->
    </div>
    <!--     最底下的页脚-->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            购书管理平台
        </div>
        <!-- Default to the left -->
        <strong>make by  dubaodan <a href="#">Team</a>.</strong>
    </footer>
    <!--     控制左边的工具栏-->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
            <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- Home tab content -->
            <div class="tab-pane active" id="control-sidebar-home-tab">
                <h3 class="control-sidebar-heading">Recent Activity</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:;">
                            <i class="menu-icon fa fa-birthday-cake bg-red"></i>

                            <div class="menu-info">
                                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                                <p>Will be 23 on April 24th</p>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

                <h3 class="control-sidebar-heading">Tasks Progress</h3>
                <ul class="control-sidebar-menu">
                    <li>
                        <a href="javascript:;">
                            <h4 class="control-sidebar-subheading">
                                Custom Template Design
                                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
                            </h4>

                            <div class="progress progress-xxs">
                                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
                            </div>
                        </a>
                    </li>
                </ul>
                <!-- /.control-sidebar-menu -->

            </div>
            <!-- /.tab-pane -->
            <!-- Stats tab content -->
            <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
            <!-- /.tab-pane -->
            <!-- Settings tab content -->
            <div class="tab-pane" id="control-sidebar-settings-tab">
                <form method="post">
                    <h3 class="control-sidebar-heading">General Settings</h3>

                    <div class="form-group">
                        <label class="control-sidebar-subheading">
                            Report panel usage
                            <input type="checkbox" class="pull-right" checked>
                        </label>

                        <p>
                            Some information about this general settings option
                        </p>
                    </div>
                    <!-- /.form-group -->
                </form>
            </div>
            <!-- /.tab-pane -->
        </div>
    </aside>
    <!--     引入脚本-->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<script src="Weblib/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="Weblib/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="Weblib/dist/js/adminlte.min.js"></script>

<script type="text/javascript">
        $(document).ready(function () {
            $(function(){
                $(".sidebar-menu li").click(function() {
                    $(this).siblings('li').removeClass('active');  // 删除其兄弟元素的样式
                    $(this).addClass('active');                    // 为点击元素添加类名
                });
            });
        });
        $("#toProduct_list").click(function(){
            $("#main_body").html("");
            $("#main_body").load("Form_list.jsp");
        });
        $("#toCustomer").click(function () {
            $("#main_body").load("customer_List.jsp");
        });

        $("#toRecord").click(function () {
            $("#main_body").load("Record_list.jsp");
        })

        $("#toSale_sta").click(function () {
            $("#main_body").load("chart.jsp")
        })
</script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<link rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>