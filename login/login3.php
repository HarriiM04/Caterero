<?php
// session_start();
// $conn = new mysqli('localhost', 'username', 'password', 'database');

// // Check if login form is submitted
// if ($_SERVER['REQUEST_METHOD'] === 'POST') {
//     $email = $conn->real_escape_string($_POST['email']);
//     $password = $conn->real_escape_string($_POST['password']);

//     // Query to check if user exists
//     $sql = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";
//     $result = $conn->query($sql);

//     if ($result->num_rows > 0) {
//         // User exists, start session
//         $_SESSION['email'] = $email;
//         echo "<script>alert('Login successful');</script>";
//     } else {
//         echo "<script>alert('Invalid email or password');</script>";
//     }
// }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Modal Demo</title>
    <style>
        /* Basic styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Blur effect when modal is opened */
        body.modal-active #content {
            filter: blur(5px);
            transition: filter 0.3s ease;
        }

        #content {
            padding: 20px;
            text-align: center;
        }

        /* Style for the login button */
        .loginButton {
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            margin-top: 20px;
        }

        /* Modal background styling */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            background-color: rgba(0, 0, 0, 0.5); /* Black background with opacity */
        }

        /* Modal content */
        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fefefe;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        /* Input and button styles inside modal */
        .modal-content input[type="email"],
        .modal-content input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .modal-content button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div id="content">
    <h1>Welcome to the Website</h1>
    <!-- Button to open the login form -->
    <button class="loginButton" onclick="toggleLogin()">Login</button>
</div>

<!-- The Modal -->
<div id="loginModal" class="modal">
    <div class="modal-content">
        <form action="index.php" method="POST">
            <h2>Login</h2>
            <label for="email">Email:</label><br>
            <input type="email" name="email" id="email" required><br>
            <label for="password">Password:</label><br>
            <input type="password" name="password" id="password" required><br>
            <button type="submit">Login</button>
        </form>
    </div>
</div>

<script>
    // Function to toggle the login form modal
    function toggleLogin() {
        var modal = document.getElementById('loginModal');
        var body = document.body;
        if (modal.style.display === 'none' || modal.style.display === '') {
            modal.style.display = 'block';
            body.classList.add('modal-active');
        } else {
            modal.style.display = 'none';
            body.classList.remove('modal-active');
        }
    }

    // Close the modal if clicked outside of it
    window.onclick = function(event) {
        var modal = document.getElementById('loginModal');
        if (event.target === modal) {
            modal.style.display = 'none';
            document.body.classList.remove('modal-active');
        }
    }
</script>

</body>
</html>
