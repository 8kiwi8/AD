<jsp:include page="../header.jsp"/>
<%@ page import ="java.sql.*, common.DB" %>
<%
	String username = request.getParameter("username");

	ResultSet rs = DB.query("SELECT * FROM profile, department WHERE profile.username= '"+username+"' AND profile.departmentID=department.departmentID");
        rs.next();
        
        boolean isActive = false;
        if (rs.getString(5).equals("Active")) {
            isActive = true;
        }
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Lecturer Profile - <%=session.getAttribute("User").toString()%></title>
</head>

<body>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-body">
                
                <form class="form-horizontal" method="post" action="<%=request.getContextPath()%>/updateLecturerDB?username=<%=rs.getString(6) %>">
                    <div class="form-group">
                        <label for="username" class="control-label col-xs-3">Username</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="username" value="<%=rs.getString(6) %>" disabled>
                        </div>
                        <div class="col-xs-3"></div>
                    </div>


                    <div class="form-group">
                        <label for="name" class="control-label col-xs-3">Name</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="name" value="<%=rs.getString(1) %>">
                        </div>
                        <div class="col-xs-3"></div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="control-label col-xs-3">Email Address</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="emailAdd" value="<%=rs.getString(2) %>">
                        </div>
                        <div class="col-xs-3"></div>
                    </div>

                    <div class="form-group">
                        <label for="phoneNo" class="control-label col-xs-3">Phone Number</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="phoneNo" value="<%=rs.getString(3) %>">
                        </div>
                        <div class="col-xs-3"></div>
                    </div>

                    <div class="form-group">
                        <label for="department" class="control-label col-xs-3">Department</label>
                        <div class="col-xs-6">
                            <input type="text" class="form-control" name="department" value="<%=rs.getString(4) %>">
                        </div>
                        <div class="col-xs-3"></div>
                    </div>

                    <div class="form-group">
                        <label for="status" class="control-label col-xs-3">Status</label>
                        <div class="radio col-xs-9">
                            <label>
                                <input type="radio" name="status" value="Active" <% if(isActive) out.println("checked");%>>
                                Active
                            </label>
                        </div>
                            
                            <div class="form-group">
                            <label for="department" class="control-label col-xs-4">Department</label>
                            <div class="radio col-xs-8">
                             <input type="text" class="form-control" value="<%=rs.getString(8) %>" disabled>
                            <label class="radio-inline"><input type="radio" name="department" value="2">Software Engineering</label>
                            <label class="radio-inline"><input type="radio" name="department" value="3">Computer Science</label>
                            <label class="radio-inline"><input type="radio" name="department" value="4">Information System</label>
                            </div>
                        </div>
                        <div class="col-xs-3"></div>
                    </div>

                        <div class="form-group">
      						<label for="status" class="control-label col-xs-4">Status</label> 
                                                <%=rs.getString(5) %>                                                  
      						<div class="radio col-xs-8">
  							<label class="radio-inline"><input type="radio" name="status" value="Active">Active</label>
  							<label class="radio-inline"><input type="radio" name="status" value="Inactive">Inactive</label>
							</div>
        				</div>
                                                
                            <div class="form-group">
      						<label for="view" class="control-label col-xs-4">View Permission</label>					 
      						<div class="radio col-xs-8">
  							<label class="radio-inline"><input type="radio" name="view" value="LECTURER">Lecturer</label>
                                                        <label class="radio-inline"><input type="radio" name="view" value="KETUA JABATAN">Ketua Jabatan</label>
  							<label class="radio-inline"><input type="radio" name="view" value="PENTADBIR">Pentadbir</label>
							</div>
        				</div>
                        
                        <div class="form-group">
                            <div class="col-xs-offset-4 col-xs-8">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </div>
                    </div>
                </form>
                                
            </div> <!-- ./panel-body -->         
        </div>             
    </div> <!-- /.container -->
</body>
