<?php
session_start();
if (!$_SESSION['email']) {
    header("Location: index.php");
}
include 'adminback.php';

// Retrieve from session
// Replace this with actual logged-in customer ID retrieval
$admin = new adminback();

$customer_mail = $_SESSION['email']; // Use customer ID from session
$package_id = $_GET['id']; // Make sure to sanitize this input
$package = $admin->display_packageByID($package_id);
$message = '';
// Handle form submission for creating an order
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $order_date = $_POST['order_date'];
    $service_address = $_POST['service_address'];
    $service_date = $_POST['service_date'];
    $dish_count = intval($_POST['dish_count']); // Ensure dish_count is an integer
    $staff_count = intval($_POST['staff_count']); // Ensure staff_count is an integer
    $total_amount = floatval($_POST['total_amount']); // Ensure total_amount is a float
    $chefs_count = intval($_POST['chefs']); // New line
    $coordinators_count = intval($_POST['coordinators']); // New line
    $waitstaff_count = intval($_POST['waitstaff']); // New line



    // Call the create_order method
    if ($admin->create_order($customer_mail, $order_date, $package_id, $dish_count, $total_amount, $staff_count, $service_address, $service_date)) {

        // Assign Chefs
        $chefs_result = $admin->assign_designation_staff('Chef', $chefs_count);
        if ($chefs_result !== "Staff assigned successfully.") {
            echo "<script>alert('Error: $chefs_result'); window.location.href='error_page.php';</script>";
            exit; // Stop further execution if staff assignment fails
        }

        // Assign Event Coordinators
        $coordinators_result = $admin->assign_designation_staff('Event Coordinator', $coordinators_count);
        if ($coordinators_result !== "Staff assigned successfully.") {
            echo "<script>alert('Error: $coordinators_result'); window.location.href='error_page.php';</script>";
            exit; // Stop further execution if staff assignment fails
        }

        // Assign Waitstaff
        $waitstaff_result = $admin->assign_designation_staff('Waitstaff', $waitstaff_count);
        if ($waitstaff_result !== "Staff assigned successfully.") {
            echo "<script>alert('Error: $waitstaff_result'); window.location.href='error_page.php';</script>";
            exit; // Stop further execution if staff assignment fails
        }

        // If everything is successful, proceed with the success message
        echo "<script>alert('Order created successfully!'); window.location.href='success_page.php';</script>";
    } else {
        // Show error message for order creation failure
        $message = "<div class='error'>Error creating order. Please try again.</div>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<style>
    .success {
        color: green;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .error {
        color: red;
        font-weight: bold;
        margin-bottom: 20px;
    }
</style>

<head>
    <title>Orders</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php include 'head_style.php'; ?>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // AJAX function to calculate staff count and total amount
        // AJAX function to calculate staff count and total amount
        function calculateStaffAndTotal() {
            const dishCount = parseInt($('#dish_count').val());
            const packageId = <?php echo $package_id; ?>;

            $.ajax({
                url: 'calculate.php', // The PHP file that processes the request
                type: 'POST',
                data: {
                    dish_count: dishCount,
                    package_id: packageId
                },
                success: function(response) {
                    const result = JSON.parse(response);
                    $('#staff_count').val(result.staff_count);
                    $('#total_amount').val(result.total_amount);
                    $('#chefs').val(result.chefs); // Set chefs count
                    $('#coordinators').val(result.coordinators); // Set coordinators count
                    $('#waitstaff').val(result.waitstaff); // Set waitstaff count
                }
            });
        }


        // Trigger the calculation whenever dish count changes
        $(document).ready(function() {
            $('#dish_count').on('input', calculateStaffAndTotal);
        });
    </script>
</head>

<body class="animsition">

    <?php include 'head.php'; ?>
    <?php if ($message) echo $message; ?>
    <!-- Shoping Cart -->
    <form class="bg0 p-t-75 p-b-85" method="post" action="">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                    <div class="m-l-25 m-r--38 m-lr-0-xl">
                        <div class="wrap-table-shopping-cart">
                            <table class="table-shopping-cart">
                                <tr class="table_head">
                                    <th class="column-1">Product</th>
                                    <th class="column-2">Name</th>
                                </tr>
                                <?php if ($package): ?>
                                    <tr class="table_row">
                                        <td class="column-1">
                                            <div class="how-itemcart1">
                                                <img src="images/<?php echo $package['image']; ?>" alt="IMG">
                                            </div>
                                        </td>
                                        <td class="column-2">
                                            <?php echo htmlspecialchars($package['name']); ?>
                                            <p class="stext-111 cl6 p-t-2">
                                                <?php echo htmlspecialchars($package['description']); ?>
                                            </p>
                                        </td>
                                    </tr>
                                <?php else: ?>
                                    <tr class="table_row">
                                        <td colspan="2" class="text-center">Package not found.</td>
                                    </tr>
                                <?php endif; ?>
                            </table>
                        </div>

                        <!-- Dish Count -->
                        <div class="p-t-20">

                            <label for="dish_count">Dish Count:</label>

                            <input type="number" id="dish_count" name="dish_count" class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-tb-10"  min="300" max="5000" placeholder="300 to 5000 valid" required>
                            <span id="error_message" style="color: red; display: none;">Minimum 300 dishes are required.</span>
                            <span id="error_message2" style="color: red; display: none;">Maximum 5000 dishes are required.</span>

                        </div>
                        <script>
                            document.getElementById('dish_count').addEventListener('input', function() {
                                var dishCount = parseInt(this.value, 10); // Parse input as an integer
                                var errorMessage = document.getElementById('error_message');
                                var errorMessage2 = document.getElementById('error_message2');

                                // Reset error messages
                                errorMessage.style.display = 'none';
                                errorMessage2.style.display = 'none';

                                // Validate the dish count
                                if (isNaN(dishCount)) {
                                    // Optionally handle case when input is not a number
                                    errorMessage.textContent = "Please enter a valid number.";
                                    errorMessage.style.display = 'block';
                                } else if (dishCount < 300) {
                                    errorMessage.textContent = "Minimum dish count is 300.";
                                    errorMessage.style.display = 'block';
                                } else if (dishCount > 5000) {
                                    errorMessage2.textContent = "Maximum dish count is 5000.";
                                    errorMessage2.style.display = 'block';
                                }
                            });
                        </script>



                        <!-- Staff Count (will be calculated and filled via AJAX) -->
                        <div class="p-t-20">
                            <label for="staff_count">Total Staff Count:</label>
                            <input type="number" id="staff_count" name="staff_count" class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-tb-10" readonly>
                        </div>

                        <!-- Chefs Count (will be calculated and filled via AJAX) -->
                        <div class="p-t-20">
                            <label for="chefs">Chefs Count:</label>
                            <input type="number" id="chefs" name="chefs" class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-tb-10" readonly>
                        </div>

                        <!-- Coordinators Count (will be calculated and filled via AJAX) -->
                        <div class="p-t-20">
                            <label for="coordinators">Coordinators Count:</label>
                            <input type="number" id="coordinators" name="coordinators" class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-tb-10" readonly>
                        </div>

                        <!-- Waitstaff Count (will be calculated and filled via AJAX) -->
                        <div class="p-t-20">
                            <label for="waitstaff">Waitstaff Count:</label>
                            <input type="number" id="waitstaff" name="waitstaff" class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-tb-10" readonly>
                        </div>


                        <!-- Service Address -->
                        <div class="p-t-20">
                            <label for="service_address">Service Address:</label>
                            <textarea id="service_address" name="service_address" class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-tb-10" rows="4" required></textarea>
                        </div>

                        <!-- Order Date -->
                        <div class="p-t-20">
                            <label for="order_date">Order Date:</label>
                            <input type="date" id="order_date" name="order_date" class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-tb-10" required>
                        </div>

                        <!-- Service Date -->
                        <div class="p-t-20">
                            <label for="service_date">Service Date:</label>
                            <input type="date" id="service_date" name="service_date" class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-tb-10" required>
                        </div>

                        <!-- Total Amount (will be calculated and filled via AJAX) -->
                        <div class="p-t-20">
                            <label for="total_amount">Total Amount:</label>
                            <input type="text" id="total_amount" name="total_amount" class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-tb-10" readonly>
                        </div>

                        <!-- Submit Button -->
                        <div class="p-t-20">
                            <button type="submit" class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">
                                Submit Order
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <?php include 'footer.php'; ?>
    <?php include 'footer_script.php'; ?>

</body>

</html>