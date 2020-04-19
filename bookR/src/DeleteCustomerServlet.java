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
public class DeleteCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String ID = String.valueOf(request.getParameter("ID"));    //��ȡ��ƷID������
        System.out.println(ID);
        try {
            //192.168.153.129
            //10.132.51.206
            sql q = new sql("oracle.jdbc.driver.OracleDriver","jdbc:oracle:thin:@139.219.2.222:1522/NEWWHUSRCM.CN",
                    "qiang","Admin369");
            q.ConnectData();

            q.DeleteCustomer(ID);

            q.CloseConnect();
        }catch(Exception e) {
            e.printStackTrace();
        }
        //response.sendRedirect("GetItemServlet");           //�ض���FindServlet
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}