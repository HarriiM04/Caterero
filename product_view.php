<?php
include 'adminback.php';

$admin = new adminback();

// Fetch all packages using the display_package() method
$packages = $admin->display_package();

if (!$packages) {
	echo "Error fetching packages!";
	exit;
}


?>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<?php include 'head_style.php'  ?>
</head>

<body class="animsition">

	<?php include 'head.php'  ?>








	<?php
	include 'product.php'
	?>



	<?php
	include 'footer.php'
	?>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<!-- //  <img src="images/icons/icon-close.png" alt="CLOSE"> -->
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3" data-thumb="images/<?php echo $package['image']; ?>">
										<div class="wrap-pic-w pos-relative">
											<img src="images/<?php echo $package['image']; ?>" alt="IMG-PRODUCT">
											<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/<?php echo $package['image']; ?>">
												<i class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">
								<?php echo $package['name']; ?>
							</h4>

							<span class="mtext-106 cl2">
								$<?php echo $package['price']; ?>
							</span>

							<p class="stext-102 cl3 p-t-23">
								<?php echo $package['description']; ?>
							</p>

							<!-- Display Package Items by Category -->
							<div class="p-t-33">
								<?php
								// Check if the 'items' field exists and is not null
								if (!empty($package['items'])) {
									// Decode the items JSON
									$items = json_decode($package['items'], true);

									// Check if JSON decoding was successful and no errors occurred
									if (json_last_error() === JSON_ERROR_NONE && !empty($items)) {
										$categories = $admin->getCategoriess(); // Fetch all categories
										$categoryMap = [];
										while ($category = mysqli_fetch_assoc($categories)) {
											$categoryMap[$category['id']] = $category['name'];
										}

										foreach ($items as $categoryId => $itemIds) {
											if (isset($categoryMap[$categoryId])) {
												// Fetch item details by their IDs
												$ids = implode(',', array_map('intval', $itemIds));
												$result = $admin->getItemsByIds($ids);

												$itemNames = [];
												while ($item = mysqli_fetch_assoc($result)) {
													$itemNames[] = $item['Name'];
												}

												if (!empty($itemNames)) {
													echo "<b>Category: " . $categoryMap[$categoryId] . "</b>";
													echo "<ul><li>" . implode('</li><li>', $itemNames) . "</li></ul>";
												}
											}
										}
									} else {
										// JSON decode failed or items array is empty
										echo "No items found for this package.";
									}
								} else {
									// Handle case where 'items' field is missing or empty
									echo "This package has no items associated.";
								}
								?>
							</div>

							<!-- Add to Cart Button -->
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
										Add to cart
									</button>
								</div>
							</div>

							<!-- Social Media Links -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
										<i class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
									<i class="fa fa-facebook"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
									<i class="fa fa-twitter"></i>
								</a>

								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
									<i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<?php
	include 'footer_script.php'
	?>
</body>

</html>

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