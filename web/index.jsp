<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 02-Sep-16
  Time: 12:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Project 1</title>
      <link rel="stylesheet" href="style.css" type="text/css">
  </head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script>
    $(document).ready(function(){
      var fade_out = function(){
        $(".message").fadeOut(3000);
      };
      setTimeout(fade_out, 3000);
    })
  </script>
  <body>
  <div class="message">${message}</div>
  <div id="menu">
      <ul>
        <li><a href="UserController?action=list">Display Users</a> </li>
        <li><a href="user.jsp?action=register">Add User</a></li>
      </ul>
  </div>
  </body>
</html>
