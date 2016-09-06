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
<script type="text/javascript">
    <!--
    function validate() {
        if (document.myForm.userName.value == "") {
            alert("Please enter a username!");
            document.myForm.userName.focus();
            return false;
        }

        if(document.myForm.lastName.value == "") {
            alert( "Please enter a Last Name");
            document.myForm.lastName.focus();
            return false;
        }
        // for the last name we allow only letters
        if (/[^a-z]/i.exec(document.myForm.lastName.value.toLowerCase())) {
            alert('Please enter a valid name! Only letters are allowed.');
            document.myForm.lastName.focus();
            return false;
        }

        if( document.myForm.dob.value == "" ) {
            alert( "Please enter the Birthday!");
            document.myForm.dob.focus();
            return false;
        }
        return( true );
    }
    //-->
</script>
<body>
<form method="POST" action='UserController' name="myForm" onSubmit="return validate()">
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
            <td>Birthday</td>
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
            <td><input type="submit" value="Submit" /> <input type="button" onclick="history.back()" value="Cancel"/> </td>
        </tr>
    </table>
</form>

</body>
</html>
