<?php
session_start();
if (!$_SESSION['email']) {
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

<body class="animsition">

	<?php include 'head.php' ?>

    <div class="container">
			<div class="p-b-10">
				<h3 class="ltext-103 cl5">
					Orders Overview
				</h3>
			</div>

           
            <div class="flex-w flex-tr">
                <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">
                 
                    <!-- Check if there are any orders -->
                    <?php if ($orders && $orders->num_rows > 0): ?>
                        <!-- Display the orders in a table -->
                        <div class="bor8 m-b-30 how-pos4-parent">
                            <table class="table-orders stext-111 cl2 plh3 size-116 p-lr-30 p-tb-25" border="1" cellpadding="10" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th>Order ID</th>
                                      
                                        <th>Order Date</th>
                                      
                                       
                                      
                                        <th>Package</th>
                                        <th>Status</th>
                                        <th>Track Order</th>
                                        <th>Details</th> <!-- New Column -->
                                      
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php while ($row = $orders->fetch_assoc()): ?>
                                        <tr>
                                            <td><?php echo $row['Id']; ?></td>
                                           
                                            <td><?php echo $row['order_date']; ?></td>
                                          
                                            <td><?php echo $row['name']; ?></td>
                                            <td><?php echo $row['status']; ?></td>
                                            <td> <a href="trackorder.php?odid=<?php echo $row['Id']; ?>');" title="Track order">Track Order</a></td>
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
 





	


	<?php include 'footer.php' ?>
	<?php include 'footer_script.php' ?>

</body>

</html>

<!-- used for model -->
<script>
	$(document).ready(function() {
		$('.quick-view-btn').click(function() {
			var packageId = $(this).data('id');

			// AJAX request to fetch package details
			$.ajax({
				url: 'fetch_package.php', // This script will return package details as JSON
				type: 'GET',
				data: {
					id: packageId
				},
				success: function(response) {
					// Parse the JSON response
					var package = JSON.parse(response);

					// Update modal content with fetched data
					$('.js-name-detail').text(package.name);
					$('.mtext-106').text('$' + package.price);
					$('.stext-102').text(package.description);

					// Update the modal image
					$('.wrap-pic-w img').attr('src', 'images/' + package.image);

					// Display the package items
					var itemListHtml = '';
					for (var categoryName in package.itemDetails) {
						itemListHtml += '<b>Category: ' + categoryName + '</b><ul>';
						package.itemDetails[categoryName].forEach(function(itemName) {
							itemListHtml += '<li>' + itemName + '</li>'; // Display item names
						});
						itemListHtml += '</ul>';
					}
					$('.p-t-33').html(itemListHtml); // Update the items display in the modal

					// Show the modal
					$('.js-modal1').addClass('show-modal1');
				}


			});
		});

		// Close modal
		$('.js-hide-modal1').click(function() {
			$('.js-modal1').removeClass('show-modal1');
		});
	});
</script>

