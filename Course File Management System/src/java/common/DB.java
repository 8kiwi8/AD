/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;
import org.json.*;

/**
 *
 * @author Kiwi
 */
public class DB {
    private static Connection connection = null;
    private static Statement statement;
    private static ResultSet resultSet;
    private static ResultSetMetaData rsmd;
    private static int resultRow;
    private static final String REGEX = "\\[(.*?)\\]";
    
    public static Connection getConnection() {
        try {
            Properties prop = new Properties();
            InputStream inputStream = DB.class.getClassLoader().getResourceAsStream("/db.properties");
            System.out.println(inputStream);
            prop.load(inputStream);
            String driver = prop.getProperty("driver");
            String url = prop.getProperty("url");
            String user = prop.getProperty("user");
            String password = prop.getProperty("password");
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);
            connection.setAutoCommit(false);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    public static ResultSet query(String query) {
        try {
            Connection conn = DB.getConnection();
            statement = conn.createStatement();
            resultSet = statement.executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }
    
    public static int update(String query) {
        try {
            Connection conn = DB.getConnection();
            statement = conn.createStatement();
            resultRow = statement.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        DB.close();
        return resultRow;
    }
    
    public static JSONArray createJson(String query, String label, String value) {
        resultSet = DB.query(query);
        //Get the formating of lable
        JSONArray jsonArray = new JSONArray();
        try {
            rsmd = resultSet.getMetaData();
            int total_cols = resultSet.getMetaData().getColumnCount();
            while (resultSet.next()) {
                String toLabel = label;
                String toValue = value;
                JSONObject obj = new JSONObject();
                for (int i = 0; i < total_cols; i++) {
                    String colName = rsmd.getColumnLabel(i + 1);
                    toLabel = toLabel.replaceAll("\\["+colName+"\\]", resultSet.getString(colName));
                    toValue = toValue.replaceAll("\\["+colName+"\\]", resultSet.getString(colName));
                    obj.put(colName, resultSet.getObject(i + 1));
                }
                obj.put("label", toLabel);
                obj.put("value", toValue);
                jsonArray.put(obj);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (JSONException ex) {
            ex.printStackTrace();
        }
        return jsonArray;
    }
    
    public static JSONArray createJson(String query, HashMap<String, String> extra) {
        resultSet = DB.query(query);
        //Get the formating of lable
        JSONArray jsonArray = new JSONArray();
        try {
            rsmd = resultSet.getMetaData();
            int total_cols = resultSet.getMetaData().getColumnCount();
            while (resultSet.next()) {
                JSONObject obj = new JSONObject();
                HashMap<String, String> temp = new HashMap(extra);
                for (int i = 0; i < total_cols; i++) {
                    String colName = rsmd.getColumnLabel(i + 1);
                    for (Map.Entry<String, String> entry : temp.entrySet()) {
                        String value = entry.getValue();
                        value = value.replaceAll("\\["+colName+"\\]", resultSet.getString(colName));
                        entry.setValue(value);
                    }
                    obj.put(colName, resultSet.getObject(i + 1));
                }
                for (Map.Entry<String, String> entry : temp.entrySet()) {
                    String key = entry.getKey();
                    String val = entry.getValue();
                    obj.put(key, val);
                }
                jsonArray.put(obj);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (JSONException ex) {
            ex.printStackTrace();
        }
        return jsonArray;
    }
        
    public static JSONArray createJson(String query, String label, String value, String term) {
        resultSet = DB.query(query);
        //Get the formating of lable
        JSONArray jsonArray = new JSONArray();
        try {
            rsmd = resultSet.getMetaData();
            int total_cols = resultSet.getMetaData().getColumnCount();
            while (resultSet.next()) {
                String toLabel = label;
                String toValue = value;
                JSONObject obj = new JSONObject();
                for (int i = 0; i < total_cols; i++) {
                    String colName = rsmd.getColumnLabel(i + 1);
                    toLabel = toLabel.replaceAll("\\["+colName+"\\]", resultSet.getString(colName));
                    toValue = toValue.replaceAll("\\["+colName+"\\]", resultSet.getString(colName));
                    obj.put(colName, resultSet.getObject(i + 1));
                }
                if(!(toLabel.toLowerCase()).contains(term.toLowerCase())) continue;
                obj.put("label", toLabel);
                obj.put("value", toValue);
                jsonArray.put(obj);
            }
        } catch (SQLException e) 
        {
            e.printStackTrace();
        } 
        catch (JSONException ex) 
        {
            ex.printStackTrace();
        }
        return jsonArray;
    }
    
    public static String getDataAt(String query, int row, String columnName){
        try{
                query(query);
                resultSet.absolute(row+1);
                return resultSet.getString(columnName);
        }
        catch(SQLException sqlEx){
                System.out.println(sqlEx.getMessage());
                return null;
        }
    }
    
    public static void close(){
        try{
                statement.close();
                connection.commit();
                connection.close();
        }
        catch(SQLException sqlEx){
                System.out.println(sqlEx.getMessage());
        }
    }
}
