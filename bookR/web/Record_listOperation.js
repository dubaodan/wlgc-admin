$(document).ready(function () {

    function selectRecord() {
        var tbody = "";
        $.ajax({
            type: "GET",
            url: "GetRecordServlet",
            dataType: "json",
            async: false,
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
});