-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2024 at 02:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_logo`
--

CREATE TABLE `add_logo` (
  `id` int(10) NOT NULL,
  `img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `add_logo`
--

INSERT INTO `add_logo` (`id`, `img`) VALUES
(2, 'logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(60) NOT NULL,
  `admin_pass` varchar(60) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_email`, `admin_pass`, `role`) VALUES
(1, 'saifulislamsapon@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(3, 'moazzem@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2),
(4, 'yearul@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `all_order_info`
-- (See below for the actual view)
--
CREATE TABLE `all_order_info` (
`order_id` int(255)
,`product_name` varchar(255)
,`pdt_quantity` int(11)
,`amount` int(11)
,`uses_coupon` varchar(35)
,`customer_name` varchar(60)
,`Shipping_mobile` varchar(20)
,`trans_id` varchar(25)
,`shiping_address` varchar(255)
,`order_status` int(3)
,`order_time` timestamp
,`order_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catagory`
--

CREATE TABLE `catagory` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catagory`
--

INSERT INTO `catagory` (`id`, `name`) VALUES
(1, 'Starters'),
(2, 'Main Course'),
(3, 'Side Dishes'),
(4, 'Desserts'),
(5, 'Beverages');

-- --------------------------------------------------------

--
-- Table structure for table `cupon`
--

CREATE TABLE `cupon` (
  `cupon_id` int(11) NOT NULL,
  `cupon_code` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `discount` int(5) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cupon`
--

INSERT INTO `cupon` (`cupon_id`, `cupon_code`, `description`, `discount`, `status`) VALUES
(1, 'fruitsbazar', 'It\'s a discount coupon.', 10, 1),
(2, 'eid2021', 'Eid discount', 15, 1),
(3, 'eid2021', 'Eid discount', 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_feedback`
--

CREATE TABLE `customer_feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `pdt_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_feedback`
--

INSERT INTO `customer_feedback` (`id`, `user_id`, `user_name`, `pdt_id`, `comment`, `comment_date`) VALUES
(1, 1, 'saiful', 4, 'This product is very good', '2021-09-11'),
(4, 5, 'karim', 6, 'Good product', '2021-09-15');

-- --------------------------------------------------------

--
-- Table structure for table `header_info`
--

CREATE TABLE `header_info` (
  `id` int(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tweeter` varchar(500) NOT NULL,
  `fb_link` varchar(500) NOT NULL,
  `pinterest` varchar(500) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `header_info`
--

INSERT INTO `header_info` (`id`, `email`, `tweeter`, `fb_link`, `pinterest`, `phone`) VALUES
(10, 'fruitsbazar@gmail.com', 'https://twitter.com/', 'https://facebook.com/', 'https://pinerest.com/', '01982364958');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Price` float DEFAULT NULL,
  `Type` enum('Veg','Non Veg') NOT NULL,
  `Availability` enum('Available','Not Available') NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `Image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Id`, `Name`, `Price`, `Type`, `Availability`, `CategoryID`, `Image`) VALUES
(0, 'vffgff', 1234, 'Veg', 'Available', 1, 'IMG_7275.JPG'),
(1, 'Vegetable Sam', 25, 'Non Veg', 'Available', 1, 'shree.png'),
(2, 'Paneer Tikka', NULL, 'Veg', 'Available', 1, 'shree.png'),
(3, 'Aloo Tikki', NULL, 'Veg', 'Available', 1, NULL),
(4, 'Chicken Seekh Kebabs', NULL, 'Non Veg', 'Available', 1, NULL),
(5, 'Dahi Puri', NULL, 'Veg', 'Available', 1, NULL),
(6, 'Prawn Pakoras', NULL, 'Non Veg', 'Available', 1, NULL),
(7, 'Hara Bhara Kabab', NULL, 'Veg', 'Available', 1, NULL),
(8, 'Onion Bhaji', NULL, 'Veg', 'Available', 1, NULL),
(9, 'Chaat (various types)', NULL, 'Veg', 'Available', 1, NULL),
(10, 'Spring Rolls', NULL, 'Veg', 'Available', 1, NULL),
(11, 'Butter Chicken', NULL, 'Non Veg', 'Available', 2, NULL),
(12, 'Paneer Butter Masala', NULL, 'Veg', 'Available', 2, NULL),
(13, 'Biryani (Chicken)', NULL, 'Non Veg', 'Available', 2, NULL),
(14, 'Dal Makhani', NULL, 'Veg', 'Available', 2, NULL),
(15, 'Chole Bhature', NULL, 'Veg', 'Available', 2, NULL),
(16, 'Rogan Josh', NULL, 'Non Veg', 'Available', 2, NULL),
(17, 'Palak Paneer', NULL, 'Veg', 'Available', 2, NULL),
(18, 'Fish Curry', NULL, 'Non Veg', 'Available', 2, NULL),
(19, 'Pulao (Vegetable)', NULL, 'Veg', 'Available', 2, NULL),
(20, 'Kadai Paneer', NULL, 'Veg', 'Available', 2, NULL),
(21, 'Raita (Cucumber, Boondi)', NULL, 'Veg', 'Available', 3, NULL),
(22, 'Naan (Butter)', NULL, 'Veg', 'Available', 3, NULL),
(23, 'Aloo Gobi', NULL, 'Veg', 'Available', 3, NULL),
(24, 'Mixed Vegetable Curry', NULL, 'Veg', 'Available', 3, NULL),
(25, 'Saag Aloo', NULL, 'Veg', 'Available', 3, NULL),
(26, 'Jeera Rice', NULL, 'Veg', 'Available', 3, NULL),
(27, 'Masala Papad', NULL, 'Veg', 'Available', 3, NULL),
(28, 'Bhindi Masala', NULL, 'Veg', 'Available', 3, NULL),
(29, 'Lauki (Bottle Gourd) Curry', NULL, 'Veg', 'Available', 3, NULL),
(30, 'Kachumber Salad', NULL, 'Veg', 'Available', 3, NULL),
(31, 'Gulab Jamun', NULL, 'Veg', 'Available', 4, NULL),
(32, 'Jalebi', NULL, 'Veg', 'Available', 4, NULL),
(33, 'Rasgulla', NULL, 'Veg', 'Available', 4, NULL),
(34, 'Kheer (Rice Pudding)', NULL, 'Veg', 'Available', 4, NULL),
(35, 'Gajar Halwa (Carrot Halwa)', NULL, 'Veg', 'Available', 4, NULL),
(36, 'Barfi (Coconut, Pistachio)', NULL, 'Veg', 'Available', 4, NULL),
(37, 'Ladoo (Besan, Motichoor)', NULL, 'Veg', 'Available', 4, NULL),
(38, 'Peda', NULL, 'Veg', 'Available', 4, NULL),
(39, 'Sooji Halwa (Semolina Pudding)', NULL, 'Veg', 'Available', 4, NULL),
(40, 'Malpua', NULL, 'Veg', 'Available', 4, NULL),
(41, 'Masala Chai', NULL, 'Veg', 'Available', 5, NULL),
(42, 'Lassi (Sweet)', NULL, 'Veg', 'Available', 5, NULL),
(43, 'Mango Lassi', NULL, 'Veg', 'Available', 5, NULL),
(44, 'Jaljeera', NULL, 'Veg', 'Available', 5, NULL),
(45, 'Coconut Water', NULL, 'Veg', 'Available', 5, NULL),
(46, 'Nimbu Pani (Lemonade)', NULL, 'Veg', 'Available', 5, NULL),
(47, 'Buttermilk', NULL, 'Veg', 'Available', 5, NULL),
(48, 'Thandai', NULL, 'Veg', 'Available', 5, NULL),
(49, 'Chaas (Buttermilk)', NULL, 'Veg', 'Available', 5, NULL),
(50, 'Sweetened Coffee', NULL, 'Veg', 'Available', 5, NULL),
(51, 'ice cream', 33, 'Veg', 'Available', 2, 'ganpati.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `Cust_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `type` enum('Customised','Package') NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `dish_count` int(11) DEFAULT NULL,
  `total_amount` int(11) NOT NULL,
  `staff_count` int(11) NOT NULL,
  `status` enum('Pending','Confirmed','Delivered','Cancelled') NOT NULL,
  `service_address` varchar(255) NOT NULL,
  `service_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id`, `Cust_id`, `order_date`, `type`, `package_id`, `dish_count`, `total_amount`, `staff_count`, `status`, `service_address`, `service_date`) VALUES
(0, 1, '2024-10-04', 'Package', 3, 100, 0, 12, 'Pending', 'kjhgfds', '2024-10-30');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `pdt_quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `uses_coupon` varchar(35) NOT NULL,
  `order_status` int(3) NOT NULL,
  `trans_id` varchar(25) NOT NULL,
  `Shipping_mobile` varchar(20) NOT NULL,
  `shiping` varchar(255) NOT NULL,
  `order_time` timestamp NULL DEFAULT current_timestamp(),
  `order_date` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `user_id`, `product_name`, `pdt_quantity`, `amount`, `uses_coupon`, `order_status`, `trans_id`, `Shipping_mobile`, `shiping`, `order_time`, `order_date`) VALUES
(1, 1, ' Apple Gala(1 kg)', 1, 245, '', 2, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-11 09:18:53', '2021-09-13'),
(2, 1, 'Apple Golden Delicious (1kg)', 1, 250, '', 2, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-11 09:18:53', '2021-09-13'),
(3, 1, ' Banana (Shobri) (1 P)', 1, 10, '', 2, 'afasffa', '1246798', ' SubarnaChar, Noakhali ', '2021-09-11 09:22:16', '2021-09-13'),
(4, 1, ' Grapes Red (Kg)', 1, 300, '', 2, 'afasffa', '1246798', ' SubarnaChar, Noakhali ', '2021-09-11 09:22:16', '2021-09-11'),
(5, 1, 'Coconut', 1, 10, '', 2, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-11 09:31:12', '2021-09-13'),
(6, 1, ' Apple Gala(1 kg)', 1, 245, 'fruitsbazar', 2, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-11 10:21:33', '2021-09-11'),
(7, 1, ' Grapes White (Kg)', 1, 250, 'fruitsbazar', 1, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-11 10:21:33', '2021-09-11'),
(8, 1, ' Banana (Shobri) (1 P)', 1, 10, '', 2, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-12 19:34:21', '2021-09-12'),
(9, 1, 'Black Apple', 1, 150, '', 1, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-12 19:34:21', '2021-09-12'),
(10, 2, ' Banana (Shagor Kola) (1 P)', 1, 12, '', 0, '156464631afdasf', '1246798', ' Maijdee, Noakhali ', '2021-09-12 20:52:40', '2021-09-13'),
(11, 2, ' Banana (Shobri) (1 P)', 1, 10, '', 2, '156464631afdasf', '1246798', ' Maijdee, Noakhali ', '2021-09-12 20:52:40', '2021-09-13'),
(12, 2, 'Black Apple', 1, 150, '', 1, '156464631afdasf', '1246798', ' Maijdee, Noakhali ', '2021-09-12 20:52:40', '2020-09-13'),
(13, 5, ' Apple Gala(1 kg)', 1, 245, '', 2, 'avxev125', '1840239402', ' Jatrabari, Dhaka ', '2021-09-14 07:06:53', '2021-09-14'),
(14, 5, '  Apple Golden Delicious (1kg)', 1, 250, '', 0, 'avxev125', '1840239402', ' Jatrabari, Dhaka ', '2021-09-14 07:06:53', '2021-09-14'),
(15, 5, ' Apple Fuji(1 Kg)', 1, 208, '', 0, 'avxev125', '1840239402', ' Jatrabari, Dhaka ', '2021-09-14 08:02:43', '2021-09-14'),
(16, 5, ' Banana (Chini Chompa) (1 P)', 1, 10, '', 0, 'avxev125', '1840239402', ' Jatrabari, Dhaka ', '2021-09-14 08:02:43', '2021-09-14'),
(17, 5, '  Apple Golden Delicious (1kg)', 1, 250, '', 0, 'avxev125', '1840239402', ' Jatrabari, Dhaka ', '2021-09-14 08:02:43', '2021-09-14'),
(18, 5, ' Navel Oranges.', 1, 150, '', 0, '164614618', '1840239402', ' Jatrabari, Dhaka ', '2021-09-15 09:05:37', '2021-09-15'),
(19, 5, ' Grapes Black (Kg)', 1, 250, '', 0, '164614618', '1840239402', ' Jatrabari, Dhaka ', '2021-09-15 09:05:37', '2021-09-15'),
(20, 1, ' Banana (Shagor Kola) (1 P)', 1, 12, '', 0, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-15 10:28:12', '2021-09-15'),
(21, 1, '  Apple Golden Delicious (1kg)', 1, 250, '', 0, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-15 10:28:12', '2021-09-15'),
(22, 1, ' Navel Oranges.', 1, 150, 'fruitsbazar', 0, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-16 09:23:53', '2021-09-16'),
(23, 1, ' Banana (Shobri) (1 P)', 1, 10, 'fruitsbazar', 0, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-16 09:23:53', '2021-09-16'),
(24, 1, 'Black Apple', 1, 150, 'fruitsbazar', 0, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-16 09:23:53', '2021-09-16'),
(25, 1, ' Apple Fuji(1 Kg)', 1, 208, 'fruitsbazar', 0, 'avxev125', '1246798', ' SubarnaChar, Noakhali ', '2021-09-16 09:25:36', '2021-09-16'),
(26, 1, ' Apple Gala(1 kg)', 1, 245, 'fruitsbazar', 1, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-16 09:57:19', '2021-09-16'),
(27, 1, '  Apple Golden Delicious (1kg)', 1, 250, 'fruitsbazar', 0, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-16 09:57:19', '2021-09-16'),
(28, 1, ' Grapes White (Kg)', 1, 250, 'fruitsbazar', 0, 'afasfsaf', '1246798', ' SubarnaChar, Noakhali ', '2021-09-16 09:59:31', '2021-09-16');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` enum('Standard','Premium','Basic','Deluxe') NOT NULL,
  `cuisine` enum('Indian','Chinese','Italian','Mexican','Thai') NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`items`)),
  `availability` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `name`, `category`, `cuisine`, `price`, `description`, `image`, `items`, `availability`) VALUES
(2, 'Gujarati Thali', '', 'Indian', 250.00, 'The best free stock photos, royalty free images & videos shared by creators.\r\n\r\n', 'pexels-lum3n-44775-1410235.jpg', '{\"1\":[\"1\",\"9\"],\"2\":[\"15\",\"19\"],\"3\":[\"22\",\"24\",\"26\",\"27\"],\"4\":[\"32\",\"35\"],\"5\":[\"47\",\"49\"]}', 1),
(3, 'Punjabi Thali', '', 'Chinese', 34.00, 'The best free stock photos, royalty free images & videos shared by creators.\r\n\r\n', 'pexels-valeriya-1199957.jpg', '{\"1\":[\"6\",\"7\"],\"2\":[\"15\",\"18\"],\"3\":[\"27\"],\"4\":[\"37\"],\"5\":[\"45\"]}', 1),
(4, 'Chinese Thali', '', 'Chinese', 23.00, 'The best free stock photos, royalty free images & videos shared by creators.\r\n\r\n', 'pexels-rajesh-tp-749235-1633525.jpg', '{\"1\":[\"6\"],\"5\":[\"43\"]}', 1),
(5, 'Italian Dish', 'Premium', 'Italian', 5000.00, 'The best free stock photos, royalty free images & videos shared by creators.\r\n\r\n', 'pexels-valeriya-842571.jpg', '{\"3\":[\"23\",\"24\",\"25\"],\"4\":[\"37\",\"38\"],\"5\":[\"43\",\"44\",\"45\"]}', 1),
(6, 'Mexican Dish', '', 'Mexican', 5000.00, 'The best free stock photos, royalty free images & videos shared by creators.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'pexels-julieaagaard-2097090.jpg', '{\"4\":[\"32\",\"35\",\"37\",\"39\"],\"5\":[\"44\",\"47\"]}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pdt_id` int(255) NOT NULL,
  `pdt_name` varchar(200) NOT NULL,
  `pdt_price` int(255) NOT NULL,
  `pdt_des` varchar(250) NOT NULL,
  `pdt_ctg` int(200) NOT NULL,
  `pdt_img` varchar(250) NOT NULL,
  `product_stock` int(5) NOT NULL,
  `pdt_status` tinyint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pdt_id`, `pdt_name`, `pdt_price`, `pdt_des`, `pdt_ctg`, `pdt_img`, `product_stock`, `pdt_status`) VALUES
(1, '  Apple Golden Delicious (1kg)', 250, 'Fruits bazar is an online shop for providing fresh fruits in Dhaka city. Here you can get huge collection of local and foreign fruits in your finger tips          ', 1, 'apple1.jpg', 10, 1),
(2, ' Apple Gala(1 kg)', 245, 'fruits bazar is an online shop for providing fresh fruits in Dhaka city. Here you can get huge collection of local and foreign fruits in your finger tips ', 1, '2901459.jpg', 15, 1),
(3, ' Apple Fuji(1 Kg)', 208, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator. ', 1, '2901460.jpg', 10, 1),
(4, ' Banana (Shagor Kola) (1 P)', 12, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator. ', 2, '2901099.jpg', 10, 1),
(5, ' Banana (Shobri) (1 P)', 10, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator. ', 2, '2901100.jpg', 8, 1),
(6, ' Banana (Chini Chompa) (1 P)', 10, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator. ', 2, '2901141.jpg', 12, 1),
(7, ' Grapes Red (Kg)', 300, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator. ', 3, '2901051_19.jpg', 15, 1),
(8, ' Grapes White (Kg)', 250, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator. ', 3, 'graps_white.jpg', 13, 1),
(9, ' Grapes Black (Kg)', 250, 'Tempranillo grapes are often blended with other grape varieties, such as Syrah, Grenache, or Cabernet Sauvignon, to create delicious wines. ', 3, 'black-seedless-grapes-500x500.jpg', 12, 1),
(11, 'Coconut', 10, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 6, 'tijana-drndarski-SJxDhVZR30I-unsplash.jpg', 11, 1),
(12, 'Black Apple', 150, 'Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.', 1, 'Black apple.jpg', 5, 1),
(13, ' Navel Oranges.', 150, ' Navel Orange. Navel oranges are one of the most popular kinds of oranges out there. · 2. Blood Orange. The blood orange stands out from every other type of  ', 4, 'xiaolong-wong-nibgG33H0F8-unsplash.jpg', 15, 1),
(14, ' Cara Cara Oranges', 180, 'The fruit of any citrus tree is considered a hesperidium, a kind of modified berry; it is covered by a rind originated by a rugged thickening of the ovary wall. ', 4, 'mae-mu-U1iYwZ8Dx7k-unsplash.jpg', 15, 1),
(15, ' Valencia Oranges.', 200, 'Sweet orange varieties · Common orange – There are many varieties of common orange and it is widely grown. · Blood or pigmented orange ', 4, 'monika-grabkowska-qSkWlOBHia0-unsplash.jpg', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slider_id` int(11) NOT NULL,
  `first_line` varchar(255) NOT NULL,
  `second_line` varchar(255) NOT NULL,
  `third_line` varchar(255) NOT NULL,
  `btn_left` varchar(25) NOT NULL,
  `btn_right` varchar(25) NOT NULL,
  `slider_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slider_id`, `first_line`, `second_line`, `third_line`, `btn_left`, `btn_right`, `slider_img`) VALUES
(1, 'Pomegranate', 'Fruits 100% Organic', 'A blend of freshly squeezed green apple & fruits', 'Shop now', 'View lookbook', 'green-slide-01.jpg'),
(2, 'Pomegranate', 'Orange 100% Organic', 'A blend of freshly squeezed green apple & fruits', 'Shop now', 'View lookbook', 'green-slide-02.jpg'),
(3, 'Pomegranate', 'Banana 100% Organic', 'A blend of freshly squeezed green apple & fruits', 'Shop now', 'View lookbook', 'green-slide-01.jpg'),
(4, 'Pomegranate', 'Apple 100% Organic', 'A blend of freshly squeezed green apple & fruits', 'Shop now', 'View lookbook', 'green-slide-02.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `Id` int(11) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `address` varchar(256) NOT NULL,
  `city` varchar(25) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `contactno` varchar(15) NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `designation` enum('Chef','Event Coordinator','Waitstaff') NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Id`, `fname`, `lname`, `address`, `city`, `gender`, `contactno`, `emailid`, `designation`, `status`) VALUES
(1, 'Jackson', 'Sparrow', 'Surat', 'Surat', 'Male', '9969996655', 'Jack@gmail.com', 'Chef', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_firstname` varchar(60) NOT NULL,
  `user_lastname` varchar(60) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_mobile` int(11) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_roles` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_firstname`, `user_lastname`, `user_email`, `user_password`, `user_mobile`, `user_address`, `user_roles`, `created_at`, `modified_at`) VALUES
(1, 'saiful', ' saiful', ' islam', 'saifulislamsapon@gmail.com', '202cb962ac59075b964b07152d234b70', 1246798, 'SubarnaChar, Noakhali', 5, '2021-08-21 13:38:23', '2021-08-21 13:38:23'),
(2, 'Yearul', ' Yerarul', ' islam', 'yearul@gmail.com', '202cb962ac59075b964b07152d234b70', 1246798, 'Maijdee, Noakhali', 5, '2021-08-21 13:38:23', '2021-08-21 13:38:23'),
(3, 'Omar6627', ' Omar Bin', ' Faruk', 'omarbfaruk@gmail.com', 'ad126b79a449eb003915c3917c8a30e1', 1684734323, 'Feni', 5, '2021-08-21 18:56:24', '2021-08-21 18:56:24'),
(4, 'Omar_6627', ' Omar Bin', ' Faruk', 'omarbinfaruk97@gmail.com', '8d5dcd9520e2712d648297f0f116c284', 1684734323, 'Dhaka', 5, '2021-08-30 11:04:09', '2021-08-30 11:04:09'),
(5, 'karim', ' karim', ' ', 'karim@gmail.com', '202cb962ac59075b964b07152d234b70', 1840239402, 'Jatrabari, Dhaka', 5, '2021-09-14 05:03:25', '2021-09-14 05:03:25'),
(6, 'rahim', ' Rahim', ' ', 'rahim@gmail.com', '202cb962ac59075b964b07152d234b70', 1840239415, 'Mirpur, Dhaka. ', 5, '2021-09-14 07:05:48', '2021-09-14 07:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `postal_code` varchar(8) NOT NULL,
  `city` varchar(25) NOT NULL,
  `country` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_payment`
--

CREATE TABLE `user_payment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `provider` varchar(35) NOT NULL,
  `account_no` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `all_order_info`
--
DROP TABLE IF EXISTS `all_order_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `all_order_info`  AS SELECT `order_details`.`order_id` AS `order_id`, `order_details`.`product_name` AS `product_name`, `order_details`.`pdt_quantity` AS `pdt_quantity`, `order_details`.`amount` AS `amount`, `order_details`.`uses_coupon` AS `uses_coupon`, `users`.`user_firstname` AS `customer_name`, `order_details`.`Shipping_mobile` AS `Shipping_mobile`, `order_details`.`trans_id` AS `trans_id`, `order_details`.`shiping` AS `shiping_address`, `order_details`.`order_status` AS `order_status`, `order_details`.`order_time` AS `order_time`, `order_details`.`order_date` AS `order_date` FROM (`order_details` join `users`) WHERE `users`.`user_id` = `order_details`.`user_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_logo`
--
ALTER TABLE `add_logo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catagory`
--
ALTER TABLE `catagory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cupon`
--
ALTER TABLE `cupon`
  ADD PRIMARY KEY (`cupon_id`);

--
-- Indexes for table `customer_feedback`
--
ALTER TABLE `customer_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `header_info`
--
ALTER TABLE `header_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `category` (`CategoryID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pdt_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
