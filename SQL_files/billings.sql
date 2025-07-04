CREATE TABLE Billing (
    billing_id INT AUTO_INCREMENT PRIMARY KEY,
    visit_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
    payment_status ENUM('Pending', 'Paid', 'Cancelled') DEFAULT 'Pending',
    paid_on DATE,
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
);
-- 100 billing entries according to visit_id
INSERT INTO Billing (visit_id, amount, payment_status, paid_on) VALUES
(26, 1200.00, 'Paid', '2024-06-02'),
(27, 900.00, 'Pending', NULL),
(28, 1500.00, 'Paid', '2024-06-04'),
(29, 800.00, 'Cancelled', NULL),
(30, 1000.00, 'Paid', '2024-06-06'),
(31, 950.00, 'Pending', NULL),
(32, 1100.00, 'Paid', '2024-06-07'),
(33, 700.00, 'Cancelled', NULL),
(34, 1250.00, 'Paid', '2024-06-08'),
(35, 850.00, 'Pending', NULL),
(36, 1050.00, 'Paid', '2024-06-10'),
(37, 990.00, 'Pending', NULL),
(38, 1400.00, 'Paid', '2024-06-11'),
(39, 760.00, 'Cancelled', NULL),
(40, 1120.00, 'Paid', '2024-06-12'),
(41, 920.00, 'Pending', NULL),
(42, 1300.00, 'Paid', '2024-06-13'),
(43, 875.00, 'Cancelled', NULL),
(44, 980.00, 'Paid', '2024-06-14'),
(45, 810.00, 'Pending', NULL),
(46, 1500.00, 'Paid', '2024-06-15'),
(47, 880.00, 'Pending', NULL),
(48, 1350.00, 'Paid', '2024-06-16'),
(49, 725.00, 'Cancelled', NULL),
(50, 1150.00, 'Paid', '2024-06-17'),
(51, 940.00, 'Pending', NULL),
(52, 1080.00, 'Paid', '2024-06-18'),
(53, 845.00, 'Cancelled', NULL),
(54, 1000.00, 'Paid', '2024-06-19'),
(55, 895.00, 'Pending', NULL),
(56, 1235.00, 'Paid', '2024-06-20'),
(57, 975.00, 'Pending', NULL),
(58, 1275.00, 'Paid', '2024-06-21'),
(59, 760.00, 'Cancelled', NULL),
(60, 1125.00, 'Paid', '2024-06-22'),
(61, 880.00, 'Pending', NULL),
(62, 1340.00, 'Paid', '2024-06-23'),
(63, 790.00, 'Cancelled', NULL),
(64, 990.00, 'Paid', '2024-06-24'),
(65, 820.00, 'Pending', NULL),
(66, 1460.00, 'Paid', '2024-06-25'),
(67, 910.00, 'Pending', NULL),
(68, 1325.00, 'Paid', '2024-06-26'),
(69, 760.00, 'Cancelled', NULL),
(70, 1085.00, 'Paid', '2024-06-27'),
(71, 880.00, 'Pending', NULL),
(72, 1380.00, 'Paid', '2024-06-28'),
(73, 840.00, 'Cancelled', NULL),
(74, 970.00, 'Paid', '2024-06-29'),
(75, 890.00, 'Pending', NULL),
(76, 1150.00, 'Paid', '2024-07-01'),
(77, 980.00, 'Pending', NULL),
(78, 1250.00, 'Paid', '2024-07-02'),
(79, 875.00, 'Cancelled', NULL),
(80, 1100.00, 'Paid', '2024-07-03'),
(81, 920.00, 'Pending', NULL),
(82, 1380.00, 'Paid', '2024-07-04'),
(83, 760.00, 'Cancelled', NULL),
(84, 1450.00, 'Paid', '2024-07-05'),
(85, 870.00, 'Pending', NULL),
(86, 1320.00, 'Paid', '2024-07-06'),
(87, 990.00, 'Pending', NULL),
(88, 1175.00, 'Paid', '2024-07-07'),
(89, 740.00, 'Cancelled', NULL),
(90, 1085.00, 'Paid', '2024-07-08'),
(91, 960.00, 'Pending', NULL),
(92, 1200.00, 'Paid', '2024-07-09'),
(93, 810.00, 'Cancelled', NULL),
(94, 1275.00, 'Paid', '2024-07-10'),
(95, 940.00, 'Pending', NULL),
(96, 1300.00, 'Paid', '2024-07-11'),
(97, 990.00, 'Pending', NULL),
(98, 1400.00, 'Paid', '2024-07-12'),
(99, 880.00, 'Cancelled', NULL),
(100, 1190.00, 'Paid', '2024-07-13'),
(101, 1025.00, 'Pending', NULL),
(102, 1350.00, 'Paid', '2024-07-14'),
(103, 890.00, 'Cancelled', NULL),
(104, 1130.00, 'Paid', '2024-07-15'),
(105, 950.00, 'Pending', NULL),
(106, 1225.00, 'Paid', '2024-07-16'),
(107, 995.00, 'Pending', NULL),
(108, 1280.00, 'Paid', '2024-07-17'),
(109, 810.00, 'Cancelled', NULL),
(110, 1165.00, 'Paid', '2024-07-18'),
(111, 930.00, 'Pending', NULL),
(112, 1395.00, 'Paid', '2024-07-19'),
(113, 850.00, 'Cancelled', NULL),
(114, 1420.00, 'Paid', '2024-07-20'),
(115, 910.00, 'Pending', NULL),
(116, 1375.00, 'Paid', '2024-07-21'),
(117, 990.00, 'Pending', NULL),
(118, 1260.00, 'Paid', '2024-07-22'),
(119, 830.00, 'Cancelled', NULL),
(120, 1180.00, 'Paid', '2024-07-23'),
(121, 970.00, 'Pending', NULL),
(122, 1335.00, 'Paid', '2024-07-24'),
(123, 790.00, 'Cancelled', NULL),
(124, 1110.00, 'Paid', '2024-07-25'),
(125, 945.00, 'Pending', NULL);
