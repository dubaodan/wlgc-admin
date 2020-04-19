import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import itemList.sql;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usernameGet = String.valueOf(request.getParameter("username"));
		String passwordGet = String.valueOf(request.getParameter("password"));
		String username = "dubaodan", password = "123";
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(usernameGet.equals(username) && passwordGet.equals(password)){
			session.setAttribute("usernameSession", username);
			session.setAttribute("passwordSession", password);
			session.setMaxInactiveInterval(300);
			out.print("success");
		}
		else {
			out.print("false");
		}
		out.flush();
		out.close();
	}

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
