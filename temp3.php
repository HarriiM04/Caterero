<?php



$customer_id = 1;
$cart_items = $admin->display_cart_by_customer($customer_id);
?>
<!-- Header -->
<header class="header-v4">
	<!-- Header desktop -->
	<div class="container-menu-desktop">
		<!-- Topbar -->
		<div class="top-bar">
			<div class="content-topbar flex-sb-m h-full container">
				<div class="left-top-bar">
					Free shipping for standard order over $100
				</div>

				<div class="right-top-bar flex-w h-full">
					<a href="#" class="flex-c-m p-lr-10 trans-04">
						Help & FAQs
					</a>

					<?php if (isset($_SESSION['email']) === true): ?>
						<!-- If user is logged in, show profile link -->
						<a href="profile.php" class="flex-c-m p-lr-10 trans-04">
							My Account
						</a>
					<?php else: ?>
						<!-- If user is not logged in, show login/register options -->
						<a href="login/login.php" class="flex-c-m p-lr-10 trans-04">
							My Account
						</a>
					<?php endif; ?>

					<a href="#" class="flex-c-m p-lr-10 trans-04">
						EN
					</a>

					<a href="#" class="flex-c-m p-lr-10 trans-04">
						USD
					</a>
				</div>

				<div class="right-top-bar flex-w h-full">
					<?php if (isset($_SESSION['email']) === true): ?>
						<!-- Show logout option if the user is logged in -->
						<a href="login/logout.php" class="flex-c-m trans-04 p-lr-25">
							Logout
						</a>
					<?php else: ?>
						<!-- Show login and register options if the user is not logged in -->
						<a href="login/login.php" class="flex-c-m trans-04 p-lr-25">
							Login
						</a>
						<a href="login/register.php" class="flex-c-m trans-04 p-lr-25">
							Register
						</a>
					<?php endif; ?>
				</div>

			</div>

			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">

					<!-- Logo desktop -->
					<a href="#" class="logo">
						<img src="images/icons/logo-01.png" alt="IMG-LOGO">
					</a>

					<!-- Menu desktop -->
					<div class="menu-desktop">
						<ul class="main-menu">
							<li class="active-menu">
								<a href="index.php">Home</a>
								<ul class="sub-menu">
									<li><a href="index.php">Homepage 1</a></li>
									<li><a href="home-02.html">Homepage 2</a></li>
									<li><a href="home-03.html">Homepage 3</a></li>
								</ul>
							</li>

							<li>
								<a href="product.html">Shop</a>
							</li>

							<li class="label1" data-label1="hot">
								<a href="shoping-cart.html">Features</a>
							</li>

							<li>
								<a href="blog.html">Blog</a>
							</li>

							<li>
								<a href="about.php">About</a>
							</li>

							<li>
								<a href="contact.php">Contact</a>
							</li>
						</ul>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>

						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
							<i class="zmdi zmdi-shopping-cart"></i>
						</div>

						<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
							<i class="zmdi zmdi-favorite-outline"></i>
						</a>
					</div>
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="index.php"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
					<i class="zmdi zmdi-shopping-cart"></i>
				</div>

				<a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">
					<i class="zmdi zmdi-favorite-outline"></i>
				</a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						Free shipping for standard order over $100
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04">
							Help & FAQs
						</a>

						<?php if (isset($_SESSION['email']) === true): ?>
							<!-- If user is logged in, show profile link -->
							<a href="profile.php" class="flex-c-m p-lr-10 trans-04">
								My Account
							</a>
						<?php else: ?>
							<!-- If user is not logged in, show login/register options -->
							<a href="login/login.php" class="flex-c-m p-lr-10 trans-04">
								My Account
							</a>
						<?php endif; ?>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							EN
						</a>

						<a href="#" class="flex-c-m p-lr-10 trans-04">
							USD
						</a>
					</div>

					<div class="right-top-bar flex-w h-full">
						<?php if (isset($_SESSION['email']) === true): ?>
							<!-- Show logout option if the user is logged in -->
							<a href="login/logout.php" class="flex-c-m trans-04 p-lr-25">
								Logout
							</a>
						<?php else: ?>
							<!-- Show login and register options if the user is not logged in -->
							<a href="login/login.php" class="flex-c-m trans-04 p-lr-25">
								Login
							</a>
							<a href="login/register.php" class="flex-c-m trans-04 p-lr-25">
								Register
							</a>
						<?php endif; ?>
					</div>

				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="index.php">Home</a>
					<ul class="sub-menu-m">
						<li><a href="index.php">Homepage 1</a></li>
						<li><a href="home-02.html">Homepage 2</a></li>
						<li><a href="home-03.html">Homepage 3</a></li>
					</ul>
					<span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
				</li>

				<li>
					<a href="product.html">Shop</a>
				</li>

				<li>
					<a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
				</li>

				<li>
					<a href="blog.html">Blog</a>
				</li>

				<li>
					<a href="about.php">About</a>
				</li>

				<li>
					<a href="contact.php">Contact</a>
				</li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search" placeholder="Search...">
				</form>
			</div>
		</div>
</header>

<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your Cart
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<?php
					if ($cart_items && $cart_items->num_rows > 0) {
						while ($row = $cart_items->fetch_assoc()) {
					?>
							<li class="header-cart-item flex-w flex-t m-b-12">
								<div class="header-cart-item-img">
									<img src="images/<?php echo $row['image']; ?>" alt="IMG">
								</div>

								<div class="header-cart-item-txt p-t-8">
									<a href="package_details.php?id=<?php echo $row['id']?>" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
										<?php echo $row['name']; ?>
									</a>

									<span class="header-cart-item-info">
										1 x $<?php echo $row['price']; // Assuming you also fetch price 
												?>
									</span>

									<a href="shoping-cart.php?id=<?php echo $row['id']?>" class="flex-c-m stext-101 cl0 size-55 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
										proceed
									</a>

									<a href="remove_from_cart.php?id=<?php echo $row['id']?>" class="flex-c-m stext-101 cl0 size-55 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
										remove
									</a>
								</div>
							</li>
					<?php
						}
					} else {
						echo "<p>Your cart is empty.</p>";
					}
					?>
				</ul>

				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">
						Total:
						<?php
						// Assuming you want to calculate the total here
						$total = 0;
						if ($cart_items && $cart_items->num_rows > 0) {
							mysqli_data_seek($cart_items, 0); // Reset the result pointer
							while ($row = $cart_items->fetch_assoc()) {
								$total += $row['price']; // Assuming price is available in your cart data
							}
						}
						echo "$" . number_format($total, 2);
						?>
					</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart.php" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart
						</a>

						<a href="checkout.html" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>