-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 01, 2019 lúc 03:31 PM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `seasonalfoods`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accountadmin`
--

CREATE TABLE `accountadmin` (
  `id` int(11) NOT NULL,
  `privilege` int(1) NOT NULL DEFAULT '1',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `accountadmin`
--

INSERT INTO `accountadmin` (`id`, `privilege`, `username`, `password`) VALUES
(1, 0, 'admin', '202cb962ac59075b964b07152d234b70'),
(2, 1, 'user', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accountcustomers`
--

CREATE TABLE `accountcustomers` (
  `id_customer` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `accountcustomers`
--

INSERT INTO `accountcustomers` (`id_customer`, `username`, `password`) VALUES
(2, 'trung', '123'),
(6, 'thanhcong', '123'),
(7, 'hue', '123'),
(8, 'nguyen', '123'),
(9, 'chau', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id_bills` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id_bills`, `id_customer`, `status`, `create_at`, `total`) VALUES
(1, 1, 0, '2019-06-18 01:34:15', 300000),
(2, 1, 0, '2019-06-18 01:34:15', 200000),
(3, 2, 0, '2019-06-18 01:34:15', 400000),
(6, 2, 0, '2019-11-19 09:13:08', 450000),
(7, 2, 0, '2019-11-19 09:20:51', 450000),
(9, 2, 0, '2019-11-19 09:25:53', 354000),
(10, 2, 0, '2019-11-19 09:53:30', 230000),
(11, 7, 0, '2019-11-19 15:59:51', 1140000),
(12, 2, 0, '2019-11-22 05:38:19', 1504000),
(13, 9, 0, '2019-11-25 03:30:25', 651000),
(14, 2, 0, '2019-12-01 02:25:19', 920000),
(15, 2, 0, '2019-12-01 02:33:35', 920000),
(16, 2, 0, '2019-12-01 02:36:42', 920000),
(17, 2, 0, '2019-12-01 02:37:25', 0),
(18, 2, 0, '2019-12-01 02:37:33', 0),
(19, 2, 0, '2019-12-01 02:37:53', 134000),
(20, 2, 0, '2019-12-01 02:38:58', 690000),
(21, 2, 0, '2019-12-01 03:04:54', 107200);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brand`
--

CREATE TABLE `brand` (
  `id_brands` int(11) NOT NULL,
  `brandName` varchar(50) NOT NULL,
  `brandImage` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `brand`
--

INSERT INTO `brand` (`id_brands`, `brandName`, `brandImage`) VALUES
(1, 'Vũng Tàu', ''),
(2, 'Hà Nội', ''),
(3, 'Cà Mau', ''),
(4, 'An Giang', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL,
  `cusName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phonenumber` varchar(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `ward` int(4) NOT NULL DEFAULT '0',
  `district` int(4) NOT NULL DEFAULT '0',
  `city` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id_customer`, `cusName`, `email`, `phonenumber`, `address`, `ward`, `district`, `city`) VALUES
(1, 'Nguyễn Văn Tới', 'toi@gmail.com', '09883434', 'Lê Trọng Tấn', 328, 79, 4),
(2, 'Lê Văn Trung', 'trung@gmail.com', '0976456445', '35 Nguyễn Huệ                                    ', 15390, 13, 4),
(6, '', 'thanhcong@gmail.com', '0906192326', '', 0, 0, 0),
(7, 'Nguyễn Thị Huệ', 'hue@gmail.com', '0906192326', '35 Nguyễn Huệ', 1599, 236, 17),
(8, '', 'thanhcong@gmail.com', '09348388', '', 0, 0, 0),
(9, 'Đoàn Thị Quý Châu', 'chau@gmail.com', '0906192326', '35 Nguyễn Huệ', 15595, 135, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detailbills`
--

CREATE TABLE `detailbills` (
  `id_bill` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantumDiscount` int(2) NOT NULL DEFAULT '0',
  `quantum` int(11) NOT NULL,
  `money` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `detailbills`
--

INSERT INTO `detailbills` (`id_bill`, `id_product`, `price`, `quantumDiscount`, `quantum`, `money`) VALUES
(1, 6, 100000, 0, 2, 200000),
(1, 11, 200000, 0, 2, 400000),
(1, 12, 120000, 0, 1, 120000),
(2, 17, 210000, 0, 2, 420000),
(3, 16, 200000, 0, 2, 400000),
(3, 17, 34000, 0, 1, 34000),
(7, 6, 220000, 0, 1, 220000),
(7, 31, 230000, 0, 1, 230000),
(9, 6, 220000, 0, 1, 220000),
(9, 11, 134000, 0, 1, 134000),
(10, 12, 230000, 0, 1, 230000),
(11, 6, 220000, 0, 1, 220000),
(11, 10, 230000, 0, 1, 230000),
(11, 12, 230000, 0, 3, 690000),
(12, 6, 220000, 0, 1, 220000),
(12, 10, 230000, 0, 5, 1150000),
(12, 11, 134000, 0, 1, 134000),
(13, 6, 220000, 0, 1, 220000),
(13, 32, 431000, 0, 1, 431000),
(14, 10, 230000, 0, 4, 920000),
(15, 10, 230000, 0, 2, 460000),
(15, 31, 230000, 0, 2, 460000),
(16, 10, 230000, 0, 2, 460000),
(16, 31, 230000, 0, 2, 460000),
(19, 40, 134000, 0, 1, 134000),
(20, 31, 230000, 0, 3, 690000),
(21, 11, 134000, 20, 1, 107200);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discountcode`
--

CREATE TABLE `discountcode` (
  `id_discountcode` int(11) NOT NULL,
  `discountName` varchar(50) NOT NULL,
  `quantumDiscount` float NOT NULL,
  `dateFrom` date NOT NULL,
  `dateTo` date NOT NULL,
  `hiddencode` int(1) NOT NULL DEFAULT '0',
  `discount_create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discount_update_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `discountcode`
--

INSERT INTO `discountcode` (`id_discountcode`, `discountName`, `quantumDiscount`, `dateFrom`, `dateTo`, `hiddencode`, `discount_create_at`, `discount_update_at`) VALUES
(1, 'test1', 10, '2019-06-26', '2019-06-29', 0, '2019-06-26 08:02:17', '2019-06-28 11:50:03'),
(2, 'test%', 20, '2019-12-01', '2019-12-06', 0, '2019-06-27 09:46:48', '2019-12-01 02:47:02'),
(3, 'test2%', 15, '2019-06-26', '2019-07-04', 0, '2019-06-28 10:36:09', '2019-07-03 02:26:17');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `discountcodeapply`
-- (See below for the actual view)
--
CREATE TABLE `discountcodeapply` (
`id_discountcode` int(11)
,`discountName` varchar(50)
,`quantumDiscount` float
,`dateFrom` date
,`dateTo` date
,`hiddencode` int(1)
,`discount_create_at` timestamp
,`discount_update_at` timestamp
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discountcodedetail`
--

CREATE TABLE `discountcodedetail` (
  `id_code` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `discountcodedetail`
--

INSERT INTO `discountcodedetail` (`id_code`, `id_product`) VALUES
(1, 6),
(2, 10),
(2, 11),
(2, 20),
(2, 33),
(3, 31);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `portfolio`
--

CREATE TABLE `portfolio` (
  `id_portfolio` int(11) NOT NULL,
  `porName` varchar(50) NOT NULL,
  `porImage` varchar(100) NOT NULL,
  `por_create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `portfolio`
--

INSERT INTO `portfolio` (`id_portfolio`, `porName`, `porImage`, `por_create_at`) VALUES
(1, 'Trái Cây', '5.png', '2019-11-09 04:14:26'),
(2, 'Rau Củ', '4.png', '2019-11-09 04:15:50'),
(3, 'thảo dược thiên nhiên', 'cherry.png', '2019-11-09 04:15:24'),
(4, 'hải sản', 'tomsu_03.png', '2019-11-09 04:14:56'),
(5, 'sản phẩm khác', 'logo-web.png', '2019-11-08 09:44:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_por` int(11) NOT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `price` float NOT NULL,
  `rrp` float NOT NULL DEFAULT '0',
  `quantityProduct` int(11) NOT NULL,
  `name` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `description1` text NOT NULL,
  `description` text NOT NULL,
  `hidden` int(1) NOT NULL DEFAULT '0',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `id_unit`, `id_por`, `id_brand`, `price`, `rrp`, `quantityProduct`, `name`, `image`, `description1`, `description`, `hidden`, `create_at`, `update_at`) VALUES
(6, 1, 2, 4, 220000, 0, 96, 'Cua Thịt', '6.png', '', '<p>L&agrave; Một loại tr&aacute;i c&acirc;y được nhiều người tin d&ugrave;ng, sản phẩm đảm bảo an to&agrave;n</p>\n', 0, '2019-06-17 14:51:00', '2019-12-01 02:32:19'),
(10, 1, 1, 1, 230000, 0, 105, 'cherry', 'cherry.png', '', 'Là Một loại trái cây được nhiều người tin dùng, sản phẩm đảm bảo an toàn', 0, '2019-06-20 10:52:44', '2019-12-01 02:36:42'),
(11, 3, 1, 3, 134000, 0, 98, 'Lựu', '3.png', '', 'Là Một loại trái cây được nhiều người tin dùng, sản phẩm đảm bảo an toàn', 0, '2019-06-20 11:08:47', '2019-12-01 03:04:54'),
(12, 2, 1, 4, 230000, 0, 100, 'Nước Ép Dâu', '1.png', '', 'Là Một loại trái cây được nhiều người tin dùng, sản phẩm đảm bảo an toàn', 0, '2019-06-20 17:01:16', '2019-12-01 01:40:47'),
(16, 3, 1, 2, 120000, 0, 100, 'Xoài Thái', '2.png', '', '<p>L&agrave; Một loại tr&aacute;i c&acirc;y được nhiều người tin d&ugrave;ng, sản phẩm đảm bảo an to&agrave;n</p>\n', 0, '2019-06-20 17:13:54', '2019-12-01 01:39:29'),
(17, 1, 1, 3, 220000, 0, 100, 'Dâu Tây', '4.png', '', 'Là Một loại trái cây được nhiều người tin dùng, sản phẩm đảm bảo an toàn', 0, '2019-06-21 06:39:30', '2019-12-01 01:38:45'),
(31, 1, 4, 4, 230000, 0, 95, 'Tôm Sú', 'tomsu_03.png', '', 'Là Một loại trái cây được nhiều người tin dùng, sản phẩm đảm bảo an toàn', 0, '2019-06-23 12:19:46', '2019-12-01 02:50:37'),
(32, 1, 4, 4, 431000, 0, 100, 'Mực', 'muc.png', '', '', 0, '2019-06-23 13:01:24', '2019-12-01 02:50:52'),
(33, 3, 5, 4, 6000, 0, 100, 'Trứng Gà', '7.png', '', '', 1, '2019-11-20 05:34:27', '2019-12-01 02:51:08'),
(42, 1, 5, 1, 2345, 0, 2345, 'Đùi Gà', 'ga_03.png', '', '', 0, '2019-12-01 03:03:40', '2019-12-01 03:03:54');

-- --------------------------------------------------------

--
-- Cấu trúc đóng vai cho view `productstotal`
-- (See below for the actual view)
--
CREATE TABLE `productstotal` (
`id_product` int(11)
,`quantumTotal` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `unit`
--

CREATE TABLE `unit` (
  `id_units` int(11) NOT NULL,
  `unitName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `unit`
--

INSERT INTO `unit` (`id_units`, `unitName`) VALUES
(1, 'Kg'),
(2, 'Lít'),
(3, 'Quả');

-- --------------------------------------------------------

--
-- Cấu trúc cho view `discountcodeapply`
--
DROP TABLE IF EXISTS `discountcodeapply`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `discountcodeapply`  AS  select `discountcode`.`id_discountcode` AS `id_discountcode`,`discountcode`.`discountName` AS `discountName`,`discountcode`.`quantumDiscount` AS `quantumDiscount`,`discountcode`.`dateFrom` AS `dateFrom`,`discountcode`.`dateTo` AS `dateTo`,`discountcode`.`hiddencode` AS `hiddencode`,`discountcode`.`discount_create_at` AS `discount_create_at`,`discountcode`.`discount_update_at` AS `discount_update_at` from `discountcode` where ((curdate() >= `discountcode`.`dateFrom`) and (curdate() <= `discountcode`.`dateTo`) and (`discountcode`.`hiddencode` = 0)) ;

-- --------------------------------------------------------

--
-- Cấu trúc cho view `productstotal`
--
DROP TABLE IF EXISTS `productstotal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productstotal`  AS  select `detailbills`.`id_product` AS `id_product`,sum(`detailbills`.`quantum`) AS `quantumTotal` from `detailbills` group by `detailbills`.`id_product` ;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accountadmin`
--
ALTER TABLE `accountadmin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id_bills`);

--
-- Chỉ mục cho bảng `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brands`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Chỉ mục cho bảng `detailbills`
--
ALTER TABLE `detailbills`
  ADD PRIMARY KEY (`id_bill`,`id_product`);

--
-- Chỉ mục cho bảng `discountcode`
--
ALTER TABLE `discountcode`
  ADD PRIMARY KEY (`id_discountcode`);

--
-- Chỉ mục cho bảng `discountcodedetail`
--
ALTER TABLE `discountcodedetail`
  ADD PRIMARY KEY (`id_code`,`id_product`);

--
-- Chỉ mục cho bảng `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`id_portfolio`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id_units`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accountadmin`
--
ALTER TABLE `accountadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id_bills` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `brand`
--
ALTER TABLE `brand`
  MODIFY `id_brands` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `discountcode`
--
ALTER TABLE `discountcode`
  MODIFY `id_discountcode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `portfolio`
--
ALTER TABLE `portfolio`
  MODIFY `id_portfolio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `unit`
--
ALTER TABLE `unit`
  MODIFY `id_units` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
