<%@ page import="model.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rider - Dashboard</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
        html,
        body {
            background-color: #f5f5f5;
            height: 100%;
            margin: 0;
            padding: 0;
        }




    </style>

</head>
<body>
<main class="container">
    <div class="justify-content-center bg-dark d-flex align-items-center p-4 text-white bg-purple  shadow-sm">
        <img class="me-3" src="img/LOGO2.png" alt="" width="" height="60">


    </div>
    <div style="background-color:white;" class="px-3 py-2 border-bottom mb-3">
        <nav class="navbar navbar-light">
            <div class="container-fluid">

                <div class="text-end justify-content-left">
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Recent Bookings</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Reports</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Recent Bookings</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Separated link</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Manage Users</a>
                        </li>
                    </ul>


                </div>



                <div class="d-flex">
                    <div class="flex-shrink-0 dropdown">
                        <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="img/user.png" alt="mdo"  height="40" class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2" style="">
                            <li class="dropdown-item">@${sessionScope.user.username}</li>
                            <li class="dropdown-item"><hr class="dropdown-divider"></li>
                            <li class="dropdown-item"><a class="dropdown-item" href="logout">Sign out</a></li>
                        </ul>
                    </div>


                </div>
            </div>
        </nav>
    </div>




            <div class="container p-3 bg-body rounded shadow-sm">
                <div class="d-flex text-muted pt-3 border-bottom" >
                    <div class="container">


                        <c:choose>
                            <c:when test="${not empty mybookings}" >

                                <table id="todays_journeys" class="table table-striped table-bordered" style="width:100%">
                                    <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Start Address</th>
                                        <th>Destination</th>
                                        <th>Custome ID</th>
                                        <th>Fee</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${mybookings}" var="j">
                                        <tr>
                                            <td><fmt:formatDate type = "date" value = "${j.date}" /></td>
                                            <td><fmt:formatDate type = "time" pattern = "HH:mm" value = "${j.time}" /></td>
                                            <td><c:out value="${j.start}"/></td>
                                            <td><c:out value="${j.end}"/></td>
                                            <td><c:out value="${j.customer_id}"/></td>


                                            <td><fmt:formatNumber value = "${j.fee / 100}" type = "currency"/></td>


                                            <td><form class="form-inline" method="POST" action="admindashboard" >
                                                <button type="submit" class="btn btn-info mb-2 btn-sm" name="assigndriver" value="<c:out value="${j.id}"/>">Assign Driver</button>&nbsp;

                                            </form></td>


                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </c:when>
                            <c:when test="${empty mybookings}" >
                                <div>No bookings to show!</div>
                            </c:when>
                        </c:choose>

                    </div>
                </div>



            </div>

        </div>

    </div>










</main>







<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>