<?php
// Start the session
session_start();
include 'adminback.php';

// Instantiate the adminback class
$admin = new adminback();

// Check if the user is logged in (assuming email is stored in the session during login)
if (!isset($_SESSION['email'])) {
    echo "Please log in first.";
    exit();
}

// Get the email from the session
$email = $_SESSION['email'];

// Fetch user details by email using the new function
$user_details = $admin->fetch_user_details_by_email($email);

if ($user_details) {
    // Extract the user details
    $id = $user_details['id'];
    $fname = $user_details['firstname'];
    $lname = $user_details['lastname'];
    $contact = $user_details['contact'];
    $email = $user_details['email'];
    // Removed the password from here for security reasons
} else {
    echo "No user found!";
    exit();
}

?>

<!-- Profile Page HTML -->
<!DOCTYPE html>
<html>

<head>
    <title>User Profile</title>
    <?php include 'head_style.php'  ?>
</head>

<body>
    <?php include 'head.php'  ?>

    <section class="bg0 p-t-104 p-b-116">
        <div class="container" style="display: flex; justify-content: center;">
            <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                <form action="update_profile.php" method="POST">
                    <h4 class="mtext-105 cl2 txt-center p-b-30">Update Your Profile</h4>

                    <!-- Hidden input to hold the user ID -->
                    <input type="hidden" name="id" value="<?php echo htmlspecialchars($id); ?>">

                    <!-- First Name Input -->
                    <div class="m-b-20">
                        <label for="fname" class="stext-111 cl2 p-b-10" style="display: block;">First Name:</label>
                        <div class="bor8 how-pos4-parent">
                            <input class="stext-111 cl2 plh3 size-116 p-r-30"
                                type="text"
                                name="fname"
                                id="fname"
                                value="<?php echo htmlspecialchars($fname); ?>"
                                required
                                style="width: 100%; padding-left: 10px;">
                        </div>
                    </div>

                    <!-- Last Name Input -->
                    <div class="m-b-20">
                        <label for="lname" class="stext-111 cl2 p-b-10" style="display: block;">Last Name:</label>
                        <div class="bor8 how-pos4-parent">
                            <input class="stext-111 cl2 plh3 size-116 p-r-30"
                                type="text"
                                name="lname"
                                id="lname"
                                value="<?php echo htmlspecialchars($lname); ?>"
                                required
                                style="width: 100%; padding-left: 10px;">
                        </div>
                    </div>

                    <!-- Contact Input -->
                    <div class="m-b-20">
                        <label for="contact" class="stext-111 cl2 p-b-10" style="display: block;">Contact:</label>
                        <div class="bor8 how-pos4-parent">
                            <input class="stext-111 cl2 plh3 size-116 p-r-30"
                                type="text"
                                name="contact"
                                id="contact"
                                value="<?php echo htmlspecialchars($contact); ?>"
                                required
                                style="width: 100%; padding-left: 10px;">
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
                        Update Profile
                    </button>
                </form>

                <!-- Change Password Form -->
                <form action="change_password.php" method="POST" style="margin-top: 30px;">
                    <h4 class="mtext-105 cl2 txt-center p-b-30">Change Your Password</h4>

                    <!-- Current Password Input -->
                    <div class="m-b-20">
                        <label for="current_password" class="stext-111 cl2 p-b-10" style="display: block;">Current Password:</label>
                        <div class="bor8 how-pos4-parent">
                            <input class="stext-111 cl2 plh3 size-116 p-r-30"
                                type="password"
                                name="current_password"
                                id="current_password"
                                required
                                style="width: 100%; padding-left: 10px;">
                        </div>
                    </div>

                    <!-- New Password Input -->
                    <div class="m-b-20">
                        <label for="new_password" class="stext-111 cl2 p-b-10" style="display: block;">New Password:</label>
                        <div class="bor8 how-pos4-parent">
                            <input class="stext-111 cl2 plh3 size-116 p-r-30"
                                type="password"
                                name="new_password"
                                id="new_password"
                                required
                                style="width: 100%; padding-left: 10px;">
                        </div>
                    </div>

                    <!-- Confirm New Password Input -->
                    <div class="m-b-20">
                        <label for="confirm_password" class="stext-111 cl2 p-b-10" style="display: block;">Confirm New Password:</label>
                        <div class="bor8 how-pos4-parent">
                            <input class="stext-111 cl2 plh3 size-116 p-r-30"
                                type="password"
                                name="confirm_password"
                                id="confirm_password"
                                required
                                style="width: 100%; padding-left: 10px;">
                        </div>
                    </div>

                    <!-- Submit Button for Password Change -->
                    <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
                        Change Password
                    </button>
                </form>

            </div>
        </div>
    </section>

    <?php include 'footer.php' ?>
    <?php include 'footer_script.php' ?>
</body>

</html>