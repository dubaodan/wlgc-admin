/*
���ߣ���ǿ
���벿�֣�����getCustomerServlet�еĴ���
*/
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import itemList.sql;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@WebServlet("/GetCustomerServlet")
public class GetCustomerServlet extends HttpServlet {
    private final int itemsEachPage=5;
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }


    public static JSONArray toJsonArray(List<Map<String,Object>> data)
    {
        JSONArray array = new JSONArray();
        for(Map<String,Object> rowItem: data)
        {
            JSONObject json = new JSONObject();
            try
            {
                for(Map.Entry<String,Object> entry : rowItem.entrySet())
                {
                    json.put(entry.getKey(),entry.getValue());
                }
            }catch(JSONException e)
            {
                e.printStackTrace();
            }
            array.put(json);
        }
        return array;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            int ID = Integer.parseInt(request.getParameter("ID"));
            int startRow=(ID-1)*itemsEachPage;
            sql q = new sql("com.mysql.cj.jdbc.Driver","jdbc:mysql://localhost:3306/wlgc?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
                    "root","1234");
            q.ConnectData();
            String sql="select * from customer limit "+0+" , "+itemsEachPage*ID;
            System.out.println(sql);
            ResultSet rs = q.GetResultSet(sql);
            List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
            while(rs.next()){
                Map<String,Object> map = new HashMap<String,Object>();
                map.put("cu_Id",""+rs.getString("cu_Id"));
                map.put("cu_Name",""+rs.getString("cu_Name"));
                map.put("telephone",""+rs.getString("telephone"));
                list.add(map);
            }
            //request.setAttribute("list", list);
            rs.close();
            q.CloseConnect();


            JSONArray jsonArray= toJsonArray(list);
            System.out.println(jsonArray.toString());

            response.setContentType("text/html");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print(jsonArray.toString());
            out.flush();
            out.close();
        }catch(ClassNotFoundException e) {
            e.printStackTrace();
        }catch(SQLException e) {
            e.printStackTrace();
        }


    }
}
