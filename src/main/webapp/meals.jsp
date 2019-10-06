<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<html>
<head>
    <title>Meals</title>
    <style type = "text/css">
        body {
            font-family: Arial, Verdana, sans-serif;
            color: #111111;
        }
        table {
            width: 800px;
        }
        th, td {
            padding: 7px 10px 10px 10px;
        }
        th {
            text-transform: uppercase;
            letter-spacing: 0.1em;
            font-size: 90%;
            border-bottom: 2px solid #111111;
            border-top: 1px solid#999999;
            text-align: center;
        }
        tr.no_excess {
            color: #006400;
        }
        tr.odd {
            background-color: #efefef;
        }
        tr.excess {
            color: #b22222;
        }
        tr:hover {
            background-color: #c3e6e5;
        }
        .calories {
            text-align: right;
        }
        .manage {
            text-align: center;
        }
    </style>
</head>
<body>
    <h3><a href="index.html">Home</a></h3>
    <hr>
    <h2>Meals</h2>
    <hr>
    <h3>List of my meals</h3>
    <table>
        <tr>
            <th>Дата/Время</th>
            <th>Описание</th>
            <th>Калории</th>
            <th></th>
            <th></th>
        </tr>
        <c:forEach items="${mealList}" var="item" varStatus="loop">
            <tr class="
            <c:if test="${item.excess == true}">excess</c:if>
            <c:if test="${item.excess == false}">no_excess</c:if>
            <c:if test="${loop.index mod 2 == 0}">odd</c:if>
            ">
                <td>${item.dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss"))}</td>
                <td>${item.description}</td>
                <td class="calories">${item.calories}</td>
                <td class="manage">изменить</td>
                <td class="manage">удалить</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>