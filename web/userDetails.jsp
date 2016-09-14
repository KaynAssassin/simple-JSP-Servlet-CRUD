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
    <title>Project 1 - User Details></title>
    <link rel="stylesheet" href="style.css" type="text/css">
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
</head>
<body>
<div id="container">
    <h1>User Details</h1>
    <form method="POST" action='UserController' name="myForm" onSubmit="return validate()">
        <c:if test="${mode == 'edit'}">
            <input type="hidden" name="action" value="edit" />
            <input type="hidden" name="user_id" value="<c:out value="${user.userId}" />" />
        </c:if>
    <table>
        <tr>
            <td>First Name</td>
            <td><input type="text" name="userName" value="<c:out value="${user.userName}" />"
                       <c:if test="${mode == 'view'}"> readonly </c:if> />
            </td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><input type="text" name="lastName" value="<c:out value="${user.lastName}" />"
                    <c:if test="${mode == 'view'}"> readonly </c:if> />
            </td>
        </tr>
        <tr>
            <td>Gender</td>
            <td><c:if test="${mode == 'view'}">
                    <select name="gender">
                        <option value="m" <c:if test="${user.gender == 'm'}"> selected</c:if><c:if test="${user.gender == 'f'}"> disabled</c:if>>
                            Male
                        </option>
                        <option value="f" <c:if test="${user.gender == 'f'}"> selected</c:if><c:if test="${user.gender == 'm'}"> disabled</c:if>>
                            Female
                        </option>
                    </select>
                </c:if>
                <c:if test="${mode == 'edit'}">
                    <select name="gender">
                        <option value="m" <c:if test="${user.gender == 'm'}"> selected</c:if>>
                            Male
                        </option>
                        <option value="f" <c:if test="${user.gender == 'f'}"> selected</c:if>>
                            Female
                        </option>
                    </select>
                </c:if>
            </td>
        </tr>
        <tr>
            <td>Birthdate</td>
            <td><input type="date" pattern="\d{4}/\d{1,2}/\d{1,2}" name="dob" value="<c:out value="${user.dob}"/>"
                    <c:if test="${mode == 'view'}"> readonly </c:if> />
            </td>
        </tr>
        <tr>
            <td>Work Address</td>
            <td><textarea name="workAddress" rows="3" cols="40" <c:if test="${mode == 'view'}">readonly</c:if>><c:out value="${user.workAddress}"/></textarea>
            </td>
        </tr>
        <tr>
            <td>Home Address</td>
            <td><textarea name="homeAddress" rows="3" cols="40" <c:if test="${mode == 'view'}">readonly</c:if>><c:out value="${user.homeAddress}"/></textarea>
            </td>
        </tr>
        <c:if test="${mode == 'edit'}">
            <tr>
                <td></td>
                <td><input type="submit" value="Save" class="button"></td>
            </tr>
        </c:if>
    </table>
    </form>
</div>
</body>
</html>
