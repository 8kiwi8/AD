/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CourseFileManagementSystem;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
/**
 *
 * @author zavie_000
 */
public class semester 
{
    public static String getSemester ()
    {
        Date date = new Date();
	DateFormat df;

	df = new SimpleDateFormat("yyyy");
	int year = Integer.parseInt(df.format(date));

	df = new SimpleDateFormat("MM");
	int month = Integer.parseInt(df.format(date));
                
	if(month == 1)
        {
            return Integer.toString(year - 1 ) + Integer.toString(year) + "1";
        }
        else if(month >=2 && month <=4)
        {
            return Integer.toString(year - 1) + Integer.toString(year) + "2";
        }			
        else if(month >=5 && month <= 8)
        {
            return Integer.toString(year - 1) + Integer.toString(year) + "3";
        }			
	else if(month >= 9 && month <= 12)
        {
            return Integer.toString(year) + Integer.toString(year + 1) + "1";
        }			
	else
        {
            return null;
        }		
    }
    
    public static String generateSemester (String semester)
    {
        String sem1 = " ";
        String sem2 = " ";
        String session = " ";
        String newSemester = " ";
        sem1 = semester.substring (0, 4);
        sem2 = semester.substring (4, 8);
        session = semester.substring (8, 9);
        
        if (session.equals ("1"))
        {
            newSemester = sem1 + sem2 + "2";
        }
        else
        {
            newSemester = Integer.toString(Integer.parseInt(sem1)+1)+Integer.toString(Integer.parseInt(sem2)+1)+"1";
        }
        return newSemester;
    }
}
