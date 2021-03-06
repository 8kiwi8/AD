<!DOCTYPE html>
<html lang="en">
<head>
  <title>Main Navigation</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap.min.css">
  <script src="jquery-1.11.3.min.js"></script>
  <script>
      document.onclick = function (e) {
        e = e ||  window.event;
        var element = e.target || e.srcElement;
        if (element.tagName == 'A') {
          processAjaxData(element.href);
          return false; // prevent default action and stop event propagation
        }
      };
      window.onpopstate = function(e){
            if(e.state){
                $("#content").load(e.state.html);
                document.title = e.state.pageTitle;
            }
        };
        function processAjaxData(urlPath){
            var title;
            $("#content").load(urlPath,"" , function(obj) {
                document.title = (obj.match(/<title[^>]*>([^<]+)<\/title>/)[1]);
            });
            window.history.pushState({"html":urlPath,"pageTitle":document.title}, document.title, "?path=" + urlPath);
        }
        $.urlParam = function(name){
            var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
            if (results==null){
               return null;
            }
            else{
               return results[1] || 0;
            }
        }
        $(document).ready(function() {
            if($.urlParam("path") != ""){
                processAjaxData($.urlParam("path"));
            }            
        })
  </script>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="/Assignment_2/FormLabExerciseMenu.jsp">Form information posting</a></li>
        <li><a href="/Assignment_3/survey.html">Survey Form</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container" id='content'>
  <h3>Basic Navbar Example</h3>
  <p>A navigation bar is a navigation header that is placed at the top of the page.</p>
</div>
</body>
</html>
