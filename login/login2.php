<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maharaja Catering</title>
    <link rel="icon" href="fevicon.png" type="image/png"> <!-- Favicon link -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .blurred-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(10px);
            z-index: 1;
        }

        .container {
            background: #ffffff;
            /* White background for the container */
            padding: 30px;
            border-radius: 0;
            /* Sharp edges for container */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 450px;
            text-align: center;
            animation: fadeIn 1.5s ease;
            position: relative;
            z-index: 2;
        }

        .logo {
            width: 100px;
            /* Reduced logo size */
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-control {
            border-radius: 30px;
            padding: 10px 15px;
            font-size: 16px;
        }

        .btn-primary {
            border-radius: 30px;
            background-color: black;
            /* Set to solid black */
            border: none;
        }

        .btn-primary:hover {
            background-color: #333;
            /* Darker black on hover */
        }

        .alert {
            border-radius: 30px;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @media (max-width: 576px) {
            .container {
                padding: 20px;
            }

            .logo {
                width: 80px;
                /* Further reduced logo size for smaller screens */
            }
        }
    </style>
</head>

<body>
    <div class="blurred-background"></div>
    <div class="container" id="loginForm">
        <img src="black-logo.png" alt="Logo" class="logo">
        <h2>Login</h2>
        <form action="../index.php" method="POST">
            <div class="form-group">
                <label for="email"><i class="fas fa-envelope"></i> Email:</label>
                <input type="email" class="form-control" name="email" id="email" required>
            </div>

            <div class="form-group">
                <label for="password"><i class="fas fa-lock"></i> Password:</label>
                <input type="password" class="form-control" name="password" id="password" required>
            </div>

            <!-- CAPTCHA Image -->
            <div class="form-group">
                <label for="captcha"><i class="fas fa-key"></i> CAPTCHA:</label>
                <img src="captcha.php" alt="CAPTCHA" class="mb-3">
                <input type="text" class="form-control" name="captcha_input" id="captcha" required placeholder="Enter the CAPTCHA">
            </div>

            <button type="submit" class="btn btn-primary btn-block" name="login">Login</button>

            <?php if (isset($error_message)): ?>
                <div class="alert alert-danger mt-3">
                    <?php echo htmlspecialchars($error_message); ?>
                </div>
            <?php endif; ?>
        </form>

        <div class="mt-3">
            <!-- <a href="change_password.php">Change Password</a> |  -->
            <a href="forgetpassword.php">Forget Password</a>
        </div>
    </div>
    <script>
        function toggleLogin() {
            var form = document.getElementById('loginForm');
            if (form.style.display === 'none') {
                form.style.display = 'block';
            } else {
                form.style.display = 'none';
            }
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>