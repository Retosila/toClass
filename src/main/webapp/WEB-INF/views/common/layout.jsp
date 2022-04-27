<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <style>
#container {
	width: 100%;
	margin: 0px auto;
	text-align: center;
	border: 0px solid white;
}

#header {
	padding: 0px;
	margin-bottom: 0px;
	border: 0px solid;
	background-color: white;
}


#content {
	
	height: 900px;
	padding: 5px;
	margin-right: 5px;
	float: center;
	border: 0px solid;
}

#footer {
	clear: both;
	padding: 0px;
	border: 0px solid;
}


</style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
      </div>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>