-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2024 at 05:31 PM
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
-- Table structure for table `admin_detail`
--

CREATE TABLE `admin_detail` (
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
-- Dumping data for table `admin_detail`
--

INSERT INTO `admin_detail` (`user_id`, `user_name`, `user_firstname`, `user_lastname`, `user_email`, `user_password`, `user_mobile`, `user_address`, `user_roles`, `created_at`, `modified_at`) VALUES
(1, 'saiful', ' saiful', ' islam', 'saifulislamsapon@gmail.com', '202cb962ac59075b964b07152d234b70', 1246798, 'SubarnaChar, Noakhali', 5, '2021-08-21 13:38:23', '2021-08-21 13:38:23'),
(2, 'Yearul', ' Yerarul', ' islam', 'yearul@gmail.com', '202cb962ac59075b964b07152d234b70', 1246798, 'Maijdee, Noakhali', 5, '2021-08-21 13:38:23', '2021-08-21 13:38:23'),
(3, 'Omar6627', ' Omar Bin', ' Faruk', 'omarbfaruk@gmail.com', 'ad126b79a449eb003915c3917c8a30e1', 1684734323, 'Feni', 5, '2021-08-21 18:56:24', '2021-08-21 18:56:24'),
(4, 'Omar_6627', ' Omar Bin', ' Faruk', 'omarbinfaruk97@gmail.com', '8d5dcd9520e2712d648297f0f116c284', 1684734323, 'Dhaka', 5, '2021-08-30 11:04:09', '2021-08-30 11:04:09'),
(5, 'karim', ' karim', ' ', 'karim@gmail.com', '202cb962ac59075b964b07152d234b70', 1840239402, 'Jatrabari, Dhaka', 5, '2021-09-14 05:03:25', '2021-09-14 05:03:25'),
(6, 'rahim', ' Rahim', ' ', 'rahim@gmail.com', '202cb962ac59075b964b07152d234b70', 1840239415, 'Mirpur, Dhaka. ', 5, '2021-09-14 07:05:48', '2021-09-14 07:05:48');

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
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_id`, `package_id`) VALUES
(12, 2, 5),
(13, 5, 3),
(14, 5, 2),
(15, 5, 5),
(16, 5, 4),
(17, 2, 2),
(20, 7, 2),
(21, 8, 2);

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
(51, 'ice cream', 33, 'Veg', 'Available', 2, 'ganpati.png'),
(52, 'ice cream', 5, 'Veg', 'Available', 2, 'pexels-lum3n-44775-1410235.jpg'),
(53, 'ice cream', 5, 'Veg', 'Available', 3, 'pngwing.com (7).png'),
(54, 'ice cream', 5, 'Veg', 'Available', 3, 'pngwing.com (7).png');

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
(7, 1, '2024-10-05', 'Package', 3, 1500, 51000, 40, 'Pending', 'kjhgfds', '2024-10-17'),
(8, 1, '2024-10-05', 'Package', 3, 1500, 51000, 40, 'Pending', 'kjhgfds', '2024-10-17'),
(9, 1, '2024-10-05', 'Package', 3, 1500, 0, 0, 'Pending', 'kjhgfds', '2024-10-17'),
(10, 1, '2024-10-01', 'Package', 6, 1500, 7500000, 40, 'Pending', ',khjhj', '2024-10-10'),
(11, 1, '2024-10-04', 'Package', 2, 1000, 250000, 29, 'Pending', 'fff', '2024-10-23'),
(12, 1, '2024-10-09', 'Package', 2, 100, 25000, 20, 'Pending', 'ff', '2024-10-10'),
(13, 1, '2024-10-23', 'Package', 2, 1444, 361000, 40, 'Pending', 'gg', '2024-10-24'),
(14, 1, '2024-10-11', 'Package', 2, 13, 3250, 20, 'Pending', '545', '2024-10-25'),
(15, 1, '2024-10-05', 'Package', 2, 10, 2500, 20, 'Pending', 'cccc', '2024-10-12'),
(16, 2, '2024-10-10', 'Package', 5, 1000, 80000, 29, 'Pending', 'jds', '2024-10-15'),
(17, 2, '2024-10-25', 'Package', 5, 105, 8400, 20, 'Pending', 'ddd', '2024-10-12'),
(18, 5, '2024-10-05', 'Package', 3, 23, 782, 20, 'Pending', 'ffgg', '2024-10-10'),
(19, 2, '2024-10-11', 'Package', 5, 500, 40000, 20, 'Pending', 'ieee', '2024-10-24'),
(20, 7, '2024-10-19', 'Package', 3, 200, 6800, 20, 'Pending', 'tyhhgbg', '2024-10-26'),
(21, 7, '2024-10-03', 'Package', 6, 10, 0, 0, 'Pending', 'fgfg', '2024-10-03'),
(22, 7, '2024-10-26', 'Package', 6, 3000, 15000000, 120, 'Pending', 'jghhg', '2024-10-08'),
(23, 7, '2024-10-26', 'Package', 6, 1800, 9000000, 72, 'Pending', 'jghhg', '2024-10-08'),
(24, 7, '2024-10-26', 'Package', 6, 1800, 9000000, 72, 'Pending', 'jghhg', '2024-10-08'),
(26, 7, '2024-10-30', 'Package', 6, 3000, 15000000, 120, 'Pending', 'lkl', '2024-10-30'),
(27, 7, '2024-10-19', 'Package', 2, 300, 75000, 12, 'Pending', 'surat', '2024-10-20'),
(28, 7, '2024-10-19', 'Package', 2, 300, 75000, 12, 'Pending', 'surat', '2024-10-20'),
(29, 7, '2024-10-19', 'Package', 2, 350, 87500, 14, 'Pending', 'surat varcha', '2024-10-20'),
(30, 7, '2024-10-19', 'Package', 2, 3500, 875000, 140, 'Pending', 'surat varcha', '2024-10-20'),
(31, 8, '2024-10-21', 'Package', 2, 300, 75000, 12, 'Pending', 'ram rajya', '2024-10-24');

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
(5, 'Italian Dish', 'Premium', 'Italian', 80.00, 'The best free stock photos, royalty free images & videos shared by creators.\r\n\r\n', 'pexels-valeriya-842571.jpg', '{\"3\":[\"23\",\"24\",\"25\"],\"4\":[\"37\",\"38\"],\"5\":[\"43\",\"44\",\"45\"]}', 1),
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
(1, 'John', 'Doe', '123 Main St', 'New York', 'Male', '1234567890', 'john.doe@example.com', 'Chef', 1),
(2, 'Jane', 'Smith', '456 Elm St', 'Los Angeles', 'Female', '9876543210', 'jane.smith@example.com', 'Chef', 1),
(3, 'Bob', 'Johnson', '789 Oak St', 'Chicago', 'Male', '5551234567', 'bob.johnson@example.com', 'Chef', 1),
(4, 'Alice', 'Williams', '234 Pine St', 'Miami', 'Female', '8765432109', 'alice.williams@example.com', 'Chef', 1),
(5, 'Mike', 'Davis', '567 Maple St', 'San Francisco', 'Male', '3456789012', 'mike.davis@example.com', 'Chef', 1),
(6, 'Emily', 'Taylor', '890 Cedar St', 'Seattle', 'Female', '5678901234', 'emily.taylor@example.com', 'Chef', 1),
(7, 'David', 'Hall', '1234 Spruce St', 'Denver', 'Male', '8901234567', 'david.hall@example.com', 'Chef', 1),
(8, 'Laura', 'Martin', '4567 Fir St', 'Boston', 'Female', '4567890123', 'laura.martin@example.com', 'Chef', 1),
(9, 'Kevin', 'White', '5678 Cypress St', 'Dallas', 'Male', '9012345678', 'kevin.white@example.com', 'Chef', 1),
(10, 'Rebecca', 'Harris', '9012 Magnolia St', 'Atlanta', 'Female', '2345678901', 'rebecca.harris@example.com', 'Chef', 1),
(11, 'Christopher', 'Walker', '3456 Palm St', 'Houston', 'Male', '5678901234', 'christopher.walker@example.com', 'Chef', 1),
(12, 'Samantha', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Female', '8901234567', 'samantha.taylor@example.com', 'Chef', 1),
(13, 'Olivia', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'olivia.lee@example.com', 'Chef', 1),
(14, 'Benjamin', 'Brown', '2345 Elm St', 'Los Angeles', 'Male', '9876543210', 'benjamin.brown@example.com', 'Chef', 1),
(15, 'Ava', 'Johnson', '5678 Main St', 'New York', 'Female', '5551234567', 'ava.johnson@example.com', 'Chef', 1),
(16, 'Ethan', 'Davis', '9012 Pine St', 'Miami', 'Male', '8765432109', 'ethan.davis@example.com', 'Chef', 1),
(17, 'Lily', 'Williams', '3456 Maple St', 'San Francisco', 'Female', '3456789012', 'lily.williams@example.com', 'Chef', 1),
(18, 'Logan', 'Taylor', '567 Cedar St', 'Seattle', 'Male', '5678901234', 'logan.taylor@example.com', 'Chef', 1),
(19, 'Gabriella', 'Hall', '1234 Spruce St', 'Denver', 'Female', '8901234567', 'gabriella.hall@example.com', 'Chef', 1),
(20, 'Alexander', 'Martin', '4567 Fir St', 'Boston', 'Male', '4567890123', 'alexander.martin@example.com', 'Chef', 1),
(21, 'Julia', 'White', '5678 Cypress St', 'Dallas', 'Female', '9012345678', 'julia.white@example.com', 'Chef', 1),
(22, 'Mason', 'Harris', '9012 Magnolia St', 'Atlanta', 'Male', '2345678901', 'mason.harris@example.com', 'Chef', 1),
(23, 'Abigail', 'Walker', '3456 Palm St', 'Houston', 'Female', '5678901234', 'abigail.walker@example.com', 'Chef', 1),
(24, 'Jackson', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Male', '8901234567', 'jackson.taylor@example.com', 'Chef', 1),
(25, 'Isabella', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'isabella.lee@example.com', 'Chef', 1),
(26, 'Noah', 'Brown', '2345 Elm St', 'Los Angeles', 'Male', '9876543210', 'noah.brown@example.com', 'Chef', 1),
(27, 'Sophia', 'Johnson', '5678 Main St', 'New York', 'Female', '5551234567', 'sophia.johnson@example.com', 'Chef', 1),
(28, 'Elijah', 'Davis', '9012 Pine St', 'Miami', 'Male', '8765432109', 'elijah.davis@example.com', 'Chef', 1),
(29, 'Mia', 'Williams', '3456 Maple St', 'San Francisco', 'Female', '3456789012', 'mia.williams@example.com', 'Chef', 1),
(30, 'William', 'Taylor', '567 Cedar St', 'Seattle', 'Male', '5678901234', 'william.taylor@example.com', 'Chef', 1),
(31, 'Charlotte', 'Hall', '1234 Spruce St', 'Denver', 'Female', '8901234567', 'charlotte.hall@example.com', 'Chef', 1),
(32, 'James', 'Martin', '4567 Fir St', 'Boston', 'Male', '4567890123', 'james.martin@example.com', 'Chef', 1),
(33, 'Amelia', 'White', '5678 Cypress St', 'Dallas', 'Female', '9012345678', 'amelia.white@example.com', 'Chef', 1),
(34, 'Benjamin', 'Harris', '9012 Magnolia St', 'Atlanta', 'Male', '2345678901', 'benjamin.harris@example.com', 'Chef', 1),
(35, 'Harper', 'Walker', '3456 Palm St', 'Houston', 'Female', '5678901234', 'harper.walker@example.com', 'Chef', 1),
(36, 'Lucas', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Male', '8901234567', 'lucas.taylor@example.com', 'Chef', 1),
(37, 'Evelyn', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'evelyn.lee@example.com', 'Chef', 1),
(38, 'Mason', 'Brown', '2345 Elm St', 'Los Angeles', 'Male', '9876543210', 'mason.brown@example.com', 'Chef', 1),
(39, 'Abigail', 'Johnson', '5678 Main St', 'New York', 'Female', '5551234567', 'abigail.johnson@example.com', 'Chef', 1),
(40, 'Logan', 'Davis', '9012 Pine St', 'Miami', 'Male', '8765432109', 'logan.davis@example.com', 'Chef', 1),
(41, 'Emily', 'Williams', '3456 Maple St', 'San Francisco', 'Female', '3456789012', 'emily.williams@example.com', 'Chef', 1),
(42, 'Alexander', 'Taylor', '567 Cedar St', 'Seattle', 'Male', '5678901234', 'alexander.taylor@example.com', 'Chef', 1),
(43, 'Ava', 'Hall', '1234 Spruce St', 'Denver', 'Female', '8901234567', 'ava.hall@example.com', 'Chef', 1),
(44, 'Ethan', 'Martin', '4567 Fir St', 'Boston', 'Male', '4567890123', 'ethan.martin@example.com', 'Chef', 1),
(45, 'Lily', 'White', '5678 Cypress St', 'Dallas', 'Female', '9012345678', 'lily.white@example.com', 'Chef', 1),
(46, 'Julian', 'Harris', '9012 Magnolia St', 'Atlanta', 'Male', '2345678901', 'julian.harris@example.com', 'Chef', 1),
(47, 'Gabriella', 'Walker', '3456 Palm St', 'Houston', 'Female', '5678901234', 'gabriella.walker@example.com', 'Chef', 0),
(48, 'Michael', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Male', '8901234567', 'michael.taylor@example.com', 'Chef', 0),
(49, 'Isabella', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'isabella.lee@example.com', 'Chef', 0),
(50, 'Daniel', 'Brown', '2345 Elm St', 'Los Angeles', 'Male', '9876543210', 'daniel.brown@example.com', 'Chef', 0),
(51, 'Michael', 'Brown', '901 Pine St', 'Miami', 'Male', '2345678901', 'michael.brown@example.com', 'Event Coordinator', 1),
(52, 'Sarah', 'Lee', '234 Cedar St', 'Seattle', 'Female', '5678901234', 'sarah.lee@example.com', 'Event Coordinator', 1),
(53, 'David', 'Hall', '567 Spruce St', 'Denver', 'Male', '8901234567', 'david.hall@example.com', 'Event Coordinator', 1),
(54, 'Emily', 'Martin', '1234 Fir St', 'Boston', 'Female', '4567890123', 'emily.martin@example.com', 'Event Coordinator', 1),
(55, 'Kevin', 'White', '5678 Cypress St', 'Dallas', 'Male', '9012345678', 'kevin.white@example.com', 'Event Coordinator', 1),
(56, 'Rebecca', 'Harris', '9012 Magnolia St', 'Atlanta', 'Female', '2345678901', 'rebecca.harris@example.com', 'Event Coordinator', 1),
(57, 'Christopher', 'Walker', '3456 Palm St', 'Houston', 'Male', '5678901234', 'christopher.walker@example.com', 'Event Coordinator', 1),
(58, 'Laura', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Female', '8901234567', 'laura.taylor@example.com', 'Event Coordinator', 1),
(59, 'Benjamin', 'Johnson', '5678 Main St', 'New York', 'Male', '5551234567', 'benjamin.johnson@example.com', 'Event Coordinator', 1),
(60, 'Ava', 'Williams', '3456 Maple St', 'San Francisco', 'Female', '3456789012', 'ava.williams@example.com', 'Event Coordinator', 1),
(61, 'Ethan', 'Davis', '9012 Pine St', 'Miami', 'Male', '8765432109', 'ethan.davis@example.com', 'Event Coordinator', 1),
(62, 'Lily', 'Brown', '2345 Elm St', 'Los Angeles', 'Female', '9876543210', 'lily.brown@example.com', 'Event Coordinator', 1),
(63, 'Logan', 'Taylor', '567 Cedar St', 'Seattle', 'Male', '5678901234', 'logan.taylor@example.com', 'Event Coordinator', 1),
(64, 'Gabriella', 'Hall', '1234 Spruce St', 'Denver', 'Female', '8901234567', 'gabriella.hall@example.com', 'Event Coordinator', 1),
(65, 'Alexander', 'Martin', '4567 Fir St', 'Boston', 'Male', '4567890123', 'alexander.martin@example.com', 'Event Coordinator', 1),
(66, 'Julia', 'White', '5678 Cypress St', 'Dallas', 'Female', '9012345678', 'julia.white@example.com', 'Event Coordinator', 1),
(67, 'Mason', 'Harris', '9012 Magnolia St', 'Atlanta', 'Male', '2345678901', 'mason.harris@example.com', 'Event Coordinator', 1),
(68, 'Abigail', 'Walker', '3456 Palm St', 'Houston', 'Female', '5678901234', 'abigail.walker@example.com', 'Event Coordinator', 1),
(69, 'Jackson', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Male', '8901234567', 'jackson.taylor@example.com', 'Event Coordinator', 1),
(70, 'Isabella', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'isabella.lee@example.com', 'Event Coordinator', 1),
(71, 'Kevin', 'White', '5678 Cypress St', 'Dallas', 'Male', '9012345678', 'kevin.white@example.com', 'Waitstaff', 1),
(72, 'Rebecca', 'Harris', '9012 Magnolia St', 'Atlanta', 'Female', '2345678901', 'rebecca.harris@example.com', 'Waitstaff', 1),
(73, 'Christopher', 'Walker', '3456 Palm St', 'Houston', 'Male', '5678901234', 'christopher.walker@example.com', 'Waitstaff', 1),
(74, 'Samantha', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Female', '8901234567', 'samantha.taylor@example.com', 'Waitstaff', 1),
(75, 'Olivia', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'olivia.lee@example.com', 'Waitstaff', 1),
(76, 'Benjamin', 'Brown', '2345 Elm St', 'Los Angeles', 'Male', '9876543210', 'benjamin.brown@example.com', 'Waitstaff', 1),
(77, 'Ava', 'Johnson', '5678 Main St', 'New York', 'Female', '5551234567', 'ava.johnson@example.com', 'Waitstaff', 1),
(78, 'Ethan', 'Davis', '9012 Pine St', 'Miami', 'Male', '8765432109', 'ethan.davis@example.com', 'Waitstaff', 1),
(79, 'Lily', 'Williams', '3456 Maple St', 'San Francisco', 'Female', '3456789012', 'lily.williams@example.com', 'Waitstaff', 1),
(80, 'Logan', 'Taylor', '567 Cedar St', 'Seattle', 'Male', '5678901234', 'logan.taylor@example.com', 'Waitstaff', 1),
(81, 'Gabriella', 'Hall', '1234 Spruce St', 'Denver', 'Female', '8901234567', 'gabriella.hall@example.com', 'Waitstaff', 1),
(82, 'Alexander', 'Martin', '4567 Fir St', 'Boston', 'Male', '4567890123', 'alexander.martin@example.com', 'Waitstaff', 1),
(83, 'Julia', 'White', '5678 Cypress St', 'Dallas', 'Female', '9012345678', 'julia.white@example.com', 'Waitstaff', 1),
(84, 'Mason', 'Harris', '9012 Magnolia St', 'Atlanta', 'Male', '2345678901', 'mason.harris@example.com', 'Waitstaff', 1),
(85, 'Abigail', 'Walker', '3456 Palm St', 'Houston', 'Female', '5678901234', 'abigail.walker@example.com', 'Waitstaff', 1),
(86, 'Jackson', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Male', '8901234567', 'jackson.taylor@example.com', 'Waitstaff', 1),
(87, 'Isabella', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'isabella.lee@example.com', 'Waitstaff', 1),
(88, 'Michael', 'Brown', '901 Pine St', 'Miami', 'Male', '2345678901', 'michael.brown@example.com', 'Waitstaff', 1),
(89, 'Sarah', 'Lee', '234 Cedar St', 'Seattle', 'Female', '5678901234', 'sarah.lee@example.com', 'Waitstaff', 1),
(90, 'David', 'Hall', '567 Spruce St', 'Denver', 'Male', '8901234567', 'david.hall@example.com', 'Waitstaff', 1),
(91, 'Emily', 'Martin', '1234 Fir St', 'Boston', 'Female', '4567890123', 'emily.martin@example.com', 'Waitstaff', 1),
(92, 'Kevin', 'White', '5678 Cypress St', 'Dallas', 'Male', '9012345678', 'kevin.white@example.com', 'Waitstaff', 1),
(93, 'Rebecca', 'Harris', '9012 Magnolia St', 'Atlanta', 'Female', '2345678901', 'rebecca.harris@example.com', 'Waitstaff', 1),
(94, 'Christopher', 'Walker', '3456 Palm St', 'Houston', 'Male', '5678901234', 'christopher.walker@example.com', 'Waitstaff', 1),
(95, 'Samantha', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Female', '8901234567', 'samantha.taylor@example.com', 'Waitstaff', 1),
(96, 'Olivia', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'olivia.lee@example.com', 'Waitstaff', 1),
(97, 'Benjamin', 'Brown', '2345 Elm St', 'Los Angeles', 'Male', '9876543210', 'benjamin.brown@example.com', 'Waitstaff', 1),
(98, 'Ava', 'Johnson', '5678 Main St', 'New York', 'Female', '5551234567', 'ava.johnson@example.com', 'Waitstaff', 1),
(99, 'Ethan', 'Davis', '9012 Pine St', 'Miami', 'Male', '8765432109', 'ethan.davis@example.com', 'Waitstaff', 1),
(100, 'Lily', 'Williams', '3456 Maple St', 'San Francisco', 'Female', '3456789012', 'lily.williams@example.com', 'Waitstaff', 1),
(101, 'Logan', 'Taylor', '567 Cedar St', 'Seattle', 'Male', '5678901234', 'logan.taylor@example.com', 'Waitstaff', 1),
(102, 'Gabriella', 'Hall', '1234 Spruce St', 'Denver', 'Female', '8901234567', 'gabriella.hall@example.com', 'Waitstaff', 1),
(103, 'Alexander', 'Martin', '4567 Fir St', 'Boston', 'Male', '4567890123', 'alexander.martin@example.com', 'Waitstaff', 1),
(104, 'Julia', 'White', '5678 Cypress St', 'Dallas', 'Female', '9012345678', 'julia.white@example.com', 'Waitstaff', 1),
(105, 'Mason', 'Harris', '9012 Magnolia St', 'Atlanta', 'Male', '2345678901', 'mason.harris@example.com', 'Waitstaff', 1),
(106, 'Abigail', 'Walker', '3456 Palm St', 'Houston', 'Female', '5678901234', 'abigail.walker@example.com', 'Waitstaff', 1),
(107, 'Jackson', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Male', '8901234567', 'jackson.taylor@example.com', 'Waitstaff', 1),
(108, 'Isabella', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'isabella.lee@example.com', 'Waitstaff', 1),
(109, 'Michael', 'Brown', '901 Pine St', 'Miami', 'Male', '2345678901', 'michael.brown@example.com', 'Waitstaff', 1),
(110, 'Sarah', 'Lee', '234 Cedar St', 'Seattle', 'Female', '5678901234', 'sarah.lee@example.com', 'Waitstaff', 1),
(111, 'David', 'Hall', '567 Spruce St', 'Denver', 'Male', '8901234567', 'david.hall@example.com', 'Waitstaff', 1),
(112, 'Emily', 'Martin', '1234 Fir St', 'Boston', 'Female', '4567890123', 'emily.martin@example.com', 'Waitstaff', 1),
(113, 'Kevin', 'White', '5678 Cypress St', 'Dallas', 'Male', '9012345678', 'kevin.white@example.com', 'Waitstaff', 1),
(114, 'Rebecca', 'Harris', '9012 Magnolia St', 'Atlanta', 'Female', '2345678901', 'rebecca.harris@example.com', 'Waitstaff', 1),
(115, 'Christopher', 'Walker', '3456 Palm St', 'Houston', 'Male', '5678901234', 'christopher.walker@example.com', 'Waitstaff', 1),
(116, 'Samantha', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Female', '8901234567', 'samantha.taylor@example.com', 'Waitstaff', 1),
(117, 'Olivia', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'olivia.lee@example.com', 'Waitstaff', 1),
(118, 'Benjamin', 'Brown', '2345 Elm St', 'Los Angeles', 'Male', '9876543210', 'benjamin.brown@example.com', 'Waitstaff', 1),
(119, 'Ava', 'Johnson', '5678 Main St', 'New York', 'Female', '5551234567', 'ava.johnson@example.com', 'Waitstaff', 1),
(120, 'Ethan', 'Davis', '9012 Pine St', 'Miami', 'Male', '8765432109', 'ethan.davis@example.com', 'Waitstaff', 1),
(121, 'Lily', 'Williams', '3456 Maple St', 'San Francisco', 'Female', '3456789012', 'lily.williams@example.com', 'Waitstaff', 1),
(122, 'Logan', 'Taylor', '567 Cedar St', 'Seattle', 'Male', '5678901234', 'logan.taylor@example.com', 'Waitstaff', 1),
(123, 'Gabriella', 'Hall', '1234 Spruce St', 'Denver', 'Female', '8901234567', 'gabriella.hall@example.com', 'Waitstaff', 1),
(124, 'Alexander', 'Martin', '4567 Fir St', 'Boston', 'Male', '4567890123', 'alexander.martin@example.com', 'Waitstaff', 1),
(125, 'Julia', 'White', '5678 Cypress St', 'Dallas', 'Female', '9012345678', 'julia.white@example.com', 'Waitstaff', 1),
(126, 'Mason', 'Harris', '9012 Magnolia St', 'Atlanta', 'Male', '2345678901', 'mason.harris@example.com', 'Waitstaff', 1),
(127, 'Abigail', 'Walker', '3456 Palm St', 'Houston', 'Female', '5678901234', 'abigail.walker@example.com', 'Waitstaff', 1),
(128, 'Jackson', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Male', '8901234567', 'jackson.taylor@example.com', 'Waitstaff', 1),
(129, 'Isabella', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'isabella.lee@example.com', 'Waitstaff', 1),
(130, 'Michael', 'Brown', '901 Pine St', 'Miami', 'Male', '2345678901', 'michael.brown@example.com', 'Waitstaff', 1),
(131, 'Sarah', 'Lee', '234 Cedar St', 'Seattle', 'Female', '5678901234', 'sarah.lee@example.com', 'Waitstaff', 1),
(132, 'David', 'Hall', '567 Spruce St', 'Denver', 'Male', '8901234567', 'david.hall@example.com', 'Waitstaff', 1),
(133, 'Emily', 'Martin', '1234 Fir St', 'Boston', 'Female', '4567890123', 'emily.martin@example.com', 'Waitstaff', 1),
(134, 'Kevin', 'White', '5678 Cypress St', 'Dallas', 'Male', '9012345678', 'kevin.white@example.com', 'Waitstaff', 1),
(135, 'Rebecca', 'Harris', '9012 Magnolia St', 'Atlanta', 'Female', '2345678901', 'rebecca.harris@example.com', 'Waitstaff', 1),
(136, 'Christopher', 'Walker', '3456 Palm St', 'Houston', 'Male', '5678901234', 'christopher.walker@example.com', 'Waitstaff', 1),
(137, 'Samantha', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Female', '8901234567', 'samantha.taylor@example.com', 'Waitstaff', 1),
(138, 'Olivia', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'olivia.lee@example.com', 'Waitstaff', 1),
(139, 'Benjamin', 'Brown', '2345 Elm St', 'Los Angeles', 'Male', '9876543210', 'benjamin.brown@example.com', 'Waitstaff', 1),
(140, 'Ava', 'Johnson', '5678 Main St', 'New York', 'Female', '5551234567', 'ava.johnson@example.com', 'Waitstaff', 1),
(141, 'Ethan', 'Davis', '9012 Pine St', 'Miami', 'Male', '8765432109', 'ethan.davis@example .com', 'Waitstaff', 1),
(142, 'Lily', 'Williams', '3456 Maple St', 'San Francisco', 'Female', '3456789012', 'lily.williams@example.com', 'Waitstaff', 1),
(143, 'Logan', 'Taylor', '567 Cedar St', 'Seattle', 'Male', '5678901234', 'logan.taylor@example.com', 'Waitstaff', 1),
(144, 'Gabriella', 'Hall', '1234 Spruce St', 'Denver', 'Female', '8901234567', 'gabriella.hall@example.com', 'Waitstaff', 1),
(145, 'Alexander', 'Martin', '4567 Fir St', 'Boston', 'Male', '4567890123', 'alexander.martin@example.com', 'Waitstaff', 1),
(146, 'Julia', 'White', '5678 Cypress St', 'Dallas', 'Female', '9012345678', 'julia.white@example.com', 'Waitstaff', 1),
(147, 'Mason', 'Harris', '9012 Magnolia St', 'Atlanta', 'Male', '2345678901', 'mason.harris@example.com', 'Waitstaff', 1),
(148, 'Abigail', 'Walker', '3456 Palm St', 'Houston', 'Female', '5678901234', 'abigail.walker@example.com', 'Waitstaff', 1),
(149, 'Jackson', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Male', '8901234567', 'jackson.taylor@example.com', 'Waitstaff', 1),
(150, 'Isabella', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'isabella.lee@example.com', 'Waitstaff', 1),
(151, 'Michael', 'Brown', '901 Pine St', 'Miami', 'Male', '2345678901', 'michael.brown@example.com', 'Waitstaff', 1),
(152, 'Sarah', 'Lee', '234 Cedar St', 'Seattle', 'Female', '5678901234', 'sarah.lee@example.com', 'Waitstaff', 1),
(153, 'David', 'Hall', '567 Spruce St', 'Denver', 'Male', '8901234567', 'david.hall@example.com', 'Waitstaff', 1),
(154, 'Emily', 'Martin', '1234 Fir St', 'Boston', 'Female', '4567890123', 'emily.martin@example.com', 'Waitstaff', 1),
(155, 'Kevin', 'White', '5678 Cypress St', 'Dallas', 'Male', '9012345678', 'kevin.white@example.com', 'Waitstaff', 1),
(156, 'Rebecca', 'Harris', '9012 Magnolia St', 'Atlanta', 'Female', '2345678901', 'rebecca.harris@example.com', 'Waitstaff', 1),
(157, 'Christopher', 'Walker', '3456 Palm St', 'Houston', 'Male', '5678901234', 'christopher.walker@example.com', 'Waitstaff', 1),
(158, 'Samantha', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Female', '8901234567', 'samantha.taylor@example.com', 'Waitstaff', 1),
(159, 'Olivia', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'olivia.lee@example.com', 'Waitstaff', 1),
(160, 'Benjamin', 'Brown', '2345 Elm St', 'Los Angeles', 'Male', '9876543210', 'benjamin.brown@example.com', 'Waitstaff', 1),
(161, 'Ava', 'Johnson', '5678 Main St', 'New York', 'Female', '5551234567', 'ava.johnson@example.com', 'Waitstaff', 1),
(162, 'Ethan', 'Davis', '9012 Pine St', 'Miami', 'Male', '8765432109', 'ethan.davis@example.com', 'Waitstaff', 1),
(163, 'Lily', 'Williams', '3456 Maple St', 'San Francisco', 'Female', '3456789012', 'lily.williams@example.com', 'Waitstaff', 1),
(164, 'Logan', 'Taylor', '567 Cedar St', 'Seattle', 'Male', '5678901234', 'logan.taylor@example.com', 'Waitstaff', 1),
(165, 'Gabriella', 'Hall', '1234 Spruce St', 'Denver', 'Female', '8901234567', 'gabriella.hall@example.com', 'Waitstaff', 1),
(166, 'Alexander', 'Martin', '4567 Fir St', 'Boston', 'Male', '4567890123', 'alexander.martin@example.com', 'Waitstaff', 1),
(167, 'Julia', 'White', '5678 Cypress St', 'Dallas', 'Female', '9012345678', 'julia.white@example.com', 'Waitstaff', 1),
(168, 'Mason', 'Harris', '9012 Magnolia St', 'Atlanta', 'Male', '2345678901', 'mason.harris@example.com', 'Waitstaff', 1),
(169, 'Abigail', 'Walker', '3456 Palm St', 'Houston', 'Female', '5678901234', 'abigail.walker@example.com', 'Waitstaff', 1),
(170, 'Jackson', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Male', '8901234567', 'jackson.taylor@example.com', 'Waitstaff', 1),
(171, 'Isabella', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'isabella.lee@example.com', 'Waitstaff', 1),
(172, 'Michael', 'Brown', '901 Pine St', 'Miami', 'Male', '2345678901', 'michael.brown@example.com', 'Waitstaff', 1),
(173, 'Sarah', 'Lee', '234 Cedar St', 'Seattle', 'Female', '5678901234', 'sarah.lee@example.com', 'Waitstaff', 1),
(174, 'David', 'Hall', '567 Spruce St', 'Denver', 'Male', '8901234567', 'david.hall@example.com', 'Waitstaff', 1),
(175, 'Emily', 'Martin', '1234 Fir St', 'Boston', 'Female', '4567890123', 'emily.martin@example.com', 'Waitstaff', 1),
(176, 'Kevin', 'White', '5678 Cypress St', 'Dallas', 'Male', '9012345678', 'kevin.white@example.com', 'Waitstaff', 1),
(177, 'Rebecca', 'Harris', '9012 Magnolia St', 'Atlanta', 'Female', '2345678901', 'rebecca.harris@example.com', 'Waitstaff', 1),
(178, 'Christopher', 'Walker', '3456 Palm St', 'Houston', 'Male', '5678901234', 'christopher.walker@example.com', 'Waitstaff', 1),
(179, 'Samantha', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Female', '8901234567', 'samantha.taylor@example.com', 'Waitstaff', 1),
(180, 'Olivia', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'olivia.lee@example.com', 'Waitstaff', 1),
(181, 'Benjamin', 'Brown', '2345 Elm St', 'Los Angeles', 'Male', '9876543210', 'benjamin.brown@example.com', 'Waitstaff', 1),
(182, 'Ava', 'Johnson', '5678 Main St', 'New York', 'Female', '5551234567', 'ava.johnson@example.com', 'Waitstaff', 1),
(183, 'Ethan', 'Davis', '9012 Pine St', 'Miami', 'Male', '8765432109', 'ethan.davis@example.com', 'Waitstaff', 1),
(184, 'Lily', 'Williams', '3456 Maple St', 'San Francisco', 'Female', '3456789012', 'lily.williams@example.com', 'Waitstaff', 1),
(185, 'Logan', 'Taylor', '567 Cedar St', 'Seattle', 'Male', '5678901234', 'logan.taylor@example.com', 'Waitstaff', 0),
(186, 'Gabriella', 'Hall', '1234 Spruce St', 'Denver', 'Female', '8901234567', 'gabriella.hall@example.com', 'Waitstaff', 0),
(187, 'Alexander', 'Martin', '4567 Fir St', 'Boston', 'Male', '4567890123', 'alexander.martin@example.com', 'Waitstaff', 0),
(188, 'Julia', 'White', '5678 Cypress St', 'Dallas', 'Female', '9012345678', 'julia.white@example.com', 'Waitstaff', 0),
(189, 'Mason', 'Harris', ' 9012 Magnolia St', 'Atlanta', 'Male', '2345678901', 'mason.harris@example.com', 'Waitstaff', 0),
(190, 'Abigail', 'Walker', '3456 Palm St', 'Houston', 'Female', '5678901234', 'abigail.walker@example.com', 'Waitstaff', 0),
(191, 'Jackson', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Male', '8901234567', 'jackson.taylor@example.com', 'Waitstaff', 0),
(192, 'Isabella', 'Lee', '6789 Oak St', 'Chicago', 'Female', '1234567890', 'isabella.lee@example.com', 'Waitstaff', 0),
(193, 'Michael', 'Brown', '901 Pine St', 'Miami', 'Male', '2345678901', 'michael.brown@example.com', 'Waitstaff', 0),
(194, 'Sarah', 'Lee', '234 Cedar St', 'Seattle', 'Female', '5678901234', 'sarah.lee@example.com', 'Waitstaff', 0),
(195, 'David', 'Hall', '567 Spruce St', 'Denver', 'Male', '8901234567', 'david.hall@example.com', 'Waitstaff', 0),
(196, 'Emily', 'Martin', '1234 Fir St', 'Boston', 'Female', '4567890123', 'emily.martin@example.com', 'Waitstaff', 0),
(197, 'Kevin', 'White', '5678 Cypress St', 'Dallas', 'Male', '9012345678', 'kevin.white@example.com', 'Waitstaff', 0),
(198, 'Rebecca', 'Harris', '9012 Magnolia St', 'Atlanta', 'Female', '2345678901', 'rebecca.harris@example.com', 'Waitstaff', 0),
(199, 'Christopher', 'Walker', '3456 Palm St', 'Houston', 'Male', '5678901234', 'christopher.walker@example.com', 'Waitstaff', 0),
(200, 'Samantha', 'Taylor', '12345 Live Oak St', 'Phoenix', 'Female', '8901234567', 'samantha.taylor@example.com', 'Waitstaff', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbltracking`
--

CREATE TABLE `tbltracking` (
  `ID` int(10) NOT NULL,
  `OrderId` varchar(50) DEFAULT NULL,
  `Remark` varchar(200) DEFAULT NULL,
  `Status` varchar(200) DEFAULT NULL,
  `StatusDate` timestamp NULL DEFAULT current_timestamp(),
  `OrderCanclledByUser` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbltracking`
--

INSERT INTO `tbltracking` (`ID`, `OrderId`, `Remark`, `Status`, `StatusDate`, `OrderCanclledByUser`) VALUES
(1, '22', 'Your Order has been Confirmed', 'Confirmed', '2020-05-13 12:47:25', NULL),
(2, '503915948', 'Your Order has been Confirmed', 'Confirmed', '2020-05-13 12:51:51', NULL),
(3, '503915948', 'Delivery Boy is on the way', 'On The Way', '2020-05-13 12:57:40', NULL),
(4, '503915948', 'Your Delicious has been delivered', 'Delivered', '2020-05-13 12:58:34', NULL),
(5, '259618655', NULL, NULL, NULL, NULL),
(6, '259618655', 'Your Order Has been confirmed', 'Confirmed', '2020-05-25 04:18:35', NULL),
(7, '259618655', 'Delivery Boy is on the way', 'On The Way', '2020-05-25 04:20:37', NULL),
(8, '973792755', 'Order confirmed', 'Confirmed', '2020-06-19 14:35:38', NULL),
(9, '140357559', 'fuck you\r\n', 'Cancelled', '2024-10-19 11:07:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `contact`, `password`, `created_at`) VALUES
(5, 'raju', 'rastogi', '22bmiit193@gmail.com', '9727958585', '$2y$10$AX8YwHhiWmvnj5MT5hcZ2.rzuNggjRFat7xFJV4UzCppYddokuCFq', '2024-10-05 13:55:56'),
(7, 'harsh', 'gandhi', 'harrymakvana530@gmail.com', '9696969696', '$2y$10$8hHcjVA4mNBLVyHfDo8IHuS2lR.Nfw6Vw/REtqM47zRSUJd.w.yG2', '2024-10-19 08:21:55'),
(8, 'test', 'user', '1212missionimpossible@gmail.com', '9727958585', '$2y$10$n0nYfgrYcrwJB2YLEWCyzuIvWGkZ1k3PeQtyh/JM4zJ2Rpryc4JiS', '2024-10-21 14:51:28');

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
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `catagory`
--
ALTER TABLE `catagory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
