<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
<div>
	<a href="/employee/addEmployee">Add New Employee</a>
		
    <h4>Employee Records:</h4>
    <table border="1">
        <thead>
        <tr class="text-center">
            
            <th class="text-center"><b>Id</b></th>
            <th class="text-center"><b>Name</b></th>
            <th class="text-center"><b>Date of Birth</b></th>
            <th class="text-center"><b>Username</b></th>
            <th class="text-center"><b>Email</b></th>
            <th class="text-center" colspan='2'><b> Operation</b></th>
        </tr>
        </thead>
        <tbody>
		<c:set var="count" value="0" scope="page" /><br>
        <c:forEach items="${allEmployees}" var="allEmpData">
        <c:set var="count" value="${count + 1}" scope="page"/>
            <tr>
            	<td>${count}</td>
                <td>${allEmpData.firstName} ${allEmpData.lastName}</td>
                <td>${allEmpData.dob}</td>
                <td>${allEmpData.userName}</td>
                <td>${allEmpData.emailId}</td>
                <td>
                    <a href="/employee/${allEmpData.id}/editEmployee">
                   
                        <button type="submit" class="btn btn-primary">Edit Employee</button>
                    </a>

                    <a href="/employee/${allEmpData.id}/deleteEmployee">
                        <button type="submit" onclick="alert(' !! Warning !! Student record will be deleted.')">Delete Employee
                        </button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>