<%-- 
    Document   : testhistory
    Created on : Jul 7, 2025, 10:34:33 AM
    Author     : selu3
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lịch sử bài test</title>
        <style>
            body {
                font-family: sans-serif;
                background: #f5f6fa;
                padding: 40px;
            }
            .card {
                display: inline-block;
                width: 250px;
                background: #fff;
                padding: 20px;
                margin: 10px;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                vertical-align: top;
            }
            .title {
                font-size: 18px;
                font-weight: bold;
                margin-bottom: 8px;
            }
            .date {
                color: #999;
                font-size: 13px;
            }
            .code {
                font-size: 24px;
                font-weight: bold;
                margin-top: 15px;
                color: #667eea;
            }
        </style>
    </head>
    <body>
        <h2>Lịch sử làm bài</h2>

        <c:forEach var="h" items="${history}">
            <div class="card">
                <div class="title">${h.userName} - ${h.testName}</div>
                <div class="date">${h.formattedDate}</div>
                <div class="code">🔰 Holland Code: ${h.hollandCode}</div>
            </div>
        </c:forEach>

        <c:if test="${empty history}">
            <p style="text-align:center">Chưa có dữ liệu.</p>
        </c:if>
    </body>
</html>

