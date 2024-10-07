<?php
session_start();
if(!$_SESSION['email']){
    header("Location: index.php");
}
include 'adminback.php';
//we will retrive it from session

$admin = new adminback();

// Fetch all packages using the display_package() method
$packages = $admin->display_package();

if (!$packages) {
    echo "Error fetching packages!";
    exit;
}

$orders = $admin->display_order($_SESSION['email']);

// Assuming you have the order data fetched from the database, let's mock the data for demonstration



?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php include 'head_style.php' ?>
</head>
    <?php include 'head.php' ?>
<body class="animsition">

 <!-- Content page -->
 <section class="bg0 p-t-104 p-b-116">
        <div class="container">
            <div class="flex-w flex-tr">
                <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                    <h4 class="mtext-105 cl2 txt-center p-b-30">
                        Order Details
                    </h4>

                    <!-- Check if there are any orders -->
                    <?php if ($orders && $orders->num_rows > 0): ?>
                        <!-- Display the orders in a table -->
                        <div class="bor8 m-b-30 how-pos4-parent">
                            <table class="table-orders stext-111 cl2 plh3 size-116 p-lr-30 p-tb-25" border="1" cellpadding="10" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Customer ID</th>
                                        <th>Order Date</th>
                                        <th>Type</th>
                                        <th>Package ID</th>
                                        <th>Details</th> <!-- New Column -->
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php while ($row = $orders->fetch_assoc()): ?>
                                        <tr>
                                            <td><?php echo $row['Id']; ?></td>
                                            <td><?php echo $row['firstname']; ?></td>
                                            <td><?php echo $row['order_date']; ?></td>
                                            <td><?php echo $row['type']; ?></td>
                                            <td><?php echo $row['name']; ?></td>
                                            <!-- Link to a new page with the order details -->
                                            <td>
                                                <a href="order_details.php?order_id=<?php echo $row['Id']; ?>" class="stext-111 cl2 plh3 size-116 p-lr-30 p-tb-25">View Details</a>
                                            </td>
                                        </tr>
                                    <?php endwhile; ?>
                                </tbody>
                            </table>
                        </div>
                    <?php else: ?>
                        <p class="txt-center cl2">No orders found.</p>
                    <?php endif; ?>
                </div>
               
        </div>
    </section>


        <?php include 'footer.php' ?>
        <?php include 'footer_script.php' ?>

</body>

</html>