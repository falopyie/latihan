-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2026 at 08:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ekspedisi`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `actor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `auditable_type` varchar(255) NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `event` varchar(80) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `actor_id`, `auditable_type`, `auditable_id`, `event`, `summary`, `old_values`, `new_values`, `created_at`, `updated_at`) VALUES
(1, 4, 'App\\Models\\Shipment', 2, 'courier.status_updated', 'Kurir memperbarui shipment EXP20260506VUTLGE ke status Tiba di Cabang Tujuan.', NULL, '{\"status\":\"arrived_at_branch\",\"location\":\"kota bandung\",\"description\":\"paket masuk ke cabang bandung\"}', '2026-05-05 21:00:33', '2026-05-05 21:00:33'),
(2, 4, 'App\\Models\\Shipment', 2, 'courier.status_updated', 'Kurir memperbarui shipment EXP20260506VUTLGE ke status Exception / Hold.', NULL, '{\"status\":\"exception_hold\",\"location\":\"kota bandung\",\"description\":\"paket sampai ke rumah ojan\"}', '2026-05-05 21:09:40', '2026-05-05 21:09:40'),
(3, 4, 'App\\Models\\Shipment', 2, 'courier.status_updated', 'Kurir memperbarui shipment EXP20260506VUTLGE ke status Sedang Diantar.', NULL, '{\"status\":\"out_for_delivery\",\"location\":\"kota bandung\",\"description\":\"paket akan dikirim ke rumah ojan\"}', '2026-05-05 21:11:40', '2026-05-05 21:11:40'),
(4, 4, 'App\\Models\\Shipment', 2, 'courier.status_updated', 'Kurir memperbarui shipment EXP20260506VUTLGE ke status Sampai ke Rumah Penerima.', NULL, '{\"status\":\"delivered\",\"location\":\"kota bandung\",\"description\":\"paket akan dikirim ke rumah ojan\"}', '2026-05-05 21:44:35', '2026-05-05 21:44:35'),
(5, 4, 'App\\Models\\Shipment', 4, 'courier.status_updated', 'Kurir memperbarui shipment EXP20260506FDHWEL ke status Dalam Perjalanan.', NULL, '{\"status\":\"in_transit\",\"location\":\"jakarta\",\"description\":\"wadaadad\"}', '2026-05-06 10:43:38', '2026-05-06 10:43:38'),
(6, 4, 'App\\Models\\Shipment', 4, 'courier.status_updated', 'Kurir memperbarui shipment EXP20260506FDHWEL ke status Sudah Dipickup.', NULL, '{\"status\":\"picked_up\",\"location\":\"jakarta\",\"description\":\"wadaadad\"}', '2026-05-06 10:43:47', '2026-05-06 10:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `city`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Pusat Jakarta', 'Jakarta', 'Jl. Jenderal Sudirman No. 1, Jakarta Pusat', '0210000000', '2026-05-05 18:22:30', '2026-05-06 10:58:26'),
(2, 'Cabang Bandung', 'Bandung', 'Jl. Asia Afrika No. 15, Bandung', '0220000000', '2026-05-05 18:31:31', '2026-05-06 10:58:26'),
(3, 'Cabang Semarang', 'Semarang', 'Jl. Pandanaran No. 88, Semarang', '0240000000', '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(4, 'Cabang Yogyakarta', 'Yogyakarta', 'Jl. Malioboro No. 25, Yogyakarta', '02740000000', '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(5, 'Cabang Surabaya', 'Surabaya', 'Jl. Basuki Rahmat No. 21, Surabaya', '0310000000', '2026-05-06 10:58:26', '2026-05-06 10:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `last_tracking_seen_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `email_verified_at`, `password`, `address`, `city`, `phone`, `photo`, `last_tracking_seen_at`, `created_at`, `updated_at`) VALUES
(1, 'Customer Demo', 'customer@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'Jl. Kemang Raya No. 10', 'Jakarta', '081200000000', NULL, '2026-05-05 21:45:22', '2026-05-05 18:22:30', '2026-05-06 10:58:27'),
(3, 'ojan', 'ojan@gmail.com', NULL, '$2y$12$3koeU1qFeuSFOdvxJVkDAu/fIrOQ/Jts6U1HYApRtnUwQKJZZSx1u', 'Jl Jambudipa Rt 01 Rw 07 Desa Cilebut Timur Kecamatan Sukaraja', 'Bogor', '08882017549', NULL, NULL, '2026-05-05 19:06:35', '2026-05-05 19:06:35'),
(4, 'Fauzan Yudistira', 'fauzan@gmail.com', NULL, '$2y$12$JL6C0ozpi9.I8wD/n2asYOCmKka/kalrzWfiMRESvHOOHxuT14TZS', 'adadadadad', 'awdawddadd', '12121131', NULL, NULL, '2026-05-06 08:03:00', '2026-05-06 08:03:00'),
(5, 'ojan', 'ojan@gmail.cpm', NULL, '$2y$12$TylycWV07SYtO.UTDwbuYeQjWxGGEXkjMnBw4/gvgdW/tzCVwP5Qm', 'dadaqdwadda', 'adad', '1231', NULL, NULL, '2026-05-06 08:12:02', '2026-05-06 10:39:37'),
(6, 'Juandaa', 'fauzanyudistira06@gmail.com', '2026-05-06 10:39:11', '$2y$12$dcxXtnRVeoBCfv5lHE4/Ted3XLKdzk1Bt32KSrR/cIRswj9w8Mp3W', 'adaadadadadadadd', 'dadddadada', '112323', NULL, '2026-05-06 10:44:20', '2026-05-06 10:39:11', '2026-05-06 10:44:20'),
(7, 'Customer Bandung', 'customer.bdg@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'Jl. Dago No. 12', 'Bandung', '081211111111', NULL, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(8, 'Customer Surabaya', 'customer.sby@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'Jl. Darmo No. 18', 'Surabaya', '081322222222', NULL, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_customer_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(80) NOT NULL,
  `receiver_name` varchar(80) NOT NULL,
  `receiver_email` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(20) NOT NULL,
  `city` varchar(120) NOT NULL,
  `address` text NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `customer_id`, `receiver_customer_id`, `label`, `receiver_name`, `receiver_email`, `receiver_phone`, `city`, `address`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'ojan', 'ojan', 'ojan@gmail.com', '08882017549', 'Bogor', 'Jl Jambudipa Rt 01 Rw 07 Desa Cilebut Timur Kecamatan Sukaraja', 0, '2026-05-05 19:06:35', '2026-05-05 19:06:35'),
(2, 4, 5, 'rumah', 'ojan', 'ojan@gmail.cpm', '1231313131', 'dadwaawd', 'dadaqdwadda', 1, '2026-05-06 08:12:02', '2026-05-06 08:12:02'),
(3, 6, 5, 'rumah', 'ojan', 'ojan@gmail.cpm', '1231', 'adad', 'dadaqdwadda', 0, '2026-05-06 10:39:37', '2026-05-06 10:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manifest_shipments`
--

CREATE TABLE `manifest_shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `manifest_id` bigint(20) UNSIGNED NOT NULL,
  `shipment_id` bigint(20) UNSIGNED NOT NULL,
  `loaded_at` timestamp NULL DEFAULT NULL,
  `unloaded_at` timestamp NULL DEFAULT NULL,
  `checkpoint_status` varchar(50) DEFAULT NULL,
  `checkpoint_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000001_create_cache_table', 1),
(2, '0001_01_01_000002_create_jobs_table', 1),
(3, '2026_03_09_033042_create_branches_table', 1),
(4, '2026_03_09_033043_create_customers_table', 1),
(5, '2026_03_09_033043_create_rates_table', 1),
(6, '2026_03_09_033043_create_users_table', 1),
(7, '2026_03_09_033044_create_shipments_table', 1),
(8, '2026_03_09_033044_create_vehicles_table', 1),
(9, '2026_03_09_033045_create_payments_table', 1),
(10, '2026_03_09_033045_create_shipment_items_table', 1),
(11, '2026_03_09_033045_create_shipment_trackings_table', 1),
(12, '2026_03_09_080602_create_sessions_table', 1),
(13, '2026_05_01_071637_add_last_tracking_seen_at_to_customers_table', 1),
(14, '2026_05_01_072835_create_customer_addresses_table', 1),
(15, '2026_05_01_072835_upgrade_payments_for_professional_flow', 1),
(16, '2026_05_06_090000_add_delivery_proof_to_shipment_trackings_table', 2),
(17, '2026_05_06_103000_upgrade_payments_for_midtrans', 3),
(18, '2026_05_06_111500_make_payment_date_nullable_for_midtrans', 4),
(19, '2026_05_06_130000_add_complex_ops_foundation', 5),
(20, '2026_05_07_010000_add_casier_role_to_users_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipment_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `gateway_provider` varchar(50) NOT NULL DEFAULT 'midtrans',
  `gateway_order_id` varchar(100) DEFAULT NULL,
  `gateway_transaction_id` varchar(100) DEFAULT NULL,
  `payment_method` enum('midtrans') NOT NULL DEFAULT 'midtrans',
  `payment_channel` varchar(100) DEFAULT NULL,
  `snap_token` varchar(255) DEFAULT NULL,
  `snap_redirect_url` text DEFAULT NULL,
  `reference_number` varchar(120) DEFAULT NULL,
  `proof_file` varchar(255) DEFAULT NULL,
  `payment_status` enum('pending','paid','failed','expired','refunded') NOT NULL DEFAULT 'pending',
  `midtrans_transaction_status` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `verified_by` bigint(20) UNSIGNED DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `gateway_payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`gateway_payload`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `shipment_id`, `amount`, `gateway_provider`, `gateway_order_id`, `gateway_transaction_id`, `payment_method`, `payment_channel`, `snap_token`, `snap_redirect_url`, `reference_number`, `proof_file`, `payment_status`, `midtrans_transaction_status`, `payment_date`, `paid_at`, `verified_at`, `expired_at`, `verified_by`, `notes`, `gateway_payload`, `created_at`, `updated_at`) VALUES
(2, 2, 120000.00, 'midtrans', 'EXP-EXP20260506VUTLGE-20260506021010', '54e21c01-e143-4265-b4f9-63477bbc85b3', 'midtrans', 'qris', '9e43384e-6b7c-48bc-a682-0c2d3d0b35a4', 'https://app.sandbox.midtrans.com/snap/v4/redirection/9e43384e-6b7c-48bc-a682-0c2d3d0b35a4', NULL, NULL, 'paid', 'settlement', '2026-05-06', '2026-05-05 19:14:09', NULL, '2026-05-06 19:10:10', NULL, 'Checkout via Midtrans', '{\"status_code\":\"200\",\"transaction_id\":\"54e21c01-e143-4265-b4f9-63477bbc85b3\",\"gross_amount\":\"120000.00\",\"currency\":\"IDR\",\"order_id\":\"EXP-EXP20260506VUTLGE-20260506021010\",\"payment_type\":\"qris\",\"signature_key\":\"63b1383f5d070ae3a49cb62cccd7168f3c7335b3fec4938d974cda468807b920d4c120b8ba29a6963c0285bdb480ce7beed61d6102e3f014e7fdda74d8e00a1d\",\"transaction_status\":\"settlement\",\"fraud_status\":\"accept\",\"status_message\":\"Success, transaction is found\",\"merchant_id\":\"M239714737\",\"transaction_type\":\"off-us\",\"issuer\":\"ovo\",\"acquirer\":\"gopay\",\"transaction_time\":\"2026-05-06 09:13:33\",\"settlement_time\":\"2026-05-06 09:14:01\",\"expiry_time\":\"2026-05-06 09:28:33\"}', '2026-05-05 19:10:10', '2026-05-05 19:14:09'),
(3, 3, 50400.00, 'midtrans', 'EXP-EXP20260506YJM8HN-20260506152544', NULL, 'midtrans', NULL, '78dc986d-8fcb-43a3-8baa-c1f9c3180ef5', 'https://app.sandbox.midtrans.com/snap/v4/redirection/78dc986d-8fcb-43a3-8baa-c1f9c3180ef5', NULL, NULL, 'pending', 'pending', NULL, NULL, NULL, '2026-05-07 08:25:44', NULL, 'Checkout via Midtrans', '{\"transaction_details\":{\"order_id\":\"EXP-EXP20260506YJM8HN-20260506152544\",\"gross_amount\":50400},\"customer_details\":{\"first_name\":\"Fauzan Yudistira\",\"email\":\"fauzan@gmail.com\",\"phone\":\"12121131\",\"billing_address\":{\"first_name\":\"Fauzan Yudistira\",\"phone\":\"12121131\",\"address\":\"adadadadad\",\"city\":\"awdawddadd\",\"country_code\":\"IDN\"},\"shipping_address\":{\"first_name\":\"ojan\",\"phone\":\"1231313131\",\"address\":\"dadaqdwadda\",\"city\":\"dadwaawd\",\"country_code\":\"IDN\"}},\"item_details\":[{\"id\":\"shipment-3\",\"price\":50400,\"quantity\":1,\"name\":\"Pengiriman EXP20260506YJM8HN\"}]}', '2026-05-06 08:25:44', '2026-05-06 08:46:58'),
(4, 4, 79200.00, 'midtrans', 'EXP-EXP20260506FDHWEL-20260506174023', '48ae3ec6-3d35-419c-9837-be638439358c', 'midtrans', 'qris', '1c498054-e582-46e9-a51a-368378a6b878', 'https://app.sandbox.midtrans.com/snap/v4/redirection/1c498054-e582-46e9-a51a-368378a6b878', NULL, NULL, 'paid', 'settlement', '2026-05-06', '2026-05-06 10:40:53', NULL, '2026-05-07 10:40:23', NULL, 'Checkout via Midtrans', '{\"status_code\":\"200\",\"transaction_id\":\"48ae3ec6-3d35-419c-9837-be638439358c\",\"gross_amount\":\"79200.00\",\"currency\":\"IDR\",\"order_id\":\"EXP-EXP20260506FDHWEL-20260506174023\",\"payment_type\":\"qris\",\"signature_key\":\"33def040951626fbbe28ab020acbfe1fe2ec42d0d84d04645c567e6962ecdbb70a7de450db9a59ac8a3e139c402fb8ec2a5d9fff26901c2baeb1c262cc7fe590\",\"transaction_status\":\"settlement\",\"fraud_status\":\"accept\",\"status_message\":\"Success, transaction is found\",\"merchant_id\":\"M239714737\",\"transaction_type\":\"off-us\",\"issuer\":\"dana\",\"acquirer\":\"gopay\",\"transaction_time\":\"2026-05-07 00:40:26\",\"settlement_time\":\"2026-05-07 00:40:47\",\"expiry_time\":\"2026-05-07 00:55:25\"}', '2026-05-06 10:40:23', '2026-05-06 10:40:53');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `origin_city` varchar(255) NOT NULL,
  `destination_city` varchar(255) NOT NULL,
  `price_per_kg` decimal(15,2) NOT NULL,
  `estimated_days` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `origin_city`, `destination_city`, `price_per_kg`, `estimated_days`, `created_at`, `updated_at`) VALUES
(1, 'Jakarta', 'Bandung', 12000.00, 2, '2026-05-05 18:31:31', '2026-05-06 10:58:26'),
(2, 'Bandung', 'Jakarta', 12000.00, 2, '2026-05-05 18:31:31', '2026-05-06 10:58:26'),
(3, 'Jakarta', 'Semarang', 14000.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(4, 'Semarang', 'Jakarta', 14000.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(5, 'Jakarta', 'Yogyakarta', 15000.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(6, 'Yogyakarta', 'Jakarta', 15000.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(7, 'Jakarta', 'Surabaya', 18000.00, 3, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(8, 'Surabaya', 'Jakarta', 18000.00, 3, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(9, 'Bandung', 'Semarang', 13000.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(10, 'Semarang', 'Bandung', 13000.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(11, 'Bandung', 'Yogyakarta', 13500.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(12, 'Yogyakarta', 'Bandung', 13500.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(13, 'Bandung', 'Surabaya', 17500.00, 3, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(14, 'Surabaya', 'Bandung', 17500.00, 3, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(15, 'Semarang', 'Yogyakarta', 11000.00, 1, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(16, 'Yogyakarta', 'Semarang', 11000.00, 1, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(17, 'Semarang', 'Surabaya', 14500.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(18, 'Surabaya', 'Semarang', 14500.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(19, 'Yogyakarta', 'Surabaya', 15500.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(20, 'Surabaya', 'Yogyakarta', 15500.00, 2, '2026-05-06 10:58:26', '2026-05-06 10:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('JRkLDPT4yMsFuEi726iGZQ0Dy80lQ86BosR4VpzI', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidlhERG9oc1R2RFRJcFZVNjQxNzh6UmNCem1MMm91T2c4TkN2bjBmSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC92ZWhpY2xlcz9wYWdlPTIiO3M6NToicm91dGUiO3M6MTQ6InZlaGljbGVzLmluZGV4Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1778090696);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tracking_number` varchar(255) NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `origin_branch_id` bigint(20) UNSIGNED NOT NULL,
  `destination_branch_id` bigint(20) UNSIGNED NOT NULL,
  `courier_id` bigint(20) UNSIGNED NOT NULL,
  `rate_id` bigint(20) UNSIGNED NOT NULL,
  `total_weight` decimal(10,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `status` enum('pending','picked_up','in_transit','arrived_at_branch','out_for_delivery','delivered','failed_delivery','exception_hold','returned_to_sender','cancelled') NOT NULL DEFAULT 'pending',
  `exception_code` varchar(50) DEFAULT NULL,
  `exception_notes` text DEFAULT NULL,
  `last_exception_at` timestamp NULL DEFAULT NULL,
  `shipment_date` date NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `tracking_number`, `sender_id`, `receiver_id`, `origin_branch_id`, `destination_branch_id`, `courier_id`, `rate_id`, `total_weight`, `total_price`, `status`, `exception_code`, `exception_notes`, `last_exception_at`, `shipment_date`, `photo`, `created_at`, `updated_at`) VALUES
(2, 'EXP20260506VUTLGE', 1, 3, 1, 2, 4, 1, 10.00, 120000.00, 'delivered', NULL, NULL, '2026-05-05 21:09:40', '2026-05-06', '1778033195_WhatsApp Image 2026-05-05 at 10.02.18 (1).jpeg', '2026-05-05 19:06:35', '2026-05-05 21:44:35'),
(3, 'EXP20260506YJM8HN', 4, 5, 1, 2, 4, 1, 4.20, 50400.00, 'pending', NULL, NULL, NULL, '2026-05-06', NULL, '2026-05-06 08:12:12', '2026-05-06 08:12:12'),
(4, 'EXP20260506FDHWEL', 6, 5, 1, 2, 4, 1, 6.60, 79200.00, 'picked_up', NULL, NULL, NULL, '2026-05-07', NULL, '2026-05-06 10:40:07', '2026-05-06 10:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_items`
--

CREATE TABLE `shipment_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipment_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipment_items`
--

INSERT INTO `shipment_items` (`id`, `shipment_id`, `item_name`, `quantity`, `weight`, `photo`, `created_at`, `updated_at`) VALUES
(2, 2, 'baju baju', 10, 1.00, 'item_0_1778033195_WhatsApp Image 2026-05-05 at 10.02.18.jpeg', '2026-05-05 19:06:35', '2026-05-05 19:06:35'),
(3, 3, 'baju', 1, 3.00, NULL, '2026-05-06 08:12:12', '2026-05-06 08:12:12'),
(4, 3, 'adada', 1, 0.50, NULL, '2026-05-06 08:12:12', '2026-05-06 08:12:12'),
(5, 3, 'adaad', 1, 0.70, NULL, '2026-05-06 08:12:12', '2026-05-06 08:12:12'),
(6, 4, 'baju', 11, 0.60, NULL, '2026-05-06 10:40:07', '2026-05-06 10:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `shipment_manifests`
--

CREATE TABLE `shipment_manifests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `manifest_number` varchar(255) NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `vehicle_id` bigint(20) UNSIGNED DEFAULT NULL,
  `courier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `manifest_type` enum('pickup','linehaul','arrival','delivery') NOT NULL,
  `status` enum('draft','in_progress','closed') NOT NULL DEFAULT 'draft',
  `departed_at` timestamp NULL DEFAULT NULL,
  `arrived_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipment_trackings`
--

CREATE TABLE `shipment_trackings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipment_id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `checkpoint_type` varchar(50) DEFAULT NULL,
  `received_by` varchar(100) DEFAULT NULL,
  `receiver_relation` varchar(50) DEFAULT NULL,
  `proof_photo` varchar(255) DEFAULT NULL,
  `status` enum('picked_up','in_transit','arrived_at_branch','out_for_delivery','delivered','failed_delivery','exception_hold','returned_to_sender') NOT NULL,
  `tracked_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipment_trackings`
--

INSERT INTO `shipment_trackings` (`id`, `shipment_id`, `branch_id`, `location`, `description`, `checkpoint_type`, `received_by`, `receiver_relation`, `proof_photo`, `status`, `tracked_at`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 'jakarta', 'paket keluar dari pengiriman menuju bandung', NULL, NULL, NULL, NULL, 'picked_up', '2026-05-05 20:03:00', '2026-05-05 20:04:39', '2026-05-05 20:04:39'),
(2, 2, NULL, 'puncak cisarua', 'paket sampai di transit cisarua', NULL, NULL, NULL, NULL, 'in_transit', '2026-05-05 20:07:00', '2026-05-05 20:08:24', '2026-05-05 20:08:24'),
(3, 2, NULL, 'kab bandung', 'paket masuk ke dc kab.bandung', NULL, NULL, NULL, NULL, 'in_transit', '2026-05-05 20:20:00', '2026-05-05 20:20:56', '2026-05-05 20:20:56'),
(4, 2, NULL, 'kota bandung', 'paket masuk ke cabang bandung', 'courier_update', NULL, NULL, NULL, 'arrived_at_branch', '2026-05-05 21:00:33', '2026-05-05 21:00:33', '2026-05-05 21:00:33'),
(5, 2, NULL, 'kota bandung', 'paket sampai ke rumah ojan', 'courier_update', NULL, NULL, NULL, 'exception_hold', '2026-05-05 21:09:40', '2026-05-05 21:09:40', '2026-05-05 21:09:40'),
(6, 2, NULL, 'kota bandung', 'paket akan dikirim ke rumah ojan', 'courier_update', NULL, NULL, NULL, 'out_for_delivery', '2026-05-05 21:11:40', '2026-05-05 21:11:40', '2026-05-05 21:11:40'),
(7, 2, NULL, 'kota bandung', 'paket akan dikirim ke rumah ojan', 'courier_update', 'ojan', 'penerima', 'proof_1778042675_WhatsApp Image 2026-05-05 at 10.02.18 (1).jpeg', 'delivered', '2026-05-05 21:44:35', '2026-05-05 21:44:35', '2026-05-05 21:44:35'),
(8, 4, NULL, 'jakarta', 'wadaadad', 'courier_pickup', NULL, NULL, NULL, 'in_transit', '2026-05-06 10:43:38', '2026-05-06 10:43:38', '2026-05-06 10:43:38'),
(9, 4, NULL, 'jakarta', 'wadaadad', 'courier_pickup', NULL, NULL, 'proof_1778089427_whatsapp-image-2026-03-31-at-200134.jpeg', 'picked_up', '2026-05-06 10:43:47', '2026-05-06 10:43:47', '2026-05-06 10:43:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','cashier','casier','courier','manager') NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `branch_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'admin', 1, NULL, '2026-05-05 18:22:30', '2026-05-06 10:58:26'),
(2, 'Manager', 'manager@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'manager', 1, NULL, '2026-05-05 18:22:30', '2026-05-06 10:58:26'),
(3, 'Cashier', 'cashier@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'cashier', 1, NULL, '2026-05-05 18:22:30', '2026-05-06 10:58:26'),
(4, 'Courier', 'courier@ekspedisi.test', NULL, '$2y$12$eO0/EpReAGnHsPeVKVXwt.LxUmyzaUd/OTmznPljcmeV83Io611Jy', 'courier', 1, NULL, '2026-05-05 18:22:30', '2026-05-06 10:52:06'),
(5, 'Courier Bandung', 'courier.bdg@ekspedisi.test', NULL, '$2y$12$eO0/EpReAGnHsPeVKVXwt.LxUmyzaUd/OTmznPljcmeV83Io611Jy', 'courier', 2, NULL, '2026-05-05 18:31:32', '2026-05-06 10:52:06'),
(6, 'Casier', 'casier@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'casier', 1, NULL, '2026-05-06 10:52:06', '2026-05-06 10:58:26'),
(7, 'Courier Pickup Jakarta', 'courier.pickup.jkt@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 1, NULL, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(8, 'Courier HTH Jakarta', 'courier.hth.jkt@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 1, NULL, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(9, 'Courier Drop Jakarta', 'courier.drop.jkt@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 1, NULL, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(10, 'Courier Pickup Bandung', 'courier.pickup.bdg@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 2, NULL, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(11, 'Courier HTH Bandung', 'courier.hth.bdg@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 2, NULL, '2026-05-06 10:58:26', '2026-05-06 10:58:26'),
(12, 'Courier Drop Bandung', 'courier.drop.bdg@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 2, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(13, 'Courier Pickup Semarang', 'courier.pickup.smg@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 3, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(14, 'Courier HTH Semarang', 'courier.hth.smg@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 3, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(15, 'Courier Drop Semarang', 'courier.drop.smg@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 3, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(16, 'Courier Pickup Yogyakarta', 'courier.pickup.yk@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 4, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(17, 'Courier HTH Yogyakarta', 'courier.hth.yk@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 4, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(18, 'Courier Drop Yogyakarta', 'courier.drop.yk@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 4, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(19, 'Courier Pickup Surabaya', 'courier.pickup.sby@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 5, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(20, 'Courier HTH Surabaya', 'courier.hth.sby@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 5, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(21, 'Courier Drop Surabaya', 'courier.drop.sby@ekspedisi.test', NULL, '$2y$12$7xlRIwrwmBUTlp5GyuuQPevuOuv1AIS4s0pGb3S7fiATwCDsKFOqS', 'courier', 5, NULL, '2026-05-06 10:58:27', '2026-05-06 10:58:27');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `type` enum('motor','mobil','truck') NOT NULL,
  `courier_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `plate_number`, `type`, `courier_id`, `created_at`, `updated_at`) VALUES
(1, 'M 0110 R', 'motor', 4, '2026-05-05 19:54:36', '2026-05-05 19:54:36'),
(2, 'B 0102 U', 'motor', 5, '2026-05-05 19:54:56', '2026-05-05 19:54:56'),
(3, 'B 1010 JKT', 'motor', 7, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(4, 'B 2020 JKT', 'truck', 8, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(5, 'B 3030 JKT', 'mobil', 9, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(6, 'D 1010 BDG', 'motor', 10, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(7, 'D 2020 BDG', 'truck', 11, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(8, 'D 3030 BDG', 'mobil', 12, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(9, 'H 4040 SMG', 'truck', 14, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(10, 'AB 5050 YK', 'mobil', 18, '2026-05-06 10:58:27', '2026-05-06 10:58:27'),
(11, 'L 6060 SBY', 'truck', 20, '2026-05-06 10:58:27', '2026-05-06 10:58:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_actor_id_foreign` (`actor_id`),
  ADD KEY `audit_logs_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `customer_addresses_receiver_customer_id_foreign` (`receiver_customer_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manifest_shipments`
--
ALTER TABLE `manifest_shipments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `manifest_shipments_manifest_id_shipment_id_unique` (`manifest_id`,`shipment_id`),
  ADD KEY `manifest_shipments_shipment_id_foreign` (`shipment_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_shipment_id_foreign` (`shipment_id`),
  ADD KEY `payments_verified_by_foreign` (`verified_by`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shipments_tracking_number_unique` (`tracking_number`),
  ADD KEY `shipments_sender_id_foreign` (`sender_id`),
  ADD KEY `shipments_receiver_id_foreign` (`receiver_id`),
  ADD KEY `shipments_origin_branch_id_foreign` (`origin_branch_id`),
  ADD KEY `shipments_destination_branch_id_foreign` (`destination_branch_id`),
  ADD KEY `shipments_courier_id_foreign` (`courier_id`),
  ADD KEY `shipments_rate_id_foreign` (`rate_id`);

--
-- Indexes for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_items_shipment_id_foreign` (`shipment_id`);

--
-- Indexes for table `shipment_manifests`
--
ALTER TABLE `shipment_manifests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `shipment_manifests_manifest_number_unique` (`manifest_number`),
  ADD KEY `shipment_manifests_branch_id_foreign` (`branch_id`),
  ADD KEY `shipment_manifests_vehicle_id_foreign` (`vehicle_id`),
  ADD KEY `shipment_manifests_courier_id_foreign` (`courier_id`);

--
-- Indexes for table `shipment_trackings`
--
ALTER TABLE `shipment_trackings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_trackings_shipment_id_foreign` (`shipment_id`),
  ADD KEY `shipment_trackings_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicles_plate_number_unique` (`plate_number`),
  ADD KEY `vehicles_courier_id_foreign` (`courier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manifest_shipments`
--
ALTER TABLE `manifest_shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shipment_items`
--
ALTER TABLE `shipment_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shipment_manifests`
--
ALTER TABLE `shipment_manifests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipment_trackings`
--
ALTER TABLE `shipment_trackings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_actor_id_foreign` FOREIGN KEY (`actor_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_addresses_receiver_customer_id_foreign` FOREIGN KEY (`receiver_customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `manifest_shipments`
--
ALTER TABLE `manifest_shipments`
  ADD CONSTRAINT `manifest_shipments_manifest_id_foreign` FOREIGN KEY (`manifest_id`) REFERENCES `shipment_manifests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `manifest_shipments_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_verified_by_foreign` FOREIGN KEY (`verified_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_courier_id_foreign` FOREIGN KEY (`courier_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipments_destination_branch_id_foreign` FOREIGN KEY (`destination_branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipments_origin_branch_id_foreign` FOREIGN KEY (`origin_branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipments_rate_id_foreign` FOREIGN KEY (`rate_id`) REFERENCES `rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipments_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipments_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipment_manifests`
--
ALTER TABLE `shipment_manifests`
  ADD CONSTRAINT `shipment_manifests_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipment_manifests_courier_id_foreign` FOREIGN KEY (`courier_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipment_manifests_vehicle_id_foreign` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `shipment_trackings`
--
ALTER TABLE `shipment_trackings`
  ADD CONSTRAINT `shipment_trackings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipment_trackings_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_courier_id_foreign` FOREIGN KEY (`courier_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
