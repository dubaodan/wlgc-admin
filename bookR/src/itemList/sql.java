/*
作者：张强 黄舜尧
编码部分：整个getCustomerServlet中的代码
*/

package itemList;
import java.sql.*;

public class sql {
    //驱动
    private String drive; //= "com.mysql.jdbc.Driver";
    //url
    private String url;//= "jdbc:mysql://localhost:3306/mysql80"
    //用户，密码
    private String user;// = "root";
    private String password ;//= "1234";
    //连接数据库
    private Connection connection = null;
    private Statement statement = null;
    private ResultSet result = null;

    public sql(String drive,String url,String user,String password) throws ClassNotFoundException {
        this.drive = drive;
        this.url = url;
        this.user = user;
        this.password = password;
        Class.forName(this.drive);
    }
    public void ConnectData() throws  SQLException {
        connection = DriverManager.getConnection(url, user, password);
    }

    public void CloseConnect() throws SQLException {
        //System.out.println(conn);
        try {
            if(result != null)
                result.close();//数据库先开后关
            statement.close();
            connection.close();//关闭数据库
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }


    public ResultSet GetResultSet(String sql) throws SQLException {
        statement = connection.createStatement();
        result = statement.executeQuery(sql);
        if (result != null)
            return result;
        else {
            System.out.println("数据集为空");
            return null;
        }
    }

    public boolean DeleteItem(String ID) {
        try {
            String sql_str2 = "Delete From Item where item_Id = " + ID + "";
            System.out.println(sql_str2);
            statement = connection.createStatement();
            statement.executeUpdate(sql_str2);
            System.out.println(ID+ "已删除");
        }
        catch (SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean AddItem(String ID,String Name,String Type,int quantity,String Introduction,String img,String oldPrice,String newPrice,String detail) {

        try {
            String sql_str2 = "insert into item values(" +   ID +  ","+ "\'" + Name + "\'" + "," + "\'" + Introduction + "\'" +
                    "," + "\'" +  Type  + "\'"+ ","  +  quantity + "," + "\'" +  img +  "\'" +  ","  +  oldPrice+ "," +  newPrice +","+ "\'"+detail+"\'"+ ")";
            System.out.println(sql_str2);
            statement = connection.createStatement();
            statement.executeUpdate(sql_str2);
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean DeleteCustomer(String ID) {
        try {
            String sql_str2 = "Delete From Customer where cu_Id = " + ID + "";
            System.out.println(sql_str2);
            statement = connection.createStatement();
            statement.executeUpdate(sql_str2);
            System.out.println(ID+ ":已删除");
        }
        catch (SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
}