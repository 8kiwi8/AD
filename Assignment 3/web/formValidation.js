/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    function validate()
      {      
         if( document.getElementById("name").value === "" )
         {
            alert( "Please provide your name!" );
            document.survey.name.focus() ;
            return false;
         }
         
         if( document.getElementById("email").value === "" )
         {
            alert( "Please provide your Email!" );
            document.survey.email.focus() ;
            return false;
         }    
         return( true );
      }
    
    function validateName ()
    {
        var name1 = document.getElementById ("name").value;
        var name_value = document.getElementById ("name1").value;
        
        if (name1 === "")
        {
            alert ("Please enter your name!");
            document.form.name.focus ();
            return false;
        }
        if (/[^a-zA-Z0-9\-]/.test(name_value))
        {
            alert("Name can only contain alphanumeric characters and hypehns(-)");
            return false;
        }
        return true;
    }
    
    function validateEmail ()
    {
        var emailID = document.getElementById ("email").value;
        at = emailID.indexOf ("@");
        dot = emailID.lastIndexOf (".");
        
        if (emailID === "")
        {
            alert ("Please enter your email!");
            document.form.email.focus ();
            return false;
        }
        
        if ((dot - at < 2 ) || at < 1)
        {
            alert ("Please re - enter the correct email.");
            document.form.email.focus ();
            return false;
        }
        return (true);
    }


