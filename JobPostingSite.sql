-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 14, 2021 at 10:38 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `JobPostingSite`
--

-- --------------------------------------------------------

--
-- Table structure for table `affinitygroup`
--

CREATE TABLE `affinitygroup` (
  `groupid` int(11) NOT NULL,
  `grouptitle` varchar(50) NOT NULL,
  `groupdescription` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `affinitygroup`
--

INSERT INTO `affinitygroup` (`groupid`, `grouptitle`, `groupdescription`) VALUES
(1, 'StudentsEdited', 'A group for students'),
(2, 'Employers', 'Group for employers'),
(4, 'Java', 'Group for java devs');

-- --------------------------------------------------------

--
-- Table structure for table `groupmembers`
--

CREATE TABLE `groupmembers` (
  `groupid` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupmembers`
--

INSERT INTO `groupmembers` (`groupid`, `userid`) VALUES
(1, 1),
(1, 3),
(2, 3),
(4, 1),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `jobapplication`
--

CREATE TABLE `jobapplication` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `jobposting_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobapplication`
--

INSERT INTO `jobapplication` (`id`, `user_id`, `jobposting_id`, `first_name`, `last_name`, `email`, `created_at`, `updated_at`) VALUES
(128, 1, 1, 'Ana', 'Sanchez', 'ana2140448@maricopa.edu', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobapplicationcontactinfo`
--

CREATE TABLE `jobapplicationcontactinfo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jobapplication_id` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobapplicationcontactinfo`
--

INSERT INTO `jobapplicationcontactinfo` (`id`, `jobapplication_id`, `address`, `city`, `state`, `country`, `zip_code`, `phone`, `created_at`, `updated_at`) VALUES
(11, 128, '3837 W Acapulco Ln', 'Phoenix', 'AZ', 'United States', '85053', '16023968163', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobapplicationqualifications`
--

CREATE TABLE `jobapplicationqualifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jobapplication_id` bigint(20) UNSIGNED NOT NULL,
  `education` text COLLATE utf8mb4_unicode_ci,
  `licenseAndCertifications` text COLLATE utf8mb4_unicode_ci,
  `skills` text COLLATE utf8mb4_unicode_ci,
  `experience` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobapplicationqualifications`
--

INSERT INTO `jobapplicationqualifications` (`id`, `jobapplication_id`, `education`, `licenseAndCertifications`, `skills`, `experience`, `created_at`, `updated_at`) VALUES
(9, 128, 'Bachelor\'s Of Science in Software Development', 'Coding certs', 'some', 'my experience', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobpostings`
--

CREATE TABLE `jobpostings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `company` text COLLATE utf8mb4_unicode_ci,
  `location` text COLLATE utf8mb4_unicode_ci,
  `salary` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` text COLLATE utf8mb4_unicode_ci,
  `postedOn` date DEFAULT NULL,
  `qualifications` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobpostings`
--

INSERT INTO `jobpostings` (`id`, `title`, `company`, `location`, `salary`, `description`, `type`, `postedOn`, `qualifications`, `created_at`, `updated_at`) VALUES
(1, 'Software Developer', 'Grand Canyon University', 'Phoeniz, AZ', '$26.00 an hour', 'great opportunity for interns', 'Intern', '2021-03-14', 'Javascript, React, Python, Machine Learning', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_02_08_223616_create_profiles_table', 1),
(4, '2021_02_21_101621_create_portfolios_table', 1),
(5, '2021_02_22_022001_create_jobpostings_table', 1),
(6, '2021_03_14_072248_create_jobapplication_table', 1),
(7, '2021_03_14_073346_create_jobapplicationcontactinfo_table', 1),
(8, '2021_03_14_073737_create_jobapplicationqualifications_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `education` text COLLATE utf8mb4_unicode_ci,
  `licenseAndCertifications` text COLLATE utf8mb4_unicode_ci,
  `skills` text COLLATE utf8mb4_unicode_ci,
  `experience` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `portfolios`
--

INSERT INTO `portfolios` (`id`, `user_id`, `education`, `licenseAndCertifications`, `skills`, `experience`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 'Edit Me!', '2021-03-14 17:57:10', '2021-03-14 17:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `headline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `image`, `headline`, `location`, `about`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Edit Me!', NULL, NULL, '2021-03-14 17:57:10', '2021-03-14 17:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suspended` tinyint(1) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `suspended`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ana Sanchez', 'ana2140448@maricopa.edu', NULL, '$2y$10$yNloV6cKeaWG.WWnINOlc.pxY1inzKleCSqz2/OPHeOnF8f7mjeqS', NULL, 'admin', NULL, '2021-03-14 17:57:10', '2021-03-14 17:57:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affinitygroup`
--
ALTER TABLE `affinitygroup`
  ADD PRIMARY KEY (`groupid`);

--
-- Indexes for table `groupmembers`
--
ALTER TABLE `groupmembers`
  ADD PRIMARY KEY (`groupid`,`userid`);

--
-- Indexes for table `jobapplication`
--
ALTER TABLE `jobapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobapplication_user_id_index` (`user_id`),
  ADD KEY `jobapplication_jobposting_id_index` (`jobposting_id`);

--
-- Indexes for table `jobapplicationcontactinfo`
--
ALTER TABLE `jobapplicationcontactinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobapplicationcontactinfo_jobapplication_id_index` (`jobapplication_id`);

--
-- Indexes for table `jobapplicationqualifications`
--
ALTER TABLE `jobapplicationqualifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobapplicationqualifications_jobapplication_id_index` (`jobapplication_id`);

--
-- Indexes for table `jobpostings`
--
ALTER TABLE `jobpostings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `portfolios_user_id_index` (`user_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affinitygroup`
--
ALTER TABLE `affinitygroup`
  MODIFY `groupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jobapplication`
--
ALTER TABLE `jobapplication`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `jobapplicationcontactinfo`
--
ALTER TABLE `jobapplicationcontactinfo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jobapplicationqualifications`
--
ALTER TABLE `jobapplicationqualifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobpostings`
--
ALTER TABLE `jobpostings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `groupmembers`
--
ALTER TABLE `groupmembers`
  ADD CONSTRAINT `groupmembers_ibfk_1` FOREIGN KEY (`groupid`) REFERENCES `affinitygroup` (`groupid`) ON DELETE CASCADE ON UPDATE CASCADE;
