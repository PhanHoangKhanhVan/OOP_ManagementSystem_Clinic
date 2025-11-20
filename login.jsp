<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Vet System</title>
        <style>
            body { font-family: sans-serif; display: flex; justify-content: center; margin-top: 50px; }
            .container { border: 1px solid #ccc; padding: 20px; border-radius: 8px; width: 300px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
            input { width: 100%; padding: 8px; margin: 10px 0; box-sizing: border-box; }
            button { width: 100%; padding: 10px; background: #28a745; color: white; border: none; cursor: pointer; }
            button:hover { background: #218838; }
            .error { color: red; text-align: center; }
        </style>
    </head>
    <body>
        <div class="container">
            <h2 style="text-align: center">Đăng Nhập</h2>
            
            <p class="error">${mess}</p>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <label>Username:</label>
                <input type="text" name="user" placeholder="Nhập username..." required>
                
                <label>Password:</label>
                <input type="password" name="pass" placeholder="Nhập password..." required>
                
                <button type="submit">Login</button>
            </form>
        </div>
    </body>
</html>