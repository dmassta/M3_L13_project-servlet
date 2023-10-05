<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Tic-Tac-Toe</title>
    <link href="${pageContext.request.contextPath}/resources/favicon.ico" rel="icon"/>
    <link href="${pageContext.request.contextPath}/static/main.css" rel="stylesheet"/>
    <script src=https://code.jquery.com/jquery-3.7.1.js></script>
</head>
<body>
<h1>Tic-Tac-Toe</h1>
<br>
<br>
<div id="content">
    <table>
        <tr>
            <td onclick="window.location='/logic?click=0'">${data.get(0).getSign()}</td>
            <td onclick="window.location='/logic?click=1'">${data.get(1).getSign()}</td>
            <td onclick="window.location='/logic?click=2'">${data.get(2).getSign()}</td>
        </tr>
        <tr>
            <td onclick="window.location='/logic?click=3'">${data.get(3).getSign()}</td>
            <td onclick="window.location='/logic?click=4'">${data.get(4).getSign()}</td>
            <td onclick="window.location='/logic?click=5'">${data.get(5).getSign()}</td>
        </tr>
        <tr>
            <td onclick="window.location='/logic?click=6'">${data.get(6).getSign()}</td>
            <td onclick="window.location='/logic?click=7'">${data.get(7).getSign()}</td>
            <td onclick="window.location='/logic?click=8'">${data.get(8).getSign()}</td>
        </tr>
    </table>

    <hr>
    <div>
    <c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
    <c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

    <c:if test="${winner == CROSSES}">
        <h2>CROSSES WIN!</h2>
        <button onclick="restart()">Start again</button>
    </c:if>
    <c:if test="${winner == NOUGHTS}">
        <h2>NOUGHTS WIN!</h2>
        <button onclick="restart()">Start again</button>
    </c:if>
    <c:if test="${draw}">
        <h1>IT'S A DRAW</h1>
        <button onclick="restart()">Start again</button>
    </c:if>
    </div>
</div>
<br>



<script>
    function restart() {
        $.ajax({
            url: '/restart',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            async: false,
            success: function () {
                location.reload();
            }
        });
    }
</script>

</body>
</html>