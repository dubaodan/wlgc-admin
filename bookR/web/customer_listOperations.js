$(document).ready(function () {
    var curPage=1;
    var currentId = 0
    // 记录信息用于修改信息界面的信息初始化
    var customer_list = new Array();
    function deleteCustomer(id) {
        $.ajax({
            type:"GET",
            url:"DeleteCustomerServlet",
            data:{
                "ID":id
            },
            async: false,
            success:function () {
            },
            error:function (xhr, status, errMsg) {
                alert("Data transmission failed!");
            }
        })
    }

    function selectCustomer() {
        var tbody = "";
        $.ajax({
            type:"GET",
            url:"GetCustomerServlet",
            data:{
                "ID":curPage
            },
            dataType:"json",
            async: false,
            success:function (resultData) {
                var i = 0;
                $.each(resultData, function (index,value) {
                    customer_list[i] = new Array();
                    customer_list[i][0] = value.cu_Id;
                    customer_list[i][1] = value.cu_Name;
                    customer_list[i][2] = value.telephone;
                    i++;
                    var trs = "";
                    trs += "<tr><td>" + value.cu_Id+"</td> <td>" + value.cu_Name + "</td> <td>" + value.telephone + "</td> <td>" +
                        "<button class = \"btn btn-block btn-Danger\" id = "+ value.ID + "> 删除</buttom>" + "</td></tr>";
                    tbody += trs;
                });

                $("#customer_list").append(tbody);

            },
            error:function (xhr, status, errMsg) {
                alert("Data transmission failed!");
            }
        })
        $(".btn-Danger").click(function () {
            var btnid=$(this).attr("id");
            alert("删除"+btnid);
            deleteCustomer(btnid)
            $("#customer_list").html("    <caption>顾客信息</caption>\n" +
                "    <thead>\n" +
                "    <tr>\n" +
                "        <th>ID</th>\n" +
                "        <th>昵称</th>\n" +
                "        <th>电话</th>\n" +
                "        <th>操作</th>\n" +
                "    </tr>\n" +
                "    </thead>");

            selectCustomer();
        });
    }
    selectCustomer();

    $("#next").click(function () {
        curPage+=1;
        $("#customer_list").html("    <caption>顾客信息</caption>\n" +
            "    <thead>\n" +
            "    <tr>\n" +
            "        <th>ID</th>\n" +
            "        <th>昵称</th>\n" +
            "        <th>电话</th>\n" +
            "        <th>操作</th>\n" +
            "    </tr>\n" +
            "    </thead>");
        selectCustomer();
    });
});
