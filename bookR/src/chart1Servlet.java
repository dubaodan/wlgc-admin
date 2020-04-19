import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.*;
import dataPac.chartSql;
import itemList.sql;

import java.io.IOException;
import java.io.PrintWriter;


//@WebServlet("/serveTest")
public class chart1Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 	PrintWriter out = response.getWriter();
          try {
        	  int inp1 = 0;
        	  int inp2 = 0;
        	  if(request.getParameter("inp1")!=null)
        	  inp1= Integer.parseInt(request.getParameter("inp1"));
        	  if(request.getParameter("inp2")!=null)
        	  inp2 = Integer.parseInt(request.getParameter("inp2"));
        	  chartSql q = new chartSql("com.mysql.cj.jdbc.Driver","jdbc:mysql://localhost:3306/wlgc?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
					  "root","1234");
//        list转化未json
        		 JSONObject jsonObject = new JSONObject();
        	if(inp1!=0 &&inp2 == 0)
        	{
        		q.getDataYear(inp1);
            	jsonObject = chartSql.toJsonObj(q.list,"earnMoney");
        	}
        	else if(inp1!=0&&inp2 != 0)
        	{
        		q.getDataMonth(inp1, inp2);
        		jsonObject = chartSql.toJsonObj(q.list, "earnMoney");
        	}
            //System.out.println(jsonObject.toString());
//            传数据到前端
            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");// 注意設置為utf-8否則前端接收到的中文為亂碼
            PrintWriter out = response.getWriter();
            out.print(jsonObject.toString());
            out.flush();
            out.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}
