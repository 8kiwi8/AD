<%-- 
    Document   : test
    Created on : Aug 4, 2015, 3:40:03 PM
    Author     : Ahmad Rafiuddin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ciplak UTM</title>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <style>
            .website-title {
                text-transform: uppercase;
                font-size: 19px;
                line-height: 19px;
                font-family: Arial;
                font-weight: bold;
                position: relative;
                margin-top: 0px;
                padding-bottom: 6px;
                top: 0px !important;
                border-bottom: 0px;
                color: rgb(51, 51, 51);
            }
        </style>
        <script src="https://code.jquery.com/jquery.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/javascript/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="page-header">
            <div class="container-fluid">
                <div class="col-xs-1 media-left">
                    <img class="img-responsive media-object" src="img/LambangMalaysia.png" alt="Malaysian Coat of Arms">						
                </div>
                
                <div class="col-xs-2 media-left" >
                    <a href="http://www.utm.my">
                        <img class="img-responsive media-object" src="img/LogoUTM.png" alt="UTM Logo"/>
                    </a>
                </div>
                
                <div class="col-xs-offset-1 col-xs-4">
                    <h1>Course File Management System<br>
                        <small class="website-title">Universiti Teknologi Malaysia</small>
                    </h1>
                    <div class="tagline" style="opacity:0.8;margin-left:-2px;">
                        <img alt="UTM Tagline" height="20" src="http://cdn.utm.my/wp-content/themes/enterprise/images-2014/tagline-bi.png" />
                    </div>
                </div>

                <div class="col-xs-4">
                    <span style="margin:0px;float:right;margin-top:28px;">
                        <img width=20 src="http://www.utm.my/dev/2014/social-media-icon/mobile-icon(small).jpg" alt="Mobile" onClick="alert('This website can be viewed in mobile device')">
                        <a target="_blank" href="http://www.facebook.com/univteknologimalaysia"><img width=24 src="http://www.utm.my/dev/2014/social-media-icon/iconmonstr-facebook-2-icon.svg" alt="Facebook"></a>
                        <a target="_blank" href="https://twitter.com/utm_my"><img width=24 src="http://www.utm.my/dev/2014/social-media-icon/iconmonstr-twitter-2-icon.svg" alt="Twitter"></a>
                        <a target="_blank" href="http://www.youtube.com/utmskudaimalaysia"><img width=24 src="http://www.utm.my/dev/2014/social-media-icon/iconmonstr-youtube-2-icon.svg" alt="YouTube"></a>
                        <a target="_blank" href="http://instagram.com/utmofficial"><img width=24 src="http://www.utm.my/dev/2014/social-media-icon/iconmonstr-instagram-2-icon.svg" alt="Instagram"></a>
                        <a target="_blank" href="http://www.pinterest.com/utmmy/"><img width=24 src="http://www.utm.my/dev/2014/social-media-icon/iconmonstr-pinterest-2-icon.svg" alt="Pinterest"></a>
                    </span>                        
                </div>
            </div>
        </div>
        
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#utm-cfms-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div> <!-- /.navbar-header -->
                
                <div class="collapse navbar-collapse" id="utm-cfms-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        
                        <li class="active"><a href="#">Home <span class="sr-only">(current)</span></a></li>
                        <li><a href="viewLecturer.jsp">Lecturer</a></li>
                        <li><a href="createSemester.jsp">Semester</a></li>
                        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                Course <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="viewCourse.jsp">View Course</a></li>
                                <li><a href="createOfferedCourse.jsp">Current Offered Courses</a></li>
                            </ul>
                        </li>
                        
                    </ul>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="<%=request.getContextPath()%>/logoutAction.jsp">
                            <span class="glyphicon glyphicon-off" aria-hidden="true" style="padding-right: 10px"></span>Log Out
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        
    </body>
</html>
