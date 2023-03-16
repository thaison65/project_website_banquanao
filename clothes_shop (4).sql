-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th3 16, 2023 lúc 06:40 AM
-- Phiên bản máy phục vụ: 8.0.31
-- Phiên bản PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `clothes_shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE IF NOT EXISTS `cart_items` (
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `quantity` bigint DEFAULT NULL,
  `size_product` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`product_id`,`user_id`),
  KEY `FK709eickf3kc0dujx3ub9i7btf` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart_items`
--

INSERT INTO `cart_items` (`product_id`, `user_id`, `quantity`, `size_product`) VALUES
(2, 1, 2, 'S'),
(4, 1, 2, 'S'),
(1, 2, 1, 'M'),
(4, 2, 1, 'S'),
(11, 2, 1, 'S'),
(2, 2, 1, 'S'),
(5, 1, 1, 'S'),
(5, 2, 1, 'S');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Áo Thun'),
(2, 'Áo Sơ Mi'),
(3, 'Áo Khoác'),
(4, 'Áo Hoodie');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` datetime DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `total_price`, `user_id`) VALUES
(1, '2022-12-01 00:00:00', 100, 1),
(2, '2022-12-02 00:00:00', 80, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` bigint DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `description` text COLLATE utf8mb4_general_ci,
  `image_url` longtext COLLATE utf8mb4_general_ci,
  `price` double DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `description`, `image_url`, `price`, `product_name`, `category_id`) VALUES
(1, 'Áo Thun Tay Ngắn Nam In Họa Tiết Form Fitted - 10F22TSS014 với thiết kế tay ngắn, cổ tròn kết hợp có phía trước ngực, form ôm vừa vặn vào body và chất liệu 100% cotton thoáng mát và thấm hút mồ hôi tốt. Điểm đặc biệt sản phẩm là phần họa tiết chữ trước ngực được in rất tỉ mỉ và sắc giúp chiếc áo trở nên ấn tượng, trẻ trung và hiện đại hơn.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/a/o/ao-thun-nam-10f22tss014_rosin_1_main.jpg', 429, 'Áo Thun Tay Ngắn Nam In Họa Tiết Form Fitted - 10F22TSS014', 1),
(2, 'Áo Sơ Mi Nam Tay Dài Cổ Trụ Phối Rib Form Loose - 10F22SHL032 là một item ấn tượng với chất liệu polyester đứng form, ít nhăn. Đặc biệt, phần cổ trụ phối Rib giúp chiếc áo nổi bật nét trang nhã và tối giản nhưng không mang lại cảm giác tẻ nhạt. Cuối cùng, áo có phần thân và tay áo suông rộng, không ôm sẽ mang đến cảm giác rộng rãi, dễ chịu cho người mặc vào những ngày hè oi bức.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22shl032_white_3_1_1.jpg', 520, 'Áo Sơ Mi Nam Tay Dài Cổ Trụ Phối Rib Form Loose - 10F22SHL032', 2),
(3, 'Áo Polo Len Form Fitted - 10F21POL010 đây là kiểu áo đơn giản, thoải mái nhưng vẫn có chi tiết nhấn nhá tại thiết kế khác màu ở phần trụ và đường kẻ trên vai áo giúp tổng thể bộ outfit trở nên nổi bật, không bị lu mờ. Với chất liệu làm từ len mỏng, đây là sản phẩm thích hợp để diện vào những dịp đi chơi, đi làm mùa thu đông này', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f21pol010-brown_white-1_1.jpg', 480, 'Áo Polo Nam Dệt Kim Phối Màu Form Slim - 10F21POL010', 1),
(5, 'Áo Khoác Jean Nam Form Regular - 10S22DJA001 là item hot không thể thiếu trong tủ đồ của nam giới. Ngoài công dụng mặc đẹp ra thì áo khoác jean còn là item giữ ấm cơ thể khá tốt trong mùa thu đông. Áo được làm với chất liệu Jean - Denim khiến chất vải dày dặn và bền tốt. Với thiết kế form regular phần thân áo suông, rông,chiều dài ngang mông khiến áo ôm vừa vặn vào phần cơ thể mà không gây khó chịu. Đặc biệt, áo với thiết kế màu sắc basic khiến bạn nam dễ dàng mix đồ mà không lo bị lỗi mốt.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10s22dja001_black_5_.jpg', 650, 'Áo Khoác Jean Nam Form Regular - 10S22DJA001', 3),
(6, 'Áo Khoác Nam Cotton Form Regular - 10F22JAC006 là item đa năng, dễ mặc, dễ phối hợp cùng nhiều loại trang phục khác nhau từ án thun, áo cổ cao,... Form áo mang đặc tính rộng rãi, thoải mái, kết hợp cùng chất liệu thoáng mát, thấm hút mồ hôi tốt giúp người mặc luôn cảm thấy dễ chịu. Điểm đặc biệt nhất của chiếc áo khoác này chính là phần họa tiết thuê chữ ở phần thân sau của áo, chúng giúp chiếc áo thêm phần cá tính, thời thượng.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/e/c/ecom.21.10_229__1.jpg', 559.3, 'Áo Khoác Nam Cotton Form Regular - 10F22JAC006', 3),
(7, 'Áo Sơ Mi Tay Dài Form Loose – 10F22SHL030 là dáng áo sơ mi có thân và tay áo suông, rộng nhiều tạo phong thái thoải mái, phóng khoáng cho bạn nam. Điểm thu hút nhất của chiếc áo sơ mi này đó chính hoạ tiết đường kẻ caro lớn được phối màu sắc hài hoà mang đến vẻ đẹp vừa trẻ trung lại bắt kịp xu hướng thời trang hiện nay. Áo sơ mi không chỉ có kiểu dáng trẻ trung, thời trang mà còn được dệt từ 100% sợi bông tự nhiên với tính năng lưu giữ mùi hương và thấm hút mồ hôi ưu việt giúp khách hàng vẫn cảm nhận được sự thơm mát sau ngày dài.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22shl030_moonlight_2__1.jpg', 406, 'Áo Sơ Mi Nam Tay Dài Kẻ Caro Form Loose - 10F22SHL030', 2),
(8, 'Áo Sơ Mi Gập Ly Sau. Regular - 10F21SHL011 là chiếc áo sơ mi được thiết các cách điệu mới lạ dành cho các anh chàng thích sự phá cách và đang theo đuổi phong cách cá tính. Với form áo vừa vặn với người, thân áo và tay áo suông thẳng đứng, điềm đầu vai có hơi rộng so với vai. Nẹp áo được thiết kế che khuy đầy tinh tế, ở phần ngựa được may thêm túi hộp tiện dụng và thanh lịch. Điểm đặc biệt nhất của chiếc áo chính là phần thân sau của áo được thiết kế gập ly đầy độc đáo, mới lạ mang phong cách hiện đại. Là item dễ mặc, dễ phối cùng nhiều loại trang phục khác nhau và phù hợp với nhiều hoàn cảnh từ đi làm, đi chơi hay hẹn hò đều được.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f21shl011_-_black_ink_1_1.jpg', 385, 'Áo Sơ Mi Nam Tay Dài Trơn Gấp Ly Sau Form Regular - 10F21SHL011', 2),
(9, 'Áo Hoodie Tay Dài In Hình. Relax – 10F22HODU002 là một trong những dòng sản phẩm “best-seller” mỗi khi bước sang mùa Thu Đông. Điểm nhấn của thiết kế là phần slogan “Good mood, good day” quen thuộc của Routine ở chính giữa áo đã mang lại phong thái trẻ trung, năng động cho thiết kế cũng như giúp lan toả năng lượng tích cực đến mọi người. Chất liệu polyester sẽ giúp tuổi thọ của áo dài hơn và luôn giữ được form áo ổn định.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22hodu002_black_3__1.jpg', 385, 'Áo Hoodie Unisex Tay Dài In Hình Form Regular - 10F22HODU002', 4),
(10, 'Áo Hoodies Form Regular - 10F21HODA001 với phong cách thiết kế phá cách, mới lạ với form rộng, tay ngắn, có nón giúp cho người mặc tự tin phối nhiều style trang phục khác nhau. Với chất liệu từ 90%NYLON 10%SPANDEX kết hợp với kiểu dáng cổ điển, suông thẳng, vừa vặn vào phần cơ thể mang đến sự nhẹ nhàng, thoáng mát và dễ chịu cho người mặc. Áo hoodie form regular không chỉ đem đến sự thoải mái khi hoạt động mà còn giúp làm ấm, giữ ấm cơ thể.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/s/i/size_web_right_now-cc_-_01-14.jpg', 623, 'Áo Hoodie Thể Thao Tay Ngắn Có Nón Form Regular - 10F21HODA001', 4),
(11, 'Áo Polo Phối Cổ Và Nẹp. Fitted – 10F22POL023 có dáng áo ôm nhẹ vào cơ thể sẽ giúp tôn lên được dáng người rắn chắc của bạn nam. Tuy nhiên, sản phẩm được dệt từ sợi bông tự nhiên nên sẽ đảm bảo mang đến xúc cảm mềm mịn và sự thoải mái, thoáng mát khi mặc. Cuối cùng, chi tiết thiết kế khác màu ở phần cổ và tay áo giúp sản phẩm vừa có được nét thanh lịch, nghiêm túc phù hợp khi diện trong môi trường công sở mà cũng không kém phần trẻ trung, năng động để mặc khi đi chơi, dạo phố cùng bạn bè.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22pol023_black_beauty_2__1.jpg', 480, 'Áo Polo Nam Tay Ngắn Phối Màu Form Fitted - 10F22POL023', 1),
(12, 'Áo Polo Nam Ngắn Tay, Có Túi. Form Oversize - 10S21POL008 với form áo Oversize rộng rãi, thoải mái và dễ dàng cử động, là một chân ái của các chàng trai năng động. Phần cổ áo được thiết kế sâu, có khuy cài có thể đóng mở để điều chỉnh độ rộng của cổ áo. Ngoài ra, ở phần ngực còn được thiết kế thêm hai chiếc túi hộp vô cùng tiện lợi và đầy phong cách. Đây là một chiếc áo đa năng giúp bạn có thể dễ dàng mix cùng nhiều loại trang phục để tạo ra nhiều phong cách khác nhau. Bên cạnh đó, với ưu điểm rộng rãi còn có thể giúp bạn dễ dàng che đi các khuyết điểm về body.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10s21pol008---bright-white-2_1.jpg', 336, 'Áo Polo Nam Có Túi Trơn Form Oversize - 10S21POL008', 1),
(13, 'Áo Polo Nam Phối Màu Cotton Form Fitted - 10S22POL038 thiết kế form áo ôm vào cơ thể theo phong cách lịch lãm, nam tính. Làm từ chất vải Cotton mịn tay, thoáng mát và thấm hút mồ hôi tốt cho người mặc thoải mái hoạt động. Điểm đặc biệt nhất của chiếc áo chính là phần phối màu ở vai và tay áo mang lại cảm giác ấn tượng, mới lạ để tăng sự trẻ trung, năng động cho người mặc.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10s22pol038_rupper_2_.jpg', 240, 'Áo Polo Nam Phối Màu Form Fitted - 10S22POL038', 1),
(14, 'Áo Sơ Mi Flannel Sọc. Regular – 10F22SHL028 có hoạ tiết là những đường kẻ sọc dọc kết hợp với phần tag phía sau cổ áo làm điểm nhấn giúp mẫu thiết kế thu hút ánh nhìn hơn. Form regular với thân áo suông hỗ trợ các bạn nam thuận tiện khi hoạt động. Hơn nữa, chất liệu cotton của sản phẩm luôn được biết đến rộng rãi với những đặc trưng như: thoáng mát và đem lại xúc cảm mềm mại khi mặc.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22shl028_brown_2__1.jpg', 385, 'Áo Sơ Mi Nam Flannel Tay Dài Sọc Dọc Form Regular - 10F22SHL028', 2),
(15, 'Áo Khoác Jean Xếp Ly Regular - 10F22DJA004 là item hot không thể thiếu trong tủ đồ của mọi chàng trai. Ngoài công dụng mặc đẹp ra thì áo khoác jean còn là item giữ ấm cơ thể khá tốt trong mùa thu đông. Áo được làm với chất liệu Jean - Denim khiến chất vải dày dặn và bền tốt. Với thiết kế form regular phần thân áo suông, rông, chiều dài ngang mông khiến áo ôm vừa vặn vào phần cơ thể mà không gây khó chịu. Đặc biệt, áo với thiết kế đa dạng màu sắc khiến bạn nam dễ dàng mix đồ mà không lo bị lỗi mốt.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/a/o/ao-khoac-jean-10f22dja004_dnavy_1__1.jpg', 649, 'Áo Khoác Jean Nam Xếp Ly Trơn Form Regular - 10F22DJA004', 3),
(16, 'Áo Khoác Gió Uniex Phối Màu Form Regular - 10F22WJAU001 được làm từ chất liệu polyester có độ bền và khả năng chống nước tốt sẽ là sản phẩm vô cùng phù hợp với thời tiết lúc nắng lúc mưa bất chợt của Việt Nam. Đồng thời, với form dáng regular sẽ mang đến cảm giác dễ chịu, thoải mái cho người mặc khi hoạt động. Phần thân áo được phối 3 màu giúp thiết kế trở nên nổi bật cũng như đem đến vẻ ngoài thể thao, năng động và trẻ trung cho bạn nam.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22wjau001_real_black_2__1.jpg', 419.3, 'Áo Khoác Gió Unisex Phối Màu Form Regular - 10F22WJAU001', 3),
(17, 'Áo Thun Tay Ngắn Nam In Họa Tiết Form Fitted - 10F22TSS014 với thiết kế tay ngắn, cổ tròn kết hợp có phía trước ngực, form ôm vừa vặn vào body và chất liệu 100% cotton thoáng mát và thấm hút mồ hôi tốt. Điểm đặc biệt sản phẩm là phần họa tiết chữ trước ngực được in rất tỉ mỉ và sắc giúp chiếc áo trở nên ấn tượng, trẻ trung và hiện đại hơn.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/a/o/ao-thun-nam-10f22tss014_rosin_1_main.jpg', 429, 'Áo Thun Tay Ngắn Nam In Họa Tiết Form Fitted - 10F22TSS014', 1),
(18, 'Áo Sơ Mi Nam Tay Dài Cổ Trụ Phối Rib Form Loose - 10F22SHL032 là một item ấn tượng với chất liệu polyester đứng form, ít nhăn. Đặc biệt, phần cổ trụ phối Rib giúp chiếc áo nổi bật nét trang nhã và tối giản nhưng không mang lại cảm giác tẻ nhạt. Cuối cùng, áo có phần thân và tay áo suông rộng, không ôm sẽ mang đến cảm giác rộng rãi, dễ chịu cho người mặc vào những ngày hè oi bức.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22shl032_white_3_1_1.jpg', 520, 'Áo Sơ Mi Nam Tay Dài Cổ Trụ Phối Rib Form Loose - 10F22SHL032', 2),
(19, 'Áo Polo Len Form Fitted - 10F21POL010 đây là kiểu áo đơn giản, thoải mái nhưng vẫn có chi tiết nhấn nhá tại thiết kế khác màu ở phần trụ và đường kẻ trên vai áo giúp tổng thể bộ outfit trở nên nổi bật, không bị lu mờ. Với chất liệu làm từ len mỏng, đây là sản phẩm thích hợp để diện vào những dịp đi chơi, đi làm mùa thu đông này', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f21pol010-brown_white-1_1.jpg', 480, 'Áo Polo Nam Dệt Kim Phối Màu Form Slim - 10F21POL010', 1),
(20, 'Áo Khoác Jean Nam Form Regular - 10S22DJA001 là item hot không thể thiếu trong tủ đồ của nam giới. Ngoài công dụng mặc đẹp ra thì áo khoác jean còn là item giữ ấm cơ thể khá tốt trong mùa thu đông. Áo được làm với chất liệu Jean - Denim khiến chất vải dày dặn và bền tốt. Với thiết kế form regular phần thân áo suông, rông,chiều dài ngang mông khiến áo ôm vừa vặn vào phần cơ thể mà không gây khó chịu. Đặc biệt, áo với thiết kế màu sắc basic khiến bạn nam dễ dàng mix đồ mà không lo bị lỗi mốt.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10s22dja001_black_5_.jpg', 650, 'Áo Khoác Jean Nam Form Regular - 10S22DJA001', 3),
(21, 'Áo Khoác Nam Cotton Form Regular - 10F22JAC006 là item đa năng, dễ mặc, dễ phối hợp cùng nhiều loại trang phục khác nhau từ án thun, áo cổ cao,... Form áo mang đặc tính rộng rãi, thoải mái, kết hợp cùng chất liệu thoáng mát, thấm hút mồ hôi tốt giúp người mặc luôn cảm thấy dễ chịu. Điểm đặc biệt nhất của chiếc áo khoác này chính là phần họa tiết thuê chữ ở phần thân sau của áo, chúng giúp chiếc áo thêm phần cá tính, thời thượng.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/e/c/ecom.21.10_229__1.jpg', 559.3, 'Áo Khoác Nam Cotton Form Regular - 10F22JAC006', 3),
(22, 'Áo Sơ Mi Tay Dài Form Loose – 10F22SHL030 là dáng áo sơ mi có thân và tay áo suông, rộng nhiều tạo phong thái thoải mái, phóng khoáng cho bạn nam. Điểm thu hút nhất của chiếc áo sơ mi này đó chính hoạ tiết đường kẻ caro lớn được phối màu sắc hài hoà mang đến vẻ đẹp vừa trẻ trung lại bắt kịp xu hướng thời trang hiện nay. Áo sơ mi không chỉ có kiểu dáng trẻ trung, thời trang mà còn được dệt từ 100% sợi bông tự nhiên với tính năng lưu giữ mùi hương và thấm hút mồ hôi ưu việt giúp khách hàng vẫn cảm nhận được sự thơm mát sau ngày dài.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22shl030_moonlight_2__1.jpg', 406, 'Áo Sơ Mi Nam Tay Dài Kẻ Caro Form Loose - 10F22SHL030', 2),
(23, 'Áo Sơ Mi Gập Ly Sau. Regular - 10F21SHL011 là chiếc áo sơ mi được thiết các cách điệu mới lạ dành cho các anh chàng thích sự phá cách và đang theo đuổi phong cách cá tính. Với form áo vừa vặn với người, thân áo và tay áo suông thẳng đứng, điềm đầu vai có hơi rộng so với vai. Nẹp áo được thiết kế che khuy đầy tinh tế, ở phần ngựa được may thêm túi hộp tiện dụng và thanh lịch. Điểm đặc biệt nhất của chiếc áo chính là phần thân sau của áo được thiết kế gập ly đầy độc đáo, mới lạ mang phong cách hiện đại. Là item dễ mặc, dễ phối cùng nhiều loại trang phục khác nhau và phù hợp với nhiều hoàn cảnh từ đi làm, đi chơi hay hẹn hò đều được.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f21shl011_-_black_ink_1_1.jpg', 385, 'Áo Sơ Mi Nam Tay Dài Trơn Gấp Ly Sau Form Regular - 10F21SHL011', 2),
(24, 'Áo Hoodie Tay Dài In Hình. Relax – 10F22HODU002 là một trong những dòng sản phẩm “best-seller” mỗi khi bước sang mùa Thu Đông. Điểm nhấn của thiết kế là phần slogan “Good mood, good day” quen thuộc của Routine ở chính giữa áo đã mang lại phong thái trẻ trung, năng động cho thiết kế cũng như giúp lan toả năng lượng tích cực đến mọi người. Chất liệu polyester sẽ giúp tuổi thọ của áo dài hơn và luôn giữ được form áo ổn định.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22hodu002_black_3__1.jpg', 385, 'Áo Hoodie Unisex Tay Dài In Hình Form Regular - 10F22HODU002', 4),
(25, 'Áo Hoodies Form Regular - 10F21HODA001 với phong cách thiết kế phá cách, mới lạ với form rộng, tay ngắn, có nón giúp cho người mặc tự tin phối nhiều style trang phục khác nhau. Với chất liệu từ 90%NYLON 10%SPANDEX kết hợp với kiểu dáng cổ điển, suông thẳng, vừa vặn vào phần cơ thể mang đến sự nhẹ nhàng, thoáng mát và dễ chịu cho người mặc. Áo hoodie form regular không chỉ đem đến sự thoải mái khi hoạt động mà còn giúp làm ấm, giữ ấm cơ thể.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/s/i/size_web_right_now-cc_-_01-14.jpg', 623, 'Áo Hoodie Thể Thao Tay Ngắn Có Nón Form Regular - 10F21HODA001', 4),
(26, 'Áo Polo Phối Cổ Và Nẹp. Fitted – 10F22POL023 có dáng áo ôm nhẹ vào cơ thể sẽ giúp tôn lên được dáng người rắn chắc của bạn nam. Tuy nhiên, sản phẩm được dệt từ sợi bông tự nhiên nên sẽ đảm bảo mang đến xúc cảm mềm mịn và sự thoải mái, thoáng mát khi mặc. Cuối cùng, chi tiết thiết kế khác màu ở phần cổ và tay áo giúp sản phẩm vừa có được nét thanh lịch, nghiêm túc phù hợp khi diện trong môi trường công sở mà cũng không kém phần trẻ trung, năng động để mặc khi đi chơi, dạo phố cùng bạn bè.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22pol023_black_beauty_2__1.jpg', 480, 'Áo Polo Nam Tay Ngắn Phối Màu Form Fitted - 10F22POL023', 1),
(27, 'Áo Polo Nam Ngắn Tay, Có Túi. Form Oversize - 10S21POL008 với form áo Oversize rộng rãi, thoải mái và dễ dàng cử động, là một chân ái của các chàng trai năng động. Phần cổ áo được thiết kế sâu, có khuy cài có thể đóng mở để điều chỉnh độ rộng của cổ áo. Ngoài ra, ở phần ngực còn được thiết kế thêm hai chiếc túi hộp vô cùng tiện lợi và đầy phong cách. Đây là một chiếc áo đa năng giúp bạn có thể dễ dàng mix cùng nhiều loại trang phục để tạo ra nhiều phong cách khác nhau. Bên cạnh đó, với ưu điểm rộng rãi còn có thể giúp bạn dễ dàng che đi các khuyết điểm về body.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10s21pol008---bright-white-2_1.jpg', 336, 'Áo Polo Nam Có Túi Trơn Form Oversize - 10S21POL008', 1),
(28, 'Áo Polo Nam Phối Màu Cotton Form Fitted - 10S22POL038 thiết kế form áo ôm vào cơ thể theo phong cách lịch lãm, nam tính. Làm từ chất vải Cotton mịn tay, thoáng mát và thấm hút mồ hôi tốt cho người mặc thoải mái hoạt động. Điểm đặc biệt nhất của chiếc áo chính là phần phối màu ở vai và tay áo mang lại cảm giác ấn tượng, mới lạ để tăng sự trẻ trung, năng động cho người mặc.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10s22pol038_rupper_2_.jpg', 240, 'Áo Polo Nam Phối Màu Form Fitted - 10S22POL038', 1),
(29, 'Áo Sơ Mi Flannel Sọc. Regular – 10F22SHL028 có hoạ tiết là những đường kẻ sọc dọc kết hợp với phần tag phía sau cổ áo làm điểm nhấn giúp mẫu thiết kế thu hút ánh nhìn hơn. Form regular với thân áo suông hỗ trợ các bạn nam thuận tiện khi hoạt động. Hơn nữa, chất liệu cotton của sản phẩm luôn được biết đến rộng rãi với những đặc trưng như: thoáng mát và đem lại xúc cảm mềm mại khi mặc.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22shl028_brown_2__1.jpg', 385, 'Áo Sơ Mi Nam Flannel Tay Dài Sọc Dọc Form Regular - 10F22SHL028', 2),
(30, 'Áo Khoác Jean Xếp Ly Regular - 10F22DJA004 là item hot không thể thiếu trong tủ đồ của mọi chàng trai. Ngoài công dụng mặc đẹp ra thì áo khoác jean còn là item giữ ấm cơ thể khá tốt trong mùa thu đông. Áo được làm với chất liệu Jean - Denim khiến chất vải dày dặn và bền tốt. Với thiết kế form regular phần thân áo suông, rông, chiều dài ngang mông khiến áo ôm vừa vặn vào phần cơ thể mà không gây khó chịu. Đặc biệt, áo với thiết kế đa dạng màu sắc khiến bạn nam dễ dàng mix đồ mà không lo bị lỗi mốt.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/a/o/ao-khoac-jean-10f22dja004_dnavy_1__1.jpg', 649, 'Áo Khoác Jean Nam Xếp Ly Trơn Form Regular - 10F22DJA004', 3),
(31, 'Áo Khoác Gió Uniex Phối Màu Form Regular - 10F22WJAU001 được làm từ chất liệu polyester có độ bền và khả năng chống nước tốt sẽ là sản phẩm vô cùng phù hợp với thời tiết lúc nắng lúc mưa bất chợt của Việt Nam. Đồng thời, với form dáng regular sẽ mang đến cảm giác dễ chịu, thoải mái cho người mặc khi hoạt động. Phần thân áo được phối 3 màu giúp thiết kế trở nên nổi bật cũng như đem đến vẻ ngoài thể thao, năng động và trẻ trung cho bạn nam.', 'https://routine.vn/media/catalog/product/cache/5de180fdba0e830d350bd2803a0413e8/1/0/10f22wjau001_real_black_2__1.jpg', 419.3, 'Áo Khoác Gió Unisex Phối Màu Form Regular - 10F22WJAU001', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
CREATE TABLE IF NOT EXISTS `product_sizes` (
  `size_id` bigint NOT NULL AUTO_INCREMENT,
  `size_name` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_sizes`
--

INSERT INTO `product_sizes` (`size_id`, `size_name`) VALUES
(1, 'XS'),
(2, 'S'),
(3, 'M'),
(4, 'L'),
(5, 'XL'),
(6, 'M'),
(7, 'L');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_size_junction`
--

DROP TABLE IF EXISTS `product_size_junction`;
CREATE TABLE IF NOT EXISTS `product_size_junction` (
  `product_id` bigint NOT NULL,
  `size_id` bigint NOT NULL,
  PRIMARY KEY (`product_id`,`size_id`),
  KEY `FK64t0qwwcgwm83qxejw5osuuvx` (`size_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_size_junction`
--

INSERT INTO `product_size_junction` (`product_id`, `size_id`) VALUES
(1, 3),
(1, 4),
(2, 3),
(2, 4),
(3, 3),
(3, 4),
(4, 3),
(4, 4),
(5, 3),
(5, 4),
(6, 3),
(6, 4),
(7, 3),
(7, 4),
(8, 3),
(8, 4),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(12, 4),
(13, 3),
(14, 3),
(15, 1),
(15, 2),
(16, 3),
(17, 3),
(18, 4),
(19, 1),
(19, 2),
(20, 3),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(25, 3),
(26, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nb4h0p6txrmfc0xbrd1kglp9t` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'USER'),
(2, 'PM'),
(3, 'ADMIN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `username`, `address`) VALUES
(1, 'htphtpahtpa@gmail.com', 'thanh vi', '$2a$10$lYXuVWG.ULVv6yczSUOoeez/fpQfHprGTfCGVWutTsBVei4IwEny2', 'thanhvi', NULL),
(2, 'htv@gmail.com', 'thanh vi', '$2a$10$FKXTI3ckQZ.bbQPld2ja2e1f/uFfT59S7GibpatG67oQqJfAIoFBO', 'vi1', 'TpHCM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKt7e7djp752sqn6w22i6ocqy6q` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 3),
(2, 3),
(3, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
