/*
作者：黄舜尧
编码部分：整个DeleteProductServlet中的代码
*/

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import itemList.sql;


/**
 * Servlet implementation class DeleteItemServlet
 */
@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ID = String.valueOf(request.getParameter("ID"));    //获取商品ID与名称
        System.out.println(ID);
        try {
            //192.168.153.129
            //10.132.51.206
            sql q = new sql("com.mysql.cj.jdbc.Driver","jdbc:mysql://localhost:3306/wlgc?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
                    "root","1234");
            q.ConnectData();

            q.DeleteItem(ID);

            q.CloseConnect();
        }catch(Exception e) {
            e.printStackTrace();
        }
        //response.sendRedirect("GetItemServlet");           //重定向到FindServlet
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
