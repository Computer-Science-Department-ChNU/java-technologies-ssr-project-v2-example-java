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
            height: max-content;
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

            .content-card {
                padding: 20px;
            }
        }
        .resource-list {
            margin: 0 auto;
            width: 100%;
        }

        .resource-item {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .resource-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .resource-title {
            font-size: 18px;
            font-weight: 600;
            color: #333;
            padding: 20px 20px 10px 20px;
        }

        .resource-content {
            padding: 0 20px 15px 20px;
            color: #555;
            line-height: 1.5;
        }

        .resource-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 20px;
            background-color: #f9f9f9;
            border-top: 1px solid #eee;
        }

        .meta-info {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #777;
        }

        .author {
            font-weight: 500;
            color: #444;
        }

        .dot-separator {
            margin: 0 8px;
            font-size: 10px;
            color: #ccc;
        }

        .date {
            color: #888;
        }

        .meta-actions {
            display: flex;
            gap: 10px;
        }

        .edit-button, .delete-button {
            border: none;
            border-radius: 4px;
            padding: 6px 12px;
            font-size: 13px;
            cursor: pointer;
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .edit-button {
            background-color: #f0f0f0;
            color: #555;
        }

        .edit-button:hover {
            background-color: #e0e0e0;
        }

        .delete-button {
            background-color: #fff0f0;
            color: #e74c3c;
        }

        .delete-button:hover {
            background-color: #ffe0e0;
        }

        .floating-button {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background-color: #4a6cf7;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 4px 12px rgba(74, 108, 247, 0.3);
            cursor: pointer;
            transition: transform 0.3s, background-color 0.3s;
            border: none;
            z-index: 10;
        }

        .floating-button:hover {
            transform: translateY(-5px);
            background-color: #3a5ce5;
        }

        .floating-button svg {
            width: 24px;
            height: 24px;
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #777;
        }

        .empty-state svg {
            width: 80px;
            height: 80px;
            color: #ddd;
            margin-bottom: 20px;
        }

        .empty-title {
            font-size: 20px;
            font-weight: 500;
            color: #555;
            margin-bottom: 10px;
        }

        .empty-message {
            margin-bottom: 20px;
        }

        .create-first-button {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background-color: #4a6cf7;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .create-first-button:hover {
            background-color: #3a5ce5;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 100;
            justify-content: center;
            align-items: center;
        }

        .modal.show {
            display: flex;
        }

        .modal-content {
            background-color: white;
            border-radius: 10px;
            width: 100%;
            max-width: 500px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
            animation: modalOpen 0.3s ease-out;
        }

        @keyframes modalOpen {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .modal-header {
            background-color: #4a6cf7;
            color: white;
            padding: 15px 20px;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 500;
        }

        .modal-body {
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #4a6cf7;
            outline: none;
        }

        .form-group textarea {
            min-height: 120px;
            resize: vertical;
        }

        .modal-footer {
            padding: 15px 20px;
            background-color: #f9f9f9;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }

        .modal-close {
            background-color: #f0f0f0;
            color: #555;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .modal-close:hover {
            background-color: #e0e0e0;
        }

        .modal-save {
            background-color: #4a6cf7;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .modal-save:hover {
            background-color: #3a5ce5;
        }

        .confirm-modal .modal-content {
            max-width: 400px;
        }

        .confirm-modal .modal-header {
            background-color: #e74c3c;
        }

        .confirm-modal .modal-body {
            padding: 30px 20px;
            text-align: center;
        }

        .confirm-modal .modal-message {
            margin-bottom: 20px;
            color: #555;
            font-size: 16px;
        }

        .confirm-cancel {
            background-color: #f0f0f0;
            color: #555;
        }

        .confirm-delete {
            background-color: #e74c3c;
            color: white;
        }

        .confirm-delete:hover {
            background-color: #c0392b;
        }

        /* Responsive styles */
        @media (max-width: 768px) {
            body {
                padding: 20px 15px;
            }

            .page-title {
                font-size: 24px;
                margin-bottom: 20px;
            }

            .floating-button {
                width: 50px;
                height: 50px;
                bottom: 20px;
                right: 20px;
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
