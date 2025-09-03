<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Kết quả thanh toán</title></head>
<body>
    <c:choose>
        <c:when test="${status == 'success'}">
            <h2>✅ Thanh toán thành công! Gói VIP đã được kích hoạt.</h2>
        </c:when>
        <c:when test="${status == 'fail'}">
            <h2>❌ Thanh toán thất bại.</h2>
        </c:when>
        <c:otherwise>
            <h2>⚠️ Dữ liệu không hợp lệ (sai chữ ký).</h2>
        </c:otherwise>
    </c:choose>
</body>
</html>
