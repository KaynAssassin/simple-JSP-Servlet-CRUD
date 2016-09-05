<%@ page import="model.User" %>
<%--
  Created by IntelliJ IDEA.
  User: Steve
  Date: 05-Sep-16
  Time: 11:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table>
    <tr>
        <td>First Name</td>
        <td><input type="text" name="userName" value="<c:out value="${user.userName}" />" readonly /></td>
    </tr>
    <tr>
        <td>Last Name</td>
        <td><input type="text" name="lastName" value="<c:out value="${user.lastName}"/>" readonly/></td>
    </tr>
    <tr>
        <td>Gender</td>
        <td>
            <select name="gender">
                <option value="m" <c:if test="${user.gender == 'm'}"> selected</c:if> <c:if test="${user.gender == 'f'}"> disabled</c:if>>Male</option>
                <option value="f" <c:if test="${user.gender == 'f'}"> selected</c:if>  <c:if test="${user.gender == 'm'}"> disabled</c:if>>Female</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>Birthdate</td>
        <td><input type="date" pattern="\d{4}/\d{1,2}/\d{1,2}" name="dob" value="<c:out value="${user.dob}"/>" readonly/></td>
    </tr>
    <tr>
        <td>Work Address</td>
        <td><textarea name="workAddress" rows="3" cols="40" readonly>
            <c:out value="${user.workAddress}"/>
        </textarea></td>
    </tr>
    <tr>
        <td>Home Address</td>
        <td><textarea name="homeAddress" rows="3" cols="40" readonly>
            <c:out value="${user.homeAddress}"/>
        </textarea></td>
    </tr>

</table>
</body>
</html>
