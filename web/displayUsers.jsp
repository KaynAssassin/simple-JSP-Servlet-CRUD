<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 02-Sep-16
  Time: 12:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Project 1 - User List</title>
    <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<div id="users-list">
    <table>
        <thead>
        <tr>
            <th width="40%">First Name</th>
            <th colspan="2" width="80%">Last Name</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td><c:out value="${user.userName}"/></td>
                    <td><c:out value="${user.lastName}"/></td>
                    <td><a href="UserController?action=view&id=<c:out value="${user.userId}"/>" target="_blank">Details</a> </td>
                    <td><a href="UserController?action=edit&id=<c:out value="${user.userId}"/>" target="_blank">Edit</a> </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="counter">There are <c:out value="${numOfEntries}"/> users.</div>
    <p><input type="button" onclick="window.location.href='/index.jsp'" value="Back" class="button"/></p>
</div>
</body>
</html>
