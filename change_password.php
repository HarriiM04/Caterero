<?php
session_start();
include 'adminback.php';

// Instantiate the adminback class
$admin = new adminback();

// Check if the user is logged in
if (!isset($_SESSION['email'])) {
    echo "Please log in first.";
    exit();
}

// Get the email from the session
$email = $_SESSION['email'];

// Fetch user details by email
$user_details = $admin->fetch_user_details_by_email($email);

// Check if the user exists
if ($user_details) {
    $current_password = $_POST['current_password'];
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];

    // Verify the current password
    if (password_verify($current_password, $user_details['password'])) {
        // Check if the new password and confirm password match
        if ($new_password === $confirm_password) {
            // Update the password (hash it before saving)
            $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);
            $admin->update_password($user_details['id'], $hashed_password); // You'll need to implement this method

            echo "Password changed successfully!";
        } else {
            echo "New password and confirm password do not match.";
        }
    } else {
        echo "Current password is incorrect.";
    }
} else {
    echo "No user found!";
}
