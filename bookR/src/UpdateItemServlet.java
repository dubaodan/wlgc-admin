import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import itemList.sql;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateItemServlet")
public class UpdateItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String id = String.valueOf(request.getParameter("item_Id"));
        String Name = String.valueOf(request.getParameter("item_Name"));
        String type = String.valueOf(request.getParameter("type"));
        Integer quantity = Integer.valueOf(request.getParameter("quantity"));
        String Introduction = String.valueOf(request.getParameter("introduction"));
        String oldPrice = String.valueOf(request.getParameter("oldPrice"));
        String newPrice = String.valueOf(request.getParameter("newPrice"));
        String detail = String.valueOf(request.getParameter("detail"));
        System.out.println(id + Name +type+quantity+Introduction+""+oldPrice+newPrice);
        try {
            sql q = new sql("com.mysql.cj.jdbc.Driver","jdbc:mysql://localhost:3306/wlgc?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
                    "root","1234");
            q.ConnectData();
            System.out.println(id);
            if(Integer.parseInt(id)!=-1)
            {
                q.DeleteItem(id);
            }
            q.AddItem(id,Name,type,quantity,Introduction,"",oldPrice,newPrice,detail);
            q.CloseConnect();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}