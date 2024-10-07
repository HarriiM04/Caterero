<?php
session_start();
include 'adminback.php';
//we will retrive it from session
$_SESSION['customer_id'] = 1;
$admin = new adminback();

// Fetch all packages using the display_package() method
$packages = $admin->display_package();

if (!$packages) {
    echo "Error fetching packages!";
    exit;
}


// Assuming you have the order data fetched from the database, let's mock the data for demonstration
$order = [
    'Id' => 123,
    'Cust_id' => 456,
    'order_date' => '2024-10-01',
    'type' => 'Package',
    'package_id' => 789,
    'dish_count' => 50,
    'total_amount' => 10000,
    'staff_count' => 5,
    'status' => 'Confirmed',
    'service_address' => '123 Main St, Cityname',
    'service_date' => '2024-10-05',
];



?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php include 'head_style.php' ?>
</head>

<body class="animsition">

    <?php include 'head.php' ?>
    <!-- Content page -->
    <section class="bg0 p-t-104 p-b-116">
        <div class="container">
            <div class="flex-w flex-tr">
                <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                    <h4 class="mtext-105 cl2 txt-center p-b-30">
                        Order Details
                    </h4>

                    <!-- Order ID -->
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <p class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">Order ID: <?php echo $order['Id']; ?></p>
                    </div>

                    <!-- Order Date -->
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <p class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">Order Date: <?php echo $order['order_date']; ?></p>
                    </div>

                    <!-- Order Type -->
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <p class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">Order Type: <?php echo $order['type']; ?></p>
                    </div>

                    <!-- Dish Count -->
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <p class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">Dish Count: <?php echo $order['dish_count']; ?></p>
                    </div>

                    <!-- Total Amount -->
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <p class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">Total Amount: ₹<?php echo number_format($order['total_amount'], 2); ?></p>
                    </div>

                    <!-- Staff Count -->
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <p class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">Staff Count: <?php echo $order['staff_count']; ?></p>
                    </div>

                    <!-- Status -->
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <p class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">Order Status: <?php echo $order['status']; ?></p>
                    </div>

                    <!-- Service Address -->
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <p class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">Service Address: <?php echo $order['service_address']; ?></p>
                    </div>

                    <!-- Service Date -->
                    <div class="bor8 m-b-20 how-pos4-parent">
                        <p class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30">Service Date: <?php echo $order['service_date']; ?></p>
                    </div>

                    <!-- Add any buttons for actions (e.g., view invoice, track order) -->
                    <div class="m-t-30 txt-center">
                        <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
                            Track Order
                        </button>
                    </div>
                </div>
            </div>
        </div>



        <?php include 'footer.php' ?>
        <?php include 'footer_script.php' ?>

</body>

</html>