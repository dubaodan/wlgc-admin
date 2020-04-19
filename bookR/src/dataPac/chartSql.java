package dataPac;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Map.Entry;

//import org.apache.commons.csv.*;
//import org.apache.commons.csv.writer.*;
//import org.apache.hadoop.hdfs.server.namenode.status_jsp;
//import org.apache.mahout.cf.taste.recommender.RecommendedItem;
//import org.omg.CORBA.SystemException;

import com.alibaba.fastjson.*;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;

import oracle.net.aso.x;

public class chartSql{
    private String drive;
    //url
    private String url;
    private String user;
    private String password ;//= "Admin147258";
    private Connection connection = null;
    private Statement statement = null;
    private ResultSet result = null;
	public List<Map<String,Object>> list;
	

    public chartSql(String drive,String url,String user,String password) throws ClassNotFoundException {
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
        result.close();
        statement.close();
        connection.close();
    }

    public static boolean deleteFile(String fileName) {
        File file = new File(fileName);
        try {
            if (file.delete()) {
                return true;
            } else {
                return false;
            }
        }
        catch (Exception e) {
        	 System.out.println(e);
		}
        return false;
    }

    public ResultSet GetResultSet(String sql) throws SQLException {
        statement = connection.createStatement();
        result = statement.executeQuery(sql);
        if (result != null)
            return result;
        else {
            System.out.println("数据请求失败");
            return null;
        }

    }
    
    
    public List<String> getYearMaxFive (int year) throws SQLException
    {
    	List<String> typelist = new ArrayList<String>();
        this.ConnectData();
    	ResultSet typeset = this.GetResultSet("SELECT type,(count*price)as total,buy_Date  FROM item i, recoder r WHERE i.item_ID = r.item_ID");
    	Map<String, Integer> map = new HashMap<String, Integer>();
        Calendar calendar = Calendar.getInstance();    
        
    	while(typeset.next())
    	{
    		String type = typeset.getString("type");
    		int price=Integer.parseInt(typeset.getString("total"));
    		Date date = typeset.getDate("buy_Date");
    		calendar.setTime(date);
    		if(map.containsKey(type)&&year == calendar.get(Calendar.YEAR)){
    			price += map.get(type);
    			map.put(type,price);
		}
		else if(!map.containsKey(type)&&year == calendar.get(Calendar.YEAR))
				map.put(type,price);
		}			    	
    	List<Entry<String, Integer>> indexlist = new ArrayList<Entry<String, Integer>>(map.entrySet());
        Collections.sort(indexlist,new Comparator<Entry<String,Integer>>() {
   
        	             public int compare(Entry<String,Integer> o1,
                                            Entry<String,Integer> o2) {
        	                 return o2.getValue().compareTo(o1.getValue());
        	             }
        });
        int number = 0;
        for (Entry<String, Integer> entry : indexlist) {
			typelist.add(entry.getKey());
			number++;
			if(number ==5) break;
		}
    	
    
    	this.CloseConnect();
    	
    	return typelist;
    }
    
    
    
    public List<String> getMonthMaxFive (int month,int year) throws SQLException
    {
    	List<String> typelist = new ArrayList<String>();
        this.ConnectData();
    	ResultSet typeset = this.GetResultSet("SELECT type,(count*price)as total,buy_Date  FROM item i, recoder r WHERE i.item_ID = r.item_ID");
    	Map<String, Integer> map = new HashMap<String, Integer>();
        Calendar calendar = Calendar.getInstance();    
        
    	while(typeset.next())
    	{
			String type = typeset.getString("type");
			int price=Integer.parseInt(typeset.getString("total"));
			Date date = typeset.getDate("buy_Date");
    		calendar.setTime(date);
    		if(map.containsKey(type)&&year == calendar.get(Calendar.YEAR)&&month == (calendar.get(Calendar.MONTH)+1)){
    			price += map.get(type);
    			map.put(type,price);
		}
		else if(!map.containsKey(type)&&year == calendar.get(Calendar.YEAR)&&month == (calendar.get(Calendar.MONTH)+1))
				map.put(type,price);
		}			    	
    	List<Entry<String, Integer>> indexlist = new ArrayList<Entry<String, Integer>>(map.entrySet());
        Collections.sort(indexlist,new Comparator<Entry<String,Integer>>() {
   
        	             public int compare(Entry<String,Integer> o1,
                                            Entry<String,Integer> o2) {
        	                 return o2.getValue().compareTo(o1.getValue());
        	             }
        });
        int number = 0;
        for (Entry<String, Integer> entry : indexlist) {
			typelist.add(entry.getKey());
			number++;
			if(number ==5) break;
		}
    	
    
    	this.CloseConnect();
    	
    	return typelist;
    }
    
    
    
    
    
    
    
    public void getDataYearMax (int year,int number,List<String>typelist) throws SQLException
    { 
    	 list = new ArrayList<Map<String,Object>>();
        this.ConnectData();
        
        for(int i = 1;i<=12;i++)
		{
        	Map<String, Integer> map = new HashMap<String, Integer>();
        	ResultSet typeset = this.GetResultSet("SELECT type,(count*price)as total,buy_Date  FROM item i, recoder r WHERE i.item_ID = r.item_ID AND type = \'"+typelist.get(number)+"\'");
            Calendar calendar = Calendar.getInstance();               
        	while(typeset.next())
        	{
				String type = typeset.getString("type");
				int price=Integer.parseInt(typeset.getString("total"));
				Date date = typeset.getDate("buy_Date");
        		calendar.setTime(date);      		
        		if(map.containsKey(type)&&year == calendar.get(Calendar.YEAR)&& i == (calendar.get(Calendar.MONTH)+1)){
        			price += map.get(type);
        			map.put(type,price);
			}
			else if(!map.containsKey(type)&&year == calendar.get(Calendar.YEAR)&& i == (calendar.get(Calendar.MONTH)+1))
    				map.put(type,price);
			}					

		Map<String, Object>savemap = new HashMap<String, Object>();
		savemap.put("type",""+typelist.get(number) );
		savemap.put("month", ""+i+"月");
		if(map.get(typelist.get(number)) == null)
			savemap.put("money",""+0);
		else {
			savemap.put("money",""+map.get(typelist.get(number)));
		}
		list.add(savemap);
	}
        //System.out.println(list);
        this.CloseConnect();
    }
    
    
    public void getDataMonthMax (int year,int month,int number,List<String>typelist) throws SQLException
    { 
    	 list = new ArrayList<Map<String,Object>>();
        this.ConnectData();
        Calendar calendar1 = Calendar.getInstance();
        int interval[] = {10,20,calendar1.getActualMaximum(Calendar.DAY_OF_MONTH)};
        for(int i = 0;i<3;i++)
		{
        	Map<String, Integer> map = new HashMap<String, Integer>();
        	ResultSet typeset = this.GetResultSet("SELECT type,(count*price)as total,buy_Date  FROM item i, recoder r WHERE i.item_ID = r.item_ID AND type = \'"+typelist.get(number)+"\'");
            Calendar calendar = Calendar.getInstance();               
        	while(typeset.next())
        	{
				String type = typeset.getString("type");
				int price=Integer.parseInt(typeset.getString("total"));
				Date date = typeset.getDate("buy_Date");
        		calendar.setTime(date);   
        		if(i == 0)
        		{
        		if(map.containsKey(type)&&year == calendar.get(Calendar.YEAR)&&month ==(calendar.get(Calendar.MONTH)+1)
        				&&calendar.get(Calendar.DAY_OF_MONTH)<=interval[i]){
        			price += map.get(type);
        			map.put(type,price);
			}
			else if(!map.containsKey(type)&&year == calendar.get(Calendar.YEAR)&&month == (calendar.get(Calendar.MONTH)+1))
    				map.put(type,price);
			}
        		else{
            		if(map.containsKey(type)&&year == calendar.get(Calendar.YEAR)&&month == (calendar.get(Calendar.MONTH)+1)&&interval[i-1]<calendar.get(Calendar.DAY_OF_MONTH)
            				&&calendar.get(Calendar.DAY_OF_MONTH)<=interval[i]){
            			price += map.get(type);
            			map.put(type,price);
    			}
    			else if(!map.containsKey(type)&&year == calendar.get(Calendar.YEAR)&&month == (calendar.get(Calendar.MONTH)+1)&&interval[i-1]<calendar.get(Calendar.DAY_OF_MONTH)
        				&&calendar.get(Calendar.DAY_OF_MONTH)<=interval[i])
    				map.put(type,price);
    			}
        	}

		Map<String, Object>savemap = new HashMap<String, Object>();
		switch (i) {
		case 0:
			savemap.put("period", "上旬");
			break;
		case 1:
			savemap.put("period", "中旬");
			break;
		case 2:
			savemap.put("period", "下旬");
			break;
		default:
			break;
		}
		savemap.put("type",""+typelist.get(number) );
		if(map.get(typelist.get(number)) == null)
			savemap.put("money",""+0);
		else {
			savemap.put("money",""+map.get(typelist.get(number)));
		}
		list.add(savemap);
	}
        //System.out.println(list);
        this.CloseConnect();
    }
    
    
    
    
    public void getDataYear (int year) throws SQLException
    { 
    	 list = new ArrayList<Map<String,Object>>();
        this.ConnectData();
        for(int i = 1;i<=12;i++)
		{
        	Map<Integer, Integer> map = new HashMap<Integer, Integer>();
            ResultSet resultRecord = this.GetResultSet("select * from recoder");
            ResultSet resultShop = this.GetResultSet("select * from item");
            Calendar calendar = Calendar.getInstance();    
            int totalPrice = 0;
            
        	while(resultRecord.next())
        	{
        		int id = Integer.parseInt(resultRecord.getString("item_Id"));
        		int count=Integer.parseInt(resultRecord.getString("count"));
        		Date date = resultRecord.getDate("buy_Date");
        		calendar.setTime(date);
        		//System.out.println(calendar.get(Calendar.YEAR));
        		//System.out.println(calendar.get(Calendar.MONTH)+1);
        		
        		if(map.containsKey(id)&&year == calendar.get(Calendar.YEAR)&& i == (calendar.get(Calendar.MONTH)+1)){
        			count += map.get(id);
        			map.put(id, count);
			}
			else if(!map.containsKey(id)&&year == calendar.get(Calendar.YEAR)&& i == (calendar.get(Calendar.MONTH)+1))
					map.put(id, count);
			}					
        	
		while(resultShop.next())
		{
				float price = Float.parseFloat(resultShop.getString("newPrice"));
				int id = Integer.parseInt(resultShop.getString("item_Id"));
				if(map.containsKey(id)) {
					price *= map.get(id);
					map.put(id, (int)price);
			}
		}

    	for (Integer id : map.keySet()) {
			totalPrice += map.get(id);
		}
		Map<String, Object>savemap = new HashMap<String, Object>();
		
		
		savemap.put("month", ""+i+"月");
		savemap.put("money",""+totalPrice);
		list.add(savemap);
	}
        //System.out.println(list);
        this.CloseConnect();
    }
    
    public void getDataMonth (int year,int month) throws SQLException
    { 
    	 list = new ArrayList<Map<String,Object>>();
        this.ConnectData();
        Calendar calendar1 = Calendar.getInstance();
        calendar1.set(year, month, 1);
        int interval[] = {10,20,calendar1.getActualMaximum(Calendar.DAY_OF_MONTH)};
        for(int i = 0;i<3;i++)
		{
        	Map<Integer, Integer> map = new HashMap<Integer, Integer>();
            ResultSet resultRecord = this.GetResultSet("select * from RECODER");
            ResultSet resultShop = this.GetResultSet("select * from item");
            Calendar calendar = Calendar.getInstance();    
            int totalPrice = 0;
            
        	while(resultRecord.next())
        	{
        		int id = Integer.parseInt(resultRecord.getString("item_Id"));
        		int count=Integer.parseInt(resultRecord.getString("count"));
        		Date date = resultRecord.getDate("BUY_DATE");
        		calendar.setTime(date);
        		//System.out.print("year"+calendar.get(Calendar.YEAR));
        		//System.out.print(" month"+(calendar.get(Calendar.MONTH)+1));
        		//System.out.println(" day" +calendar.get(Calendar.DAY_OF_MONTH));
        		//System.out.println(interval[i]);
      		if(i == 0) {
        		if(map.containsKey(id)&&year == calendar.get(Calendar.YEAR)&&month ==(calendar.get(Calendar.MONTH)+1)
        				&&calendar.get(Calendar.DAY_OF_MONTH)<=interval[i]){
        			count += map.get(id);
        			map.put(id, count);
			}
			else if(!map.containsKey(id)&&year == calendar.get(Calendar.YEAR)&&month == (calendar.get(Calendar.MONTH)+1)
					&& calendar.get(Calendar.DAY_OF_MONTH)<=interval[i])
					map.put(id, count);
			}
        	else {
        		if(map.containsKey(id)&&year == calendar.get(Calendar.YEAR)&&month == (calendar.get(Calendar.MONTH)+1)&&interval[i-1]<calendar.get(Calendar.DAY_OF_MONTH)
        				&&calendar.get(Calendar.DAY_OF_MONTH)<=interval[i]){
        			count += map.get(id);
        			map.put(id, count);
			}
			else if(!map.containsKey(id)&&year == calendar.get(Calendar.YEAR)&&month == (calendar.get(Calendar.MONTH)+1)&&interval[i-1]<calendar.get(Calendar.DAY_OF_MONTH)
    				&&calendar.get(Calendar.DAY_OF_MONTH)<=interval[i])
					map.put(id, count);
			}
			}
        	
        	
        	
		while(resultShop.next())
		{
				float price = Float.parseFloat(resultShop.getString("newPrice"));
				int id = Integer.parseInt(resultShop.getString("item_Id"));
				if(map.containsKey(id)) {
					price *= map.get(id);
					map.put(id, (int)price);
			}
		}

    	for (Integer id : map.keySet()) {
			totalPrice += map.get(id);
		}
		Map<String, Object>savemap = new HashMap<String, Object>();
		switch (i) {
		case 0:
			savemap.put("period", "上旬");
			break;
		case 1:
			savemap.put("period", "中旬");
			break;
		case 2:
			savemap.put("period", "下旬");
			break;
		default:
			break;
		}
		savemap.put("money",""+totalPrice);
		list.add(savemap);
	}
        //System.out.println(list);
        this.CloseConnect();
    }
    

    
    public static JSONObject toJsonObj(List<Map<String,Object>> data,String name)
    {
    	JSONArray array = new JSONArray();
    	JSONObject jss = new JSONObject();
    	for(Map<String,Object> rowItem: data)
    	{
    		JSONObject json = new JSONObject();
    		try
    		{
    			for(Entry<String,Object> entry : rowItem.entrySet())
    			{
    				json.put(entry.getKey(),entry.getValue());
    			}
    		}catch(JSONException e)
    		{
    			e.printStackTrace();	
    		}
    		array.add(json);
    	}
    	jss.put(name, array);
    	return jss;
    }
    
    public static JSONObject toMaxJsonObjY(chartSql q,int year) throws SQLException
    {
    	JSONObject jss = new JSONObject(new LinkedHashMap<String, Object>());
    	List<String> typeList = q.getYearMaxFive(year);
    	for(int i = 0;i<5;i++)    	
    	{
    		JSONArray array = new JSONArray();
    		q.getDataYearMax(year,i, typeList);
        	for(Map<String,Object> rowItem: q.list)
        	{
        		JSONObject json = new JSONObject();
        		try
        		{
        			for(Entry<String,Object> entry : rowItem.entrySet())
        			{
        				json.put(entry.getKey(),entry.getValue());
        			}
        		}catch(JSONException e)
        		{
        			e.printStackTrace();	
        		}
        		array.add(json);
        	}
        	jss.put("series"+(i+1), array);
    	}
    	return jss;
    }

    public static JSONObject toMaxJsonObjM(chartSql q,int year,int month) throws SQLException
    {
    	JSONObject jss = new JSONObject(new LinkedHashMap<String, Object>());
    	List<String> typeList = q.getMonthMaxFive(month, year);
    			
    	for(int i = 0;i<3;i++)
    	{
    		JSONArray array = new JSONArray();
    		q.getDataMonthMax(year, month,i, typeList);
        	for(Map<String,Object> rowItem: q.list)
        	{
        		JSONObject json = new JSONObject();
        		try
        		{
        			for(Entry<String,Object> entry : rowItem.entrySet())
        			{
        				json.put(entry.getKey(),entry.getValue());
        			}
        		}catch(JSONException e)
        		{
        			e.printStackTrace();	
        		}
        		array.add(json);
        	}
        	jss.put("series"+(i+1), array);
    	}
    	return jss;
    }
    
}