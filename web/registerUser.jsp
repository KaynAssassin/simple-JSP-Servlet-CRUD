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
<form method="POST" action='UserController'>
    <input type="hidden" name="action" value="insert" />

    <p><b>Add a New User</b></p>
    <table>
        <tr>
            <td>First Name</td>
            <td><input type="text" name="userName" /></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><input type="text" name="lastName" /></td>
        </tr>
        <tr>
            <td>Gender</td>
            <td>
                <select name="gender">
                    <option value="m">Male</option>
                    <option value="f">Female</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Birthdate</td>
            <td><input type="date" pattern="\d{4}/\d{1,2}/\d{1,2}" name="dob" /></td>
        </tr>
        <tr>
            <td>Work Address</td>
            <td><textarea name="workAddress" rows="3" cols="40"></textarea></td>
        </tr>
        <tr>
            <td>Home Address</td>
            <td><textarea name="homeAddress" rows="3" cols="40"></textarea></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Submit" /></td>
        </tr>
    </table>
</form>

</body>
</html>
