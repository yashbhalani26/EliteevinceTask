<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Add/Edit Employee</title>
</head>
<body>
<div align="center">
<c:choose>
    <c:when test="${employeeData.id>0}">
        <h1>Edit Employee</h1>
        <br />
    </c:when>    
    <c:otherwise>
        <h1>Add Employee</h1>
        <br />
    </c:otherwise>
</c:choose>
<br />
<form method = "post" id = "employeeForm">
	<table border="1" cellpadding="10">
	<input type="hidden" name="id" value="${employeeData.id}">
		<tr>
			<td>First Name : <input type = "text" name = "firstName" id = "firstName" value="${employeeData.firstName}"></td>
		</tr>
		<tr>
			<td>Last Name : <input type = "text" name = "lastName" id = "lastName" value="${employeeData.lastName}"></td>
		</tr>
		<tr>
			<td>Date Of Birth : <input type = "text" name = "dob" id = "dob" 
			value="<fmt:formatDate pattern="dd/MM/yyyy" value="${employeeData.dob}" />"/>
			</td>
		</tr>
		<tr>
			<td>Username : <input type = "text" name = "userName" id = "userName" value="${employeeData.userName}"></td>
		</tr>
		<tr>
			<td>Password : <input type = "password" name = "password" id = "password" value="${employeeData.password}"></td>
		</tr>
		<tr>
			<td>Email Id: <input type = "text" name = "emailId" id = "emailId" value="${employeeData.emailId}"></td>
		</tr>
		<tr>
			<td><input type="button" name = "submit" value = "Submit" id = "submit"></td>	
		</tr>
	</table>
</form>

	
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$("#submit").click(function(){

		
	var form = $('#employeeForm');
	console.log("Hi "+form.serialize());
	$.post("/employee/saveEmployee", form.serialize(), function( data,status ) 
	{
		if(status == "success")
		{
			window.location.href = '/employee/getAllEmployees';
		}
		
	});
});
});
</script>
</html>