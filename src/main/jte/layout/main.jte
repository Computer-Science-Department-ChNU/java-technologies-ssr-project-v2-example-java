@param Boolean isAuthenticated
@param Boolean isAdmin
@param gg.jte.Content content

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 15px 20px;
            position: relative;
        }

        .title {
            text-align: center;
            color: #333;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .login-button {
            position: absolute;
            top: 15px;
            right: 20px;
            background-color: #4a6cf7;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 15px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            text-decoration: none;
        }

        .login-button:hover {
            background-color: #3a5ce5;
        }

        .menu {
            display: flex;
            border-bottom: 1px solid #eee;
            padding: 0 20px;
            background-color: white;
        }

        .menu-item {
            padding: 15px 20px;
            color: #555;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s, border-bottom 0.3s;
            border-bottom: 3px solid transparent;
        }

        .menu-item:hover, .menu-item.active {
            color: #4a6cf7;
            border-bottom: 3px solid #4a6cf7;
        }

        .main-content {
            flex: 1;
            padding: 30px 20px;
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
        }

        .content-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
            margin-bottom: 30px;
        }

        .card-title {
            font-size: 22px;
            color: #333;
            margin-bottom: 15px;
        }

        .card-text {
            color: #555;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .footer {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 14px;
        }

        .copyright {
            opacity: 0.8;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            .header {
                padding: 15px 10px;
            }

            .title {
                font-size: 22px;
                margin-bottom: 20px;
            }

            .login-button {
                top: auto;
                bottom: 15px;
                right: 10px;
                font-size: 13px;
                padding: 6px 12px;
            }

            .menu {
                padding: 0 10px;
            }

            .menu-item {
                padding: 12px 15px;
                font-size: 14px;
            }

            .main-content {
                padding: 20px 10px;
            }

            .content-card {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<header class="header">
    <h1 class="title">Blog platform</h1>
    @if(isAuthenticated)
        <a href="/logout" class="login-button">Logout</a>
    @else
        <a href="/login" class="login-button">Login</a>
    @endif
</header>

@if(isAuthenticated)
    <nav class="menu">
        <a href="/" class="menu-item active" id="home">Home</a>
        @if(isAdmin)
            <a href="/admin" class="menu-item" id="authors">Authors</a>
        @else
            <a href="/author" class="menu-item" id="my-posts">My posts</a>
        @endif
    </nav>
    <script>
        // Set active menu item based on current URL path
        document.addEventListener('DOMContentLoaded', function() {
            const currentPath = window.location.pathname;

            // Remove all active classes first
            const menuItems = document.querySelectorAll('.menu-item');
            menuItems.forEach(item => {
                item.classList.remove('active');
            });

            // Apply active class based on current path
            if (currentPath === '/') {
                document.getElementById('home').classList.add('active');
            } else if (currentPath.includes('/author')) {
                document.getElementById('my-posts').classList.add('active');
            } else if (currentPath.includes('/admin')) {
                document.getElementById('authors').classList.add('active');
            }
        });
    </script>
@endif

<main class="main-content">
    ${content}
</main>
<footer class="footer">
    <p class="copyright">© 2025 Blog platform. All rights reserved.</p>
</footer>
</body>
</html>
