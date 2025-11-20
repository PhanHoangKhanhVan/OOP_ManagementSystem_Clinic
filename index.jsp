<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chủ Vet System</title>
    </head>
    <body>
        <c:if test="${sessionScope.acc != null}">
            <h1 style="color: green">Đăng nhập thành công!</h1>
            <h2>Xin chào: ${sessionScope.acc.fullName}</h2>
            <h3>Quyền hạn: ${sessionScope.acc.role}</h3>
            
            <a href="login">Quay lại đăng nhập</a>
        </c:if>
            
        <c:if test="${sessionScope.acc == null}">
            <h1>Bạn chưa đăng nhập!</h1>
            <a href="${pageContext.request.contextPath}/views/auth/login.jsp">Bấm vào đây để Login</a>
        </c:if>
    </body>
</html>