<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .signup-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            overflow: hidden;
        }

        .signup-header {
            background-color: #4a6cf7;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .signup-form {
            padding: 30px;
        }

        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            flex: 1;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #4a6cf7;
            outline: none;
        }

        .error-message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }

        .form-group.error input {
            border-color: #e74c3c;
        }

        .form-group.error .error-message {
            display: block;
        }

        .signup-button {
            background-color: #4a6cf7;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px;
            font-size: 16px;
            font-weight: 500;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-bottom: 20px;
        }

        .signup-button:hover {
            background-color: #3a5ce5;
        }

        .login-link {
            text-align: center;
            font-size: 14px;
            color: #666;
        }

        .login-link a {
            color: #4a6cf7;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            .signup-container {
                border-radius: 0;
                box-shadow: none;
            }

            .signup-form {
                padding: 20px;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
<div class="signup-container">
    <div class="signup-header">
        <div class="logo">Sign Up</div>
        <p>Create your account</p>
    </div>
    <form class="signup-form" id="signupForm">
        <div class="form-row">
            <div class="form-group" id="firstNameGroup">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" placeholder="Enter your first name" required>
                <p class="error-message">Please enter your first name</p>
            </div>
            <div class="form-group" id="lastNameGroup">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" placeholder="Enter your last name" required>
                <p class="error-message">Please enter your last name</p>
            </div>
        </div>
        <div class="form-group" id="usernameGroup">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Choose a username" required>
            <p class="error-message">Username must be at least 4 characters</p>
        </div>
        <div class="form-group" id="passwordGroup">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Create a password" required>
            <p class="error-message">Password must be at least 8 characters</p>
        </div>
        <div class="form-group" id="confirmPasswordGroup">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
            <p class="error-message">Passwords do not match</p>
        </div>
        <button type="submit" class="signup-button">Sign Up</button>
        <div class="login-link">
            <p>Already have an account? <a href="/login">Log In</a></p>
        </div>
    </form>
</div>

<script>
    document.getElementById('signupForm').addEventListener('submit', function(e) {
        e.preventDefault();
        let isValid = true;

        // First name validation
        const firstName = document.getElementById('firstName');
        const firstNameGroup = document.getElementById('firstNameGroup');

        if (firstName.value.trim() === '') {
            firstNameGroup.classList.add('error');
            isValid = false;
        } else {
            firstNameGroup.classList.remove('error');
        }

        // Last name validation
        const lastName = document.getElementById('lastName');
        const lastNameGroup = document.getElementById('lastNameGroup');

        if (lastName.value.trim() === '') {
            lastNameGroup.classList.add('error');
            isValid = false;
        } else {
            lastNameGroup.classList.remove('error');
        }

        // Username validation
        const username = document.getElementById('username');
        const usernameGroup = document.getElementById('usernameGroup');

        if (username.value.length < 4) {
            usernameGroup.classList.add('error');
            isValid = false;
        } else {
            usernameGroup.classList.remove('error');
        }

        // Password validation
        const password = document.getElementById('password');
        const passwordGroup = document.getElementById('passwordGroup');

        if (password.value.length < 8) {
            passwordGroup.classList.add('error');
            isValid = false;
        } else {
            passwordGroup.classList.remove('error');
        }

        // Confirm password validation
        const confirmPassword = document.getElementById('confirmPassword');
        const confirmPasswordGroup = document.getElementById('confirmPasswordGroup');

        if (confirmPassword.value !== password.value) {
            confirmPasswordGroup.classList.add('error');
            isValid = false;
        } else {
            confirmPasswordGroup.classList.remove('error');
        }

        if (isValid) {
            // Create an object with form data
            const formData = {
                firstName: firstName.value.trim(),
                lastName: lastName.value.trim(),
                userName: username.value.trim(),
                password: password.value
                // Note: We don't include confirmPassword in the actual submission
            };

            // Send the POST request
            submitSignupForm(formData);
        }
    });

    // Function to handle the POST request
    function submitSignupForm(formData) {
        // Show loading state
        const signupButton = document.querySelector('.signup-button');
        const originalButtonText = signupButton.textContent;
        signupButton.textContent = 'Signing up...';
        signupButton.disabled = true;

        // API endpoint - replace with your actual API endpoint
        const apiUrl = 'http://localhost:8080/signup';

        fetch(apiUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
            .then(response => {
                if (!response.ok) {
                    // If the server responds with an error
                    return response.json().then(errorData => {
                        throw new Error(errorData.message || 'Registration failed');
                    });
                }
                return response.json();
            })
            .then(data => {
                // Handle successful registration
                console.log('Registration successful:', data);
                // Redirect to login page after successful registration
                // Replace '/login' with your actual login page URL
                window.location.href = '/login';
            })
            .catch(error => {
                // Handle errors
                console.error('Registration error:', error);
                alert(`Registration failed: ` + error.message);
            })
            .finally(() => {
                // Reset button state
                signupButton.textContent = originalButtonText;
                signupButton.disabled = false;
            });
    }
</script>
</body>
</html>