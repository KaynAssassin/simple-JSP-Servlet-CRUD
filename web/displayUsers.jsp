<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserDAO" %>
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
    <title>Title</title>
</head>
<body>
<%--<%--%>
    <%--UserDAO dao = new UserDAO();--%>
    <%--List<User> users = dao.getAllUsers();--%>
<%--%>--%>

<table>
    <thead>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${users}" var="user">
            <tr>
                <td><c:out value="${user.userName}"/></td>
                <td><c:out value="${user.lastName}"/></td>
                <td><a href="UserController?action=view&id=<c:out value="${user.userId}"/>" target="_blank">Details</a> </td>
            </tr>
        </c:forEach>
        <%--<tr>--%>
        <%--<%--%>
            <%--for (User user : users){--%>
        <%--%>--%>

        <%--<td> <%= user.getUserName() %></td>--%>
        <%--<td><%= user.getLastName() %></td>--%>
            <%--<td><a href="UserController?action=view&id=<%= user.getUserId() %>">Details</a> </td>--%>
        <%--</tr>--%>
    <%--<%--%>
        <%--}--%>
    <%--%>--%>
    </tbody>
</table>
<p><a href="index.jsp">Back</a></p>
</body>
</html>
