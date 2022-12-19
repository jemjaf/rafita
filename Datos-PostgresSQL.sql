-- Proveedor
INSERT INTO "ComprasApp_proveedor" (id, "RUC", razon_social, direccion, "DNI_representante", estado, telefono) VALUES
(4, '12345672233', 'PACASMAYO S.A.C.', 'Av 10 de Julio', '12345678', false, '990909090'),
(5, '20913642571', 'Blogtag', '982 Moose Avenue', '15163074', true, '995295223'),
(6, '20127430491', 'Teklist', '722 Glendale Avenue', '04157981', false, '952399833'),
(7, '20271232631', 'Wikizz', '9836 Continental Point', '11070562', true, '994721128'),
(8, '20801053441', 'Aivee', '59498 Toban Pass', '02306419', false, '960460970'),
(9, '20272399211', 'Meembee', '456 Esch Way', '76891774', false, '996747904'),
(10, '20545320081', 'Ailane', '5 Tomscot Drive', '65273138', false, '924596619'),
(11, '20656164751', 'Feedmix', '84 Westport Way', '07153056', false, '948630986'),
(12, '20555403741', 'Feednation', '77132 Scofield Avenue', '69045868', false, '904626148'),
(13, '20105799121', 'Rhyzio', '5 Reinke Terrace', '33404013', false, '987066215'),
(14, '20456233491', 'Dynabox', '77 Killdeer Drive', '25150308', true, '910529916'),
(15, '20492519051', 'Rooxo', '52 Huxley Circle', '53646485', false, '924888719'),
(16, '20753809521', 'Agivu', '37 Jenna Road', '59545914', false, '923984616'),
(17, '20331064451', 'Photobug', '17 Hoffman Point', '54942441', false, '944280593'),
(18, '20713736851', 'Babbleset', '03121 Merry Street', '23896146', true, '981198382'),
(19, '20277748381', 'Latz', '9686 Fuller Plaza', '37420625', true, '992401672'),
(20, '20095795561', 'Wikizz', '4833 Sloan Avenue', '16981636', false, '976363035'),
(21, '20604443881', 'Jaloo', '09 Cambridge Parkway', '31663076', true, '928374670'),
(22, '20304061991', 'Voonte', '231 Vahlen Point', '60194230', true, '949634676'),
(23, '20880507641', 'Cogidoo', '28344 Graedel Place', '89990445', false, '934092712'),
(24, '20823586551', 'Babbleblab', '6 Coleman Hill', '57246368', true, '974363927'),
(25, '20294951261', 'Quaxo', '6 Judy Circle', '03318365', false, '945974815'),
(26, '20615642301', 'Voonyx', '44 Sutteridge Court', '47605871', false, '926314800'),
(27, '20913883891', 'Kimia', '8 Warrior Avenue', '94703322', false, '954468497'),
(28, '20664002561', 'Dynazzy', '040 Eggendart Park', '79050805', false, '900350242'),
(29, '20118508561', 'Voomm', '6 Kim Terrace', '71984440', true, '936998676'),
(30, '20761513751', 'Zoomzone', '46 Russell Lane', '24932789', true, '926751756'),
(31, '20717508231', 'Bluejam', '9 Talmadge Trail', '41300121', true, '901964888'),
(32, '20734414961', 'Mynte', '620 Ramsey Street', '92965051', false, '902014267'),
(33, '20656219821', 'Skidoo', '659 Sutherland Street', '64748353', true, '903665025'),
(34, '20916832961', 'Voomm', '4 Esker Crossing', '26588891', true, '964990998'),
(35, '20795811451', 'Meezzy', '42 Cody Pass', '72411280', false, '931779270'),
(36, '20160335731', 'Gabvine', '3 Lakewood Court', '89325064', false, '954311702'),
(37, '20725994001', 'Thoughtmix', '17 Katie Avenue', '78864307', true, '954021753'),
(38, '20969595291', 'Buzzster', '7960 Haas Road', '66978841', true, '914759504'),
(39, '20027021771', 'BlogXS', '5105 Sundown Parkway', '03603460', true, '992363585'),
(40, '20753534251', 'Kanoodle', '807 Hollow Ridge Crossing', '82171217', false, '972639841'),
(41, '20678368111', 'Topicshots', '675 Transport Circle', '60465796', true, '960726043'),
(42, '20588561551', 'Dynabox', '094 Columbus Circle', '54709044', true, '971839526'),
(43, '20324596001', 'Realfire', '59 South Trail', '14377658', true, '999520474'),
(44, '20611538761', 'Voomm', '0 Darwin Terrace', '30845945', false, '925679248'),
(45, '20734431461', 'Gigabox', '83844 Oxford Crossing', '21284987', true, '945357295'),
(46, '20406247931', 'Fanoodle', '0 Esch Avenue', '08461566', false, '945068402'),
(47, '20897299191', 'Devbug', '18 Maywood Pass', '23164559', false, '967880819'),
(48, '20568135091', 'Buzzbean', '5 Susan Terrace', '64054081', false, '921352058'),
(49, '20052664901', 'Feedbug', '32753 2nd Trail', '65541268', false, '977843794'),
(50, '20500773451', 'LiveZ', '5664 Arrowood Center', '74537852', true, '928742837');

select * from "ComprasApp_proveedor"

-- Insumos
INSERT INTO "ComprasApp_insumo" (id, descripcion, unidad_medida, stock, estado, proveedor_id, precio) VALUES
(1, 'Ecolab Digiclean Mild Fm', 'Unidades', '19.55', true, 30, '8.04'),
(2, 'Carrots - Mini Red Organic', 'Unidades', '16.02', true, 28, '3.08'),
(3, 'Wine - George Duboeuf Rose', 'Unidades', '3.23', true, 26, '24.19'),
(4, 'Sausage - Andouille', 'Kg', '5.51', true, 19, '26.91'),
(5, 'Lemonade - Mandarin, 591 Ml', 'Litros', '19.03', true, 18, '7.23'),
(6, 'Couscous', 'Kg', '28.57', true, 48, '7.68'),
(7, 'Wine - Acient Coast Caberne', 'Kg', '19.09', true, 41, '13.89'),
(8, 'Pasta - Ravioli', 'Kg', '24.59', true, 43, '11.29'),
(9, 'Kale - Red', 'Litros', '23.18', true, 23, '20.25'),
(10, 'Flour - Semolina', 'Kg', '8.49', true, 23, '3.46'),
(11, 'Wine - Alsace Riesling Reserve', 'Litros', '13.36', true, 5, '23.22'),
(12, 'Gatorade - Cool Blue Raspberry', 'Kg', '22.38', true, 4, '13.70'),
(13, 'Soup - Tomato Mush. Florentine', 'Litros', '0.66', true, 10, '3.50'),
(14, 'Crackers - Trio', 'Litros', '29.09', true, 9, '9.11'),
(15, 'Turnip - White', 'Litros', '3.99', true, 34, '4.52'),
(16, 'Bread - Pumpernickle, Rounds', 'Kg', '13.81', true, 31, '18.16'),
(17, 'Chicken - Base', 'Kg', '23.73', true, 42, '20.97'),
(18, 'Ecolab Silver Fusion', 'Litros', '17.82', true, 35, '4.48'),
(19, 'Fudge - Chocolate Fudge', 'Litros', '26.60', true, 20, '26.70'),
(20, 'Stock - Fish', 'Litros', '5.93', true, 26, '12.36'),
(21, 'Ketchup - Tomato', 'Kg', '7.22', true, 17, '2.97'),
(22, 'Gloves - Goldtouch Disposable', 'Litros', '0.16', true, 24, '17.74'),
(23, 'Beer - Original Organic Lager', 'Litros', '6.15', true, 39, '20.64'),
(24, 'Basil - Primerba, Paste', 'Kg', '16.29', true, 19, '7.63'),
(25, 'Beer - Maudite', 'Kg', '12.56', true, 44, '6.70'),
(26, 'Onion Powder', 'Unidades', '9.57', true, 14, '14.69'),
(27, 'Wine - Cotes Du Rhone Parallele', 'Litros', '27.57', true, 26, '19.45'),
(28, 'Flour - Bran, Red', 'Litros', '4.61', true, 5, '25.13'),
(29, 'Mustard - Seed', 'Kg', '18.15', true, 32, '26.47'),
(30, 'Cheese - Pied De Vents', 'Unidades', '19.05', true, 25, '22.75'),
(31, 'Garbage Bags - Clear', 'Kg', '22.76', true, 33, '17.81'),
(32, 'Lobster - Live', 'Litros', '9.54', true, 11, '24.97'),
(33, 'Pork Salted Bellies', 'Kg', '6.37', true, 4, '2.60'),
(34, 'Flounder - Fresh', 'Kg', '9.18', true, 28, '8.13'),
(35, 'Eggplant - Baby', 'Litros', '29.17', true, 6, '16.58'),
(36, 'Pepper - Paprika, Spanish', 'Kg', '11.61', true, 5, '6.54'),
(37, 'Asparagus - White, Fresh', 'Unidades', '7.81', true, 10, '8.05'),
(38, 'Lettuce - Spring Mix', 'Kg', '16.32', true, 39, '21.45'),
(39, 'Dragon Fruit', 'Kg', '23.04', true, 30, '16.61'),
(40, 'Beans - Fine', 'Kg', '29.25', true, 25, '4.33'),
(41, 'Cheese - Camembert', 'Litros', '16.52', true, 50, '6.63'),
(42, 'Nut - Chestnuts, Whole', 'Unidades', '22.49', true, 27, '16.42'),
(43, 'Cheese - Mozzarella, Buffalo', 'Kg', '3.72', true, 20, '24.02'),
(44, 'Bread - Rolls, Corn', 'Kg', '13.94', true, 43, '19.84'),
(45, 'Longos - Greek Salad', 'Litros', '14.08', true, 8, '15.33'),
(46, 'Cake - Mini Cheesecake', 'Unidades', '28.97', true, 11, '3.74'),
(48, 'Pear - Packum', 'Unidades', '13.97', true, 42, '7.93'),
(49, 'Vinegar - Sherry', 'Kg', '0.59', true, 27, '18.48'),
(50, 'Milk Powder', 'Litros', '10.57', true, 26, '25.80'),
(52, 'Lamb - Pieces, Diced', 'Unidades', '6.89', true, 38, '9.73'),
(53, 'Flour - Corn, Fine', 'Unidades', '18.27', true, 46, '13.19'),
(54, 'Lotus Root', 'Kg', '24.45', true, 16, '14.59'),
(55, 'Cheese Cloth No 60', 'Kg', '5.79', true, 23, '20.58'),
(56, 'Bread - Sour Sticks With Onion', 'Unidades', '8.22', true, 13, '6.75'),
(57, 'Flour - Teff', 'Kg', '29.42', true, 25, '17.25'),
(58, 'Bread Bowl Plain', 'Unidades', '28.20', true, 33, '18.93'),
(59, 'Yoplait Drink', 'Unidades', '6.18', true, 50, '15.82'),
(60, 'Croissants Thaw And Serve', 'Unidades', '2.45', true, 36, '2.32'),
(61, 'Basil - Dry, Rubbed', 'Unidades', '14.05', true, 31, '15.94'),
(62, 'Cream Of Tartar', 'Kg', '19.74', true, 5, '9.18'),
(63, 'Mahi Mahi', 'Kg', '17.18', true, 20, '10.88'),
(64, 'Bread - Dark Rye', 'Kg', '1.18', true, 14, '22.81'),
(65, 'Wine - Red, Wolf Blass, Yellow', 'Litros', '16.24', true, 29, '25.73'),
(66, 'Marjoram - Fresh', 'Unidades', '13.54', true, 16, '25.43'),
(67, 'Cup - 3.5oz, Foam', 'Unidades', '7.42', true, 7, '20.23'),
(68, 'Pineapple - Golden', 'Kg', '28.18', true, 28, '19.93'),
(69, 'Cabbage - Red', 'Unidades', '22.80', true, 5, '10.88'),
(70, 'Ice Cream Bar - Oreo Cone', 'Litros', '0.34', true, 39, '17.67'),
(71, 'Beans - Black Bean, Preserved', 'Litros', '27.50', true, 29, '22.84'),
(72, 'Rabbit - Frozen', 'Litros', '3.56', true, 12, '16.26'),
(73, 'Sachet', 'Litros', '20.71', true, 42, '5.41'),
(74, 'Milk - Chocolate 250 Ml', 'Unidades', '5.07', true, 28, '24.08'),
(75, 'Pork - Belly Fresh', 'Unidades', '28.24', true, 20, '26.40'),
(76, 'Oil - Hazelnut', 'Kg', '24.24', true, 20, '5.44'),
(77, 'Glaze - Clear', 'Kg', '9.00', true, 16, '27.81'),
(78, 'Leeks - Baby, White', 'Unidades', '22.92', true, 12, '6.80'),
(79, 'Jameson Irish Whiskey', 'Litros', '25.29', true, 9, '11.34'),
(80, 'Ice Cream Bar - Hageen Daz To', 'Unidades', '19.98', true, 17, '18.41'),
(81, 'Wine - White, Concha Y Toro', 'Unidades', '28.76', true, 35, '15.95'),
(82, 'Bar Mix - Lemon', 'Kg', '12.09', true, 30, '9.63'),
(83, 'Beer - Sleeman Fine Porter', 'Litros', '25.22', true, 46, '26.79'),
(84, 'Rice - Brown', 'Litros', '20.86', true, 43, '5.33'),
(85, 'Schnappes Peppermint - Walker', 'Kg', '25.63', true, 27, '19.09'),
(86, 'Wine - Red, Mouton Cadet', 'Litros', '24.55', true, 27, '16.63'),
(87, 'Muffin Mix - Oatmeal', 'Unidades', '17.23', true, 41, '3.38'),
(88, 'Savory', 'Unidades', '11.39', true, 30, '26.79'),
(89, 'Appetizer - Mango Chevre', 'Unidades', '18.89', true, 45, '19.26'),
(90, 'Ostrich - Fan Fillet', 'Kg', '14.59', true, 24, '13.68'),
(91, 'Cheese - Havarti, Salsa', 'Litros', '28.36', true, 12, '11.78'),
(92, 'Orange Roughy 6/8 Oz', 'Unidades', '11.36', true, 41, '13.51'),
(93, 'Blackberries', 'Unidades', '23.44', true, 40, '8.90'),
(94, 'Coffee - Egg Nog Capuccino', 'Kg', '11.94', true, 32, '15.71'),
(95, 'Syrup - Kahlua Chocolate', 'Unidades', '18.35', true, 48, '27.85'),
(96, 'Pernod', 'Unidades', '29.39', true, 13, '4.13'),
(97, 'Skirt - 24 Foot', 'Litros', '19.13', true, 8, '8.40'),
(98, 'Cheese - Mascarpone', 'Kg', '10.34', true, 50, '9.55'),
(99, 'Yucca', 'Unidades', '28.56', true, 4, '8.89'),
(100, 'Pepper - Green', 'Kg', '22.59', true, 23, '15.17'),
(101, 'Beef - Tenderlion, Center Cut', 'Unidades', '25.98', true, 6, '25.38'),
(102, 'Slt - Individual Portions', 'Kg', '28.53', true, 9, '8.22'),
(103, 'Spic And Span All Purpose', 'Kg', '23.55', true, 50, '27.17'),
(104, 'Table Cloth 91x91 Colour', 'Litros', '7.30', true, 46, '20.57'),
(105, 'Snapple Lemon Tea', 'Kg', '27.73', true, 17, '8.01'),
(106, 'Steel Wool', 'Kg', '13.51', true, 32, '21.25'),
(107, 'Shrimp - Black Tiger 26/30', 'Kg', '27.33', true, 39, '4.38'),
(108, 'Wine - Penfolds Koonuga Hill', 'Kg', '23.55', true, 19, '13.73'),
(109, 'Tofu - Soft', 'Litros', '15.72', true, 38, '3.67'),
(110, 'Strawberries - California', 'Unidades', '20.32', true, 36, '19.04'),
(111, 'Fennel', 'Kg', '8.51', true, 36, '22.42'),
(112, 'Celery', 'Kg', '11.09', true, 15, '10.47'),
(113, 'Island Oasis - Ice Cream Mix', 'Unidades', '0.03', true, 31, '20.24'),
(115, 'Soup Campbells - Tomato Bisque', 'Kg', '8.46', true, 11, '7.89'),
(116, 'Absolut Citron', 'Litros', '29.76', true, 50, '11.25'),
(117, 'Wine - Saint Emilion Calvet', 'Litros', '1.49', true, 44, '2.47'),
(118, 'Alize Gold Passion', 'Unidades', '10.64', true, 12, '15.83'),
(119, 'Beef - Shank', 'Litros', '14.10', true, 11, '23.83'),
(120, 'Vinegar - White Wine', 'Unidades', '2.20', true, 26, '16.45'),
(121, 'Vermouth - Sweet, Cinzano', 'Kg', '5.77', true, 15, '20.05'),
(122, 'Buffalo - Short Rib Fresh', 'Unidades', '9.23', true, 20, '19.75'),
(123, 'Grapefruit - White', 'Litros', '5.98', true, 40, '23.60'),
(124, 'Soup - Campbells, Butternut', 'Unidades', '0.74', true, 15, '16.89'),
(125, 'Muffin Mix - Banana Nut', 'Unidades', '0.51', true, 43, '19.89'),
(126, 'Oil - Macadamia', 'Unidades', '17.58', true, 15, '23.10'),
(127, 'Hickory Smoke, Liquid', 'Unidades', '14.03', true, 16, '16.58'),
(128, 'Olives - Green, Pitted', 'Litros', '2.41', true, 16, '22.97'),
(129, 'Shrimp - Baby, Warm Water', 'Unidades', '4.03', true, 38, '6.63'),
(130, 'Pastry - Carrot Muffin - Mini', 'Litros', '21.92', true, 16, '20.64'),
(131, 'Chocolate - Dark Callets', 'Litros', '27.00', true, 32, '17.61'),
(132, 'Nut - Peanut, Roasted', 'Unidades', '20.37', true, 7, '18.15'),
(133, 'Sprouts - Peppercress', 'Litros', '24.77', true, 50, '16.22'),
(134, 'Pate - Peppercorn', 'Unidades', '0.65', true, 17, '27.95'),
(135, 'Tomatoes - Heirloom', 'Unidades', '20.42', true, 25, '11.27'),
(136, 'Apple - Northern Spy', 'Unidades', '6.41', true, 28, '6.09'),
(137, 'Carbonated Water - Blackberry', 'Litros', '6.48', true, 32, '3.10'),
(138, 'Oil - Peanut', 'Litros', '26.67', true, 44, '10.66'),
(139, 'Truffle Shells - White Chocolate', 'Unidades', '12.45', true, 6, '14.17'),
(140, 'Sour Puss Sour Apple', 'Unidades', '4.27', true, 43, '9.41'),
(141, 'Pastry - Butterscotch Baked', 'Unidades', '29.25', true, 33, '4.87'),
(142, 'Sambuca - Ramazzotti', 'Kg', '13.08', true, 49, '20.59'),
(143, 'Seedlings - Buckwheat, Organic', 'Unidades', '23.31', true, 15, '7.63'),
(144, 'Wine - Red, Cabernet Merlot', 'Kg', '8.07', true, 6, '13.63'),
(145, 'Cheese - St. Paulin', 'Unidades', '1.01', true, 44, '17.72'),
(146, 'Garlic - Peeled', 'Unidades', '21.26', true, 45, '21.25'),
(147, 'Broom - Corn', 'Kg', '8.06', true, 50, '27.94'),
(148, 'Milk 2% 500 Ml', 'Kg', '28.58', true, 15, '12.82'),
(149, 'Shortbread - Cookie Crumbs', 'Unidades', '4.77', true, 36, '10.56'),
(200, 'Soup - Campbells, Classic Chix', 'Unidades', '19.16', true, 35, '11.52'),
(201, 'Cheese - Goat With Herbs', 'Unidades', '18.00', true, 5, '11.87'),
(202, 'Hipnotiq Liquor', 'Unidades', '0.46', true, 14, '11.68'),
(203, 'Grapefruit - Pink', 'Unidades', '11.76', true, 15, '18.83'),
(204, 'Turkey - Breast, Double', 'Litros', '5.37', true, 10, '20.08'),
(206, 'Vinegar - Raspberry', 'Litros', '10.69', true, 29, '26.90'),
(207, 'Juice - Apple, 341 Ml', 'Kg', '13.40', true, 20, '19.01'),
(208, 'Chips Potato Swt Chilli Sour', 'Kg', '13.43', true, 24, '15.82'),
(209, 'Broom - Angled', 'Kg', '11.41', true, 18, '23.94'),
(210, 'Pomello', 'Unidades', '25.40', true, 39, '9.81'),
(211, 'Bread Cranberry Foccacia', 'Litros', '15.98', true, 19, '18.42'),
(213, 'Pepper - Red, Finger Hot', 'Kg', '13.73', true, 28, '22.39'),
(214, 'Cheese - Blue', 'Kg', '10.18', true, 8, '11.22'),
(215, 'Vinegar - Red Wine', 'Litros', '13.68', true, 16, '9.94'),
(216, 'Compound - Pear', 'Unidades', '5.50', true, 9, '5.65'),
(217, 'Rice - 7 Grain Blend', 'Unidades', '17.07', true, 24, '3.85'),
(218, 'Salt - Seasoned', 'Unidades', '13.22', true, 43, '18.77'),
(219, 'Tumeric', 'Kg', '11.23', true, 27, '7.98'),
(220, 'Tortillas - Flour, 10', 'Unidades', '22.41', true, 46, '25.04'),
(221, 'Spice - Peppercorn Melange', 'Unidades', '12.96', true, 21, '5.71'),
(222, 'Muffin Mix - Raisin Bran', 'Litros', '20.79', true, 29, '15.73'),
(224, 'Scallops - Live In Shell', 'Kg', '20.16', true, 20, '15.57'),
(225, 'Red Currants', 'Kg', '16.03', true, 11, '16.29'),
(227, 'Arizona - Green Tea', 'Litros', '18.79', true, 27, '10.95'),
(228, 'Onions - Cippolini', 'Unidades', '20.28', true, 31, '7.31'),
(229, 'Butter - Salted', 'Litros', '7.57', true, 37, '23.83'),
(231, 'Propel Sport Drink', 'Litros', '15.95', true, 16, '4.21'),
(232, 'Green Tea Refresher', 'Unidades', '7.67', true, 48, '16.86'),
(233, 'Beer - Steamwhistle', 'Litros', '7.92', true, 17, '18.20'),
(234, 'Sauce - Soya, Light', 'Litros', '5.16', true, 35, '13.15'),
(235, 'Soup - Knorr, Chicken Noodle', 'Unidades', '19.59', true, 18, '13.82'),
(236, 'Soup - Campbellschix Stew', 'Kg', '8.40', true, 35, '23.55'),
(238, 'Onions - Green', 'Kg', '29.18', true, 9, '18.38'),
(239, 'Paper Cocktail Umberlla 80 - 180', 'Unidades', '6.53', true, 15, '17.38'),
(240, 'Ecolab - Balanced Fusion', 'Unidades', '2.96', true, 19, '2.58'),
(241, 'Venison - Denver Leg Boneless', 'Kg', '22.02', true, 49, '21.18'),
(242, 'Wine - Two Oceans Cabernet', 'Litros', '2.54', true, 33, '22.85'),
(243, 'Durian Fruit', 'Kg', '5.00', true, 14, '19.21'),
(244, 'Pepper - Black, Whole', 'Unidades', '15.46', true, 28, '3.24'),
(245, 'Mousse - Passion Fruit', 'Kg', '15.06', true, 9, '13.44'),
(246, 'Salmon - Atlantic, Skin On', 'Kg', '27.75', true, 43, '18.28'),
(247, 'Cheese - Le Cru Du Clocher', 'Litros', '15.11', true, 9, '14.02'),
(248, 'Baking Soda', 'Kg', '20.40', true, 35, '10.07'),
(249, 'Juice - Grape, White', 'Kg', '28.16', true, 39, '13.59'),
(250, 'Nut - Pecan, Pieces', 'Litros', '11.55', true, 11, '16.14'),
(252, 'Soup - Cream Of Broccoli, Dry', 'Unidades', '29.44', true, 20, '20.59'),
(253, 'Tomato - Plum With Basil', 'Litros', '25.15', true, 33, '8.18'),
(254, 'Tea - Herbal Sweet Dreams', 'Unidades', '8.67', true, 32, '22.28'),
(255, 'Bread - Pumpernickel', 'Kg', '24.68', true, 33, '7.11'),
(256, 'Arizona - Plum Green Tea', 'Unidades', '0.53', true, 10, '21.30'),
(257, 'Blue Curacao - Marie Brizard', 'Litros', '10.42', true, 6, '3.74'),
(258, 'Chips Potato Reg 43g', 'Kg', '10.98', true, 39, '10.32'),
(259, 'Cookies Cereal Nut', 'Kg', '11.09', true, 23, '11.71'),
(260, 'Wine - Magnotta - Pinot Gris Sr', 'Kg', '12.68', true, 18, '6.49'),
(261, 'Beer - Blue', 'Kg', '4.19', true, 22, '13.38'),
(262, 'Spinach - Frozen', 'Unidades', '12.10', true, 49, '15.32'),
(263, 'Paste - Black Olive', 'Litros', '11.39', true, 16, '25.49'),
(264, 'Scallops 60/80 Iqf', 'Unidades', '21.37', true, 11, '26.29'),
(265, 'Rice - Basmati', 'Litros', '13.27', true, 16, '9.02'),
(266, 'Shrimp - Tiger 21/25', 'Kg', '6.83', true, 17, '18.94'),
(267, 'Straws - Cocktale', 'Kg', '12.42', true, 11, '3.55'),
(268, 'Pears - Bosc', 'Litros', '7.90', true, 29, '27.01'),
(269, 'Asparagus - Frozen', 'Litros', '13.15', true, 4, '22.14'),
(270, 'Asparagus - White, Canned', 'Litros', '24.29', true, 42, '12.70'),
(271, 'Cleaner - Bleach', 'Kg', '5.55', true, 37, '19.13'),
(272, 'Ecolab - Hand Soap Form Antibac', 'Unidades', '6.20', true, 24, '9.73'),
(273, 'Chocolate Eclairs', 'Kg', '28.49', true, 21, '4.64'),
(274, 'Pastry - Apple Muffins - Mini', 'Kg', '22.22', true, 16, '2.21'),
(275, 'Mushroom - White Button', 'Kg', '28.69', true, 28, '27.31'),
(276, 'Beef - Short Loin', 'Unidades', '17.26', true, 25, '16.98'),
(277, 'Tomatoes - Plum, Canned', 'Litros', '1.19', true, 36, '23.71'),
(278, 'Long Island Ice Tea', 'Litros', '18.37', true, 32, '17.05'),
(279, 'Pasta - Fett Alfredo, Single Serve', 'Litros', '28.14', true, 44, '2.84'),
(280, 'Pickerel - Fillets', 'Litros', '24.52', true, 5, '17.33'),
(281, 'Bread - Crusty Italian Poly', 'Kg', '17.29', true, 19, '26.70'),
(282, 'Pancetta', 'Unidades', '3.20', true, 18, '17.03'),
(283, 'Quinoa', 'Kg', '3.41', true, 50, '8.89'),
(284, 'Wine - Vouvray Cuvee Domaine', 'Kg', '18.16', true, 27, '22.24'),
(285, 'Beer - Camerons Cream Ale', 'Unidades', '15.38', true, 22, '21.42'),
(287, 'Marjoram - Dried, Rubbed', 'Unidades', '11.71', true, 31, '12.94'),
(288, 'Sugar - Brown', 'Kg', '1.68', true, 15, '25.24'),
(289, 'Nantucket - 518ml', 'Kg', '5.64', true, 41, '11.55'),
(291, 'Shrimp - 100 / 200 Cold Water', 'Unidades', '14.63', true, 38, '19.30'),
(292, 'Sobe - Orange Carrot', 'Litros', '20.37', true, 14, '8.29'),
(293, 'Water - Evian 355 Ml', 'Kg', '21.79', true, 18, '24.21'),
(294, 'Coffee Cup 8oz 5338cd', 'Kg', '19.85', true, 46, '25.07'),
(296, 'Beets', 'Unidades', '14.10', true, 33, '2.53'),
(297, 'Huck Towels White', 'Litros', '14.96', true, 29, '5.17'),
(298, 'Pork - Butt, Boneless', 'Kg', '4.46', true, 16, '26.02'),
(299, 'Foil - 4oz Custard Cup', 'Litros', '19.80', true, 22, '8.38'),
(300, 'Beef - Kobe Striploin', 'Unidades', '13.04', true, 25, '8.31'),
(301, 'Haggis', 'Unidades', '29.78', true, 7, '5.26'),
(302, 'Lamb - Shanks', 'Kg', '3.73', true, 49, '15.02'),
(303, 'Bread Crumbs - Japanese Style', 'Kg', '3.99', true, 12, '6.30'),
(304, 'Tomatoes - Diced, Canned', 'Unidades', '22.19', true, 12, '7.25');

select * from "ComprasApp_insumo"


--Clientes
INSERT INTO "PedidosApp_cliente" (id, direccion, email, telefono, estado, nombre, "nroDocumento", "tipoCliente", "tipoDocumento") VALUES
(1, '4223 Hayes Drive', 'mlyosik0@cbslocal.com', '971248329', true, 'Mordy Lyosik', '62010685', 'Natural', 'RUC'),
(2, '8150 Mitchell Place', 'emcgeagh1@narod.ru', '947847866', true, 'Emily McGeagh', '03449248', 'Jurídico', 'Carné de Extranjería'),
(3, '323 Beilfuss Crossing', 'gstuddal2@wix.com', '986486797', true, 'Gillie Studdal', '77619364', 'Jurídico', 'RUC'),
(4, '0268 Arrowood Parkway', 'mbrozek3@ed.gov', '917183933', true, 'Maggee Brozek', '38291498', 'Jurídico', 'DNI'),
(5, '298 Green Court', 'tshasnan4@google.es', '930030892', true, 'Titus Shasnan', '96197538', 'Natural', 'RUC'),
(6, '31530 Erie Place', 'tromand5@google.ca', '984475602', true, 'Trent Romand', '11134488', 'Natural', 'DNI'),
(7, '24481 Bluejay Parkway', 'jmacsherry6@nifty.com', '906096857', true, 'Jamison MacSherry', '76534847', 'Jurídico', 'Carné de Extranjería'),
(8, '38221 Warbler Place', 'mgoom7@nifty.com', '922843502', true, 'Marillin Goom', '54701461', 'Jurídico', 'Carné de Extranjería'),
(9, '7 Vermont Lane', 'apedlingham8@dropbox.com', '944526911', true, 'Addie Pedlingham', '11201941', 'Jurídico', 'Carné de Extranjería'),
(10, '48 Pond Circle', 'mbirchner9@ow.ly', '961915049', true, 'Molli Birchner', '96178926', 'Jurídico', 'Carné de Extranjería'),
(11, '119 Di Loreto Way', 'bmaccaguea@unicef.org', '938050906', true, 'Bud MacCague', '38256133', 'Natural', 'Carné de Extranjería'),
(12, '75 Gulseth Place', 'omcaleesb@facebook.com', '936762243', true, 'Olin McAlees', '34754612', 'Natural', 'RUC'),
(13, '0162 Rieder Road', 'dkleinec@unc.edu', '908763903', true, 'Dominica Kleine', '34216710', 'Natural', 'Carné de Extranjería'),
(14, '5 Meadow Valley Junction', 'oponderd@hostgator.com', '938540720', true, 'Osbert Ponder', '78423346', 'Natural', 'Carné de Extranjería'),
(15, '9 Dunning Road', 'bhaskette@mysql.com', '912172703', true, 'Burke Haskett', '81191015', 'Jurídico', 'Carné de Extranjería'),
(16, '97246 Tennessee Street', 'vskirvanef@posterous.com', '953796363', true, 'Val Skirvane', '12699787', 'Jurídico', 'Carné de Extranjería'),
(17, '0 Towne Place', 'lcarneg@nhs.uk', '936340183', true, 'Lydia Carne', '93501984', 'Jurídico', 'DNI'),
(18, '4 Kensington Drive', 'grosenvasserh@360.cn', '984411345', true, 'Gabe Rosenvasser', '95602988', 'Natural', 'RUC'),
(19, '14 Onsgard Street', 'lpirrii@squidoo.com', '964380410', true, 'Leah Pirri', '82730308', 'Natural', 'RUC'),
(20, '701 Prairieview Terrace', 'mdellj@goo.gl', '999098759', true, 'Moira Dell Casa', '08447923', 'Jurídico', 'DNI');

select * from "PedidosApp_cliente"

--Mesas
INSERT INTO "PedidosApp_mesa" (id, nombre, "enUso", "horaUltimoUso", estado) VALUES
(2, 'Mesa 2', true, '2022-08-21 23:54:52.006779', true),
(3, 'Mesa 3', true, '2022-08-21 23:54:55.068709', true),
(4, 'Mesa 4', true, '2022-08-21 23:54:58.173501', true),
(5, 'Mesa 5', true, '2022-08-21 23:55:03.407518', true),
(6, 'Mesa 6', true, '2022-08-21 23:55:08.889473', true),
(7, 'Mesa 7', true, '2022-08-21 23:55:12.116162', true),
(8, 'Mesa 8', true, '2022-08-21 23:55:15.714970', true),
(9, 'Mesa 9', true, '2022-08-21 23:55:21.165194', true),
(10, 'Mesa 10', true, '2022-08-21 23:55:25.243673', true);

select * from "PedidosApp_mesa"

--Plato
INSERT INTO "PedidosApp_plato" (id, nombre, estado, categoria, precio) VALUES
(1, 'Nachos', true, 'Acompañamiento', '18.60'),
(2, 'Arroz con pollo', true, 'Plato', '14.69'),
(3, 'Arepas', true, 'Acompañamiento', '21.26'),
(4, 'Aji de gallina', true, 'Plato', '8.99'),
(5, 'Chicharron de pota', true, 'Acompañamiento', '18.83'),
(6, 'vestibulum ante', true, 'Otros', '13.12'),
(7, 'Gaseosa Coca-Cola', true, 'Bebida', '24.38'),
(8, 'Tequeños', true, 'Acompañamiento', '17.29'),
(9, 'Alitas', true, 'Otros', '24.44'),
(10, 'Chicharron de pollo', true, 'Acompañamiento', '25.80'),
(11, 'felis', true, 'Acompañamiento', '15.15'),
(12, 'tristique tortor', true, 'Bebida', '18.43'),
(13, 'nulla sed', true, 'Bebida', '25.41'),
(14, 'porttitor lorem', true, 'Plato', '23.32'),
(15, 'eget', true, 'Otros', '14.53'),
(16, 'quam sollicitudin', true, 'Otros', '8.14'),
(17, 'luctus', true, 'Plato', '27.06'),
(18, 'risus', true, 'Acompañamiento', '9.10'),
(19, 'sit amet', true, 'Plato', '19.09'),
(20, 'consequat ut', true, 'Plato', '26.85'),
(21, 'orci', true, 'Acompañamiento', '8.66'),
(22, 'erat nulla', true, 'Acompañamiento', '20.50'),
(23, 'primis', true, 'Plato', '22.28'),
(24, 'sagittis', true, 'Plato', '20.76'),
(25, 'nam congue', true, 'Bebida', '11.43'),
(26, 'odio consequat', true, 'Bebida', '10.70'),
(27, 'nibh', true, 'Bebida', '29.54'),
(28, 'nisi', true, 'Plato', '8.87'),
(29, 'vulputate', true, 'Bebida', '15.43'),
(30, 'leo odio', true, 'Bebida', '20.81');

select * from "PedidosApp_plato"

