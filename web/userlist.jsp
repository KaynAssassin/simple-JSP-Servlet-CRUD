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
    <link rel="stylesheet" href="<c:url value="style.css"/>" type="text/css">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
    $(document).ready(function(){

        $(".selectme").click(function () {
          var user_id = $(this).attr("data-userid");
          window.open('UserController?action=view&id=' + user_id,'_blank');
        });

        var fade_out = function(){
            $(".message").fadeOut(3000);
        };

        setTimeout(fade_out, 3000);
    });
</script>
<body>
<div class="message">${message}</div>
<div id="users-list">

    <table>
        <thead>
        <tr>
            <th width="40%">First Name</th>
            <th width="40%">Last Name</th>
            <th width="20%" colspan="3"></th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td class="selectme" data-userid = "<c:out value="${user.userId}"/>"><c:out value="${user.userName}"/></td>
                    <td class="selectme" data-userid = "<c:out value="${user.userId}"/>"><c:out value="${user.lastName}"/></td>
                    <td><a href="UserController?action=view&id=<c:out value="${user.userId}"/>" target="_blank" id="details">Details</a> </td>
                    <td><a href="UserController?action=edit&id=<c:out value="${user.userId}"/>">Edit</a> </td>
                    <td><a href="UserController?action=delete&id=<c:out value="${user.userId}"/>" onclick="return confirm('Are you sure?')">Delete</a> </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="counter">There are <c:out value="${numOfEntries}"/> users.</div>
    <p><input type="button" onclick="window.location.href='/index.jsp'" value="Back" class="button"/></p>
</div>
</body>
</html>
