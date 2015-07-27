/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CourseFileManagementSystem;

/**
 *
 * @author zavie_000
 */
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class database
{
    public final static String DRIVER_MYSQL = "com.mysql.jdbc.Driver";
    public final static String DRIVERMGRCONN_MYSQL = "jdbc:mysql:";

	private Connection conn;
	private ResultSet resultSet;
	private Statement statement;
	private String db;
	private String user;
	private String pwd;
	private String driver;
	private String driverMgrConn;
        
    public database ()
    {
        resultSet = null;
        statement = null;
        
        db = "//localhost:3306/cfms";
        user = "root";
        pwd = "";
        
        driver = DRIVER_MYSQL;
        driverMgrConn = DRIVERMGRCONN_MYSQL;
    }
    
    public boolean connect ()
    {
        try
        {
            Class.forName (driver);
            conn = DriverManager.getConnection(driverMgrConn + db , user, pwd);
            conn.setAutoCommit(false);
            return true;
        }
        catch (SQLException sql_ex)
        {
            System.out.println (sql_ex.getMessage());
            return false;
        }
        catch (ClassNotFoundException class_not_found)
        {
            System.out.println (class_not_found.getMessage());
            return false;
        }
    }
    
    public boolean query (String mysql)
    {
        try
        {
            if(mysql.substring(0, 6).toLowerCase().equals("select"))
            {
		statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		resultSet = statement.executeQuery(mysql);
	    }
	    else
            {
		statement = conn.createStatement();
		statement.executeUpdate(mysql);
            }
	    return true;
        }
        catch (SQLException sql_ex)
        {
            System.out.println (sql_ex.getMessage());
            return false;
        }
    }
    
    public void rollback ()
    {
        try
        {
            conn.rollback();
        }
        catch (SQLException sql_ex)
        {
            System.out.println (sql_ex.getMessage());
        }
    }
    
    public int getNumberOfRows()
    {
	try
        {
            resultSet.last();
            return resultSet.getRow();
	}
	catch(SQLException sql_ex)
        {
            System.out.println(sql_ex.getMessage());
            return 0;
        }       
    }
    
    public String getDataAt(int row, String columnName)
    {
	try
        {
            resultSet.absolute(row+1);
            return resultSet.getString(columnName);
	}
	catch(SQLException sqlEx)
        {
            System.out.println(sqlEx.getMessage());
            return null;
	}
    }
    
    public void close()
    {
	try
        {
            statement.close();
            conn.commit();
            conn.close();
	}
	catch(SQLException sql_ex)
        {
            System.out.println(sql_ex.getMessage());
	}
    }
}