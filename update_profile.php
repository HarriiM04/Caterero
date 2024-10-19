<?php
// Start the session
session_start();

// Include the adminback class or database connection
include 'adminback.php';

// Instantiate the adminback class
$admin = new adminback();

// Check if the form was submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get the form data
    $id = $_POST['id']; // Hidden field to identify the user
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $contact = $_POST['contact'];

    // Prepare SQL query to update the user's details
    $query = "UPDATE users SET firstname = ?, lastname = ?, contact = ? WHERE id = ?";
    $stmt = $admin->connection->prepare($query);

    if ($stmt) {
        // Bind the parameters to the query
        $stmt->bind_param("sssi", $fname, $lname, $contact, $id);

        // Execute the query
        if ($stmt->execute()) {
            // Redirect back to profile page with success message
            $_SESSION['success_message'] = "Profile updated successfully!";
            header("Location: profile.php");
            exit();
        } else {
            // Handle query execution failure
            echo "Error updating profile: " . $stmt->error;
        }

        // Close the statement
        $stmt->close();
    } else {
        // Handle query preparation failure
        echo "Error preparing query: " . $admin->connection->error;
    }
} else {
    // If the form was not submitted properly
    echo "Invalid request!";
}
?>
