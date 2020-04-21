$(document).ready(function () {
    var curPage=1;
    function selectRecord() {
        var tbody = "";
        $.ajax({
            type: "GET",
            url: "GetRecordServlet",
            dataType: "json",
            async: false,
            data:{
                "ID":curPage
            },
            success: function (resultData) {

                $.each(resultData, function (index, value) {

                    var trs = "";
                    trs += "<tr><td>" + value.cu_Id + "</td> <td>" + value.cu_Name + "</td> <td>" + value.item_Id + "</td> <td>" + value.item_Name +
                        "</td> <td>" + value.count + "</td> <td>" + value.buy_Date + "</td> <td>" + value.rating+ "</td></tr>";
                    tbody += trs;
                });

                $("#Record_list").append(tbody);

            },
            error: function (xhr, status, errMsg) {
                alert("Data transmission failed!");
            }
        })
    }

    selectRecord();

    $("#next").click(function () {
        curPage+=1;
        $("#Record_list").html("<caption>购书记录</caption>\n" +
            "<thead>\n" +
            "\t<tr>\n" +
            "\t<th>用户ID</th>\n" +
            "\t<th>用户昵称</th>\n" +
            "\t<th>书籍ID</th>\n" +
            "\t<th>书籍名称</th>\n" +
            "\t<th>数量</th>\n" +
            "\t<th>购买日期</th>\n" +
            "\t<th>评分</th>\n" +
            "\t</tr>\n" +
            "</thead>");
        selectRecord();
    })
});
