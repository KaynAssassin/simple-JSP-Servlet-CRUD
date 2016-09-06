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
    <title>$Title$</title>
  </head>
  <body>
  <c:if test="${insertStatus == 'success'}">
      <script>
          alert('User has been added succefully!');
      </script>
  </c:if>
  <c:if test="${insertStatus == 'fail'}">
      <script>
          alert('Failed to insert new user!');
      </script>
  </c:if>
  <ul>
    <li><a href="UserController?action=list">Display Users</a> </li>
    <li><a href="registerUser.jsp">Add User</a></li>
  </ul>
  </body>
</html>
