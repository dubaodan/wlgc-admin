// 作者：张强
// 编码部分：整个product_listOperation中的代码

$(document).ready(function () {
    var curPage=1;
    var currentId = 0
    //存储接收的数据库信息便于在修改时同时显示信息
    var product_arry = new Array();

    function deleteProduct(id) {
        $.ajax({
            type:"GET",
            url:"DeleteItemServlet",
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

    function updateProduct(item_id,item_Name,introduction,Type,quantity,oldPrice,newPrice,detail){
        $.ajax({
            type:"GET",
            url:"UpdateItemServlet",
            data:{
                "item_Id":item_id,
                "item_Name":item_Name,
                "type":Type,
                "quantity":quantity,
                "oldPrice":oldPrice,
                "newPrice":newPrice,
                "introduction":introduction,
                "detail":detail
            },
            async: false,
            success:function () {
            },
            error:function (xhr, status, errMsg) {
                alert("Data transmission failed!");
            }
        })
    }

    function selectProducts() {
        var tbody = "";
        $.ajax({
            type:"GET",
            url:"GetItemServlet",
            dataType:"json",
            async: false,
            data:{
                "ID":curPage
            },
            success:function (resultData) {
                var i = 0;//指定数组
                $.each(resultData, function (index,value) {
                    product_arry[i] = new Array();
                    product_arry[i][0] = value.item_Id;
                    product_arry[i][1] = value.item_Name;
                    product_arry[i][2] = value.type;
                    product_arry[i][3] = value.quantity;
                    product_arry[i][4] = value.oldPrice;
                    product_arry[i][5] = value.newPrice;
                    product_arry[i][6] = value.introduction;
                    product_arry[i][7] = value.detail;
                    i++;
                    var trs = "";
                    trs += "<tr><td>" + value.item_Id+"</td> <td>" + value.item_Name + "</td> <td>" + value.type + "</td> <td>" + value.quantity + "</td> <td>" +
                        value.oldPrice + "</td> <td>" + value.newPrice + "</td> <td>" +
                        "<button class = \"btn btn-block btn-Info\" id =" + value.item_Id + "> 修改</button>"
                        + "<button class = \"btn btn-block btn-Danger\" id = "+ value.item_Id + "> 删除</buttom>" + "</td></tr>";
                    tbody += trs;
                });

                $("#product_list").append(tbody);

            },
            error:function (xhr, status, errMsg) {
                alert("Data transmission failed!");
            }
        })
        $(".btn-Danger").click(function () {
            var btnid=$(this).attr("id");
            alert("删除商品"+btnid);
            deleteProduct(btnid)
            $("#product_list").html("<caption>出售书籍一览</caption>\n" +
                "<thead>\n" +
                "\t<tr>\n" +
                "\t<th>ID</th>\n" +
                "\t<th>名字</th>\n" +
                "\t<th>类型</th>\n" +
                "\t<th>数量</th>\n" +
                "\t<th>单价(旧)</th>\n" +
                "\t<th>单价(新)</th>\n" +
                "\t<th>操作</th>\n" +
                "\t</tr>\n" +
                "</thead>");
            selectProducts();
            // selectProducts();
        });
        // 修改商品
        $(".btn-Info").click(function () {
            $("input").val("");
            $("#choiceWindow").slideDown(300);
            var btnid=$(this).attr("id");
            currentId=btnid;
            //alert(product_arry[0][0]);
            for(var i = 0;i < 100;i++) {
                if (currentId == product_arry[i][0]) {
                    //alert(product_arry[i][0]);
                    $("#item_Id").val(product_arry[i][0]);
                    $("#item_Name").val(product_arry[i][1]);
                    $("#type").val(product_arry[i][2]);
                    $("#quantity").val(product_arry[i][3]);
                    $("#oldPrice").val(product_arry[i][4]);
                    $("#newPrice").val(product_arry[i][5]);
                    $("textarea[name = 'introduction']").val(product_arry[i][6]);
                    $("textarea[name = 'detail']").val(product_arry[i][7]);
                }
            }
        });
    }


    selectProducts();



    //添加商品
    $("#test").click(function () {
        $("input").val("");
        $("textarea").val("");
        $("#choiceWindow").slideDown(300);
    })


    // 信息框中的取消按钮消失此界面
    $(".btn-Default").click(function () {
        $("#choiceWindow").slideUp(300);
        $("input").val("");
    });
    $("#ok").click(function (id) {
        var item_Id = $("input[name = 'item_Id']").val();
        var item_Name = $("input[name = 'item_Name']").val();
        var Quantity = $("input[name = 'quantity']").val();
        var Introduction = $("textarea[name = 'introduction']").val();
        var detail = $("textarea[name = 'detail']").val();
        var Type = $("input[name = 'type']").val();
        var oldPrice = $("input[name = 'oldPrice']").val();
        var newPrice = $("input[name = 'newPrice']").val();
        //alert(""+ ID + Name + Number + Description+Type);
        updateProduct(item_Id,item_Name,Introduction,Type,Quantity,oldPrice,newPrice,detail);
        $("#choiceWindow").slideUp(300);
        $("#product_list").html("<caption>出售书籍一览</caption>\n" +
            "<thead>\n" +
            "\t<tr>\n" +
            "\t<th>ID</th>\n" +
            "\t<th>名字</th>\n" +
            "\t<th>类型</th>\n" +
            "\t<th>数量</th>\n" +
            "\t<th>单价(旧)</th>\n" +
            "\t<th>单价(新)</th>\n" +
            "\t<th>操作</th>\n" +
            "\t</tr>\n" +
            "</thead>");
        selectProducts();
    })

    $("#next").click(function () {
        curPage+=1;
        $("#product_list").html("<caption>出售书籍一览</caption>\n" +
            "<thead>\n" +
            "\t<tr>\n" +
            "\t<th>ID</th>\n" +
            "\t<th>名字</th>\n" +
            "\t<th>类型</th>\n" +
            "\t<th>数量</th>\n" +
            "\t<th>单价(旧)</th>\n" +
            "\t<th>单价(新)</th>\n" +
            "\t<th>操作</th>\n" +
            "\t</tr>\n" +
            "</thead>");
        selectProducts();
    });
});
