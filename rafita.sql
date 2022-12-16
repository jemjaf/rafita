-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2022 a las 20:32:33
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
drop database if exists rafita;
create database rafita;
use rafita;
--
-- Base de datos: `rafita`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'Administrador'),
(4, 'Caja'),
(3, 'Cocina'),
(2, 'Mozo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(106, 1, 13),
(107, 1, 14),
(108, 1, 15),
(105, 1, 16),
(102, 1, 25),
(103, 1, 26),
(104, 1, 27),
(101, 1, 28),
(98, 1, 29),
(99, 1, 30),
(100, 1, 31),
(97, 1, 32),
(118, 1, 34),
(119, 1, 35),
(120, 1, 36),
(117, 1, 37),
(110, 1, 38),
(111, 1, 39),
(112, 1, 40),
(109, 1, 41),
(122, 1, 43),
(123, 1, 44),
(124, 1, 45),
(121, 1, 46),
(114, 1, 47),
(115, 1, 48),
(116, 1, 49),
(113, 1, 50),
(126, 1, 51),
(127, 1, 52),
(128, 1, 53),
(125, 1, 54),
(94, 1, 55),
(95, 1, 56),
(96, 1, 57),
(93, 1, 58),
(134, 1, 59),
(135, 1, 60),
(136, 1, 61),
(133, 1, 62),
(130, 1, 63),
(131, 1, 64),
(132, 1, 65),
(129, 1, 66),
(138, 1, 67),
(139, 1, 68),
(140, 1, 69),
(137, 1, 70),
(142, 1, 73),
(141, 1, 74),
(79, 2, 25),
(80, 2, 26),
(81, 2, 27),
(78, 2, 28),
(76, 2, 32),
(77, 2, 33),
(90, 2, 37),
(83, 2, 38),
(84, 2, 39),
(85, 2, 40),
(82, 2, 41),
(87, 2, 47),
(88, 2, 48),
(89, 2, 49),
(86, 2, 50),
(157, 3, 41),
(158, 3, 50),
(152, 3, 51),
(153, 3, 52),
(151, 3, 54),
(156, 3, 62),
(155, 3, 63),
(154, 3, 66),
(149, 4, 41),
(150, 4, 50),
(144, 4, 67),
(145, 4, 68),
(146, 4, 69),
(143, 4, 70),
(148, 4, 71),
(147, 4, 74);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add cliente', 7, 'add_cliente'),
(26, 'Can change cliente', 7, 'change_cliente'),
(27, 'Can delete cliente', 7, 'delete_cliente'),
(28, 'Can view cliente', 7, 'view_cliente'),
(29, 'Can add mesa', 8, 'add_mesa'),
(30, 'Can change mesa', 8, 'change_mesa'),
(31, 'Can delete mesa', 8, 'delete_mesa'),
(32, 'Can view mesa', 8, 'view_mesa'),
(33, 'Liberar mesa', 8, 'liberar_mesa'),
(34, 'Can add plato', 9, 'add_plato'),
(35, 'Can change plato', 9, 'change_plato'),
(36, 'Can delete plato', 9, 'delete_plato'),
(37, 'Can view plato', 9, 'view_plato'),
(38, 'Can add pedido', 10, 'add_pedido'),
(39, 'Can change pedido', 10, 'change_pedido'),
(40, 'Can delete pedido', 10, 'delete_pedido'),
(41, 'Can view pedido', 10, 'view_pedido'),
(42, 'Entregar pedido', 10, 'can_entregar_pedido'),
(43, 'Can add detalle plato', 11, 'add_detalleplato'),
(44, 'Can change detalle plato', 11, 'change_detalleplato'),
(45, 'Can delete detalle plato', 11, 'delete_detalleplato'),
(46, 'Can view detalle plato', 11, 'view_detalleplato'),
(47, 'Can add detalle pedido', 12, 'add_detallepedido'),
(48, 'Can change detalle pedido', 12, 'change_detallepedido'),
(49, 'Can delete detalle pedido', 12, 'delete_detallepedido'),
(50, 'Can view detalle pedido', 12, 'view_detallepedido'),
(51, 'Can add compra', 13, 'add_compra'),
(52, 'Can change compra', 13, 'change_compra'),
(53, 'Can delete compra', 13, 'delete_compra'),
(54, 'Can view compra', 13, 'view_compra'),
(55, 'Can add proveedor', 14, 'add_proveedor'),
(56, 'Can change proveedor', 14, 'change_proveedor'),
(57, 'Can delete proveedor', 14, 'delete_proveedor'),
(58, 'Can view proveedor', 14, 'view_proveedor'),
(59, 'Can add insumo', 15, 'add_insumo'),
(60, 'Can change insumo', 15, 'change_insumo'),
(61, 'Can delete insumo', 15, 'delete_insumo'),
(62, 'Can view insumo', 15, 'view_insumo'),
(63, 'Can add detalle compra', 16, 'add_detallecompra'),
(64, 'Can change detalle compra', 16, 'change_detallecompra'),
(65, 'Can delete detalle compra', 16, 'delete_detallecompra'),
(66, 'Can view detalle compra', 16, 'view_detallecompra'),
(67, 'Can add apertura caja', 17, 'add_aperturacaja'),
(68, 'Can change apertura caja', 17, 'change_aperturacaja'),
(69, 'Can delete apertura caja', 17, 'delete_aperturacaja'),
(70, 'Can view apertura caja', 17, 'view_aperturacaja'),
(71, 'Can add comprobante pago', 18, 'add_comprobantepago'),
(72, 'Can change comprobante pago', 18, 'change_comprobantepago'),
(73, 'Can delete comprobante pago', 18, 'delete_comprobantepago'),
(74, 'Can view comprobante pago', 18, 'view_comprobantepago');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$2E2nIGoHN7nnVHXCWI0NqW$N1wmq8dsuD5ulpaZn/b/SaMvNvWGeXCUo6c4NHxzoAo=', '2022-12-15 11:54:03.550552', 0, 'cuentaAdmin', 'Carlo', 'Razzeto', 'salvattore_25@hotmail.com', 0, 1, '2022-12-15 11:52:53.283665'),
(2, 'pbkdf2_sha256$390000$7MgP1TfAIkdoybzYd8XPMD$hlm+Rf1K657v7L4Dp8V5z9w5cM27zZkud/rdr1jKZno=', NULL, 0, 'cuentaMozo', 'Anderson', 'Miguel', 'aaaaaa@hotmail.com', 0, 1, '2022-12-15 11:52:53.509803'),
(3, 'pbkdf2_sha256$390000$piYhREkftJDdMwbIMAPrV1$tO5OM1TXDLzqFInClgKvR5Xbkg+qlIVqWtYxiY44m7s=', NULL, 0, 'cuentaCocina', 'Gerardo', 'Avalos', 'eeeeee@hotmail.com', 0, 1, '2022-12-15 11:52:53.844832'),
(4, 'pbkdf2_sha256$390000$hasOhSSLvpqpEnjI8HgK2a$eVGE2SquiVYEIR2Pt+ILuYG4FHgU1Nb/tKt2L9lM3y4=', NULL, 0, 'cuentaCaja', 'Alessandro', 'Venegas', 'iiiiiii@hotmail.com', 0, 1, '2022-12-15 11:52:54.054242');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(6, 1, 1),
(8, 2, 2),
(9, 3, 3),
(10, 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajaapp_aperturacaja`
--

CREATE TABLE `cajaapp_aperturacaja` (
  `id` bigint(20) NOT NULL,
  `estadoApertura` tinyint(1) NOT NULL,
  `importeInicial` decimal(5,2) NOT NULL,
  `importe` decimal(5,2) NOT NULL,
  `importeFinal` decimal(5,2) DEFAULT NULL,
  `fechaInicio` datetime(6) NOT NULL,
  `fechaCierre` datetime(6) DEFAULT NULL,
  `cajero_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajaapp_comprobantepago`
--

CREATE TABLE `cajaapp_comprobantepago` (
  `id` bigint(20) NOT NULL,
  `tipoPago` varchar(20) NOT NULL,
  `tipoComprobante` varchar(20) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `importeTotal` decimal(4,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `igv` decimal(3,2) NOT NULL,
  `apertura_id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `pedido_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasapp_compra`
--

CREATE TABLE `comprasapp_compra` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `usuarioCompra_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasapp_detallecompra`
--

CREATE TABLE `comprasapp_detallecompra` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(4,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `compra_id` bigint(20) NOT NULL,
  `insumo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasapp_insumo`
--

CREATE TABLE `comprasapp_insumo` (
  `id` bigint(20) NOT NULL,
  `descripcion` varchar(40) NOT NULL,
  `precio` decimal(4,2) NOT NULL,
  `unidad_medida` varchar(20) NOT NULL,
  `stock` decimal(4,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `proveedor_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprasapp_insumo`
--

INSERT INTO `comprasapp_insumo` (`id`, `descripcion`, `precio`, `unidad_medida`, `stock`, `estado`, `proveedor_id`) VALUES
(1, 'Arroz', '3.00', 'Kg', '20.00', 1, 1),
(2, 'Pollo', '10.00', 'Kg', '2.00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasapp_proveedor`
--

CREATE TABLE `comprasapp_proveedor` (
  `id` bigint(20) NOT NULL,
  `RUC` varchar(11) NOT NULL,
  `razon_social` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `DNI_representante` varchar(8) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comprasapp_proveedor`
--

INSERT INTO `comprasapp_proveedor` (`id`, `RUC`, `razon_social`, `direccion`, `telefono`, `DNI_representante`, `estado`) VALUES
(1, '1111111111', 'Bodega la bodeguita', 'Lima 259', '159489156', '15815825', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(17, 'CajaApp', 'aperturacaja'),
(18, 'CajaApp', 'comprobantepago'),
(13, 'ComprasApp', 'compra'),
(16, 'ComprasApp', 'detallecompra'),
(15, 'ComprasApp', 'insumo'),
(14, 'ComprasApp', 'proveedor'),
(5, 'contenttypes', 'contenttype'),
(7, 'PedidosApp', 'cliente'),
(12, 'PedidosApp', 'detallepedido'),
(11, 'PedidosApp', 'detalleplato'),
(8, 'PedidosApp', 'mesa'),
(10, 'PedidosApp', 'pedido'),
(9, 'PedidosApp', 'plato'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-15 11:51:36.151537'),
(2, 'auth', '0001_initial', '2022-12-15 11:51:36.731273'),
(3, 'ComprasApp', '0001_initial', '2022-12-15 11:51:37.195977'),
(4, 'PedidosApp', '0001_initial', '2022-12-15 11:51:37.622324'),
(5, 'CajaApp', '0001_initial', '2022-12-15 11:51:37.780131'),
(6, 'admin', '0001_initial', '2022-12-15 11:51:37.885275'),
(7, 'admin', '0002_logentry_remove_auto_add', '2022-12-15 11:51:37.894271'),
(8, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-15 11:51:37.905244'),
(9, 'contenttypes', '0002_remove_content_type_name', '2022-12-15 11:51:38.597223'),
(10, 'auth', '0002_alter_permission_name_max_length', '2022-12-15 11:51:38.741999'),
(11, 'auth', '0003_alter_user_email_max_length', '2022-12-15 11:51:38.782890'),
(12, 'auth', '0004_alter_user_username_opts', '2022-12-15 11:51:38.794859'),
(13, 'auth', '0005_alter_user_last_login_null', '2022-12-15 11:51:38.864370'),
(14, 'auth', '0006_require_contenttypes_0002', '2022-12-15 11:51:38.867363'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2022-12-15 11:51:38.876339'),
(16, 'auth', '0008_alter_user_username_max_length', '2022-12-15 11:51:38.894263'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2022-12-15 11:51:38.928146'),
(18, 'auth', '0010_alter_group_name_max_length', '2022-12-15 11:51:39.015324'),
(19, 'auth', '0011_update_proxy_permissions', '2022-12-15 11:51:39.031281'),
(20, 'auth', '0012_alter_user_first_name_max_length', '2022-12-15 11:51:39.068245'),
(21, 'sessions', '0001_initial', '2022-12-15 11:51:39.127113');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2hmexhgawnltc61kqj4hvw6o4sov2dlp', '.eJxVjDsOwjAQBe_iGlk2_oaSPmewdr1eHECOFCcV4u4QKQW0b2beSyTY1pq2XpY0kbgILU6_G0J-lLYDukO7zTLPbV0mlLsiD9rlOFN5Xg_376BCr98a1KAsFWsQXSTjEbRnijEr44izcsgDh-A0gXXReLYGNDPlYPisYhDvD_LtODc:1p5rUh:C6c-yR-LfL7Fu9-9tFTejeNcNMnWyX2uVI5MCUhyg3E', '2022-12-29 11:54:03.584540');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosapp_cliente`
--

CREATE TABLE `pedidosapp_cliente` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `tipoCliente` varchar(10) NOT NULL,
  `tipoDocumento` varchar(25) NOT NULL,
  `nroDocumento` varchar(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidosapp_cliente`
--

INSERT INTO `pedidosapp_cliente` (`id`, `nombre`, `direccion`, `email`, `telefono`, `tipoCliente`, `tipoDocumento`, `nroDocumento`, `estado`) VALUES
(1, 'Carlo', 'Jr. Lima 168', '', '1225533', 'Natural', 'DNI', '74466379', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosapp_detallepedido`
--

CREATE TABLE `pedidosapp_detallepedido` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `indicaciones` varchar(50) NOT NULL,
  `precio` decimal(4,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `plato_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidosapp_detallepedido`
--

INSERT INTO `pedidosapp_detallepedido` (`id`, `cantidad`, `indicaciones`, `precio`, `estado`, `pedido_id`, `plato_id`) VALUES
(1, 3, '', '10.00', 1, 1, 1),
(2, 4, '', '10.00', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosapp_detalleplato`
--

CREATE TABLE `pedidosapp_detalleplato` (
  `id` bigint(20) NOT NULL,
  `cantidad` decimal(4,2) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `insumo_id` bigint(20) NOT NULL,
  `plato_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidosapp_detalleplato`
--

INSERT INTO `pedidosapp_detalleplato` (`id`, `cantidad`, `estado`, `insumo_id`, `plato_id`) VALUES
(1, '0.50', 1, 1, 1),
(2, '0.50', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosapp_mesa`
--

CREATE TABLE `pedidosapp_mesa` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `enUso` tinyint(1) NOT NULL,
  `horaUltimoUso` datetime(6) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidosapp_mesa`
--

INSERT INTO `pedidosapp_mesa` (`id`, `nombre`, `enUso`, `horaUltimoUso`, `estado`) VALUES
(1, 'Mesa 1', 1, '2022-12-15 12:28:19.538071', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosapp_pedido`
--

CREATE TABLE `pedidosapp_pedido` (
  `id` bigint(20) NOT NULL,
  `TipoPedido` varchar(20) NOT NULL,
  `Fecha` datetime(6) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `pagado` tinyint(1) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `mesa_id` bigint(20) DEFAULT NULL,
  `usuarioRegistra_id` int(11) NOT NULL,
  `usuarioReparte_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidosapp_pedido`
--

INSERT INTO `pedidosapp_pedido` (`id`, `TipoPedido`, `Fecha`, `direccion`, `pagado`, `estado`, `cliente_id`, `mesa_id`, `usuarioRegistra_id`, `usuarioReparte_id`) VALUES
(1, 'Salon', '2022-12-15 12:28:19.478137', '', 0, 1, 1, 1, 1, NULL),
(2, 'Delivery', '2022-12-15 12:56:45.398388', 'a', 0, 1, 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidosapp_plato`
--

CREATE TABLE `pedidosapp_plato` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `categoria` varchar(15) NOT NULL,
  `precio` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidosapp_plato`
--

INSERT INTO `pedidosapp_plato` (`id`, `nombre`, `estado`, `categoria`, `precio`) VALUES
(1, 'Arroz con pollo', 1, 'Plato', '10.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `cajaapp_aperturacaja`
--
ALTER TABLE `cajaapp_aperturacaja`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CajaApp_aperturacaja_cajero_id_8796c823_fk_auth_user_id` (`cajero_id`);

--
-- Indices de la tabla `cajaapp_comprobantepago`
--
ALTER TABLE `cajaapp_comprobantepago`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CajaApp_comprobantep_apertura_id_3dbb2862_fk_CajaApp_a` (`apertura_id`),
  ADD KEY `CajaApp_comprobantep_cliente_id_283d42fc_fk_PedidosAp` (`cliente_id`),
  ADD KEY `CajaApp_comprobantep_pedido_id_474d8d45_fk_PedidosAp` (`pedido_id`);

--
-- Indices de la tabla `comprasapp_compra`
--
ALTER TABLE `comprasapp_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ComprasApp_compra_usuarioCompra_id_b0c998bf_fk_auth_user_id` (`usuarioCompra_id`);

--
-- Indices de la tabla `comprasapp_detallecompra`
--
ALTER TABLE `comprasapp_detallecompra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ComprasApp_detalleco_compra_id_dd760299_fk_ComprasAp` (`compra_id`),
  ADD KEY `ComprasApp_detalleco_insumo_id_ed9054fe_fk_ComprasAp` (`insumo_id`);

--
-- Indices de la tabla `comprasapp_insumo`
--
ALTER TABLE `comprasapp_insumo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descripcion` (`descripcion`),
  ADD KEY `ComprasApp_insumo_proveedor_id_7c59d9c2_fk_ComprasAp` (`proveedor_id`);

--
-- Indices de la tabla `comprasapp_proveedor`
--
ALTER TABLE `comprasapp_proveedor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `RUC` (`RUC`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `pedidosapp_cliente`
--
ALTER TABLE `pedidosapp_cliente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nroDocumento` (`nroDocumento`);

--
-- Indices de la tabla `pedidosapp_detallepedido`
--
ALTER TABLE `pedidosapp_detallepedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PedidosApp_detallepe_pedido_id_b47e3c86_fk_PedidosAp` (`pedido_id`),
  ADD KEY `PedidosApp_detallepe_plato_id_04709026_fk_PedidosAp` (`plato_id`);

--
-- Indices de la tabla `pedidosapp_detalleplato`
--
ALTER TABLE `pedidosapp_detalleplato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PedidosApp_detallepl_insumo_id_e5fcbf61_fk_ComprasAp` (`insumo_id`),
  ADD KEY `PedidosApp_detalleplato_plato_id_84058acb_fk_PedidosApp_plato_id` (`plato_id`);

--
-- Indices de la tabla `pedidosapp_mesa`
--
ALTER TABLE `pedidosapp_mesa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidosapp_pedido`
--
ALTER TABLE `pedidosapp_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PedidosApp_pedido_cliente_id_236ec871_fk_PedidosApp_cliente_id` (`cliente_id`),
  ADD KEY `PedidosApp_pedido_mesa_id_e09223f9_fk_PedidosApp_mesa_id` (`mesa_id`),
  ADD KEY `PedidosApp_pedido_usuarioRegistra_id_093d098e_fk_auth_user_id` (`usuarioRegistra_id`),
  ADD KEY `PedidosApp_pedido_usuarioReparte_id_542997d7_fk_auth_user_id` (`usuarioReparte_id`);

--
-- Indices de la tabla `pedidosapp_plato`
--
ALTER TABLE `pedidosapp_plato`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cajaapp_aperturacaja`
--
ALTER TABLE `cajaapp_aperturacaja`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cajaapp_comprobantepago`
--
ALTER TABLE `cajaapp_comprobantepago`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprasapp_compra`
--
ALTER TABLE `comprasapp_compra`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprasapp_detallecompra`
--
ALTER TABLE `comprasapp_detallecompra`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprasapp_insumo`
--
ALTER TABLE `comprasapp_insumo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comprasapp_proveedor`
--
ALTER TABLE `comprasapp_proveedor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `pedidosapp_cliente`
--
ALTER TABLE `pedidosapp_cliente`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidosapp_detallepedido`
--
ALTER TABLE `pedidosapp_detallepedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidosapp_detalleplato`
--
ALTER TABLE `pedidosapp_detalleplato`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidosapp_mesa`
--
ALTER TABLE `pedidosapp_mesa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidosapp_pedido`
--
ALTER TABLE `pedidosapp_pedido`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidosapp_plato`
--
ALTER TABLE `pedidosapp_plato`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `cajaapp_aperturacaja`
--
ALTER TABLE `cajaapp_aperturacaja`
  ADD CONSTRAINT `CajaApp_aperturacaja_cajero_id_8796c823_fk_auth_user_id` FOREIGN KEY (`cajero_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `cajaapp_comprobantepago`
--
ALTER TABLE `cajaapp_comprobantepago`
  ADD CONSTRAINT `CajaApp_comprobantep_apertura_id_3dbb2862_fk_CajaApp_a` FOREIGN KEY (`apertura_id`) REFERENCES `cajaapp_aperturacaja` (`id`),
  ADD CONSTRAINT `CajaApp_comprobantep_cliente_id_283d42fc_fk_PedidosAp` FOREIGN KEY (`cliente_id`) REFERENCES `pedidosapp_cliente` (`id`),
  ADD CONSTRAINT `CajaApp_comprobantep_pedido_id_474d8d45_fk_PedidosAp` FOREIGN KEY (`pedido_id`) REFERENCES `pedidosapp_pedido` (`id`);

--
-- Filtros para la tabla `comprasapp_compra`
--
ALTER TABLE `comprasapp_compra`
  ADD CONSTRAINT `ComprasApp_compra_usuarioCompra_id_b0c998bf_fk_auth_user_id` FOREIGN KEY (`usuarioCompra_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `comprasapp_detallecompra`
--
ALTER TABLE `comprasapp_detallecompra`
  ADD CONSTRAINT `ComprasApp_detalleco_compra_id_dd760299_fk_ComprasAp` FOREIGN KEY (`compra_id`) REFERENCES `comprasapp_compra` (`id`),
  ADD CONSTRAINT `ComprasApp_detalleco_insumo_id_ed9054fe_fk_ComprasAp` FOREIGN KEY (`insumo_id`) REFERENCES `comprasapp_insumo` (`id`);

--
-- Filtros para la tabla `comprasapp_insumo`
--
ALTER TABLE `comprasapp_insumo`
  ADD CONSTRAINT `ComprasApp_insumo_proveedor_id_7c59d9c2_fk_ComprasAp` FOREIGN KEY (`proveedor_id`) REFERENCES `comprasapp_proveedor` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `pedidosapp_detallepedido`
--
ALTER TABLE `pedidosapp_detallepedido`
  ADD CONSTRAINT `PedidosApp_detallepe_pedido_id_b47e3c86_fk_PedidosAp` FOREIGN KEY (`pedido_id`) REFERENCES `pedidosapp_pedido` (`id`),
  ADD CONSTRAINT `PedidosApp_detallepe_plato_id_04709026_fk_PedidosAp` FOREIGN KEY (`plato_id`) REFERENCES `pedidosapp_plato` (`id`);

--
-- Filtros para la tabla `pedidosapp_detalleplato`
--
ALTER TABLE `pedidosapp_detalleplato`
  ADD CONSTRAINT `PedidosApp_detallepl_insumo_id_e5fcbf61_fk_ComprasAp` FOREIGN KEY (`insumo_id`) REFERENCES `comprasapp_insumo` (`id`),
  ADD CONSTRAINT `PedidosApp_detalleplato_plato_id_84058acb_fk_PedidosApp_plato_id` FOREIGN KEY (`plato_id`) REFERENCES `pedidosapp_plato` (`id`);

--
-- Filtros para la tabla `pedidosapp_pedido`
--
ALTER TABLE `pedidosapp_pedido`
  ADD CONSTRAINT `PedidosApp_pedido_cliente_id_236ec871_fk_PedidosApp_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `pedidosapp_cliente` (`id`),
  ADD CONSTRAINT `PedidosApp_pedido_mesa_id_e09223f9_fk_PedidosApp_mesa_id` FOREIGN KEY (`mesa_id`) REFERENCES `pedidosapp_mesa` (`id`),
  ADD CONSTRAINT `PedidosApp_pedido_usuarioRegistra_id_093d098e_fk_auth_user_id` FOREIGN KEY (`usuarioRegistra_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `PedidosApp_pedido_usuarioReparte_id_542997d7_fk_auth_user_id` FOREIGN KEY (`usuarioReparte_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
