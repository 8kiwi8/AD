/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;


/**
 *
 * @author Kiwi
 */
public class DB {
    private static Connection connection = null;
    private static Statement statement;
    private static ResultSet resultSet;

    public static Connection getConnection() throws SQLException {
        if (connection != null)
            return connection;
        else {
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
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            connection.setAutoCommit(false);
            return connection;
        }
    }
    
    public static ResultSet query(String query) throws SQLException{
        Connection conn = DB.getConnection();
        statement = conn.createStatement();
        resultSet = statement.executeQuery(query);
        return resultSet;
    }
    
    public String getDataAt(int row, String columnName){
        try{
                resultSet.absolute(row+1);

                return resultSet.getString(columnName);
        }
        catch(SQLException sqlEx){
                System.out.println(sqlEx.getMessage());

                return null;
        }
    }
    
    public void close(){
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
