/*
 Navicat Premium Data Transfer

 Source Server         : local_Discover
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : discover

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 08/09/2023 10:05:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accountant_date
-- ----------------------------
DROP TABLE IF EXISTS `accountant_date`;
CREATE TABLE `accountant_date`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `year` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '会计年',
  `day` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '结算天',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `day_type` tinyint UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accountant_date
-- ----------------------------

-- ----------------------------
-- Table structure for accountant_date_item
-- ----------------------------
DROP TABLE IF EXISTS `accountant_date_item`;
CREATE TABLE `accountant_date_item`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `accountant_date_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联id',
  `start_at` timestamp NULL DEFAULT NULL COMMENT '开始日期',
  `end_at` timestamp NULL DEFAULT NULL COMMENT '截止日期',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `month` tinyint UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accountant_date_item
-- ----------------------------

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL DEFAULT 0,
  `order` int NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '首页', 'feather icon-bar-chart-2', '/', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (2, 0, 2, '权限管理', 'feather icon-settings', NULL, '2023-08-21 13:43:34', '2023-08-28 10:12:28');
INSERT INTO `admin_menu` VALUES (3, 2, 3, '管理员', '', 'auth/users', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色', '', 'auth/roles', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限', '', 'auth/permissions', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单', '', 'auth/menu', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (7, 2, 7, '日志', '', 'auth/logs', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (8, 0, 8, '产品管理/제품 관리', 'fa-product-hunt', NULL, '2023-08-21 13:43:34', '2023-08-23 10:11:30');
INSERT INTO `admin_menu` VALUES (9, 8, 9, '产品档案/제품 파일', NULL, 'products', '2023-08-21 13:43:34', '2023-08-23 10:12:52');
INSERT INTO `admin_menu` VALUES (10, 8, 10, '产品单位/제품 단위', NULL, 'units', '2023-08-21 13:43:34', '2023-08-23 10:13:56');
INSERT INTO `admin_menu` VALUES (11, 8, 11, '产品属性/제품 속성', NULL, 'attrs', '2023-08-21 13:43:34', '2023-08-25 16:34:08');
INSERT INTO `admin_menu` VALUES (12, 0, 12, '采购管理/구매 관리', 'fa-cart-plus', NULL, '2023-08-21 13:43:34', '2023-08-25 16:34:38');
INSERT INTO `admin_menu` VALUES (13, 12, 13, '供应商档案/공급업체 파일', NULL, 'suppliers', '2023-08-21 13:43:34', '2023-08-25 17:06:02');
INSERT INTO `admin_menu` VALUES (14, 12, 14, '采购订购单/구매 주문서', NULL, 'purchase-orders', '2023-08-21 13:43:34', '2023-08-25 17:06:24');
INSERT INTO `admin_menu` VALUES (15, 12, 15, '采购入库单/구매 입고', NULL, 'purchase-in-orders', '2023-08-21 13:43:34', '2023-08-25 17:09:12');
INSERT INTO `admin_menu` VALUES (16, 0, 16, '库存管理/재고 관리', 'fa-ambulance', NULL, '2023-08-21 13:43:34', '2023-08-25 17:09:39');
INSERT INTO `admin_menu` VALUES (17, 16, 17, '产品库存/제품 재고', NULL, 'sku-stocks', '2023-08-21 13:43:34', '2023-08-25 17:10:35');
INSERT INTO `admin_menu` VALUES (18, 16, 18, '批次库存/재고 차수', NULL, 'sku-stock-batchs', '2023-08-21 13:43:34', '2023-08-25 17:11:53');
INSERT INTO `admin_menu` VALUES (19, 16, 19, '仓库库位/창고 위치', NULL, 'positions', '2023-08-21 13:43:34', '2023-08-25 17:12:25');
INSERT INTO `admin_menu` VALUES (20, 16, 20, '库存往来/재고 거래', NULL, 'stock-historys', '2023-08-21 13:43:34', '2023-08-25 17:12:54');
INSERT INTO `admin_menu` VALUES (21, 16, 21, '期初建账/기초 장부 작성', NULL, 'init-stock-orders', '2023-08-21 13:43:34', '2023-08-25 17:13:25');
INSERT INTO `admin_menu` VALUES (22, 0, 22, '销售管理/영업 관리', 'fa-calendar-minus-o', NULL, '2023-08-21 13:43:34', '2023-08-25 17:13:51');
INSERT INTO `admin_menu` VALUES (23, 22, 23, '客户档案/고객 프로필', NULL, 'customers', '2023-08-21 13:43:34', '2023-08-25 17:14:28');
INSERT INTO `admin_menu` VALUES (24, 22, 24, '付款人信息/지불자 정보', NULL, 'drawees', '2023-08-21 13:43:34', '2023-08-25 17:14:45');
INSERT INTO `admin_menu` VALUES (25, 22, 25, '客户订单/고객 주문서', NULL, 'sale-orders', '2023-08-21 13:43:34', '2023-08-28 09:02:41');
INSERT INTO `admin_menu` VALUES (26, 22, 26, '客户出货单/고객 배송 명세서', NULL, 'sale-out-orders', '2023-08-21 13:43:34', '2023-08-25 17:18:20');
INSERT INTO `admin_menu` VALUES (27, 22, 27, '客户退货单/고객 반품 명세서', NULL, 'sale-in-orders', '2023-08-21 13:43:34', '2023-08-25 17:18:38');
INSERT INTO `admin_menu` VALUES (28, 0, 28, '生产加工', 'fa-wrench', NULL, '2023-08-21 13:43:34', '2023-08-28 10:12:39');
INSERT INTO `admin_menu` VALUES (29, 28, 29, '生产任务', '', 'tasks', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (30, 28, 30, '生产工艺', '', 'crafts', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (31, 28, 31, '物料申领', '', 'apply-for-orders', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (32, 28, 32, '生产入库', '', 'make-product-orders', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (33, 0, 33, '盘点管理', 'fa-database', NULL, '2023-08-21 13:43:34', '2023-08-28 10:12:47');
INSERT INTO `admin_menu` VALUES (34, 33, 34, '盘点任务', '', 'inventorys', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (35, 33, 35, '盘点单据', '', 'inventory-orders', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (36, 0, 36, '财务管理', 'fa-money', NULL, '2023-08-21 13:43:34', '2023-08-28 10:12:55');
INSERT INTO `admin_menu` VALUES (37, 36, 37, '会计期', '', 'accountant-dates', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (38, 36, 38, '月结', '', 'month-settlements/create', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (39, 36, 39, '费用单', '', 'cost-orders', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (40, 36, 40, '结算单', '', 'statement-orders', '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_menu` VALUES (41, 0, 41, '报表中心/보고서 센터', 'fa-calendar', 'report-centers', '2023-08-21 13:43:34', '2023-08-25 17:19:00');
INSERT INTO `admin_menu` VALUES (42, 0, 9999, '需求反馈', 'fa-comment-o', 'demands', '2023-08-21 13:43:34', NULL);

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1460 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"ej1oF000ItoaD1oXJSbWoK250TbDZtBLCL0JpjAP\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-21 13:43:09', '2023-08-21 13:43:09');
INSERT INTO `admin_operation_log` VALUES (2, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"ej1oF000ItoaD1oXJSbWoK250TbDZtBLCL0JpjAP\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-21 13:43:38', '2023-08-21 13:43:38');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-21 13:43:38', '2023-08-21 13:43:38');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-21 13:43:48', '2023-08-21 13:43:48');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/units', 'GET', '127.0.0.1', '[]', '2023-08-21 13:43:50', '2023-08-21 13:43:50');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-08-21 13:43:50', '2023-08-21 13:43:50');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-08-21 13:43:52', '2023-08-21 13:43:52');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-08-21 13:43:53', '2023-08-21 13:43:53');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '[]', '2023-08-21 13:43:53', '2023-08-21 13:43:53');
INSERT INTO `admin_operation_log` VALUES (10, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-23 10:09:08', '2023-08-23 10:09:08');
INSERT INTO `admin_operation_log` VALUES (11, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"rI06x8zJrXcfyQGPEAbTdfB1tlgd5jhsbP1AsRjs\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-23 10:09:13', '2023-08-23 10:09:13');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-23 10:09:14', '2023-08-23 10:09:14');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-23 10:09:17', '2023-08-23 10:09:17');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '[]', '2023-08-23 10:09:30', '2023-08-23 10:09:30');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\\/\\uc81c\\ud488 \\uad00\\ub9ac\",\"icon\":\"fa-product-hunt\",\"uri\":null,\"roles\":[null],\"permissions\":null,\"_token\":\"qzdZiJi6xRVIaqshydTCJLbarhnBh5KdDQbN1JXQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-23 10:11:30', '2023-08-23 10:11:30');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-23 10:11:31', '2023-08-23 10:11:31');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-23 10:11:49', '2023-08-23 10:11:49');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '[]', '2023-08-23 10:11:53', '2023-08-23 10:11:53');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-23 10:12:23', '2023-08-23 10:12:23');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '[]', '2023-08-23 10:12:27', '2023-08-23 10:12:27');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4ea7\\u54c1\\u6863\\u6848\\/\\uc81c\\ud488 \\ud30c\\uc77c\",\"icon\":null,\"uri\":\"products\",\"roles\":[null],\"permissions\":null,\"_token\":\"qzdZiJi6xRVIaqshydTCJLbarhnBh5KdDQbN1JXQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-23 10:12:52', '2023-08-23 10:12:52');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-23 10:12:53', '2023-08-23 10:12:53');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-23 10:13:10', '2023-08-23 10:13:10');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '[]', '2023-08-23 10:13:12', '2023-08-23 10:13:12');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu/10', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4ea7\\u54c1\\u5355\\u4f4d\\/\\uc81c\\ud488 \\ub2e8\\uc704\",\"icon\":null,\"uri\":\"units\",\"roles\":[null],\"permissions\":null,\"_token\":\"qzdZiJi6xRVIaqshydTCJLbarhnBh5KdDQbN1JXQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-23 10:13:56', '2023-08-23 10:13:56');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-23 10:13:56', '2023-08-23 10:13:56');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu/10', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4ea7\\u54c1\\u5355\\u4f4d\\/\\uc81c\\ud488 \\ub2e8\\uc704\",\"icon\":null,\"uri\":\"units\",\"roles\":[null],\"permissions\":null,\"_token\":\"qzdZiJi6xRVIaqshydTCJLbarhnBh5KdDQbN1JXQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-23 10:14:00', '2023-08-23 10:14:00');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-23 10:14:00', '2023-08-23 10:14:00');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-23 10:14:09', '2023-08-23 10:14:09');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '[]', '2023-08-23 10:14:16', '2023-08-23 10:14:16');
INSERT INTO `admin_operation_log` VALUES (31, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-25 16:15:41', '2023-08-25 16:15:41');
INSERT INTO `admin_operation_log` VALUES (32, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"1F6wXF0j0WxP2lZRoNeIao0fCSt0BdalC0khYs9u\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-25 16:15:44', '2023-08-25 16:15:44');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-25 16:15:46', '2023-08-25 16:15:46');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-25 16:15:52', '2023-08-25 16:15:52');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 16:16:06', '2023-08-25 16:16:06');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-25 16:19:57', '2023-08-25 16:19:57');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 16:20:03', '2023-08-25 16:20:03');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 16:20:09', '2023-08-25 16:20:09');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 16:32:15', '2023-08-25 16:32:15');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 16:32:22', '2023-08-25 16:32:22');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 16:32:25', '2023-08-25 16:32:25');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 16:33:32', '2023-08-25 16:33:32');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4ea7\\u54c1\\u5c5e\\u6027\\/\\uc81c\\ud488 \\uc18d\\uc131\",\"icon\":null,\"uri\":\"attrs\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 16:34:08', '2023-08-25 16:34:08');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 16:34:08', '2023-08-25 16:34:08');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 16:34:10', '2023-08-25 16:34:10');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/auth/menu/12/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 16:34:17', '2023-08-25 16:34:17');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/auth/menu/12', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u91c7\\u8d2d\\u7ba1\\u7406\\/\\uad6c\\ub9e4 \\uad00\\ub9ac\",\"icon\":\"fa-cart-plus\",\"uri\":null,\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 16:34:38', '2023-08-25 16:34:38');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 16:34:38', '2023-08-25 16:34:38');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 16:34:40', '2023-08-25 16:34:40');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 16:35:52', '2023-08-25 16:35:52');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 16:36:07', '2023-08-25 16:36:07');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 16:39:00', '2023-08-25 16:39:00');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 16:39:16', '2023-08-25 16:39:16');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/auth/menu/12/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 16:39:34', '2023-08-25 16:39:34');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 16:39:59', '2023-08-25 16:39:59');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 16:40:34', '2023-08-25 16:40:34');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 16:40:39', '2023-08-25 16:40:39');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:05:57', '2023-08-25 17:05:57');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u4f9b\\u5e94\\u5546\\u6863\\u6848\\/\\uacf5\\uae09\\uc5c5\\uccb4 \\ud30c\\uc77c\",\"icon\":null,\"uri\":\"suppliers\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:06:02', '2023-08-25 17:06:02');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:06:03', '2023-08-25 17:06:03');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:06:04', '2023-08-25 17:06:04');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:06:09', '2023-08-25 17:06:09');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/auth/menu/14', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u91c7\\u8d2d\\u8ba2\\u8d2d\\u5355\\/\\uad6c\\ub9e4 \\uc8fc\\ubb38\\uc11c\",\"icon\":null,\"uri\":\"purchase-orders\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:06:24', '2023-08-25 17:06:24');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:06:24', '2023-08-25 17:06:24');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:06:26', '2023-08-25 17:06:26');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:06:48', '2023-08-25 17:06:48');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:07:03', '2023-08-25 17:07:03');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:07:14', '2023-08-25 17:07:14');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:07:25', '2023-08-25 17:07:25');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/auth/menu/12/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:07:36', '2023-08-25 17:07:36');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:07:44', '2023-08-25 17:07:44');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:07:54', '2023-08-25 17:07:54');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:08:02', '2023-08-25 17:08:02');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/auth/menu/15', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u91c7\\u8d2d\\u5165\\u5e93\\u5355\\/\\uad6c\\ub9e4 \\uc785\\uace0\",\"icon\":null,\"uri\":\"purchase-in-orders\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:09:12', '2023-08-25 17:09:12');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:09:12', '2023-08-25 17:09:12');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:09:14', '2023-08-25 17:09:14');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/auth/menu/16/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:09:25', '2023-08-25 17:09:25');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/auth/menu/16', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5e93\\u5b58\\u7ba1\\u7406\\/\\uc7ac\\uace0 \\uad00\\ub9ac\",\"icon\":\"fa-ambulance\",\"uri\":null,\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:09:39', '2023-08-25 17:09:39');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:09:39', '2023-08-25 17:09:39');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:09:40', '2023-08-25 17:09:40');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/auth/menu/17/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:09:44', '2023-08-25 17:09:44');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/auth/menu/17', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u4ea7\\u54c1\\u5e93\\u5b58\\/\\uc81c\\ud488 \\uc7ac\\uace0\",\"icon\":null,\"uri\":\"sku-stocks\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:10:35', '2023-08-25 17:10:35');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:10:35', '2023-08-25 17:10:35');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:10:37', '2023-08-25 17:10:37');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:10:44', '2023-08-25 17:10:44');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/auth/menu/18', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u6279\\u6b21\\u5e93\\u5b58\\/\\uc7ac\\uace0 \\ucc28\\uc218\",\"icon\":null,\"uri\":\"sku-stock-batchs\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:11:53', '2023-08-25 17:11:53');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:11:53', '2023-08-25 17:11:53');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:11:54', '2023-08-25 17:11:54');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/auth/menu/19/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:12:07', '2023-08-25 17:12:07');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/auth/menu/19', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u4ed3\\u5e93\\u5e93\\u4f4d\\/\\ucc3d\\uace0 \\uc704\\uce58\",\"icon\":null,\"uri\":\"positions\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:12:25', '2023-08-25 17:12:25');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:12:26', '2023-08-25 17:12:26');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:12:27', '2023-08-25 17:12:27');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/auth/menu/20/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:12:31', '2023-08-25 17:12:31');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/auth/menu/20', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u5e93\\u5b58\\u5f80\\u6765\\/\\uc7ac\\uace0 \\uac70\\ub798\",\"icon\":null,\"uri\":\"stock-historys\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:12:54', '2023-08-25 17:12:54');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:12:54', '2023-08-25 17:12:54');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:12:56', '2023-08-25 17:12:56');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/auth/menu/21/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:13:13', '2023-08-25 17:13:13');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/auth/menu/21', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u671f\\u521d\\u5efa\\u8d26\\/\\uae30\\ucd08 \\uc7a5\\ubd80 \\uc791\\uc131\",\"icon\":null,\"uri\":\"init-stock-orders\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:13:25', '2023-08-25 17:13:25');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:13:25', '2023-08-25 17:13:25');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:13:27', '2023-08-25 17:13:27');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/auth/menu/22/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:13:35', '2023-08-25 17:13:35');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/auth/menu/22', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u9500\\u552e\\u7ba1\\u7406\\/\\uc601\\uc5c5 \\uad00\\ub9ac\",\"icon\":\"fa-calendar-minus-o\",\"uri\":null,\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:13:51', '2023-08-25 17:13:51');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:13:51', '2023-08-25 17:13:51');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:13:53', '2023-08-25 17:13:53');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/auth/menu/23/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:13:58', '2023-08-25 17:13:58');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/auth/menu/23', 'PUT', '127.0.0.1', '{\"parent_id\":\"22\",\"title\":\"\\u5ba2\\u6237\\u6863\\u6848\\/\\uace0\\uac1d \\ud504\\ub85c\\ud544\",\"icon\":null,\"uri\":\"customers\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:14:28', '2023-08-25 17:14:28');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:14:28', '2023-08-25 17:14:28');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:14:30', '2023-08-25 17:14:30');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/auth/menu/24/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:14:40', '2023-08-25 17:14:40');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/auth/menu/24', 'PUT', '127.0.0.1', '{\"parent_id\":\"22\",\"title\":\"\\u4ed8\\u6b3e\\u4eba\\u4fe1\\u606f\\/\\uc9c0\\ubd88\\uc790 \\uc815\\ubcf4\",\"icon\":null,\"uri\":\"drawees\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:14:45', '2023-08-25 17:14:45');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:14:45', '2023-08-25 17:14:45');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:14:47', '2023-08-25 17:14:47');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/auth/menu/25/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:15:10', '2023-08-25 17:15:10');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/auth/menu/25', 'PUT', '127.0.0.1', '{\"parent_id\":\"22\",\"title\":\"\\u5ba2\\u6237\\u8981\\u8d27\\u5355\\/\\uace0\\uac1d \\uc8fc\\ubb38\\uc11c\",\"icon\":null,\"uri\":\"sale-orders\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:15:14', '2023-08-25 17:15:14');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:15:15', '2023-08-25 17:15:15');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/auth/menu/25/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:15:16', '2023-08-25 17:15:16');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:15:16', '2023-08-25 17:15:16');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/auth/menu/25/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:15:20', '2023-08-25 17:15:20');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/auth/menu/26/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:15:30', '2023-08-25 17:15:30');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/auth/menu/26', 'PUT', '127.0.0.1', '{\"parent_id\":\"22\",\"title\":\"\\u5ba2\\u6237\\u51fa\\u8d27\\u5355\\/\\uace0\\uac1d \\ubc30\\uc1a1 \\uba85\\uc138\\uc11c\",\"icon\":null,\"uri\":\"sale-out-orders\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:18:20', '2023-08-25 17:18:20');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:18:20', '2023-08-25 17:18:20');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:18:21', '2023-08-25 17:18:21');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/auth/menu/27/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:18:26', '2023-08-25 17:18:26');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/auth/menu/27', 'PUT', '127.0.0.1', '{\"parent_id\":\"22\",\"title\":\"\\u5ba2\\u6237\\u9000\\u8d27\\u5355\\/\\uace0\\uac1d \\ubc18\\ud488 \\uba85\\uc138\\uc11c\",\"icon\":null,\"uri\":\"sale-in-orders\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:18:38', '2023-08-25 17:18:38');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:18:38', '2023-08-25 17:18:38');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:18:40', '2023-08-25 17:18:40');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/auth/menu/41/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-25 17:18:46', '2023-08-25 17:18:46');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/auth/menu/41', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u62a5\\u8868\\u4e2d\\u5fc3\\/\\ubcf4\\uace0\\uc11c \\uc13c\\ud130\",\"icon\":\"fa-calendar\",\"uri\":\"report-centers\",\"roles\":[null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"PXKlFNqGuUvKVgd3x5ZBbNZm5vwtRJfxRXsDTpHQ\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-25 17:19:00', '2023-08-25 17:19:00');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-25 17:19:00', '2023-08-25 17:19:00');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-25 17:19:01', '2023-08-25 17:19:01');
INSERT INTO `admin_operation_log` VALUES (131, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-28 07:59:31', '2023-08-28 07:59:31');
INSERT INTO `admin_operation_log` VALUES (132, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"YGeLCD70v1detKzFPIvV8GMtc8pzDSodojMhPQSl\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-28 07:59:35', '2023-08-28 07:59:35');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 07:59:36', '2023-08-28 07:59:36');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/auth/menu/41/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 07:59:48', '2023-08-28 07:59:48');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 08:58:25', '2023-08-28 08:58:25');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 08:58:25', '2023-08-28 08:58:25');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 08:58:31', '2023-08-28 08:58:31');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"User\",\"name\":\"User\",\"permissions\":null,\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/roles\"}', '2023-08-28 08:59:01', '2023-08-28 08:59:01');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 08:59:01', '2023-08-28 08:59:01');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 08:59:04', '2023-08-28 08:59:04');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 08:59:08', '2023-08-28 08:59:08');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/auth/menu/8/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 08:59:12', '2023-08-28 08:59:12');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/auth/menu/8', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\\/\\uc81c\\ud488 \\uad00\\ub9ac\",\"icon\":\"fa-product-hunt\",\"uri\":null,\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 08:59:22', '2023-08-28 08:59:22');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 08:59:23', '2023-08-28 08:59:23');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 08:59:24', '2023-08-28 08:59:24');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 08:59:30', '2023-08-28 08:59:30');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4ea7\\u54c1\\u6863\\u6848\\/\\uc81c\\ud488 \\ud30c\\uc77c\",\"icon\":null,\"uri\":\"products\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 08:59:37', '2023-08-28 08:59:37');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 08:59:37', '2023-08-28 08:59:37');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 08:59:39', '2023-08-28 08:59:39');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 08:59:42', '2023-08-28 08:59:42');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/auth/menu/10', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4ea7\\u54c1\\u5355\\u4f4d\\/\\uc81c\\ud488 \\ub2e8\\uc704\",\"icon\":null,\"uri\":\"units\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 08:59:46', '2023-08-28 08:59:46');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 08:59:46', '2023-08-28 08:59:46');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 08:59:47', '2023-08-28 08:59:47');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 08:59:47', '2023-08-28 08:59:47');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 08:59:51', '2023-08-28 08:59:51');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4ea7\\u54c1\\u5c5e\\u6027\\/\\uc81c\\ud488 \\uc18d\\uc131\",\"icon\":null,\"uri\":\"attrs\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 08:59:55', '2023-08-28 08:59:55');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 08:59:55', '2023-08-28 08:59:55');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 08:59:57', '2023-08-28 08:59:57');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/auth/menu/12/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:00:03', '2023-08-28 09:00:03');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/auth/menu/12', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u91c7\\u8d2d\\u7ba1\\u7406\\/\\uad6c\\ub9e4 \\uad00\\ub9ac\",\"icon\":\"fa-cart-plus\",\"uri\":null,\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:00:06', '2023-08-28 09:00:06');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:00:06', '2023-08-28 09:00:06');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:00:08', '2023-08-28 09:00:08');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/auth/menu/13/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:00:11', '2023-08-28 09:00:11');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/auth/menu/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u4f9b\\u5e94\\u5546\\u6863\\u6848\\/\\uacf5\\uae09\\uc5c5\\uccb4 \\ud30c\\uc77c\",\"icon\":null,\"uri\":\"suppliers\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:00:17', '2023-08-28 09:00:17');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:00:17', '2023-08-28 09:00:17');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:00:18', '2023-08-28 09:00:18');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:00:22', '2023-08-28 09:00:22');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/auth/menu/14', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u91c7\\u8d2d\\u8ba2\\u8d2d\\u5355\\/\\uad6c\\ub9e4 \\uc8fc\\ubb38\\uc11c\",\"icon\":null,\"uri\":\"purchase-orders\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:00:26', '2023-08-28 09:00:26');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:00:26', '2023-08-28 09:00:26');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:00:28', '2023-08-28 09:00:28');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/auth/menu/20/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:00:35', '2023-08-28 09:00:35');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:00:44', '2023-08-28 09:00:44');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:00:47', '2023-08-28 09:00:47');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/auth/menu/15', 'PUT', '127.0.0.1', '{\"parent_id\":\"12\",\"title\":\"\\u91c7\\u8d2d\\u5165\\u5e93\\u5355\\/\\uad6c\\ub9e4 \\uc785\\uace0\",\"icon\":null,\"uri\":\"purchase-in-orders\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:00:51', '2023-08-28 09:00:51');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:00:51', '2023-08-28 09:00:51');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:00:53', '2023-08-28 09:00:53');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/auth/menu/17/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:00:56', '2023-08-28 09:00:56');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/auth/menu/17', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u4ea7\\u54c1\\u5e93\\u5b58\\/\\uc81c\\ud488 \\uc7ac\\uace0\",\"icon\":null,\"uri\":\"sku-stocks\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:01:00', '2023-08-28 09:01:00');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:01:01', '2023-08-28 09:01:01');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:01:02', '2023-08-28 09:01:02');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin/auth/menu/16/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:01:05', '2023-08-28 09:01:05');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/auth/menu/16', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u5e93\\u5b58\\u7ba1\\u7406\\/\\uc7ac\\uace0 \\uad00\\ub9ac\",\"icon\":\"fa-ambulance\",\"uri\":null,\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:01:09', '2023-08-28 09:01:09');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:01:09', '2023-08-28 09:01:09');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:01:10', '2023-08-28 09:01:10');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/auth/menu/18/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:01:16', '2023-08-28 09:01:16');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/auth/menu/18', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u6279\\u6b21\\u5e93\\u5b58\\/\\uc7ac\\uace0 \\ucc28\\uc218\",\"icon\":null,\"uri\":\"sku-stock-batchs\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:01:20', '2023-08-28 09:01:20');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:01:20', '2023-08-28 09:01:20');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:01:22', '2023-08-28 09:01:22');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/auth/menu/19/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:01:24', '2023-08-28 09:01:24');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/auth/menu/19', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u4ed3\\u5e93\\u5e93\\u4f4d\\/\\ucc3d\\uace0 \\uc704\\uce58\",\"icon\":null,\"uri\":\"positions\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:01:28', '2023-08-28 09:01:28');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:01:28', '2023-08-28 09:01:28');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:01:30', '2023-08-28 09:01:30');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/auth/menu/20/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:01:34', '2023-08-28 09:01:34');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/auth/menu/20', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u5e93\\u5b58\\u5f80\\u6765\\/\\uc7ac\\uace0 \\uac70\\ub798\",\"icon\":null,\"uri\":\"stock-historys\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:01:38', '2023-08-28 09:01:38');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:01:38', '2023-08-28 09:01:38');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:01:40', '2023-08-28 09:01:40');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/auth/menu/21/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:01:43', '2023-08-28 09:01:43');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/auth/menu/21', 'PUT', '127.0.0.1', '{\"parent_id\":\"16\",\"title\":\"\\u671f\\u521d\\u5efa\\u8d26\\/\\uae30\\ucd08 \\uc7a5\\ubd80 \\uc791\\uc131\",\"icon\":null,\"uri\":\"init-stock-orders\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:01:46', '2023-08-28 09:01:46');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:01:46', '2023-08-28 09:01:46');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:01:48', '2023-08-28 09:01:48');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/auth/menu/22/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:01:52', '2023-08-28 09:01:52');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/auth/menu/22', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u9500\\u552e\\u7ba1\\u7406\\/\\uc601\\uc5c5 \\uad00\\ub9ac\",\"icon\":\"fa-calendar-minus-o\",\"uri\":null,\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:01:56', '2023-08-28 09:01:56');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:01:56', '2023-08-28 09:01:56');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:01:57', '2023-08-28 09:01:57');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/auth/menu/23/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:02:00', '2023-08-28 09:02:00');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/auth/menu/23', 'PUT', '127.0.0.1', '{\"parent_id\":\"22\",\"title\":\"\\u5ba2\\u6237\\u6863\\u6848\\/\\uace0\\uac1d \\ud504\\ub85c\\ud544\",\"icon\":null,\"uri\":\"customers\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:02:03', '2023-08-28 09:02:03');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:02:04', '2023-08-28 09:02:04');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:02:05', '2023-08-28 09:02:05');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/auth/menu/23/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:02:09', '2023-08-28 09:02:09');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/auth/menu/24/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:02:14', '2023-08-28 09:02:14');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/auth/menu/24', 'PUT', '127.0.0.1', '{\"parent_id\":\"22\",\"title\":\"\\u4ed8\\u6b3e\\u4eba\\u4fe1\\u606f\\/\\uc9c0\\ubd88\\uc790 \\uc815\\ubcf4\",\"icon\":null,\"uri\":\"drawees\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:02:18', '2023-08-28 09:02:18');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:02:18', '2023-08-28 09:02:18');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:02:20', '2023-08-28 09:02:20');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/auth/menu/25/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:02:24', '2023-08-28 09:02:24');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/auth/menu/25', 'PUT', '127.0.0.1', '{\"parent_id\":\"22\",\"title\":\"\\u5ba2\\u6237\\u8ba2\\u5355\\/\\uace0\\uac1d \\uc8fc\\ubb38\\uc11c\",\"icon\":null,\"uri\":\"sale-orders\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:02:41', '2023-08-28 09:02:41');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:02:41', '2023-08-28 09:02:41');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:02:43', '2023-08-28 09:02:43');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/auth/menu/26/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:02:48', '2023-08-28 09:02:48');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/auth/menu/26', 'PUT', '127.0.0.1', '{\"parent_id\":\"22\",\"title\":\"\\u5ba2\\u6237\\u51fa\\u8d27\\u5355\\/\\uace0\\uac1d \\ubc30\\uc1a1 \\uba85\\uc138\\uc11c\",\"icon\":null,\"uri\":\"sale-out-orders\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:02:52', '2023-08-28 09:02:52');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:02:52', '2023-08-28 09:02:52');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:02:54', '2023-08-28 09:02:54');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin/auth/menu/26/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:02:57', '2023-08-28 09:02:57');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin/auth/menu/27/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:03:00', '2023-08-28 09:03:00');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/auth/menu/27', 'PUT', '127.0.0.1', '{\"parent_id\":\"22\",\"title\":\"\\u5ba2\\u6237\\u9000\\u8d27\\u5355\\/\\uace0\\uac1d \\ubc18\\ud488 \\uba85\\uc138\\uc11c\",\"icon\":null,\"uri\":\"sale-in-orders\",\"roles\":[\"1\",\"2\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 09:03:04', '2023-08-28 09:03:04');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:03:04', '2023-08-28 09:03:04');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:03:05', '2023-08-28 09:03:05');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:03:15', '2023-08-28 09:03:15');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:03:16', '2023-08-28 09:03:16');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:03:22', '2023-08-28 09:03:22');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"user\",\"name\":\"user\",\"avatar\":null,\"_file_\":null,\"password\":\"123******\",\"password_confirmation\":\"123******\",\"roles\":[\"2\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/users\"}', '2023-08-28 09:03:50', '2023-08-28 09:03:50');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:03:50', '2023-08-28 09:03:50');
INSERT INTO `admin_operation_log` VALUES (232, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-28 09:03:59', '2023-08-28 09:03:59');
INSERT INTO `admin_operation_log` VALUES (233, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"vrAcJwmKzbZu2CaWIjgxRJhkz6qszng67Py0XAFd\",\"username\":\"user\",\"password\":\"123******\"}', '2023-08-28 09:04:04', '2023-08-28 09:04:04');
INSERT INTO `admin_operation_log` VALUES (234, 2, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 09:04:04', '2023-08-28 09:04:04');
INSERT INTO `admin_operation_log` VALUES (235, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:04:08', '2023-08-28 09:04:08');
INSERT INTO `admin_operation_log` VALUES (236, 2, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:04:10', '2023-08-28 09:04:10');
INSERT INTO `admin_operation_log` VALUES (237, 2, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:04:11', '2023-08-28 09:04:11');
INSERT INTO `admin_operation_log` VALUES (238, 2, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:04:13', '2023-08-28 09:04:13');
INSERT INTO `admin_operation_log` VALUES (239, 2, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:04:14', '2023-08-28 09:04:14');
INSERT INTO `admin_operation_log` VALUES (240, 2, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:04:15', '2023-08-28 09:04:15');
INSERT INTO `admin_operation_log` VALUES (241, 2, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:04:16', '2023-08-28 09:04:16');
INSERT INTO `admin_operation_log` VALUES (242, 2, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:04:18', '2023-08-28 09:04:18');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:04:26', '2023-08-28 09:04:26');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:04:33', '2023-08-28 09:04:33');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:04:34', '2023-08-28 09:04:34');
INSERT INTO `admin_operation_log` VALUES (246, 2, 'admin/report-centers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:24:54', '2023-08-28 09:24:54');
INSERT INTO `admin_operation_log` VALUES (247, 2, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:24:58', '2023-08-28 09:24:58');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:25:06', '2023-08-28 09:25:06');
INSERT INTO `admin_operation_log` VALUES (249, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:25:15', '2023-08-28 09:25:15');
INSERT INTO `admin_operation_log` VALUES (250, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:25:18', '2023-08-28 09:25:18');
INSERT INTO `admin_operation_log` VALUES (251, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:25:27', '2023-08-28 09:25:27');
INSERT INTO `admin_operation_log` VALUES (252, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:25:28', '2023-08-28 09:25:28');
INSERT INTO `admin_operation_log` VALUES (253, 2, 'admin/auth/setting', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:26:06', '2023-08-28 09:26:06');
INSERT INTO `admin_operation_log` VALUES (254, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:26:09', '2023-08-28 09:26:09');
INSERT INTO `admin_operation_log` VALUES (255, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-28 09:26:10', '2023-08-28 09:26:10');
INSERT INTO `admin_operation_log` VALUES (256, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"AkPOf9kn6NS5e51M3hPTAu2nEkUVlH01r8XUCSjB\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-28 09:26:12', '2023-08-28 09:26:12');
INSERT INTO `admin_operation_log` VALUES (257, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-28 09:26:13', '2023-08-28 09:26:13');
INSERT INTO `admin_operation_log` VALUES (258, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:26:16', '2023-08-28 09:26:16');
INSERT INTO `admin_operation_log` VALUES (259, 1, 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:26:18', '2023-08-28 09:26:18');
INSERT INTO `admin_operation_log` VALUES (260, 1, 'admin/auth/permissions/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:26:35', '2023-08-28 09:26:35');
INSERT INTO `admin_operation_log` VALUES (261, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":null,\"slug\":\"productManager\",\"name\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":[null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:27:12', '2023-08-28 09:27:12');
INSERT INTO `admin_operation_log` VALUES (262, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:27:12', '2023-08-28 09:27:12');
INSERT INTO `admin_operation_log` VALUES (263, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:27:17', '2023-08-28 09:27:17');
INSERT INTO `admin_operation_log` VALUES (264, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"7\",\"slug\":\"products\",\"name\":\"\\u4ea7\\u54c1\\u6863\\u6848\",\"http_method\":[null],\"http_path\":[\"\\/products*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:28:21', '2023-08-28 09:28:21');
INSERT INTO `admin_operation_log` VALUES (265, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:28:22', '2023-08-28 09:28:22');
INSERT INTO `admin_operation_log` VALUES (266, 1, 'admin/auth/menu/10/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:28:37', '2023-08-28 09:28:37');
INSERT INTO `admin_operation_log` VALUES (267, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:28:45', '2023-08-28 09:28:45');
INSERT INTO `admin_operation_log` VALUES (268, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"7\",\"slug\":\"products-unit\",\"name\":\"\\u4ea7\\u54c1\\u5355\\u4f4d\",\"http_method\":[null],\"http_path\":[\"\\/units*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:29:35', '2023-08-28 09:29:35');
INSERT INTO `admin_operation_log` VALUES (269, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:29:35', '2023-08-28 09:29:35');
INSERT INTO `admin_operation_log` VALUES (270, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:34:27', '2023-08-28 09:34:27');
INSERT INTO `admin_operation_log` VALUES (271, 1, 'admin/auth/menu/12/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:34:40', '2023-08-28 09:34:40');
INSERT INTO `admin_operation_log` VALUES (272, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":null,\"slug\":\"purchaseManage\",\"name\":\"\\u91c7\\u8d2d\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":[null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:36:29', '2023-08-28 09:36:29');
INSERT INTO `admin_operation_log` VALUES (273, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:36:29', '2023-08-28 09:36:29');
INSERT INTO `admin_operation_log` VALUES (274, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:36:32', '2023-08-28 09:36:32');
INSERT INTO `admin_operation_log` VALUES (275, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:37:07', '2023-08-28 09:37:07');
INSERT INTO `admin_operation_log` VALUES (276, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:37:23', '2023-08-28 09:37:23');
INSERT INTO `admin_operation_log` VALUES (277, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:37:24', '2023-08-28 09:37:24');
INSERT INTO `admin_operation_log` VALUES (278, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"10\",\"slug\":\"supplier\",\"name\":\"\\u4f9b\\u5e94\\u5546\\u6863\\u6848\",\"http_method\":[null],\"http_path\":[\"\\/suppliers*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:37:45', '2023-08-28 09:37:45');
INSERT INTO `admin_operation_log` VALUES (279, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:37:45', '2023-08-28 09:37:45');
INSERT INTO `admin_operation_log` VALUES (280, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:37:48', '2023-08-28 09:37:48');
INSERT INTO `admin_operation_log` VALUES (281, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"10\",\"slug\":\"purchers-order\",\"name\":\"\\u91c7\\u8d2d\\u8ba2\\u8d2d\\u5355\",\"http_method\":[null],\"http_path\":[\"\\/purchase-orders*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:38:30', '2023-08-28 09:38:30');
INSERT INTO `admin_operation_log` VALUES (282, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:38:30', '2023-08-28 09:38:30');
INSERT INTO `admin_operation_log` VALUES (283, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:38:40', '2023-08-28 09:38:40');
INSERT INTO `admin_operation_log` VALUES (284, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":null,\"slug\":\"purchase-in-orders\",\"name\":\"\\u91c7\\u8d2d\\u5165\\u5e93\\u5355\",\"http_method\":[null],\"http_path\":[\"\\/purchase-in-orders*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:39:19', '2023-08-28 09:39:19');
INSERT INTO `admin_operation_log` VALUES (285, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:39:19', '2023-08-28 09:39:19');
INSERT INTO `admin_operation_log` VALUES (286, 1, 'admin/auth/permissions/13/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:39:22', '2023-08-28 09:39:22');
INSERT INTO `admin_operation_log` VALUES (287, 1, 'admin/auth/permissions/13', 'PUT', '127.0.0.1', '{\"parent_id\":\"10\",\"slug\":\"purchase-in-orders\",\"name\":\"\\u91c7\\u8d2d\\u5165\\u5e93\\u5355\",\"http_method\":[null],\"http_path\":[\"\\/purchase-in-orders*\",null],\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:39:27', '2023-08-28 09:39:27');
INSERT INTO `admin_operation_log` VALUES (288, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:39:27', '2023-08-28 09:39:27');
INSERT INTO `admin_operation_log` VALUES (289, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:39:42', '2023-08-28 09:39:42');
INSERT INTO `admin_operation_log` VALUES (290, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":null,\"slug\":\"Inventory-management\",\"name\":\"\\u5e93\\u5b58\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":[null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:40:28', '2023-08-28 09:40:28');
INSERT INTO `admin_operation_log` VALUES (291, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:40:28', '2023-08-28 09:40:28');
INSERT INTO `admin_operation_log` VALUES (292, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:40:30', '2023-08-28 09:40:30');
INSERT INTO `admin_operation_log` VALUES (293, 1, 'admin/auth/permissions/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:40:36', '2023-08-28 09:40:36');
INSERT INTO `admin_operation_log` VALUES (294, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"14\",\"slug\":\"sku-stocks\",\"name\":\"\\u4ea7\\u54c1\\u5e93\\u5b58\",\"http_method\":[null],\"http_path\":[\"\\/sku-stocks*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:41:41', '2023-08-28 09:41:41');
INSERT INTO `admin_operation_log` VALUES (295, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:41:41', '2023-08-28 09:41:41');
INSERT INTO `admin_operation_log` VALUES (296, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:41:44', '2023-08-28 09:41:44');
INSERT INTO `admin_operation_log` VALUES (297, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"15\",\"slug\":\"sku-stocks-batch\",\"name\":\"\\u6279\\u6b21\\u5e93\\u5b58\",\"http_method\":[null],\"http_path\":[\"\\/sku-stock-batchs*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:42:22', '2023-08-28 09:42:22');
INSERT INTO `admin_operation_log` VALUES (298, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:42:22', '2023-08-28 09:42:22');
INSERT INTO `admin_operation_log` VALUES (299, 1, 'admin/auth/permissions/16/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:42:26', '2023-08-28 09:42:26');
INSERT INTO `admin_operation_log` VALUES (300, 1, 'admin/auth/permissions/16', 'PUT', '127.0.0.1', '{\"parent_id\":\"14\",\"slug\":\"sku-stocks-batch\",\"name\":\"\\u6279\\u6b21\\u5e93\\u5b58\",\"http_method\":[null],\"http_path\":[\"\\/sku-stock-batchs*\",null],\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:42:29', '2023-08-28 09:42:29');
INSERT INTO `admin_operation_log` VALUES (301, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:42:29', '2023-08-28 09:42:29');
INSERT INTO `admin_operation_log` VALUES (302, 1, 'admin/auth/permissions/14/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:44:35', '2023-08-28 09:44:35');
INSERT INTO `admin_operation_log` VALUES (303, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:44:44', '2023-08-28 09:44:44');
INSERT INTO `admin_operation_log` VALUES (304, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"14\",\"slug\":\"positions\",\"name\":\"\\u4ed3\\u5e93\\u5e93\\u4f4d\",\"http_method\":[null],\"http_path\":[\"\\/positions*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\"}', '2023-08-28 09:45:06', '2023-08-28 09:45:06');
INSERT INTO `admin_operation_log` VALUES (305, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:45:07', '2023-08-28 09:45:07');
INSERT INTO `admin_operation_log` VALUES (306, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:58:15', '2023-08-28 09:58:15');
INSERT INTO `admin_operation_log` VALUES (307, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"14\",\"slug\":\"stock-histories\",\"name\":\"\\u5e93\\u5b58\\u5f80\\u6765\",\"http_method\":[null],\"http_path\":[\"\\/stock-historys*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 09:59:25', '2023-08-28 09:59:25');
INSERT INTO `admin_operation_log` VALUES (308, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 09:59:25', '2023-08-28 09:59:25');
INSERT INTO `admin_operation_log` VALUES (309, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 09:59:28', '2023-08-28 09:59:28');
INSERT INTO `admin_operation_log` VALUES (310, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"14\",\"slug\":\"init-stock-orders\",\"name\":\"\\u671f\\u521d\\u5efa\\u8d26\",\"http_method\":[null],\"http_path\":[\"\\/init-stock-orders*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 10:00:13', '2023-08-28 10:00:13');
INSERT INTO `admin_operation_log` VALUES (311, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:00:13', '2023-08-28 10:00:13');
INSERT INTO `admin_operation_log` VALUES (312, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:00:20', '2023-08-28 10:00:20');
INSERT INTO `admin_operation_log` VALUES (313, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":null,\"slug\":\"\\u9500\\u552e\\u7ba1\\u7406\",\"name\":\"saleManage\",\"http_method\":[null],\"http_path\":[null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 10:00:52', '2023-08-28 10:00:52');
INSERT INTO `admin_operation_log` VALUES (314, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:00:53', '2023-08-28 10:00:53');
INSERT INTO `admin_operation_log` VALUES (315, 1, 'admin/auth/permissions/20/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:00:57', '2023-08-28 10:00:57');
INSERT INTO `admin_operation_log` VALUES (316, 1, 'admin/auth/permissions/20', 'PUT', '127.0.0.1', '{\"parent_id\":null,\"slug\":\"saleManage\",\"name\":\"\\u9500\\u552e\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":[null],\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 10:01:04', '2023-08-28 10:01:04');
INSERT INTO `admin_operation_log` VALUES (317, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:01:04', '2023-08-28 10:01:04');
INSERT INTO `admin_operation_log` VALUES (318, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:01:06', '2023-08-28 10:01:06');
INSERT INTO `admin_operation_log` VALUES (319, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"20\",\"slug\":\"customers\",\"name\":\"\\u5ba2\\u6237\\u6863\\u6848\",\"http_method\":[null],\"http_path\":[\"\\/customers*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 10:01:43', '2023-08-28 10:01:43');
INSERT INTO `admin_operation_log` VALUES (320, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:01:43', '2023-08-28 10:01:43');
INSERT INTO `admin_operation_log` VALUES (321, 1, 'admin/auth/permissions/21/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:01:50', '2023-08-28 10:01:50');
INSERT INTO `admin_operation_log` VALUES (322, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:02:36', '2023-08-28 10:02:36');
INSERT INTO `admin_operation_log` VALUES (323, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"20\",\"slug\":\"drawss\",\"name\":\"\\u4ed8\\u6b3e\\u4eba\\u4fe1\\u606f\",\"http_method\":[null],\"http_path\":[\"\\/drawees*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\"}', '2023-08-28 10:03:02', '2023-08-28 10:03:02');
INSERT INTO `admin_operation_log` VALUES (324, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:03:02', '2023-08-28 10:03:02');
INSERT INTO `admin_operation_log` VALUES (325, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:03:05', '2023-08-28 10:03:05');
INSERT INTO `admin_operation_log` VALUES (326, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"20\",\"slug\":\"sale-orders\",\"name\":\"\\u5ba2\\u6237\\u8ba2\\u5355\",\"http_method\":[null],\"http_path\":[\"\\/sale-orders*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 10:03:25', '2023-08-28 10:03:25');
INSERT INTO `admin_operation_log` VALUES (327, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:03:25', '2023-08-28 10:03:25');
INSERT INTO `admin_operation_log` VALUES (328, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:04:00', '2023-08-28 10:04:00');
INSERT INTO `admin_operation_log` VALUES (329, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"20\",\"slug\":\"sale-out-orders\",\"name\":\"\\u5ba2\\u6237\\u51fa\\u8d27\\u5355\",\"http_method\":[null],\"http_path\":[\"\\/sale-out-orders*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 10:08:36', '2023-08-28 10:08:36');
INSERT INTO `admin_operation_log` VALUES (330, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:08:37', '2023-08-28 10:08:37');
INSERT INTO `admin_operation_log` VALUES (331, 1, 'admin/auth/permissions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:08:40', '2023-08-28 10:08:40');
INSERT INTO `admin_operation_log` VALUES (332, 1, 'admin/auth/permissions', 'POST', '127.0.0.1', '{\"parent_id\":\"20\",\"slug\":\"sale-in-orders\",\"name\":\"\\u5ba2\\u6237\\u9000\\u8d27\\u5355\",\"http_method\":[null],\"http_path\":[\"\\/sale-in-orders*\",null],\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/permissions\"}', '2023-08-28 10:09:16', '2023-08-28 10:09:16');
INSERT INTO `admin_operation_log` VALUES (333, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:09:16', '2023-08-28 10:09:16');
INSERT INTO `admin_operation_log` VALUES (334, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:09:19', '2023-08-28 10:09:19');
INSERT INTO `admin_operation_log` VALUES (335, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:09:21', '2023-08-28 10:09:21');
INSERT INTO `admin_operation_log` VALUES (336, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"User\",\"name\":\"User\",\"permissions\":\"8,9,11,12,13,15,16,17,18,19,21,22,23,24,25\",\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/roles\"}', '2023-08-28 10:09:31', '2023-08-28 10:09:31');
INSERT INTO `admin_operation_log` VALUES (337, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:09:32', '2023-08-28 10:09:32');
INSERT INTO `admin_operation_log` VALUES (338, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:09:34', '2023-08-28 10:09:34');
INSERT INTO `admin_operation_log` VALUES (339, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:09:35', '2023-08-28 10:09:35');
INSERT INTO `admin_operation_log` VALUES (340, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:09:53', '2023-08-28 10:09:53');
INSERT INTO `admin_operation_log` VALUES (341, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-28 10:09:53', '2023-08-28 10:09:53');
INSERT INTO `admin_operation_log` VALUES (342, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"2SLCxk5t5GVGd3hpZ7Lo1dzc6kBvdvZgkQJ45UAI\",\"username\":\"user\",\"password\":\"123******\"}', '2023-08-28 10:10:00', '2023-08-28 10:10:00');
INSERT INTO `admin_operation_log` VALUES (343, 2, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-28 10:10:00', '2023-08-28 10:10:00');
INSERT INTO `admin_operation_log` VALUES (344, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:10:03', '2023-08-28 10:10:03');
INSERT INTO `admin_operation_log` VALUES (345, 2, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:10:04', '2023-08-28 10:10:04');
INSERT INTO `admin_operation_log` VALUES (346, 2, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:10:05', '2023-08-28 10:10:05');
INSERT INTO `admin_operation_log` VALUES (347, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:12:05', '2023-08-28 10:12:05');
INSERT INTO `admin_operation_log` VALUES (348, 1, 'admin/auth/menu/11/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:12:12', '2023-08-28 10:12:12');
INSERT INTO `admin_operation_log` VALUES (349, 1, 'admin/auth/menu/11', 'PUT', '127.0.0.1', '{\"parent_id\":\"8\",\"title\":\"\\u4ea7\\u54c1\\u5c5e\\u6027\\/\\uc81c\\ud488 \\uc18d\\uc131\",\"icon\":null,\"uri\":\"attrs\",\"roles\":[\"1\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 10:12:19', '2023-08-28 10:12:19');
INSERT INTO `admin_operation_log` VALUES (350, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:12:19', '2023-08-28 10:12:19');
INSERT INTO `admin_operation_log` VALUES (351, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 10:12:21', '2023-08-28 10:12:21');
INSERT INTO `admin_operation_log` VALUES (352, 1, 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:12:24', '2023-08-28 10:12:24');
INSERT INTO `admin_operation_log` VALUES (353, 1, 'admin/auth/menu/2', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"feather icon-settings\",\"uri\":null,\"roles\":[\"1\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 10:12:28', '2023-08-28 10:12:28');
INSERT INTO `admin_operation_log` VALUES (354, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:12:28', '2023-08-28 10:12:28');
INSERT INTO `admin_operation_log` VALUES (355, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 10:12:30', '2023-08-28 10:12:30');
INSERT INTO `admin_operation_log` VALUES (356, 1, 'admin/auth/menu/28/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:12:34', '2023-08-28 10:12:34');
INSERT INTO `admin_operation_log` VALUES (357, 1, 'admin/auth/menu/28', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u751f\\u4ea7\\u52a0\\u5de5\",\"icon\":\"fa-wrench\",\"uri\":null,\"roles\":[\"1\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 10:12:39', '2023-08-28 10:12:39');
INSERT INTO `admin_operation_log` VALUES (358, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:12:39', '2023-08-28 10:12:39');
INSERT INTO `admin_operation_log` VALUES (359, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 10:12:41', '2023-08-28 10:12:41');
INSERT INTO `admin_operation_log` VALUES (360, 1, 'admin/auth/menu/33/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:12:44', '2023-08-28 10:12:44');
INSERT INTO `admin_operation_log` VALUES (361, 1, 'admin/auth/menu/33', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u76d8\\u70b9\\u7ba1\\u7406\",\"icon\":\"fa-database\",\"uri\":null,\"roles\":[\"1\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 10:12:47', '2023-08-28 10:12:47');
INSERT INTO `admin_operation_log` VALUES (362, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:12:48', '2023-08-28 10:12:48');
INSERT INTO `admin_operation_log` VALUES (363, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 10:12:49', '2023-08-28 10:12:49');
INSERT INTO `admin_operation_log` VALUES (364, 1, 'admin/auth/menu/36/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:12:52', '2023-08-28 10:12:52');
INSERT INTO `admin_operation_log` VALUES (365, 1, 'admin/auth/menu/36', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"icon\":\"fa-money\",\"uri\":null,\"roles\":[\"1\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 10:12:55', '2023-08-28 10:12:55');
INSERT INTO `admin_operation_log` VALUES (366, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:12:56', '2023-08-28 10:12:56');
INSERT INTO `admin_operation_log` VALUES (367, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 10:12:57', '2023-08-28 10:12:57');
INSERT INTO `admin_operation_log` VALUES (368, 1, 'admin/auth/menu/42/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:13:00', '2023-08-28 10:13:00');
INSERT INTO `admin_operation_log` VALUES (369, 1, 'admin/auth/menu/42', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u9700\\u6c42\\u53cd\\u9988\",\"icon\":\"fa-comment-o\",\"uri\":\"demands\",\"roles\":[\"1\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 10:13:02', '2023-08-28 10:13:02');
INSERT INTO `admin_operation_log` VALUES (370, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:13:02', '2023-08-28 10:13:02');
INSERT INTO `admin_operation_log` VALUES (371, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 10:13:04', '2023-08-28 10:13:04');
INSERT INTO `admin_operation_log` VALUES (372, 1, 'admin/auth/menu/41/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:13:07', '2023-08-28 10:13:07');
INSERT INTO `admin_operation_log` VALUES (373, 1, 'admin/auth/menu/41', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u62a5\\u8868\\u4e2d\\u5fc3\\/\\ubcf4\\uace0\\uc11c \\uc13c\\ud130\",\"icon\":\"fa-calendar\",\"uri\":\"report-centers\",\"roles\":[\"1\",null],\"permissions\":null,\"_method\":\"PUT\",\"_token\":\"0XCsHrkZIIrYHpmS8ziXAFB0OiuttwOBSF3MbUNK\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/auth\\/menu\"}', '2023-08-28 10:13:09', '2023-08-28 10:13:09');
INSERT INTO `admin_operation_log` VALUES (374, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:13:10', '2023-08-28 10:13:10');
INSERT INTO `admin_operation_log` VALUES (375, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-28 10:13:11', '2023-08-28 10:13:11');
INSERT INTO `admin_operation_log` VALUES (376, 2, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-08-28 10:13:16', '2023-08-28 10:13:16');
INSERT INTO `admin_operation_log` VALUES (377, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:13:19', '2023-08-28 10:13:19');
INSERT INTO `admin_operation_log` VALUES (378, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 10:14:47', '2023-08-28 10:14:47');
INSERT INTO `admin_operation_log` VALUES (379, 2, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:14:50', '2023-08-28 10:14:50');
INSERT INTO `admin_operation_log` VALUES (380, 2, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:14:52', '2023-08-28 10:14:52');
INSERT INTO `admin_operation_log` VALUES (381, 2, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:14:53', '2023-08-28 10:14:53');
INSERT INTO `admin_operation_log` VALUES (382, 2, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:14:54', '2023-08-28 10:14:54');
INSERT INTO `admin_operation_log` VALUES (383, 2, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:16:49', '2023-08-28 10:16:49');
INSERT INTO `admin_operation_log` VALUES (384, 2, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:16:51', '2023-08-28 10:16:51');
INSERT INTO `admin_operation_log` VALUES (385, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 10:22:17', '2023-08-28 10:22:17');
INSERT INTO `admin_operation_log` VALUES (386, 2, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:22:19', '2023-08-28 10:22:19');
INSERT INTO `admin_operation_log` VALUES (387, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 10:28:46', '2023-08-28 10:28:46');
INSERT INTO `admin_operation_log` VALUES (388, 2, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:28:48', '2023-08-28 10:28:48');
INSERT INTO `admin_operation_log` VALUES (389, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 10:29:29', '2023-08-28 10:29:29');
INSERT INTO `admin_operation_log` VALUES (390, 2, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:29:31', '2023-08-28 10:29:31');
INSERT INTO `admin_operation_log` VALUES (391, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 10:29:35', '2023-08-28 10:29:35');
INSERT INTO `admin_operation_log` VALUES (392, 2, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:29:36', '2023-08-28 10:29:36');
INSERT INTO `admin_operation_log` VALUES (393, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 10:33:52', '2023-08-28 10:33:52');
INSERT INTO `admin_operation_log` VALUES (394, 2, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:33:54', '2023-08-28 10:33:54');
INSERT INTO `admin_operation_log` VALUES (395, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 10:34:04', '2023-08-28 10:34:04');
INSERT INTO `admin_operation_log` VALUES (396, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 10:34:05', '2023-08-28 10:34:05');
INSERT INTO `admin_operation_log` VALUES (397, 2, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:34:07', '2023-08-28 10:34:07');
INSERT INTO `admin_operation_log` VALUES (398, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 10:49:04', '2023-08-28 10:49:04');
INSERT INTO `admin_operation_log` VALUES (399, 2, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 10:49:05', '2023-08-28 10:49:05');
INSERT INTO `admin_operation_log` VALUES (400, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 10:58:51', '2023-08-28 10:58:51');
INSERT INTO `admin_operation_log` VALUES (401, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 11:07:19', '2023-08-28 11:07:19');
INSERT INTO `admin_operation_log` VALUES (402, 2, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:14:25', '2023-08-28 11:14:25');
INSERT INTO `admin_operation_log` VALUES (403, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:14:26', '2023-08-28 11:14:26');
INSERT INTO `admin_operation_log` VALUES (404, 2, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:14:27', '2023-08-28 11:14:27');
INSERT INTO `admin_operation_log` VALUES (405, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:14:32', '2023-08-28 11:14:32');
INSERT INTO `admin_operation_log` VALUES (406, 2, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:14:34', '2023-08-28 11:14:34');
INSERT INTO `admin_operation_log` VALUES (407, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:14:47', '2023-08-28 11:14:47');
INSERT INTO `admin_operation_log` VALUES (408, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 11:16:11', '2023-08-28 11:16:11');
INSERT INTO `admin_operation_log` VALUES (409, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 11:16:28', '2023-08-28 11:16:28');
INSERT INTO `admin_operation_log` VALUES (410, 2, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:16:47', '2023-08-28 11:16:47');
INSERT INTO `admin_operation_log` VALUES (411, 2, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-08-28 11:16:50', '2023-08-28 11:16:50');
INSERT INTO `admin_operation_log` VALUES (412, 2, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:16:59', '2023-08-28 11:16:59');
INSERT INTO `admin_operation_log` VALUES (413, 2, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:16:59', '2023-08-28 11:16:59');
INSERT INTO `admin_operation_log` VALUES (414, 2, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 11:17:03', '2023-08-28 11:17:03');
INSERT INTO `admin_operation_log` VALUES (415, 2, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:17:17', '2023-08-28 11:17:17');
INSERT INTO `admin_operation_log` VALUES (416, 2, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:17:18', '2023-08-28 11:17:18');
INSERT INTO `admin_operation_log` VALUES (417, 2, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:17:19', '2023-08-28 11:17:19');
INSERT INTO `admin_operation_log` VALUES (418, 2, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:17:43', '2023-08-28 11:17:43');
INSERT INTO `admin_operation_log` VALUES (419, 2, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:17:47', '2023-08-28 11:17:47');
INSERT INTO `admin_operation_log` VALUES (420, 2, 'admin/positions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:17:49', '2023-08-28 11:17:49');
INSERT INTO `admin_operation_log` VALUES (421, 2, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:17:50', '2023-08-28 11:17:50');
INSERT INTO `admin_operation_log` VALUES (422, 2, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:17:51', '2023-08-28 11:17:51');
INSERT INTO `admin_operation_log` VALUES (423, 2, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:18:06', '2023-08-28 11:18:06');
INSERT INTO `admin_operation_log` VALUES (424, 2, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:18:18', '2023-08-28 11:18:18');
INSERT INTO `admin_operation_log` VALUES (425, 2, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:19:05', '2023-08-28 11:19:05');
INSERT INTO `admin_operation_log` VALUES (426, 2, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:29:56', '2023-08-28 11:29:56');
INSERT INTO `admin_operation_log` VALUES (427, 2, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:32:37', '2023-08-28 11:32:37');
INSERT INTO `admin_operation_log` VALUES (428, 2, 'admin/units/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 11:32:39', '2023-08-28 11:32:39');
INSERT INTO `admin_operation_log` VALUES (429, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 11:32:44', '2023-08-28 11:32:44');
INSERT INTO `admin_operation_log` VALUES (430, 2, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 11:32:45', '2023-08-28 11:32:45');
INSERT INTO `admin_operation_log` VALUES (431, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 11:33:33', '2023-08-28 11:33:33');
INSERT INTO `admin_operation_log` VALUES (432, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 11:33:35', '2023-08-28 11:33:35');
INSERT INTO `admin_operation_log` VALUES (433, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 11:33:35', '2023-08-28 11:33:35');
INSERT INTO `admin_operation_log` VALUES (434, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 11:33:47', '2023-08-28 11:33:47');
INSERT INTO `admin_operation_log` VALUES (435, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 11:33:48', '2023-08-28 11:33:48');
INSERT INTO `admin_operation_log` VALUES (436, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 11:34:36', '2023-08-28 11:34:36');
INSERT INTO `admin_operation_log` VALUES (437, 2, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 11:34:45', '2023-08-28 11:34:45');
INSERT INTO `admin_operation_log` VALUES (438, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-28 13:46:05', '2023-08-28 13:46:05');
INSERT INTO `admin_operation_log` VALUES (439, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"Z1Pwbm2TqtisSTrHZnu6li4DpcebJb3ZHd3R2PXe\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-28 13:46:12', '2023-08-28 13:46:12');
INSERT INTO `admin_operation_log` VALUES (440, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 13:46:13', '2023-08-28 13:46:13');
INSERT INTO `admin_operation_log` VALUES (441, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 13:48:41', '2023-08-28 13:48:41');
INSERT INTO `admin_operation_log` VALUES (442, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 13:50:26', '2023-08-28 13:50:26');
INSERT INTO `admin_operation_log` VALUES (443, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 13:50:30', '2023-08-28 13:50:30');
INSERT INTO `admin_operation_log` VALUES (444, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 14:00:51', '2023-08-28 14:00:51');
INSERT INTO `admin_operation_log` VALUES (445, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 14:00:55', '2023-08-28 14:00:55');
INSERT INTO `admin_operation_log` VALUES (446, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 14:02:02', '2023-08-28 14:02:02');
INSERT INTO `admin_operation_log` VALUES (447, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 14:02:04', '2023-08-28 14:02:04');
INSERT INTO `admin_operation_log` VALUES (448, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 14:02:06', '2023-08-28 14:02:06');
INSERT INTO `admin_operation_log` VALUES (449, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 14:09:42', '2023-08-28 14:09:42');
INSERT INTO `admin_operation_log` VALUES (450, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 14:09:43', '2023-08-28 14:09:43');
INSERT INTO `admin_operation_log` VALUES (451, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 14:09:46', '2023-08-28 14:09:46');
INSERT INTO `admin_operation_log` VALUES (452, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 14:10:04', '2023-08-28 14:10:04');
INSERT INTO `admin_operation_log` VALUES (453, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 14:13:35', '2023-08-28 14:13:35');
INSERT INTO `admin_operation_log` VALUES (454, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-28 14:20:19', '2023-08-28 14:20:19');
INSERT INTO `admin_operation_log` VALUES (455, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 14:20:26', '2023-08-28 14:20:26');
INSERT INTO `admin_operation_log` VALUES (456, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-08-28 14:20:28', '2023-08-28 14:20:28');
INSERT INTO `admin_operation_log` VALUES (457, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-08-28 14:20:40', '2023-08-28 14:20:40');
INSERT INTO `admin_operation_log` VALUES (458, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-08-28 14:24:52', '2023-08-28 14:24:52');
INSERT INTO `admin_operation_log` VALUES (459, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-08-28 14:30:10', '2023-08-28 14:30:10');
INSERT INTO `admin_operation_log` VALUES (460, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-08-28 14:56:14', '2023-08-28 14:56:14');
INSERT INTO `admin_operation_log` VALUES (461, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-08-28 15:12:35', '2023-08-28 15:12:35');
INSERT INTO `admin_operation_log` VALUES (462, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:12:48', '2023-08-28 15:12:48');
INSERT INTO `admin_operation_log` VALUES (463, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:12:49', '2023-08-28 15:12:49');
INSERT INTO `admin_operation_log` VALUES (464, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:12:54', '2023-08-28 15:12:54');
INSERT INTO `admin_operation_log` VALUES (465, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:12:55', '2023-08-28 15:12:55');
INSERT INTO `admin_operation_log` VALUES (466, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:12:58', '2023-08-28 15:12:58');
INSERT INTO `admin_operation_log` VALUES (467, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:13:02', '2023-08-28 15:13:02');
INSERT INTO `admin_operation_log` VALUES (468, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:13:03', '2023-08-28 15:13:03');
INSERT INTO `admin_operation_log` VALUES (469, 1, 'admin/units/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 15:13:10', '2023-08-28 15:13:10');
INSERT INTO `admin_operation_log` VALUES (470, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:13:14', '2023-08-28 15:13:14');
INSERT INTO `admin_operation_log` VALUES (471, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:22:30', '2023-08-28 15:22:30');
INSERT INTO `admin_operation_log` VALUES (472, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-08-28 15:33:33', '2023-08-28 15:33:33');
INSERT INTO `admin_operation_log` VALUES (473, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-08-28 15:33:57', '2023-08-28 15:33:57');
INSERT INTO `admin_operation_log` VALUES (474, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-08-28 15:34:35', '2023-08-28 15:34:35');
INSERT INTO `admin_operation_log` VALUES (475, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 15:34:39', '2023-08-28 15:34:39');
INSERT INTO `admin_operation_log` VALUES (476, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-08-28 15:34:53', '2023-08-28 15:34:53');
INSERT INTO `admin_operation_log` VALUES (477, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 15:34:54', '2023-08-28 15:34:54');
INSERT INTO `admin_operation_log` VALUES (478, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-08-28 15:35:12', '2023-08-28 15:35:12');
INSERT INTO `admin_operation_log` VALUES (479, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 15:35:13', '2023-08-28 15:35:13');
INSERT INTO `admin_operation_log` VALUES (480, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-08-28 15:35:59', '2023-08-28 15:35:59');
INSERT INTO `admin_operation_log` VALUES (481, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 15:36:02', '2023-08-28 15:36:02');
INSERT INTO `admin_operation_log` VALUES (482, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-28 15:40:07', '2023-08-28 15:40:07');
INSERT INTO `admin_operation_log` VALUES (483, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"RpLhC16NNKyqlhW79sYyedkYXgnXnT3LdjZcEltL\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-28 15:40:09', '2023-08-28 15:40:09');
INSERT INTO `admin_operation_log` VALUES (484, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-28 15:40:10', '2023-08-28 15:40:10');
INSERT INTO `admin_operation_log` VALUES (485, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:40:13', '2023-08-28 15:40:13');
INSERT INTO `admin_operation_log` VALUES (486, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:40:23', '2023-08-28 15:40:23');
INSERT INTO `admin_operation_log` VALUES (487, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:42:57', '2023-08-28 15:42:57');
INSERT INTO `admin_operation_log` VALUES (488, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 15:43:23', '2023-08-28 15:43:23');
INSERT INTO `admin_operation_log` VALUES (489, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-08-28 15:48:23', '2023-08-28 15:48:23');
INSERT INTO `admin_operation_log` VALUES (490, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-08-28 15:49:37', '2023-08-28 15:49:37');
INSERT INTO `admin_operation_log` VALUES (491, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-08-28 15:51:14', '2023-08-28 15:51:14');
INSERT INTO `admin_operation_log` VALUES (492, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-08-28 15:51:18', '2023-08-28 15:51:18');
INSERT INTO `admin_operation_log` VALUES (493, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 16:17:16', '2023-08-28 16:17:16');
INSERT INTO `admin_operation_log` VALUES (494, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 16:17:18', '2023-08-28 16:17:18');
INSERT INTO `admin_operation_log` VALUES (495, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-08-28 16:18:27', '2023-08-28 16:18:27');
INSERT INTO `admin_operation_log` VALUES (496, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 16:18:28', '2023-08-28 16:18:28');
INSERT INTO `admin_operation_log` VALUES (497, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-08-28 16:19:36', '2023-08-28 16:19:36');
INSERT INTO `admin_operation_log` VALUES (498, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 16:19:37', '2023-08-28 16:19:37');
INSERT INTO `admin_operation_log` VALUES (499, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 16:19:48', '2023-08-28 16:19:48');
INSERT INTO `admin_operation_log` VALUES (500, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-08-28 16:20:26', '2023-08-28 16:20:26');
INSERT INTO `admin_operation_log` VALUES (501, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-28 16:20:29', '2023-08-28 16:20:29');
INSERT INTO `admin_operation_log` VALUES (502, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 16:25:05', '2023-08-28 16:25:05');
INSERT INTO `admin_operation_log` VALUES (503, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-08-28 16:25:14', '2023-08-28 16:25:14');
INSERT INTO `admin_operation_log` VALUES (504, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 16:25:21', '2023-08-28 16:25:21');
INSERT INTO `admin_operation_log` VALUES (505, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 16:27:01', '2023-08-28 16:27:01');
INSERT INTO `admin_operation_log` VALUES (506, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-08-28 16:27:03', '2023-08-28 16:27:03');
INSERT INTO `admin_operation_log` VALUES (507, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 16:27:12', '2023-08-28 16:27:12');
INSERT INTO `admin_operation_log` VALUES (508, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 16:27:16', '2023-08-28 16:27:16');
INSERT INTO `admin_operation_log` VALUES (509, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 16:52:54', '2023-08-28 16:52:54');
INSERT INTO `admin_operation_log` VALUES (510, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-08-28 16:52:59', '2023-08-28 16:52:59');
INSERT INTO `admin_operation_log` VALUES (511, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 16:53:04', '2023-08-28 16:53:04');
INSERT INTO `admin_operation_log` VALUES (512, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-08-28 16:54:14', '2023-08-28 16:54:14');
INSERT INTO `admin_operation_log` VALUES (513, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 16:54:20', '2023-08-28 16:54:20');
INSERT INTO `admin_operation_log` VALUES (514, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:53:29', '2023-08-28 17:53:29');
INSERT INTO `admin_operation_log` VALUES (515, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-28 17:54:05', '2023-08-28 17:54:05');
INSERT INTO `admin_operation_log` VALUES (516, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"OzIFRV6HBEMzdECah64bIhlyR2MnLFUWgqy4MXWc\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-28 17:54:07', '2023-08-28 17:54:07');
INSERT INTO `admin_operation_log` VALUES (517, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-28 17:54:08', '2023-08-28 17:54:08');
INSERT INTO `admin_operation_log` VALUES (518, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:54:14', '2023-08-28 17:54:14');
INSERT INTO `admin_operation_log` VALUES (519, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-08-28 17:54:17', '2023-08-28 17:54:17');
INSERT INTO `admin_operation_log` VALUES (520, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:54:22', '2023-08-28 17:54:22');
INSERT INTO `admin_operation_log` VALUES (521, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:54:33', '2023-08-28 17:54:33');
INSERT INTO `admin_operation_log` VALUES (522, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:54:37', '2023-08-28 17:54:37');
INSERT INTO `admin_operation_log` VALUES (523, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:54:40', '2023-08-28 17:54:40');
INSERT INTO `admin_operation_log` VALUES (524, 1, 'admin/positions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:54:42', '2023-08-28 17:54:42');
INSERT INTO `admin_operation_log` VALUES (525, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:54:43', '2023-08-28 17:54:43');
INSERT INTO `admin_operation_log` VALUES (526, 1, 'admin/init-stock-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:54:45', '2023-08-28 17:54:45');
INSERT INTO `admin_operation_log` VALUES (527, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:54:47', '2023-08-28 17:54:47');
INSERT INTO `admin_operation_log` VALUES (528, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:54:48', '2023-08-28 17:54:48');
INSERT INTO `admin_operation_log` VALUES (529, 1, 'admin/crafts', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:55:00', '2023-08-28 17:55:00');
INSERT INTO `admin_operation_log` VALUES (530, 1, 'admin/tasks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:55:01', '2023-08-28 17:55:01');
INSERT INTO `admin_operation_log` VALUES (531, 1, 'admin/apply-for-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:55:02', '2023-08-28 17:55:02');
INSERT INTO `admin_operation_log` VALUES (532, 1, 'admin/make-product-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:55:04', '2023-08-28 17:55:04');
INSERT INTO `admin_operation_log` VALUES (533, 1, 'admin/inventorys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:55:06', '2023-08-28 17:55:06');
INSERT INTO `admin_operation_log` VALUES (534, 1, 'admin/inventory-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-28 17:55:07', '2023-08-28 17:55:07');
INSERT INTO `admin_operation_log` VALUES (535, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-29 08:19:17', '2023-08-29 08:19:17');
INSERT INTO `admin_operation_log` VALUES (536, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"mRsvyzGiQ9robeQgronJPxKne98eSx0iel5O5JMd\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-29 08:19:21', '2023-08-29 08:19:21');
INSERT INTO `admin_operation_log` VALUES (537, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-29 08:19:22', '2023-08-29 08:19:22');
INSERT INTO `admin_operation_log` VALUES (538, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:20:20', '2023-08-29 08:20:20');
INSERT INTO `admin_operation_log` VALUES (539, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-29 08:20:30', '2023-08-29 08:20:30');
INSERT INTO `admin_operation_log` VALUES (540, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-29 08:22:22', '2023-08-29 08:22:22');
INSERT INTO `admin_operation_log` VALUES (541, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-29 08:22:42', '2023-08-29 08:22:42');
INSERT INTO `admin_operation_log` VALUES (542, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-29 08:22:48', '2023-08-29 08:22:48');
INSERT INTO `admin_operation_log` VALUES (543, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-29 08:23:02', '2023-08-29 08:23:02');
INSERT INTO `admin_operation_log` VALUES (544, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-08-29 08:24:00', '2023-08-29 08:24:00');
INSERT INTO `admin_operation_log` VALUES (545, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:24:56', '2023-08-29 08:24:56');
INSERT INTO `admin_operation_log` VALUES (546, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:24:57', '2023-08-29 08:24:57');
INSERT INTO `admin_operation_log` VALUES (547, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-29 08:24:59', '2023-08-29 08:24:59');
INSERT INTO `admin_operation_log` VALUES (548, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-08-29 08:25:48', '2023-08-29 08:25:48');
INSERT INTO `admin_operation_log` VALUES (549, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:26:00', '2023-08-29 08:26:00');
INSERT INTO `admin_operation_log` VALUES (550, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-29 08:26:16', '2023-08-29 08:26:16');
INSERT INTO `admin_operation_log` VALUES (551, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"iJAlXeiGAMFsiJJ5TZvogwZzzXNTOTHGh422Ig53\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-29 08:26:20', '2023-08-29 08:26:20');
INSERT INTO `admin_operation_log` VALUES (552, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-29 08:26:20', '2023-08-29 08:26:20');
INSERT INTO `admin_operation_log` VALUES (553, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:26:51', '2023-08-29 08:26:51');
INSERT INTO `admin_operation_log` VALUES (554, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-29 08:26:51', '2023-08-29 08:26:51');
INSERT INTO `admin_operation_log` VALUES (555, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-29 08:27:00', '2023-08-29 08:27:00');
INSERT INTO `admin_operation_log` VALUES (556, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"DwTE2q0x3KTZOkOlOqkDmNwwpxJuuo5InrIo3KIW\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-29 08:27:39', '2023-08-29 08:27:39');
INSERT INTO `admin_operation_log` VALUES (557, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-29 08:27:40', '2023-08-29 08:27:40');
INSERT INTO `admin_operation_log` VALUES (558, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:27:49', '2023-08-29 08:27:49');
INSERT INTO `admin_operation_log` VALUES (559, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:27:59', '2023-08-29 08:27:59');
INSERT INTO `admin_operation_log` VALUES (560, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:28:00', '2023-08-29 08:28:00');
INSERT INTO `admin_operation_log` VALUES (561, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:30:29', '2023-08-29 08:30:29');
INSERT INTO `admin_operation_log` VALUES (562, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:56:04', '2023-08-29 08:56:04');
INSERT INTO `admin_operation_log` VALUES (563, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:56:06', '2023-08-29 08:56:06');
INSERT INTO `admin_operation_log` VALUES (564, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:56:15', '2023-08-29 08:56:15');
INSERT INTO `admin_operation_log` VALUES (565, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:56:35', '2023-08-29 08:56:35');
INSERT INTO `admin_operation_log` VALUES (566, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 08:57:01', '2023-08-29 08:57:01');
INSERT INTO `admin_operation_log` VALUES (567, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 09:04:17', '2023-08-29 09:04:17');
INSERT INTO `admin_operation_log` VALUES (568, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '[]', '2023-08-29 09:05:14', '2023-08-29 09:05:14');
INSERT INTO `admin_operation_log` VALUES (569, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '[]', '2023-08-29 09:05:33', '2023-08-29 09:05:33');
INSERT INTO `admin_operation_log` VALUES (570, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '[]', '2023-08-29 09:06:02', '2023-08-29 09:06:02');
INSERT INTO `admin_operation_log` VALUES (571, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '[]', '2023-08-29 09:06:15', '2023-08-29 09:06:15');
INSERT INTO `admin_operation_log` VALUES (572, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '[]', '2023-08-29 09:06:24', '2023-08-29 09:06:24');
INSERT INTO `admin_operation_log` VALUES (573, 1, 'admin/positions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 09:22:40', '2023-08-29 09:22:40');
INSERT INTO `admin_operation_log` VALUES (574, 1, 'admin/positions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 09:22:42', '2023-08-29 09:22:42');
INSERT INTO `admin_operation_log` VALUES (575, 1, 'admin/positions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-29 09:22:44', '2023-08-29 09:22:44');
INSERT INTO `admin_operation_log` VALUES (576, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 09:22:49', '2023-08-29 09:22:49');
INSERT INTO `admin_operation_log` VALUES (577, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 09:24:48', '2023-08-29 09:24:48');
INSERT INTO `admin_operation_log` VALUES (578, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 09:24:50', '2023-08-29 09:24:50');
INSERT INTO `admin_operation_log` VALUES (579, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 09:24:53', '2023-08-29 09:24:53');
INSERT INTO `admin_operation_log` VALUES (580, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 09:25:28', '2023-08-29 09:25:28');
INSERT INTO `admin_operation_log` VALUES (581, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 09:27:15', '2023-08-29 09:27:15');
INSERT INTO `admin_operation_log` VALUES (582, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 09:27:17', '2023-08-29 09:27:17');
INSERT INTO `admin_operation_log` VALUES (583, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 09:27:18', '2023-08-29 09:27:18');
INSERT INTO `admin_operation_log` VALUES (584, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 09:28:44', '2023-08-29 09:28:44');
INSERT INTO `admin_operation_log` VALUES (585, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 09:29:30', '2023-08-29 09:29:30');
INSERT INTO `admin_operation_log` VALUES (586, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 09:30:13', '2023-08-29 09:30:13');
INSERT INTO `admin_operation_log` VALUES (587, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 09:30:30', '2023-08-29 09:30:30');
INSERT INTO `admin_operation_log` VALUES (588, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 09:50:28', '2023-08-29 09:50:28');
INSERT INTO `admin_operation_log` VALUES (589, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 09:55:26', '2023-08-29 09:55:26');
INSERT INTO `admin_operation_log` VALUES (590, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 09:56:31', '2023-08-29 09:56:31');
INSERT INTO `admin_operation_log` VALUES (591, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-29 13:40:29', '2023-08-29 13:40:29');
INSERT INTO `admin_operation_log` VALUES (592, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-29 13:43:26', '2023-08-29 13:43:26');
INSERT INTO `admin_operation_log` VALUES (593, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"kEKAiWl4rJ5wG4v8Z2OqaoioPNFd36jjDfABc40m\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-29 13:43:28', '2023-08-29 13:43:28');
INSERT INTO `admin_operation_log` VALUES (594, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 13:43:29', '2023-08-29 13:43:29');
INSERT INTO `admin_operation_log` VALUES (595, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 13:46:15', '2023-08-29 13:46:15');
INSERT INTO `admin_operation_log` VALUES (596, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 13:46:58', '2023-08-29 13:46:58');
INSERT INTO `admin_operation_log` VALUES (597, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 13:46:59', '2023-08-29 13:46:59');
INSERT INTO `admin_operation_log` VALUES (598, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 13:47:01', '2023-08-29 13:47:01');
INSERT INTO `admin_operation_log` VALUES (599, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 13:47:05', '2023-08-29 13:47:05');
INSERT INTO `admin_operation_log` VALUES (600, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 13:47:07', '2023-08-29 13:47:07');
INSERT INTO `admin_operation_log` VALUES (601, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '[]', '2023-08-29 13:47:13', '2023-08-29 13:47:13');
INSERT INTO `admin_operation_log` VALUES (602, 1, 'admin/init-stock-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 13:48:48', '2023-08-29 13:48:48');
INSERT INTO `admin_operation_log` VALUES (603, 1, 'admin/init-stock-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-29 13:48:51', '2023-08-29 13:48:51');
INSERT INTO `admin_operation_log` VALUES (604, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-29 15:57:35', '2023-08-29 15:57:35');
INSERT INTO `admin_operation_log` VALUES (605, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"1uufCUZUm1H1i0a10ghNOLjcO8eZ0Pn48ipa1gJD\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-29 15:57:37', '2023-08-29 15:57:37');
INSERT INTO `admin_operation_log` VALUES (606, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-29 15:57:37', '2023-08-29 15:57:37');
INSERT INTO `admin_operation_log` VALUES (607, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 15:57:41', '2023-08-29 15:57:41');
INSERT INTO `admin_operation_log` VALUES (608, 1, 'admin/init-stock-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 15:57:42', '2023-08-29 15:57:42');
INSERT INTO `admin_operation_log` VALUES (609, 1, 'admin/init-stock-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 15:57:43', '2023-08-29 15:57:43');
INSERT INTO `admin_operation_log` VALUES (610, 1, 'admin/init-stock-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-29 15:57:45', '2023-08-29 15:57:45');
INSERT INTO `admin_operation_log` VALUES (611, 1, 'admin/init-stock-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 16:02:55', '2023-08-29 16:02:55');
INSERT INTO `admin_operation_log` VALUES (612, 1, 'admin/init-stock-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-29 16:02:57', '2023-08-29 16:02:57');
INSERT INTO `admin_operation_log` VALUES (613, 1, 'admin/init-stock-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 16:07:25', '2023-08-29 16:07:25');
INSERT INTO `admin_operation_log` VALUES (614, 1, 'admin/init-stock-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-29 16:07:27', '2023-08-29 16:07:27');
INSERT INTO `admin_operation_log` VALUES (615, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 16:08:01', '2023-08-29 16:08:01');
INSERT INTO `admin_operation_log` VALUES (616, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 16:09:06', '2023-08-29 16:09:06');
INSERT INTO `admin_operation_log` VALUES (617, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 17:08:57', '2023-08-29 17:08:57');
INSERT INTO `admin_operation_log` VALUES (618, 1, 'admin/drawees', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 17:09:04', '2023-08-29 17:09:04');
INSERT INTO `admin_operation_log` VALUES (619, 1, 'admin/drawees', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 17:09:05', '2023-08-29 17:09:05');
INSERT INTO `admin_operation_log` VALUES (620, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 17:09:07', '2023-08-29 17:09:07');
INSERT INTO `admin_operation_log` VALUES (621, 1, 'admin/sale-out-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 17:09:08', '2023-08-29 17:09:08');
INSERT INTO `admin_operation_log` VALUES (622, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 17:09:09', '2023-08-29 17:09:09');
INSERT INTO `admin_operation_log` VALUES (623, 1, 'admin/sale-out-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 17:09:10', '2023-08-29 17:09:10');
INSERT INTO `admin_operation_log` VALUES (624, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-08-29 17:09:10', '2023-08-29 17:09:10');
INSERT INTO `admin_operation_log` VALUES (625, 1, 'admin/sale-out-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-29 17:09:13', '2023-08-29 17:09:13');
INSERT INTO `admin_operation_log` VALUES (626, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-30 08:50:31', '2023-08-30 08:50:31');
INSERT INTO `admin_operation_log` VALUES (627, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"l16JwJ6SFCOq2Q0Ky8es1dYwwX0lHOucaSwTGWdP\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-30 08:50:33', '2023-08-30 08:50:33');
INSERT INTO `admin_operation_log` VALUES (628, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-30 08:50:34', '2023-08-30 08:50:34');
INSERT INTO `admin_operation_log` VALUES (629, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:50:37', '2023-08-30 08:50:37');
INSERT INTO `admin_operation_log` VALUES (630, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:50:40', '2023-08-30 08:50:40');
INSERT INTO `admin_operation_log` VALUES (631, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:50:41', '2023-08-30 08:50:41');
INSERT INTO `admin_operation_log` VALUES (632, 1, 'admin/drawees', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:50:46', '2023-08-30 08:50:46');
INSERT INTO `admin_operation_log` VALUES (633, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:50:47', '2023-08-30 08:50:47');
INSERT INTO `admin_operation_log` VALUES (634, 1, 'admin/drawees', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:50:49', '2023-08-30 08:50:49');
INSERT INTO `admin_operation_log` VALUES (635, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-30 08:53:28', '2023-08-30 08:53:28');
INSERT INTO `admin_operation_log` VALUES (636, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"e7JqBJrR7Sk2xbCVoGcQICmKH1mnepxmadnKNQ9G\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-30 08:53:31', '2023-08-30 08:53:31');
INSERT INTO `admin_operation_log` VALUES (637, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-30 08:53:32', '2023-08-30 08:53:32');
INSERT INTO `admin_operation_log` VALUES (638, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:53:35', '2023-08-30 08:53:35');
INSERT INTO `admin_operation_log` VALUES (639, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:53:49', '2023-08-30 08:53:49');
INSERT INTO `admin_operation_log` VALUES (640, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:55:24', '2023-08-30 08:55:24');
INSERT INTO `admin_operation_log` VALUES (641, 1, 'admin/drawees', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:55:25', '2023-08-30 08:55:25');
INSERT INTO `admin_operation_log` VALUES (642, 1, 'admin/drawees/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-30 08:55:26', '2023-08-30 08:55:26');
INSERT INTO `admin_operation_log` VALUES (643, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 08:57:17', '2023-08-30 08:57:17');
INSERT INTO `admin_operation_log` VALUES (644, 1, 'admin/sale-out-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:15:31', '2023-08-30 09:15:31');
INSERT INTO `admin_operation_log` VALUES (645, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:15:33', '2023-08-30 09:15:33');
INSERT INTO `admin_operation_log` VALUES (646, 1, 'admin/sale-out-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:15:34', '2023-08-30 09:15:34');
INSERT INTO `admin_operation_log` VALUES (647, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:15:35', '2023-08-30 09:15:35');
INSERT INTO `admin_operation_log` VALUES (648, 1, 'admin/sale-out-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:17:25', '2023-08-30 09:17:25');
INSERT INTO `admin_operation_log` VALUES (649, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-08-30 09:17:27', '2023-08-30 09:17:27');
INSERT INTO `admin_operation_log` VALUES (650, 1, 'admin/sale-out-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:17:30', '2023-08-30 09:17:30');
INSERT INTO `admin_operation_log` VALUES (651, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-08-30 09:17:31', '2023-08-30 09:17:31');
INSERT INTO `admin_operation_log` VALUES (652, 1, 'admin/sale-out-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:17:34', '2023-08-30 09:17:34');
INSERT INTO `admin_operation_log` VALUES (653, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:34:59', '2023-08-30 09:34:59');
INSERT INTO `admin_operation_log` VALUES (654, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:38:32', '2023-08-30 09:38:32');
INSERT INTO `admin_operation_log` VALUES (655, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:39:00', '2023-08-30 09:39:00');
INSERT INTO `admin_operation_log` VALUES (656, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:39:05', '2023-08-30 09:39:05');
INSERT INTO `admin_operation_log` VALUES (657, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:39:07', '2023-08-30 09:39:07');
INSERT INTO `admin_operation_log` VALUES (658, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '[]', '2023-08-30 09:39:07', '2023-08-30 09:39:07');
INSERT INTO `admin_operation_log` VALUES (659, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '[]', '2023-08-30 09:39:12', '2023-08-30 09:39:12');
INSERT INTO `admin_operation_log` VALUES (660, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:54:01', '2023-08-30 09:54:01');
INSERT INTO `admin_operation_log` VALUES (661, 1, 'admin/sale-in-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-30 09:54:03', '2023-08-30 09:54:03');
INSERT INTO `admin_operation_log` VALUES (662, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:56:16', '2023-08-30 09:56:16');
INSERT INTO `admin_operation_log` VALUES (663, 1, 'admin/sale-in-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-30 09:56:17', '2023-08-30 09:56:17');
INSERT INTO `admin_operation_log` VALUES (664, 1, 'admin/report-centers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:56:28', '2023-08-30 09:56:28');
INSERT INTO `admin_operation_log` VALUES (665, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:56:31', '2023-08-30 09:56:31');
INSERT INTO `admin_operation_log` VALUES (666, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:56:34', '2023-08-30 09:56:34');
INSERT INTO `admin_operation_log` VALUES (667, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 09:57:20', '2023-08-30 09:57:20');
INSERT INTO `admin_operation_log` VALUES (668, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-30 10:00:01', '2023-08-30 10:00:01');
INSERT INTO `admin_operation_log` VALUES (669, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-31 09:46:02', '2023-08-31 09:46:02');
INSERT INTO `admin_operation_log` VALUES (670, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"cXiGRLwBGPYnkSwmhToSyp728TysrE9fk8s76Lod\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-08-31 09:46:06', '2023-08-31 09:46:06');
INSERT INTO `admin_operation_log` VALUES (671, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-08-31 09:46:07', '2023-08-31 09:46:07');
INSERT INTO `admin_operation_log` VALUES (672, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-31 09:46:14', '2023-08-31 09:46:14');
INSERT INTO `admin_operation_log` VALUES (673, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-31 09:46:17', '2023-08-31 09:46:17');
INSERT INTO `admin_operation_log` VALUES (674, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-08-31 09:46:32', '2023-08-31 09:46:32');
INSERT INTO `admin_operation_log` VALUES (675, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"T922fL3p5VYgJEuvH4mrjBpVTm9H6vQaXMe8TxwK\",\"username\":\"user\",\"password\":\"123******\"}', '2023-08-31 09:46:42', '2023-08-31 09:46:42');
INSERT INTO `admin_operation_log` VALUES (676, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"T922fL3p5VYgJEuvH4mrjBpVTm9H6vQaXMe8TxwK\",\"username\":\"user\",\"password\":\"123******\"}', '2023-08-31 09:46:45', '2023-08-31 09:46:45');
INSERT INTO `admin_operation_log` VALUES (677, 2, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-08-31 09:46:46', '2023-08-31 09:46:46');
INSERT INTO `admin_operation_log` VALUES (678, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-31 09:46:49', '2023-08-31 09:46:49');
INSERT INTO `admin_operation_log` VALUES (679, 2, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-31 09:46:50', '2023-08-31 09:46:50');
INSERT INTO `admin_operation_log` VALUES (680, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-31 09:46:51', '2023-08-31 09:46:51');
INSERT INTO `admin_operation_log` VALUES (681, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-31 09:47:01', '2023-08-31 09:47:01');
INSERT INTO `admin_operation_log` VALUES (682, 2, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-08-31 10:06:13', '2023-08-31 10:06:13');
INSERT INTO `admin_operation_log` VALUES (683, 2, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-08-31 10:06:14', '2023-08-31 10:06:14');
INSERT INTO `admin_operation_log` VALUES (684, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-09-04 10:22:50', '2023-09-04 10:22:50');
INSERT INTO `admin_operation_log` VALUES (685, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"AekfM1TPyFHVPoyVmiPeG4VsoL53Wpsei7QwCoIh\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-09-04 10:22:54', '2023-09-04 10:22:54');
INSERT INTO `admin_operation_log` VALUES (686, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-09-04 10:22:54', '2023-09-04 10:22:54');
INSERT INTO `admin_operation_log` VALUES (687, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:22:57', '2023-09-04 10:22:57');
INSERT INTO `admin_operation_log` VALUES (688, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:22:59', '2023-09-04 10:22:59');
INSERT INTO `admin_operation_log` VALUES (689, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:24:06', '2023-09-04 10:24:06');
INSERT INTO `admin_operation_log` VALUES (690, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:24:07', '2023-09-04 10:24:07');
INSERT INTO `admin_operation_log` VALUES (691, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:24:51', '2023-09-04 10:24:51');
INSERT INTO `admin_operation_log` VALUES (692, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:24:52', '2023-09-04 10:24:52');
INSERT INTO `admin_operation_log` VALUES (693, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:25:42', '2023-09-04 10:25:42');
INSERT INTO `admin_operation_log` VALUES (694, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:25:43', '2023-09-04 10:25:43');
INSERT INTO `admin_operation_log` VALUES (695, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:26:03', '2023-09-04 10:26:03');
INSERT INTO `admin_operation_log` VALUES (696, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:29:44', '2023-09-04 10:29:44');
INSERT INTO `admin_operation_log` VALUES (697, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:29:51', '2023-09-04 10:29:51');
INSERT INTO `admin_operation_log` VALUES (698, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:36:36', '2023-09-04 10:36:36');
INSERT INTO `admin_operation_log` VALUES (699, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:36:38', '2023-09-04 10:36:38');
INSERT INTO `admin_operation_log` VALUES (700, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:37:59', '2023-09-04 10:37:59');
INSERT INTO `admin_operation_log` VALUES (701, 1, 'admin/units/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:38:01', '2023-09-04 10:38:01');
INSERT INTO `admin_operation_log` VALUES (702, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:41:22', '2023-09-04 10:41:22');
INSERT INTO `admin_operation_log` VALUES (703, 1, 'admin/units/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:41:23', '2023-09-04 10:41:23');
INSERT INTO `admin_operation_log` VALUES (704, 1, 'admin/units', 'POST', '127.0.0.1', '{\"name_zh\":\"\\u53f0\",\"name_ko\":\"\\ub300\",\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/units\"}', '2023-09-04 10:41:43', '2023-09-04 10:41:43');
INSERT INTO `admin_operation_log` VALUES (705, 1, 'admin/units', 'POST', '127.0.0.1', '{\"name_zh\":\"\\u53f0\",\"name_ko\":\"\\ub300\",\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/units\"}', '2023-09-04 10:41:47', '2023-09-04 10:41:47');
INSERT INTO `admin_operation_log` VALUES (706, 1, 'admin/units', 'POST', '127.0.0.1', '{\"name_zh\":\"\\u53f0\",\"name_ko\":\"\\ub300\",\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/units\"}', '2023-09-04 10:42:58', '2023-09-04 10:42:58');
INSERT INTO `admin_operation_log` VALUES (707, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:42:58', '2023-09-04 10:42:58');
INSERT INTO `admin_operation_log` VALUES (708, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:43:02', '2023-09-04 10:43:02');
INSERT INTO `admin_operation_log` VALUES (709, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:45:05', '2023-09-04 10:45:05');
INSERT INTO `admin_operation_log` VALUES (710, 1, 'admin/units/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:45:07', '2023-09-04 10:45:07');
INSERT INTO `admin_operation_log` VALUES (711, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:46:03', '2023-09-04 10:46:03');
INSERT INTO `admin_operation_log` VALUES (712, 1, 'admin/units/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:46:04', '2023-09-04 10:46:04');
INSERT INTO `admin_operation_log` VALUES (713, 1, 'admin/units', 'POST', '127.0.0.1', '{\"name\":null,\"name_zh\":\"\\u53f0\",\"name_ko\":\"\\ub300\",\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/units\"}', '2023-09-04 10:46:16', '2023-09-04 10:46:16');
INSERT INTO `admin_operation_log` VALUES (714, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:46:16', '2023-09-04 10:46:16');
INSERT INTO `admin_operation_log` VALUES (715, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:46:59', '2023-09-04 10:46:59');
INSERT INTO `admin_operation_log` VALUES (716, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:47:07', '2023-09-04 10:47:07');
INSERT INTO `admin_operation_log` VALUES (717, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:47:08', '2023-09-04 10:47:08');
INSERT INTO `admin_operation_log` VALUES (718, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:48:02', '2023-09-04 10:48:02');
INSERT INTO `admin_operation_log` VALUES (719, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 10:54:58', '2023-09-04 10:54:58');
INSERT INTO `admin_operation_log` VALUES (720, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 10:54:59', '2023-09-04 10:54:59');
INSERT INTO `admin_operation_log` VALUES (721, 1, 'admin/attrs', 'POST', '127.0.0.1', '{\"name\":null,\"name_zh\":\"\\u989c\\u8272\",\"name_ko\":\"\\uc0c9\\uc0c1\",\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/attrs\"}', '2023-09-04 11:02:42', '2023-09-04 11:02:42');
INSERT INTO `admin_operation_log` VALUES (722, 1, 'admin/attrs', 'POST', '127.0.0.1', '{\"name\":null,\"name_zh\":\"\\u989c\\u8272\",\"name_ko\":\"\\uc0c9\\uc0c1\",\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/attrs\"}', '2023-09-04 11:03:35', '2023-09-04 11:03:35');
INSERT INTO `admin_operation_log` VALUES (723, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:03:35', '2023-09-04 11:03:35');
INSERT INTO `admin_operation_log` VALUES (724, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Extensions_Expand_AttrValue\",\"key\":\"1\"}', '2023-09-04 11:03:37', '2023-09-04 11:03:37');
INSERT INTO `admin_operation_log` VALUES (725, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:03:52', '2023-09-04 11:03:52');
INSERT INTO `admin_operation_log` VALUES (726, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:04:25', '2023-09-04 11:04:25');
INSERT INTO `admin_operation_log` VALUES (727, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:04:26', '2023-09-04 11:04:26');
INSERT INTO `admin_operation_log` VALUES (728, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 11:04:28', '2023-09-04 11:04:28');
INSERT INTO `admin_operation_log` VALUES (729, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:07:20', '2023-09-04 11:07:20');
INSERT INTO `admin_operation_log` VALUES (730, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 11:07:21', '2023-09-04 11:07:21');
INSERT INTO `admin_operation_log` VALUES (731, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:12:22', '2023-09-04 11:12:22');
INSERT INTO `admin_operation_log` VALUES (732, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 11:12:24', '2023-09-04 11:12:24');
INSERT INTO `admin_operation_log` VALUES (733, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:22:37', '2023-09-04 11:22:37');
INSERT INTO `admin_operation_log` VALUES (734, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:22:39', '2023-09-04 11:22:39');
INSERT INTO `admin_operation_log` VALUES (735, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 11:22:43', '2023-09-04 11:22:43');
INSERT INTO `admin_operation_log` VALUES (736, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"00000001\",\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 11:23:15', '2023-09-04 11:23:15');
INSERT INTO `admin_operation_log` VALUES (737, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"00000001\",\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 11:23:19', '2023-09-04 11:23:19');
INSERT INTO `admin_operation_log` VALUES (738, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:40:19', '2023-09-04 11:40:19');
INSERT INTO `admin_operation_log` VALUES (739, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:40:19', '2023-09-04 11:40:19');
INSERT INTO `admin_operation_log` VALUES (740, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 11:40:20', '2023-09-04 11:40:20');
INSERT INTO `admin_operation_log` VALUES (741, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:41:32', '2023-09-04 11:41:32');
INSERT INTO `admin_operation_log` VALUES (742, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:41:35', '2023-09-04 11:41:35');
INSERT INTO `admin_operation_log` VALUES (743, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:41:36', '2023-09-04 11:41:36');
INSERT INTO `admin_operation_log` VALUES (744, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:42:04', '2023-09-04 11:42:04');
INSERT INTO `admin_operation_log` VALUES (745, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-09-04 11:42:08', '2023-09-04 11:42:08');
INSERT INTO `admin_operation_log` VALUES (746, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:42:10', '2023-09-04 11:42:10');
INSERT INTO `admin_operation_log` VALUES (747, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:42:10', '2023-09-04 11:42:10');
INSERT INTO `admin_operation_log` VALUES (748, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:51:32', '2023-09-04 11:51:32');
INSERT INTO `admin_operation_log` VALUES (749, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-09-04 11:51:35', '2023-09-04 11:51:35');
INSERT INTO `admin_operation_log` VALUES (750, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:51:37', '2023-09-04 11:51:37');
INSERT INTO `admin_operation_log` VALUES (751, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:51:38', '2023-09-04 11:51:38');
INSERT INTO `admin_operation_log` VALUES (752, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:52:34', '2023-09-04 11:52:34');
INSERT INTO `admin_operation_log` VALUES (753, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:52:42', '2023-09-04 11:52:42');
INSERT INTO `admin_operation_log` VALUES (754, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:52:56', '2023-09-04 11:52:56');
INSERT INTO `admin_operation_log` VALUES (755, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:55:30', '2023-09-04 11:55:30');
INSERT INTO `admin_operation_log` VALUES (756, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:55:50', '2023-09-04 11:55:50');
INSERT INTO `admin_operation_log` VALUES (757, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:56:13', '2023-09-04 11:56:13');
INSERT INTO `admin_operation_log` VALUES (758, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:56:18', '2023-09-04 11:56:18');
INSERT INTO `admin_operation_log` VALUES (759, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 11:56:55', '2023-09-04 11:56:55');
INSERT INTO `admin_operation_log` VALUES (760, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:57:26', '2023-09-04 11:57:26');
INSERT INTO `admin_operation_log` VALUES (761, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 11:57:27', '2023-09-04 11:57:27');
INSERT INTO `admin_operation_log` VALUES (762, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23369574\",\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 11:58:52', '2023-09-04 11:58:52');
INSERT INTO `admin_operation_log` VALUES (763, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:59:10', '2023-09-04 11:59:10');
INSERT INTO `admin_operation_log` VALUES (764, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 11:59:14', '2023-09-04 11:59:14');
INSERT INTO `admin_operation_log` VALUES (765, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 11:59:18', '2023-09-04 11:59:18');
INSERT INTO `admin_operation_log` VALUES (766, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 11:59:19', '2023-09-04 11:59:19');
INSERT INTO `admin_operation_log` VALUES (767, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 11:59:27', '2023-09-04 11:59:27');
INSERT INTO `admin_operation_log` VALUES (768, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 11:59:28', '2023-09-04 11:59:28');
INSERT INTO `admin_operation_log` VALUES (769, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23365894\",\"name_zh\":\"\\u7535\\u89c6\",\"name_ko\":\"\\ud154\\ub808\\ube44\\uc804\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:00:00', '2023-09-04 12:00:00');
INSERT INTO `admin_operation_log` VALUES (770, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23365894\",\"name_zh\":\"\\u7535\\u89c6\",\"name_ko\":\"\\ud154\\ub808\\ube44\\uc804\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:00:42', '2023-09-04 12:00:42');
INSERT INTO `admin_operation_log` VALUES (771, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 12:00:46', '2023-09-04 12:00:46');
INSERT INTO `admin_operation_log` VALUES (772, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 12:01:28', '2023-09-04 12:01:28');
INSERT INTO `admin_operation_log` VALUES (773, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23365596\",\"name_zh\":\"\\u6c34\\u676f\",\"name_ko\":null,\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:02:48', '2023-09-04 12:02:48');
INSERT INTO `admin_operation_log` VALUES (774, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23365596\",\"name_zh\":\"\\u6c34\\u676f\",\"name_ko\":\"\\ubb3c\\ucef5\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:02:58', '2023-09-04 12:02:58');
INSERT INTO `admin_operation_log` VALUES (775, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23365596\",\"name_zh\":\"\\u6c34\\u676f\",\"name_ko\":\"\\ubb3c\\ucef5\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:03:50', '2023-09-04 12:03:50');
INSERT INTO `admin_operation_log` VALUES (776, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23365596\",\"name_zh\":\"\\u6c34\\u676f\",\"name_ko\":\"\\ubb3c\\ucef5\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:03:58', '2023-09-04 12:03:58');
INSERT INTO `admin_operation_log` VALUES (777, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 12:04:11', '2023-09-04 12:04:11');
INSERT INTO `admin_operation_log` VALUES (778, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 12:04:12', '2023-09-04 12:04:12');
INSERT INTO `admin_operation_log` VALUES (779, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23368225\",\"name_zh\":\"\\u6c34\\u676f\",\"name_ko\":\"\\ubb3c\\ucef5\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:04:29', '2023-09-04 12:04:29');
INSERT INTO `admin_operation_log` VALUES (780, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23368225\",\"name_zh\":\"\\u6c34\\u676f\",\"name_ko\":\"\\ubb3c\\ucef5\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:04:47', '2023-09-04 12:04:47');
INSERT INTO `admin_operation_log` VALUES (781, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23368225\",\"name_zh\":\"\\u6c34\\u676f\",\"name_ko\":\"\\ubb3c\\ucef5\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:05:56', '2023-09-04 12:05:56');
INSERT INTO `admin_operation_log` VALUES (782, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 12:05:56', '2023-09-04 12:05:56');
INSERT INTO `admin_operation_log` VALUES (783, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 12:05:58', '2023-09-04 12:05:58');
INSERT INTO `admin_operation_log` VALUES (784, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 12:06:08', '2023-09-04 12:06:08');
INSERT INTO `admin_operation_log` VALUES (785, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23362609\",\"name\":null,\"name_zh\":\"\\u6c34\\u676f\",\"name_ko\":\"\\ubb3c\\ucef5\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"green\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:06:26', '2023-09-04 12:06:26');
INSERT INTO `admin_operation_log` VALUES (786, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 12:06:26', '2023-09-04 12:06:26');
INSERT INTO `admin_operation_log` VALUES (787, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 12:07:13', '2023-09-04 12:07:13');
INSERT INTO `admin_operation_log` VALUES (788, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 12:07:26', '2023-09-04 12:07:26');
INSERT INTO `admin_operation_log` VALUES (789, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-04 12:07:54', '2023-09-04 12:07:54');
INSERT INTO `admin_operation_log` VALUES (790, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 12:15:36', '2023-09-04 12:15:36');
INSERT INTO `admin_operation_log` VALUES (791, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 12:15:37', '2023-09-04 12:15:37');
INSERT INTO `admin_operation_log` VALUES (792, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 12:15:38', '2023-09-04 12:15:38');
INSERT INTO `admin_operation_log` VALUES (793, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"4\"}', '2023-09-04 12:15:52', '2023-09-04 12:15:52');
INSERT INTO `admin_operation_log` VALUES (794, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 12:29:31', '2023-09-04 12:29:31');
INSERT INTO `admin_operation_log` VALUES (795, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 12:29:33', '2023-09-04 12:29:33');
INSERT INTO `admin_operation_log` VALUES (796, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"item_no\":\"PD23364216\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-04 12:29:58', '2023-09-04 12:29:58');
INSERT INTO `admin_operation_log` VALUES (797, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 12:29:58', '2023-09-04 12:29:58');
INSERT INTO `admin_operation_log` VALUES (798, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 13:46:31', '2023-09-04 13:46:31');
INSERT INTO `admin_operation_log` VALUES (799, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 13:46:32', '2023-09-04 13:46:32');
INSERT INTO `admin_operation_log` VALUES (800, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 13:46:33', '2023-09-04 13:46:33');
INSERT INTO `admin_operation_log` VALUES (801, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 13:46:37', '2023-09-04 13:46:37');
INSERT INTO `admin_operation_log` VALUES (802, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 13:46:38', '2023-09-04 13:46:38');
INSERT INTO `admin_operation_log` VALUES (803, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 13:47:19', '2023-09-04 13:47:19');
INSERT INTO `admin_operation_log` VALUES (804, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 13:47:31', '2023-09-04 13:47:31');
INSERT INTO `admin_operation_log` VALUES (805, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 14:59:54', '2023-09-04 14:59:54');
INSERT INTO `admin_operation_log` VALUES (806, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 14:59:56', '2023-09-04 14:59:56');
INSERT INTO `admin_operation_log` VALUES (807, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:00:33', '2023-09-04 15:00:33');
INSERT INTO `admin_operation_log` VALUES (808, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:01:47', '2023-09-04 15:01:47');
INSERT INTO `admin_operation_log` VALUES (809, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-09-04 15:02:20', '2023-09-04 15:02:20');
INSERT INTO `admin_operation_log` VALUES (810, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:02:55', '2023-09-04 15:02:55');
INSERT INTO `admin_operation_log` VALUES (811, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:02:56', '2023-09-04 15:02:56');
INSERT INTO `admin_operation_log` VALUES (812, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:03:17', '2023-09-04 15:03:17');
INSERT INTO `admin_operation_log` VALUES (813, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-09-04 15:03:21', '2023-09-04 15:03:21');
INSERT INTO `admin_operation_log` VALUES (814, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-09-04 15:03:22', '2023-09-04 15:03:22');
INSERT INTO `admin_operation_log` VALUES (815, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:03:24', '2023-09-04 15:03:24');
INSERT INTO `admin_operation_log` VALUES (816, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:03:25', '2023-09-04 15:03:25');
INSERT INTO `admin_operation_log` VALUES (817, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:03:26', '2023-09-04 15:03:26');
INSERT INTO `admin_operation_log` VALUES (818, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:03:33', '2023-09-04 15:03:33');
INSERT INTO `admin_operation_log` VALUES (819, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:04:32', '2023-09-04 15:04:32');
INSERT INTO `admin_operation_log` VALUES (820, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:04:33', '2023-09-04 15:04:33');
INSERT INTO `admin_operation_log` VALUES (821, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:07:09', '2023-09-04 15:07:09');
INSERT INTO `admin_operation_log` VALUES (822, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:07:10', '2023-09-04 15:07:10');
INSERT INTO `admin_operation_log` VALUES (823, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"5\"}', '2023-09-04 15:09:23', '2023-09-04 15:09:23');
INSERT INTO `admin_operation_log` VALUES (824, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:24:52', '2023-09-04 15:24:52');
INSERT INTO `admin_operation_log` VALUES (825, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:24:53', '2023-09-04 15:24:53');
INSERT INTO `admin_operation_log` VALUES (826, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:24:56', '2023-09-04 15:24:56');
INSERT INTO `admin_operation_log` VALUES (827, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:24:59', '2023-09-04 15:24:59');
INSERT INTO `admin_operation_log` VALUES (828, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:25:01', '2023-09-04 15:25:01');
INSERT INTO `admin_operation_log` VALUES (829, 1, 'admin/sku-stock-batchs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:25:11', '2023-09-04 15:25:11');
INSERT INTO `admin_operation_log` VALUES (830, 1, 'admin/positions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:25:15', '2023-09-04 15:25:15');
INSERT INTO `admin_operation_log` VALUES (831, 1, 'admin/stock-historys', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:25:16', '2023-09-04 15:25:16');
INSERT INTO `admin_operation_log` VALUES (832, 1, 'admin/init-stock-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:25:21', '2023-09-04 15:25:21');
INSERT INTO `admin_operation_log` VALUES (833, 1, 'admin/init-stock-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:25:25', '2023-09-04 15:25:25');
INSERT INTO `admin_operation_log` VALUES (834, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"6\"}', '2023-09-04 15:25:32', '2023-09-04 15:25:32');
INSERT INTO `admin_operation_log` VALUES (835, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:26:16', '2023-09-04 15:26:16');
INSERT INTO `admin_operation_log` VALUES (836, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:26:17', '2023-09-04 15:26:17');
INSERT INTO `admin_operation_log` VALUES (837, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:26:19', '2023-09-04 15:26:19');
INSERT INTO `admin_operation_log` VALUES (838, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:26:19', '2023-09-04 15:26:19');
INSERT INTO `admin_operation_log` VALUES (839, 1, 'admin/suppliers', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"link\":null,\"link_zh\":\"\\u674e\",\"link_ko\":\"\\ub9ac\",\"pay_method\":\"0\",\"phone\":\"13116073110\",\"other\":\"test\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/suppliers\"}', '2023-09-04 15:27:01', '2023-09-04 15:27:01');
INSERT INTO `admin_operation_log` VALUES (840, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:27:01', '2023-09-04 15:27:01');
INSERT INTO `admin_operation_log` VALUES (841, 1, 'admin/suppliers/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:27:07', '2023-09-04 15:27:07');
INSERT INTO `admin_operation_log` VALUES (842, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-09-04 15:29:46', '2023-09-04 15:29:46');
INSERT INTO `admin_operation_log` VALUES (843, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:29:46', '2023-09-04 15:29:46');
INSERT INTO `admin_operation_log` VALUES (844, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:29:46', '2023-09-04 15:29:46');
INSERT INTO `admin_operation_log` VALUES (845, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:29:46', '2023-09-04 15:29:46');
INSERT INTO `admin_operation_log` VALUES (846, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:30:23', '2023-09-04 15:30:23');
INSERT INTO `admin_operation_log` VALUES (847, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:30:55', '2023-09-04 15:30:55');
INSERT INTO `admin_operation_log` VALUES (848, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:30:56', '2023-09-04 15:30:56');
INSERT INTO `admin_operation_log` VALUES (849, 1, 'admin/suppliers/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:30:59', '2023-09-04 15:30:59');
INSERT INTO `admin_operation_log` VALUES (850, 1, 'admin/suppliers', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"link\":null,\"name\":null,\"link_zh\":null,\"link_ko\":null,\"name_zh\":\"\\uacbd\\ub3d9\",\"pay_method\":\"0\",\"phone\":null,\"other\":null,\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/suppliers\"}', '2023-09-04 15:31:45', '2023-09-04 15:31:45');
INSERT INTO `admin_operation_log` VALUES (851, 1, 'admin/suppliers', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"link\":null,\"name\":null,\"link_zh\":\"\\u674e\",\"link_ko\":\"\\ub9ac\",\"name_zh\":\"\\uacbd\\ub3d9\",\"pay_method\":\"0\",\"phone\":\"13116073110\",\"other\":\"test\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/suppliers\"}', '2023-09-04 15:32:02', '2023-09-04 15:32:02');
INSERT INTO `admin_operation_log` VALUES (852, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:32:02', '2023-09-04 15:32:02');
INSERT INTO `admin_operation_log` VALUES (853, 1, 'admin/suppliers/2/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:32:10', '2023-09-04 15:32:10');
INSERT INTO `admin_operation_log` VALUES (854, 1, 'admin/suppliers/2', 'PUT', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"link\":\"\\u674e__\\ub9ac\",\"name\":\"\\uacbd\\ub3d9__\",\"link_zh\":\"\\u8d75\",\"link_ko\":\"\\uc870\",\"name_zh\":\"\\uacbd\\ub3d9\",\"pay_method\":\"0\",\"phone\":\"13116073110\",\"other\":\"test\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/suppliers\"}', '2023-09-04 15:34:58', '2023-09-04 15:34:58');
INSERT INTO `admin_operation_log` VALUES (855, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:34:58', '2023-09-04 15:34:58');
INSERT INTO `admin_operation_log` VALUES (856, 1, 'admin/suppliers/2/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:35:31', '2023-09-04 15:35:31');
INSERT INTO `admin_operation_log` VALUES (857, 1, 'admin/suppliers/2', 'PUT', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"link\":\"\\u8d75__\\uc870\",\"name\":\"\\uacbd\\ub3d9__\",\"link_zh\":\"\\u8d75\",\"link_ko\":\"\\uc870\",\"name_zh\":\"\\u4eac\\u4e1c\",\"name_ko\":\"\\uacbd\\ub3d9\",\"pay_method\":\"0\",\"phone\":\"13116073110\",\"other\":\"test\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/suppliers\"}', '2023-09-04 15:35:54', '2023-09-04 15:35:54');
INSERT INTO `admin_operation_log` VALUES (858, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:35:54', '2023-09-04 15:35:54');
INSERT INTO `admin_operation_log` VALUES (859, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:36:19', '2023-09-04 15:36:19');
INSERT INTO `admin_operation_log` VALUES (860, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:36:20', '2023-09-04 15:36:20');
INSERT INTO `admin_operation_log` VALUES (861, 1, 'admin/suppliers/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:36:23', '2023-09-04 15:36:23');
INSERT INTO `admin_operation_log` VALUES (862, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-09-04 15:36:27', '2023-09-04 15:36:27');
INSERT INTO `admin_operation_log` VALUES (863, 1, 'admin/suppliers', 'GET', '127.0.0.1', '[]', '2023-09-04 15:36:40', '2023-09-04 15:36:40');
INSERT INTO `admin_operation_log` VALUES (864, 1, 'admin/suppliers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:36:41', '2023-09-04 15:36:41');
INSERT INTO `admin_operation_log` VALUES (865, 1, 'admin/suppliers/2/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:36:43', '2023-09-04 15:36:43');
INSERT INTO `admin_operation_log` VALUES (866, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:39:08', '2023-09-04 15:39:08');
INSERT INTO `admin_operation_log` VALUES (867, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:39:09', '2023-09-04 15:39:09');
INSERT INTO `admin_operation_log` VALUES (868, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"6\"}', '2023-09-04 15:39:26', '2023-09-04 15:39:26');
INSERT INTO `admin_operation_log` VALUES (869, 1, 'admin/purchase-orders', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"order_no\":\"CG202309040001\",\"created_at\":\"2023-09-04 15:39:09\",\"status\":\"0\",\"supplier_id\":\"2\",\"other\":null,\"items\":{\"new_1\":{\"product_id\":\"6\",\"should_num\":\"10\",\"price\":\"2125.33\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/purchase-orders\"}', '2023-09-04 15:39:52', '2023-09-04 15:39:52');
INSERT INTO `admin_operation_log` VALUES (870, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:39:53', '2023-09-04 15:39:53');
INSERT INTO `admin_operation_log` VALUES (871, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 15:39:56', '2023-09-04 15:39:56');
INSERT INTO `admin_operation_log` VALUES (872, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:40:07', '2023-09-04 15:40:07');
INSERT INTO `admin_operation_log` VALUES (873, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 15:41:22', '2023-09-04 15:41:22');
INSERT INTO `admin_operation_log` VALUES (874, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:41:44', '2023-09-04 15:41:44');
INSERT INTO `admin_operation_log` VALUES (875, 1, 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"model\":\"PurchaseOrderModel\",\"slug\":\"purchase-order\",\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"_action\":\"App_Admin_Actions_Grid_BatchOrderPrint\",\"_key\":[\"1\"]}', '2023-09-04 15:42:13', '2023-09-04 15:42:13');
INSERT INTO `admin_operation_log` VALUES (876, 1, 'admin/order-prints', 'GET', '127.0.0.1', '{\"ids\":\"1\",\"model\":\"PurchaseOrderModel\",\"slug\":\"purchase-order\"}', '2023-09-04 15:42:13', '2023-09-04 15:42:13');
INSERT INTO `admin_operation_log` VALUES (877, 1, 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"model\":\"PurchaseOrderModel\",\"slug\":\"purchase-order\",\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"_action\":\"App_Admin_Actions_Grid_BatchOrderPrint\",\"_key\":[\"1\"]}', '2023-09-04 15:42:25', '2023-09-04 15:42:25');
INSERT INTO `admin_operation_log` VALUES (878, 1, 'admin/order-prints', 'GET', '127.0.0.1', '{\"ids\":\"1\",\"model\":\"PurchaseOrderModel\",\"slug\":\"purchase-order\"}', '2023-09-04 15:42:25', '2023-09-04 15:42:25');
INSERT INTO `admin_operation_log` VALUES (879, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 15:42:36', '2023-09-04 15:42:36');
INSERT INTO `admin_operation_log` VALUES (880, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:45:43', '2023-09-04 15:45:43');
INSERT INTO `admin_operation_log` VALUES (881, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 15:45:45', '2023-09-04 15:45:45');
INSERT INTO `admin_operation_log` VALUES (882, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:46:19', '2023-09-04 15:46:19');
INSERT INTO `admin_operation_log` VALUES (883, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:51:03', '2023-09-04 15:51:03');
INSERT INTO `admin_operation_log` VALUES (884, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:51:06', '2023-09-04 15:51:06');
INSERT INTO `admin_operation_log` VALUES (885, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 15:51:10', '2023-09-04 15:51:10');
INSERT INTO `admin_operation_log` VALUES (886, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:51:15', '2023-09-04 15:51:15');
INSERT INTO `admin_operation_log` VALUES (887, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:51:43', '2023-09-04 15:51:43');
INSERT INTO `admin_operation_log` VALUES (888, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"6\"}', '2023-09-04 15:51:47', '2023-09-04 15:51:47');
INSERT INTO `admin_operation_log` VALUES (889, 1, 'admin/purchase-orders', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"order_no\":\"CG202309040002\",\"created_at\":\"2023-09-04 15:51:43\",\"status\":\"0\",\"supplier_id\":\"2\",\"other\":null,\"items\":{\"new_1\":{\"product_id\":\"6\",\"should_num\":\"5\",\"price\":\"2500\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/purchase-orders\"}', '2023-09-04 15:52:23', '2023-09-04 15:52:23');
INSERT INTO `admin_operation_log` VALUES (890, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:52:23', '2023-09-04 15:52:23');
INSERT INTO `admin_operation_log` VALUES (891, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 15:52:26', '2023-09-04 15:52:26');
INSERT INTO `admin_operation_log` VALUES (892, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 15:52:29', '2023-09-04 15:52:29');
INSERT INTO `admin_operation_log` VALUES (893, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-04 15:58:07', '2023-09-04 15:58:07');
INSERT INTO `admin_operation_log` VALUES (894, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:58:09', '2023-09-04 15:58:09');
INSERT INTO `admin_operation_log` VALUES (895, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"4\"}', '2023-09-04 15:58:40', '2023-09-04 15:58:40');
INSERT INTO `admin_operation_log` VALUES (896, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-04 15:58:59', '2023-09-04 15:58:59');
INSERT INTO `admin_operation_log` VALUES (897, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 15:59:01', '2023-09-04 15:59:01');
INSERT INTO `admin_operation_log` VALUES (898, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"4\"}', '2023-09-04 15:59:05', '2023-09-04 15:59:05');
INSERT INTO `admin_operation_log` VALUES (899, 1, 'admin/purchase-orders', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"order_no\":\"CG202309040003\",\"created_at\":\"2023-09-04 15:59:01\",\"status\":\"0\",\"supplier_id\":\"2\",\"other\":null,\"items\":{\"new_1\":{\"product_id\":\"4\",\"should_num\":\"3\",\"price\":\"21.11\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/purchase-orders\"}', '2023-09-04 15:59:12', '2023-09-04 15:59:12');
INSERT INTO `admin_operation_log` VALUES (900, 1, 'admin/purchase-orders', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"order_no\":\"CG202309040003\",\"created_at\":\"2023-09-04 15:59:01\",\"status\":\"0\",\"supplier_id\":\"2\",\"other\":null,\"items\":{\"new_1\":{\"product_id\":\"4\",\"should_num\":\"3\",\"price\":\"21.11\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/purchase-orders\"}', '2023-09-04 16:00:35', '2023-09-04 16:00:35');
INSERT INTO `admin_operation_log` VALUES (901, 1, 'admin/purchase-orders', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"order_no\":\"CG202309040003\",\"created_at\":\"2023-09-04 15:59:01\",\"status\":\"0\",\"supplier_id\":\"2\",\"other\":null,\"items\":{\"new_1\":{\"product_id\":\"4\",\"should_num\":\"3\",\"price\":\"21.11\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/purchase-orders\"}', '2023-09-04 16:01:01', '2023-09-04 16:01:01');
INSERT INTO `admin_operation_log` VALUES (902, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-04 16:01:06', '2023-09-04 16:01:06');
INSERT INTO `admin_operation_log` VALUES (903, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 16:01:07', '2023-09-04 16:01:07');
INSERT INTO `admin_operation_log` VALUES (904, 1, 'admin/purchase-orders', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"order_no\":\"CG202309040003\",\"created_at\":\"2023-09-04 16:01:07\",\"status\":\"0\",\"supplier_id\":\"2\",\"other\":\"test\",\"items\":{\"new_1\":{\"product_id\":\"4\",\"should_num\":\"3\",\"price\":\"21\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/purchase-orders\"}', '2023-09-04 16:01:16', '2023-09-04 16:01:16');
INSERT INTO `admin_operation_log` VALUES (905, 1, 'admin/purchase-orders', 'POST', '127.0.0.1', '{\"_token\":\"G9OgElOiLDM2dlyniasAZ6OmVFIRFZtVtRFjuQNT\",\"order_no\":\"CG202309040003\",\"created_at\":\"2023-09-04 16:01:07\",\"status\":\"0\",\"supplier_id\":\"2\",\"other\":\"test\",\"items\":{\"new_1\":{\"product_id\":\"4\",\"should_num\":\"3\",\"price\":\"21\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/purchase-orders\"}', '2023-09-04 16:08:35', '2023-09-04 16:08:35');
INSERT INTO `admin_operation_log` VALUES (906, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-04 16:24:08', '2023-09-04 16:24:08');
INSERT INTO `admin_operation_log` VALUES (907, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-04 16:24:10', '2023-09-04 16:24:10');
INSERT INTO `admin_operation_log` VALUES (908, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 16:24:12', '2023-09-04 16:24:12');
INSERT INTO `admin_operation_log` VALUES (909, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-04 16:24:53', '2023-09-04 16:24:53');
INSERT INTO `admin_operation_log` VALUES (910, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 16:24:55', '2023-09-04 16:24:55');
INSERT INTO `admin_operation_log` VALUES (911, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 16:24:58', '2023-09-04 16:24:58');
INSERT INTO `admin_operation_log` VALUES (912, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 16:24:59', '2023-09-04 16:24:59');
INSERT INTO `admin_operation_log` VALUES (913, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 16:25:04', '2023-09-04 16:25:04');
INSERT INTO `admin_operation_log` VALUES (914, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-04 16:33:18', '2023-09-04 16:33:18');
INSERT INTO `admin_operation_log` VALUES (915, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 16:33:20', '2023-09-04 16:33:20');
INSERT INTO `admin_operation_log` VALUES (916, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-04 16:34:07', '2023-09-04 16:34:07');
INSERT INTO `admin_operation_log` VALUES (917, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-04 16:34:08', '2023-09-04 16:34:08');
INSERT INTO `admin_operation_log` VALUES (918, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-09-05 08:19:03', '2023-09-05 08:19:03');
INSERT INTO `admin_operation_log` VALUES (919, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"uAIx0kglSrvu2rp3PNadHabVEdarlg0Gr1p8qdHW\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-09-05 08:19:06', '2023-09-05 08:19:06');
INSERT INTO `admin_operation_log` VALUES (920, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2023-09-05 08:19:06', '2023-09-05 08:19:06');
INSERT INTO `admin_operation_log` VALUES (921, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:19:11', '2023-09-05 08:19:11');
INSERT INTO `admin_operation_log` VALUES (922, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:19:51', '2023-09-05 08:19:51');
INSERT INTO `admin_operation_log` VALUES (923, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-09-05 08:19:53', '2023-09-05 08:19:53');
INSERT INTO `admin_operation_log` VALUES (924, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:19:55', '2023-09-05 08:19:55');
INSERT INTO `admin_operation_log` VALUES (925, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:19:56', '2023-09-05 08:19:56');
INSERT INTO `admin_operation_log` VALUES (926, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-05 08:19:58', '2023-09-05 08:19:58');
INSERT INTO `admin_operation_log` VALUES (927, 1, 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"table\":\"purchase_order\",\"model\":\"PurchaseOrderModel\",\"review_status\":\"1\",\"id\":\"2\",\"_token\":\"19U1rURlbZ3KtUuVj1T06MlEPji528znjKsKJGDG\",\"_action\":\"App_Admin_Actions_Grid_OrderReview\",\"_key\":null}', '2023-09-05 08:20:05', '2023-09-05 08:20:05');
INSERT INTO `admin_operation_log` VALUES (928, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:20:05', '2023-09-05 08:20:05');
INSERT INTO `admin_operation_log` VALUES (929, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:20:10', '2023-09-05 08:20:10');
INSERT INTO `admin_operation_log` VALUES (930, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:20:12', '2023-09-05 08:20:12');
INSERT INTO `admin_operation_log` VALUES (931, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-05 08:20:14', '2023-09-05 08:20:14');
INSERT INTO `admin_operation_log` VALUES (932, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:20:20', '2023-09-05 08:20:20');
INSERT INTO `admin_operation_log` VALUES (933, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:20:21', '2023-09-05 08:20:21');
INSERT INTO `admin_operation_log` VALUES (934, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:20:23', '2023-09-05 08:20:23');
INSERT INTO `admin_operation_log` VALUES (935, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-05 08:20:26', '2023-09-05 08:20:26');
INSERT INTO `admin_operation_log` VALUES (936, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:20:37', '2023-09-05 08:20:37');
INSERT INTO `admin_operation_log` VALUES (937, 1, 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"model\":\"PurchaseOrderModel\",\"slug\":\"purchase-order\",\"_token\":\"19U1rURlbZ3KtUuVj1T06MlEPji528znjKsKJGDG\",\"_action\":\"App_Admin_Actions_Grid_BatchOrderPrint\",\"_key\":[\"2\"]}', '2023-09-05 08:20:41', '2023-09-05 08:20:41');
INSERT INTO `admin_operation_log` VALUES (938, 1, 'admin/order-prints', 'GET', '127.0.0.1', '{\"ids\":\"2\",\"model\":\"PurchaseOrderModel\",\"slug\":\"purchase-order\"}', '2023-09-05 08:20:41', '2023-09-05 08:20:41');
INSERT INTO `admin_operation_log` VALUES (939, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:20:49', '2023-09-05 08:20:49');
INSERT INTO `admin_operation_log` VALUES (940, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_grid_iframe_\":\"1\"}', '2023-09-05 08:20:50', '2023-09-05 08:20:50');
INSERT INTO `admin_operation_log` VALUES (941, 1, 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"_index\":\"5\",\"_token\":\"19U1rURlbZ3KtUuVj1T06MlEPji528znjKsKJGDG\",\"_action\":\"App_Admin_Actions_Grid_BatchCreatePurInOrderSave\",\"_key\":[\"2\"]}', '2023-09-05 08:20:54', '2023-09-05 08:20:54');
INSERT INTO `admin_operation_log` VALUES (942, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:20:55', '2023-09-05 08:20:55');
INSERT INTO `admin_operation_log` VALUES (943, 1, 'admin/purchase-in-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-05 08:20:58', '2023-09-05 08:20:58');
INSERT INTO `admin_operation_log` VALUES (944, 1, 'admin/purchase-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:21:08', '2023-09-05 08:21:08');
INSERT INTO `admin_operation_log` VALUES (945, 1, 'admin/positions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:21:11', '2023-09-05 08:21:11');
INSERT INTO `admin_operation_log` VALUES (946, 1, 'admin/positions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-05 08:21:13', '2023-09-05 08:21:13');
INSERT INTO `admin_operation_log` VALUES (947, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:21:36', '2023-09-05 08:21:36');
INSERT INTO `admin_operation_log` VALUES (948, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:21:43', '2023-09-05 08:21:43');
INSERT INTO `admin_operation_log` VALUES (949, 1, 'admin/products/6/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-05 08:22:12', '2023-09-05 08:22:12');
INSERT INTO `admin_operation_log` VALUES (950, 1, 'admin/positions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 08:22:26', '2023-09-05 08:22:26');
INSERT INTO `admin_operation_log` VALUES (951, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-09-05 12:22:50', '2023-09-05 12:22:50');
INSERT INTO `admin_operation_log` VALUES (952, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"PgNHp8WJiH1LHNRj1syLHYTZdzDqSeHz6CB5Wdu0\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-09-05 12:22:51', '2023-09-05 12:22:51');
INSERT INTO `admin_operation_log` VALUES (953, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-05 12:22:52', '2023-09-05 12:22:52');
INSERT INTO `admin_operation_log` VALUES (954, 1, 'admin/positions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 12:22:55', '2023-09-05 12:22:55');
INSERT INTO `admin_operation_log` VALUES (955, 1, 'admin/positions/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-05 12:23:06', '2023-09-05 12:23:06');
INSERT INTO `admin_operation_log` VALUES (956, 1, 'admin/init-stock-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 12:25:40', '2023-09-05 12:25:40');
INSERT INTO `admin_operation_log` VALUES (957, 1, 'admin/init-stock-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-05 12:26:36', '2023-09-05 12:26:36');
INSERT INTO `admin_operation_log` VALUES (958, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"5\"}', '2023-09-05 12:27:37', '2023-09-05 12:27:37');
INSERT INTO `admin_operation_log` VALUES (959, 1, 'admin/customers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:32:42', '2023-09-05 13:32:42');
INSERT INTO `admin_operation_log` VALUES (960, 1, 'admin/customers/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-05 13:32:44', '2023-09-05 13:32:44');
INSERT INTO `admin_operation_log` VALUES (961, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-09-05 13:34:01', '2023-09-05 13:34:01');
INSERT INTO `admin_operation_log` VALUES (962, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"95utn0hujK3jPSz0lYl4JQe9LitJ9KU5o2GY7Nvu\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-09-05 13:34:04', '2023-09-05 13:34:04');
INSERT INTO `admin_operation_log` VALUES (963, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-05 13:34:04', '2023-09-05 13:34:04');
INSERT INTO `admin_operation_log` VALUES (964, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:34:09', '2023-09-05 13:34:09');
INSERT INTO `admin_operation_log` VALUES (965, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:34:15', '2023-09-05 13:34:15');
INSERT INTO `admin_operation_log` VALUES (966, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:34:19', '2023-09-05 13:34:19');
INSERT INTO `admin_operation_log` VALUES (967, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:46:23', '2023-09-05 13:46:23');
INSERT INTO `admin_operation_log` VALUES (968, 1, 'admin/drawees', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:46:33', '2023-09-05 13:46:33');
INSERT INTO `admin_operation_log` VALUES (969, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:46:34', '2023-09-05 13:46:34');
INSERT INTO `admin_operation_log` VALUES (970, 1, 'admin/sale-out-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:46:35', '2023-09-05 13:46:35');
INSERT INTO `admin_operation_log` VALUES (971, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:46:36', '2023-09-05 13:46:36');
INSERT INTO `admin_operation_log` VALUES (972, 1, 'admin/drawees', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:52:46', '2023-09-05 13:52:46');
INSERT INTO `admin_operation_log` VALUES (973, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:52:48', '2023-09-05 13:52:48');
INSERT INTO `admin_operation_log` VALUES (974, 1, 'admin/sale-out-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:52:50', '2023-09-05 13:52:50');
INSERT INTO `admin_operation_log` VALUES (975, 1, 'admin/sale-in-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:52:52', '2023-09-05 13:52:52');
INSERT INTO `admin_operation_log` VALUES (976, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:53:16', '2023-09-05 13:53:16');
INSERT INTO `admin_operation_log` VALUES (977, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:53:23', '2023-09-05 13:53:23');
INSERT INTO `admin_operation_log` VALUES (978, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:53:24', '2023-09-05 13:53:24');
INSERT INTO `admin_operation_log` VALUES (979, 1, 'admin/sale-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-05 13:54:00', '2023-09-05 13:54:00');
INSERT INTO `admin_operation_log` VALUES (980, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:54:04', '2023-09-05 13:54:04');
INSERT INTO `admin_operation_log` VALUES (981, 1, 'admin/sale-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-05 13:54:06', '2023-09-05 13:54:06');
INSERT INTO `admin_operation_log` VALUES (982, 1, 'admin/sale-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-05 13:54:08', '2023-09-05 13:54:08');
INSERT INTO `admin_operation_log` VALUES (983, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-09-06 08:15:25', '2023-09-06 08:15:25');
INSERT INTO `admin_operation_log` VALUES (984, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"gkEGPZi7ujfRiGfuvM7mac93jHheYwmoc0sYstYY\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-09-06 08:27:38', '2023-09-06 08:27:38');
INSERT INTO `admin_operation_log` VALUES (985, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-06 08:27:39', '2023-09-06 08:27:39');
INSERT INTO `admin_operation_log` VALUES (986, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:32:00', '2023-09-06 08:32:00');
INSERT INTO `admin_operation_log` VALUES (987, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:34:42', '2023-09-06 08:34:42');
INSERT INTO `admin_operation_log` VALUES (988, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 08:34:47', '2023-09-06 08:34:47');
INSERT INTO `admin_operation_log` VALUES (989, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:35:14', '2023-09-06 08:35:14');
INSERT INTO `admin_operation_log` VALUES (990, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:35:15', '2023-09-06 08:35:15');
INSERT INTO `admin_operation_log` VALUES (991, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 08:35:17', '2023-09-06 08:35:17');
INSERT INTO `admin_operation_log` VALUES (992, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:35:35', '2023-09-06 08:35:35');
INSERT INTO `admin_operation_log` VALUES (993, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:35:37', '2023-09-06 08:35:37');
INSERT INTO `admin_operation_log` VALUES (994, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 08:35:38', '2023-09-06 08:35:38');
INSERT INTO `admin_operation_log` VALUES (995, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:37:17', '2023-09-06 08:37:17');
INSERT INTO `admin_operation_log` VALUES (996, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:37:18', '2023-09-06 08:37:18');
INSERT INTO `admin_operation_log` VALUES (997, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 08:37:20', '2023-09-06 08:37:20');
INSERT INTO `admin_operation_log` VALUES (998, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:39:35', '2023-09-06 08:39:35');
INSERT INTO `admin_operation_log` VALUES (999, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:39:36', '2023-09-06 08:39:36');
INSERT INTO `admin_operation_log` VALUES (1000, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 08:39:37', '2023-09-06 08:39:37');
INSERT INTO `admin_operation_log` VALUES (1001, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:39:43', '2023-09-06 08:39:43');
INSERT INTO `admin_operation_log` VALUES (1002, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:39:57', '2023-09-06 08:39:57');
INSERT INTO `admin_operation_log` VALUES (1003, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 08:39:57', '2023-09-06 08:39:57');
INSERT INTO `admin_operation_log` VALUES (1004, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 08:39:58', '2023-09-06 08:39:58');
INSERT INTO `admin_operation_log` VALUES (1005, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 09:02:59', '2023-09-06 09:02:59');
INSERT INTO `admin_operation_log` VALUES (1006, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 09:03:00', '2023-09-06 09:03:00');
INSERT INTO `admin_operation_log` VALUES (1007, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 09:03:02', '2023-09-06 09:03:02');
INSERT INTO `admin_operation_log` VALUES (1008, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 09:03:18', '2023-09-06 09:03:18');
INSERT INTO `admin_operation_log` VALUES (1009, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 09:03:21', '2023-09-06 09:03:21');
INSERT INTO `admin_operation_log` VALUES (1010, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 09:03:22', '2023-09-06 09:03:22');
INSERT INTO `admin_operation_log` VALUES (1011, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 09:05:59', '2023-09-06 09:05:59');
INSERT INTO `admin_operation_log` VALUES (1012, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 09:06:00', '2023-09-06 09:06:00');
INSERT INTO `admin_operation_log` VALUES (1013, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 09:06:02', '2023-09-06 09:06:02');
INSERT INTO `admin_operation_log` VALUES (1014, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-06 09:37:13', '2023-09-06 09:37:13');
INSERT INTO `admin_operation_log` VALUES (1015, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-06 09:37:14', '2023-09-06 09:37:14');
INSERT INTO `admin_operation_log` VALUES (1016, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 09:37:20', '2023-09-06 09:37:20');
INSERT INTO `admin_operation_log` VALUES (1017, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 09:37:23', '2023-09-06 09:37:23');
INSERT INTO `admin_operation_log` VALUES (1018, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 09:37:23', '2023-09-06 09:37:23');
INSERT INTO `admin_operation_log` VALUES (1019, 1, 'admin/dcat-api/action', 'POST', '127.0.0.1', '{\"url\":\"http:\\/\\/127.0.0.1\\/admin\\/order-prints?ids=2&model=PurchaseOrderModel&slug=purchase-order\",\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"_action\":\"App_Admin_Actions_Grid_OrderPrint\",\"_key\":null}', '2023-09-06 09:37:29', '2023-09-06 09:37:29');
INSERT INTO `admin_operation_log` VALUES (1020, 1, 'admin/order-prints', 'GET', '127.0.0.1', '{\"ids\":\"2\",\"model\":\"PurchaseOrderModel\",\"slug\":\"purchase-order\"}', '2023-09-06 09:37:29', '2023-09-06 09:37:29');
INSERT INTO `admin_operation_log` VALUES (1021, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 09:37:34', '2023-09-06 09:37:34');
INSERT INTO `admin_operation_log` VALUES (1022, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 09:37:35', '2023-09-06 09:37:35');
INSERT INTO `admin_operation_log` VALUES (1023, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:04:38', '2023-09-06 10:04:38');
INSERT INTO `admin_operation_log` VALUES (1024, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:04:39', '2023-09-06 10:04:39');
INSERT INTO `admin_operation_log` VALUES (1025, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 10:04:41', '2023-09-06 10:04:41');
INSERT INTO `admin_operation_log` VALUES (1026, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:04:48', '2023-09-06 10:04:48');
INSERT INTO `admin_operation_log` VALUES (1027, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 10:04:48', '2023-09-06 10:04:48');
INSERT INTO `admin_operation_log` VALUES (1028, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:06:36', '2023-09-06 10:06:36');
INSERT INTO `admin_operation_log` VALUES (1029, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:06:37', '2023-09-06 10:06:37');
INSERT INTO `admin_operation_log` VALUES (1030, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 10:06:38', '2023-09-06 10:06:38');
INSERT INTO `admin_operation_log` VALUES (1031, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:06:43', '2023-09-06 10:06:43');
INSERT INTO `admin_operation_log` VALUES (1032, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 10:06:43', '2023-09-06 10:06:43');
INSERT INTO `admin_operation_log` VALUES (1033, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:06:54', '2023-09-06 10:06:54');
INSERT INTO `admin_operation_log` VALUES (1034, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 10:07:31', '2023-09-06 10:07:31');
INSERT INTO `admin_operation_log` VALUES (1035, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:07:35', '2023-09-06 10:07:35');
INSERT INTO `admin_operation_log` VALUES (1036, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 10:07:36', '2023-09-06 10:07:36');
INSERT INTO `admin_operation_log` VALUES (1037, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:07:39', '2023-09-06 10:07:39');
INSERT INTO `admin_operation_log` VALUES (1038, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:07:58', '2023-09-06 10:07:58');
INSERT INTO `admin_operation_log` VALUES (1039, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 10:07:59', '2023-09-06 10:07:59');
INSERT INTO `admin_operation_log` VALUES (1040, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:08:02', '2023-09-06 10:08:02');
INSERT INTO `admin_operation_log` VALUES (1041, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:08:49', '2023-09-06 10:08:49');
INSERT INTO `admin_operation_log` VALUES (1042, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:09:20', '2023-09-06 10:09:20');
INSERT INTO `admin_operation_log` VALUES (1043, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:09:21', '2023-09-06 10:09:21');
INSERT INTO `admin_operation_log` VALUES (1044, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:09:35', '2023-09-06 10:09:35');
INSERT INTO `admin_operation_log` VALUES (1045, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:09:40', '2023-09-06 10:09:40');
INSERT INTO `admin_operation_log` VALUES (1046, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:09:41', '2023-09-06 10:09:41');
INSERT INTO `admin_operation_log` VALUES (1047, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:11:07', '2023-09-06 10:11:07');
INSERT INTO `admin_operation_log` VALUES (1048, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:11:08', '2023-09-06 10:11:08');
INSERT INTO `admin_operation_log` VALUES (1049, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:11:34', '2023-09-06 10:11:34');
INSERT INTO `admin_operation_log` VALUES (1050, 1, 'admin/purchase-orders/2/edit', 'GET', '127.0.0.1', '[]', '2023-09-06 10:11:35', '2023-09-06 10:11:35');
INSERT INTO `admin_operation_log` VALUES (1051, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:11:38', '2023-09-06 10:11:38');
INSERT INTO `admin_operation_log` VALUES (1052, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:11:38', '2023-09-06 10:11:38');
INSERT INTO `admin_operation_log` VALUES (1053, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:13:52', '2023-09-06 10:13:52');
INSERT INTO `admin_operation_log` VALUES (1054, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:13:53', '2023-09-06 10:13:53');
INSERT INTO `admin_operation_log` VALUES (1055, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:14:51', '2023-09-06 10:14:51');
INSERT INTO `admin_operation_log` VALUES (1056, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:14:52', '2023-09-06 10:14:52');
INSERT INTO `admin_operation_log` VALUES (1057, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"6\"}', '2023-09-06 10:14:55', '2023-09-06 10:14:55');
INSERT INTO `admin_operation_log` VALUES (1058, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:25:19', '2023-09-06 10:25:19');
INSERT INTO `admin_operation_log` VALUES (1059, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:25:24', '2023-09-06 10:25:24');
INSERT INTO `admin_operation_log` VALUES (1060, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23368901\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 10:26:34', '2023-09-06 10:26:34');
INSERT INTO `admin_operation_log` VALUES (1061, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:26:35', '2023-09-06 10:26:35');
INSERT INTO `admin_operation_log` VALUES (1062, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:30:09', '2023-09-06 10:30:09');
INSERT INTO `admin_operation_log` VALUES (1063, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23368175\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 10:30:28', '2023-09-06 10:30:28');
INSERT INTO `admin_operation_log` VALUES (1064, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23368175\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 10:31:16', '2023-09-06 10:31:16');
INSERT INTO `admin_operation_log` VALUES (1065, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23368176\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 10:32:05', '2023-09-06 10:32:05');
INSERT INTO `admin_operation_log` VALUES (1066, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23368177\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 10:33:43', '2023-09-06 10:33:43');
INSERT INTO `admin_operation_log` VALUES (1067, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23368175\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 10:34:24', '2023-09-06 10:34:24');
INSERT INTO `admin_operation_log` VALUES (1068, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:34:24', '2023-09-06 10:34:24');
INSERT INTO `admin_operation_log` VALUES (1069, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:35:08', '2023-09-06 10:35:08');
INSERT INTO `admin_operation_log` VALUES (1070, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:35:12', '2023-09-06 10:35:12');
INSERT INTO `admin_operation_log` VALUES (1071, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:35:14', '2023-09-06 10:35:14');
INSERT INTO `admin_operation_log` VALUES (1072, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"11\"}', '2023-09-06 10:35:17', '2023-09-06 10:35:17');
INSERT INTO `admin_operation_log` VALUES (1073, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 10:35:30', '2023-09-06 10:35:30');
INSERT INTO `admin_operation_log` VALUES (1074, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 10:35:33', '2023-09-06 10:35:33');
INSERT INTO `admin_operation_log` VALUES (1075, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:01:41', '2023-09-06 11:01:41');
INSERT INTO `admin_operation_log` VALUES (1076, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:01:41', '2023-09-06 11:01:41');
INSERT INTO `admin_operation_log` VALUES (1077, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:01:42', '2023-09-06 11:01:42');
INSERT INTO `admin_operation_log` VALUES (1078, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:02:09', '2023-09-06 11:02:09');
INSERT INTO `admin_operation_log` VALUES (1079, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:02:17', '2023-09-06 11:02:17');
INSERT INTO `admin_operation_log` VALUES (1080, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:02:52', '2023-09-06 11:02:52');
INSERT INTO `admin_operation_log` VALUES (1081, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:02:53', '2023-09-06 11:02:53');
INSERT INTO `admin_operation_log` VALUES (1082, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:02:56', '2023-09-06 11:02:56');
INSERT INTO `admin_operation_log` VALUES (1083, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:03:21', '2023-09-06 11:03:21');
INSERT INTO `admin_operation_log` VALUES (1084, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:03:25', '2023-09-06 11:03:25');
INSERT INTO `admin_operation_log` VALUES (1085, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:03:42', '2023-09-06 11:03:42');
INSERT INTO `admin_operation_log` VALUES (1086, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:04:17', '2023-09-06 11:04:17');
INSERT INTO `admin_operation_log` VALUES (1087, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 11:07:33', '2023-09-06 11:07:33');
INSERT INTO `admin_operation_log` VALUES (1088, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 11:07:35', '2023-09-06 11:07:35');
INSERT INTO `admin_operation_log` VALUES (1089, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23361949\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"pink\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:08:04', '2023-09-06 11:08:04');
INSERT INTO `admin_operation_log` VALUES (1090, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:08:05', '2023-09-06 11:08:05');
INSERT INTO `admin_operation_log` VALUES (1091, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 11:08:55', '2023-09-06 11:08:55');
INSERT INTO `admin_operation_log` VALUES (1092, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362040\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:09:23', '2023-09-06 11:09:23');
INSERT INTO `admin_operation_log` VALUES (1093, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362040\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:10:20', '2023-09-06 11:10:20');
INSERT INTO `admin_operation_log` VALUES (1094, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362041\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:10:28', '2023-09-06 11:10:28');
INSERT INTO `admin_operation_log` VALUES (1095, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362041\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:15:11', '2023-09-06 11:15:11');
INSERT INTO `admin_operation_log` VALUES (1096, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362042\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:15:15', '2023-09-06 11:15:15');
INSERT INTO `admin_operation_log` VALUES (1097, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362043\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:15:43', '2023-09-06 11:15:43');
INSERT INTO `admin_operation_log` VALUES (1098, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362044\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:16:02', '2023-09-06 11:16:02');
INSERT INTO `admin_operation_log` VALUES (1099, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362045\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:16:35', '2023-09-06 11:16:35');
INSERT INTO `admin_operation_log` VALUES (1100, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:18:36', '2023-09-06 11:18:36');
INSERT INTO `admin_operation_log` VALUES (1101, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 11:20:47', '2023-09-06 11:20:47');
INSERT INTO `admin_operation_log` VALUES (1102, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362090\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:21:12', '2023-09-06 11:21:12');
INSERT INTO `admin_operation_log` VALUES (1103, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362091\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:23:19', '2023-09-06 11:23:19');
INSERT INTO `admin_operation_log` VALUES (1104, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362091\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:23:57', '2023-09-06 11:23:57');
INSERT INTO `admin_operation_log` VALUES (1105, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362092\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:23:59', '2023-09-06 11:23:59');
INSERT INTO `admin_operation_log` VALUES (1106, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23362093\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:33:07', '2023-09-06 11:33:07');
INSERT INTO `admin_operation_log` VALUES (1107, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:33:07', '2023-09-06 11:33:07');
INSERT INTO `admin_operation_log` VALUES (1108, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:33:12', '2023-09-06 11:33:12');
INSERT INTO `admin_operation_log` VALUES (1109, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:34:18', '2023-09-06 11:34:18');
INSERT INTO `admin_operation_log` VALUES (1110, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 11:34:19', '2023-09-06 11:34:19');
INSERT INTO `admin_operation_log` VALUES (1111, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23361402\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:34:34', '2023-09-06 11:34:34');
INSERT INTO `admin_operation_log` VALUES (1112, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23361403\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:35:06', '2023-09-06 11:35:06');
INSERT INTO `admin_operation_log` VALUES (1113, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23361404\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:35:31', '2023-09-06 11:35:31');
INSERT INTO `admin_operation_log` VALUES (1114, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23361405\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:36:48', '2023-09-06 11:36:48');
INSERT INTO `admin_operation_log` VALUES (1115, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23361406\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:37:35', '2023-09-06 11:37:35');
INSERT INTO `admin_operation_log` VALUES (1116, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:37:35', '2023-09-06 11:37:35');
INSERT INTO `admin_operation_log` VALUES (1117, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:38:43', '2023-09-06 11:38:43');
INSERT INTO `admin_operation_log` VALUES (1118, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 11:38:45', '2023-09-06 11:38:45');
INSERT INTO `admin_operation_log` VALUES (1119, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23366135\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:39:07', '2023-09-06 11:39:07');
INSERT INTO `admin_operation_log` VALUES (1120, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:39:07', '2023-09-06 11:39:07');
INSERT INTO `admin_operation_log` VALUES (1121, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:41:53', '2023-09-06 11:41:53');
INSERT INTO `admin_operation_log` VALUES (1122, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 11:41:56', '2023-09-06 11:41:56');
INSERT INTO `admin_operation_log` VALUES (1123, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 11:46:24', '2023-09-06 11:46:24');
INSERT INTO `admin_operation_log` VALUES (1124, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 11:46:25', '2023-09-06 11:46:25');
INSERT INTO `admin_operation_log` VALUES (1125, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23367994\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:46:38', '2023-09-06 11:46:38');
INSERT INTO `admin_operation_log` VALUES (1126, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23367994\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:47:25', '2023-09-06 11:47:25');
INSERT INTO `admin_operation_log` VALUES (1127, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23367994\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:48:12', '2023-09-06 11:48:12');
INSERT INTO `admin_operation_log` VALUES (1128, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23367994\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:53:04', '2023-09-06 11:53:04');
INSERT INTO `admin_operation_log` VALUES (1129, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23367994\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:54:20', '2023-09-06 11:54:20');
INSERT INTO `admin_operation_log` VALUES (1130, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23367994\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:54:57', '2023-09-06 11:54:57');
INSERT INTO `admin_operation_log` VALUES (1131, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23367994\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:58:58', '2023-09-06 11:58:58');
INSERT INTO `admin_operation_log` VALUES (1132, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23367994\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 11:59:10', '2023-09-06 11:59:10');
INSERT INTO `admin_operation_log` VALUES (1133, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 12:01:18', '2023-09-06 12:01:18');
INSERT INTO `admin_operation_log` VALUES (1134, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 12:01:29', '2023-09-06 12:01:29');
INSERT INTO `admin_operation_log` VALUES (1135, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23363370\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 12:02:25', '2023-09-06 12:02:25');
INSERT INTO `admin_operation_log` VALUES (1136, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23363370\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 12:03:02', '2023-09-06 12:03:02');
INSERT INTO `admin_operation_log` VALUES (1137, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23363370\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 12:03:40', '2023-09-06 12:03:40');
INSERT INTO `admin_operation_log` VALUES (1138, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23363370\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 12:04:09', '2023-09-06 12:04:09');
INSERT INTO `admin_operation_log` VALUES (1139, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23363370\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 12:05:38', '2023-09-06 12:05:38');
INSERT INTO `admin_operation_log` VALUES (1140, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23363370\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 12:06:33', '2023-09-06 12:06:33');
INSERT INTO `admin_operation_log` VALUES (1141, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23363370\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 12:07:01', '2023-09-06 12:07:01');
INSERT INTO `admin_operation_log` VALUES (1142, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23363370\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 12:13:54', '2023-09-06 12:13:54');
INSERT INTO `admin_operation_log` VALUES (1143, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23363371\",\"name\":null,\"name_zh\":\"\\u952e\\u76d8\",\"name_ko\":\"\\ud0a4\\ubcf4\\ub4dc\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 12:14:02', '2023-09-06 12:14:02');
INSERT INTO `admin_operation_log` VALUES (1144, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 13:32:38', '2023-09-06 13:32:38');
INSERT INTO `admin_operation_log` VALUES (1145, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 13:32:39', '2023-09-06 13:32:39');
INSERT INTO `admin_operation_log` VALUES (1146, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23366124\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"IPHONE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:33:17', '2023-09-06 13:33:17');
INSERT INTO `admin_operation_log` VALUES (1147, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 13:36:11', '2023-09-06 13:36:11');
INSERT INTO `admin_operation_log` VALUES (1148, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 13:36:16', '2023-09-06 13:36:16');
INSERT INTO `admin_operation_log` VALUES (1149, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364492\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:36:30', '2023-09-06 13:36:30');
INSERT INTO `admin_operation_log` VALUES (1150, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364492\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:38:01', '2023-09-06 13:38:01');
INSERT INTO `admin_operation_log` VALUES (1151, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364492\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:42:29', '2023-09-06 13:42:29');
INSERT INTO `admin_operation_log` VALUES (1152, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 13:42:36', '2023-09-06 13:42:36');
INSERT INTO `admin_operation_log` VALUES (1153, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 13:42:47', '2023-09-06 13:42:47');
INSERT INTO `admin_operation_log` VALUES (1154, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23366255\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:43:05', '2023-09-06 13:43:05');
INSERT INTO `admin_operation_log` VALUES (1155, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23366255\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:43:34', '2023-09-06 13:43:34');
INSERT INTO `admin_operation_log` VALUES (1156, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 13:43:37', '2023-09-06 13:43:37');
INSERT INTO `admin_operation_log` VALUES (1157, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 13:44:33', '2023-09-06 13:44:33');
INSERT INTO `admin_operation_log` VALUES (1158, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 13:44:34', '2023-09-06 13:44:34');
INSERT INTO `admin_operation_log` VALUES (1159, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364359\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:44:47', '2023-09-06 13:44:47');
INSERT INTO `admin_operation_log` VALUES (1160, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364359\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:44:51', '2023-09-06 13:44:51');
INSERT INTO `admin_operation_log` VALUES (1161, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364357\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:45:49', '2023-09-06 13:45:49');
INSERT INTO `admin_operation_log` VALUES (1162, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364355\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:46:59', '2023-09-06 13:46:59');
INSERT INTO `admin_operation_log` VALUES (1163, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364351\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:47:12', '2023-09-06 13:47:12');
INSERT INTO `admin_operation_log` VALUES (1164, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364350\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:47:32', '2023-09-06 13:47:32');
INSERT INTO `admin_operation_log` VALUES (1165, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364350\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"green\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:47:41', '2023-09-06 13:47:41');
INSERT INTO `admin_operation_log` VALUES (1166, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364357\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"green\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:47:49', '2023-09-06 13:47:49');
INSERT INTO `admin_operation_log` VALUES (1167, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23364312\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"green\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:47:56', '2023-09-06 13:47:56');
INSERT INTO `admin_operation_log` VALUES (1168, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 13:51:11', '2023-09-06 13:51:11');
INSERT INTO `admin_operation_log` VALUES (1169, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 13:51:13', '2023-09-06 13:51:13');
INSERT INTO `admin_operation_log` VALUES (1170, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23366634\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:51:28', '2023-09-06 13:51:28');
INSERT INTO `admin_operation_log` VALUES (1171, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23366634\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:52:40', '2023-09-06 13:52:40');
INSERT INTO `admin_operation_log` VALUES (1172, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 13:52:40', '2023-09-06 13:52:40');
INSERT INTO `admin_operation_log` VALUES (1173, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 13:55:13', '2023-09-06 13:55:13');
INSERT INTO `admin_operation_log` VALUES (1174, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23368657\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"pink\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:55:27', '2023-09-06 13:55:27');
INSERT INTO `admin_operation_log` VALUES (1175, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23368651\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"pink\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:55:48', '2023-09-06 13:55:48');
INSERT INTO `admin_operation_log` VALUES (1176, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 13:55:48', '2023-09-06 13:55:48');
INSERT INTO `admin_operation_log` VALUES (1177, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 13:56:54', '2023-09-06 13:56:54');
INSERT INTO `admin_operation_log` VALUES (1178, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 13:56:56', '2023-09-06 13:56:56');
INSERT INTO `admin_operation_log` VALUES (1179, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23363795\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:57:15', '2023-09-06 13:57:15');
INSERT INTO `admin_operation_log` VALUES (1180, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 13:57:15', '2023-09-06 13:57:15');
INSERT INTO `admin_operation_log` VALUES (1181, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 13:57:31', '2023-09-06 13:57:31');
INSERT INTO `admin_operation_log` VALUES (1182, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"AhOwGdFhRL9tFRj0kA5u9I6v7MQ00jSEQS6WwEKp\",\"item_no\":\"PD23365761\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-06 13:57:57', '2023-09-06 13:57:57');
INSERT INTO `admin_operation_log` VALUES (1183, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 13:57:58', '2023-09-06 13:57:58');
INSERT INTO `admin_operation_log` VALUES (1184, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 13:58:06', '2023-09-06 13:58:06');
INSERT INTO `admin_operation_log` VALUES (1185, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-06 14:00:16', '2023-09-06 14:00:16');
INSERT INTO `admin_operation_log` VALUES (1186, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 14:01:24', '2023-09-06 14:01:24');
INSERT INTO `admin_operation_log` VALUES (1187, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 14:02:03', '2023-09-06 14:02:03');
INSERT INTO `admin_operation_log` VALUES (1188, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Extensions_Expand_AttrValue\",\"key\":\"1\"}', '2023-09-06 14:02:04', '2023-09-06 14:02:04');
INSERT INTO `admin_operation_log` VALUES (1189, 1, 'admin/attrs/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 14:02:11', '2023-09-06 14:02:11');
INSERT INTO `admin_operation_log` VALUES (1190, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 14:05:31', '2023-09-06 14:05:31');
INSERT INTO `admin_operation_log` VALUES (1191, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 14:05:32', '2023-09-06 14:05:32');
INSERT INTO `admin_operation_log` VALUES (1192, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-09-06 14:07:50', '2023-09-06 14:07:50');
INSERT INTO `admin_operation_log` VALUES (1193, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 14:07:52', '2023-09-06 14:07:52');
INSERT INTO `admin_operation_log` VALUES (1194, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-09-06 14:08:24', '2023-09-06 14:08:24');
INSERT INTO `admin_operation_log` VALUES (1195, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 14:08:26', '2023-09-06 14:08:26');
INSERT INTO `admin_operation_log` VALUES (1196, 1, 'admin/attrs/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 14:08:29', '2023-09-06 14:08:29');
INSERT INTO `admin_operation_log` VALUES (1197, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-09-06 14:09:45', '2023-09-06 14:09:45');
INSERT INTO `admin_operation_log` VALUES (1198, 1, 'admin/attrs/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 14:09:47', '2023-09-06 14:09:47');
INSERT INTO `admin_operation_log` VALUES (1199, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 14:11:33', '2023-09-06 14:11:33');
INSERT INTO `admin_operation_log` VALUES (1200, 1, 'admin/attrs/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 14:11:35', '2023-09-06 14:11:35');
INSERT INTO `admin_operation_log` VALUES (1201, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Extensions_Expand_AttrValue\",\"key\":\"1\"}', '2023-09-06 14:13:23', '2023-09-06 14:13:23');
INSERT INTO `admin_operation_log` VALUES (1202, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 14:26:24', '2023-09-06 14:26:24');
INSERT INTO `admin_operation_log` VALUES (1203, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 14:26:25', '2023-09-06 14:26:25');
INSERT INTO `admin_operation_log` VALUES (1204, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 15:08:54', '2023-09-06 15:08:54');
INSERT INTO `admin_operation_log` VALUES (1205, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 15:08:56', '2023-09-06 15:08:56');
INSERT INTO `admin_operation_log` VALUES (1206, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-06 15:08:59', '2023-09-06 15:08:59');
INSERT INTO `admin_operation_log` VALUES (1207, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-06 15:09:01', '2023-09-06 15:09:01');
INSERT INTO `admin_operation_log` VALUES (1208, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2023-09-06 15:09:05', '2023-09-06 15:09:05');
INSERT INTO `admin_operation_log` VALUES (1209, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-09-07 08:10:27', '2023-09-07 08:10:27');
INSERT INTO `admin_operation_log` VALUES (1210, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"yVkC0yp6CAZ0vD2YVqrkCyNLiLya4ncb3O2BQU8y\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-09-07 08:10:30', '2023-09-07 08:10:30');
INSERT INTO `admin_operation_log` VALUES (1211, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-07 08:10:30', '2023-09-07 08:10:30');
INSERT INTO `admin_operation_log` VALUES (1212, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:10:35', '2023-09-07 08:10:35');
INSERT INTO `admin_operation_log` VALUES (1213, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Extensions_Expand_AttrValue\",\"key\":\"1\"}', '2023-09-07 08:10:36', '2023-09-07 08:10:36');
INSERT INTO `admin_operation_log` VALUES (1214, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:10:39', '2023-09-07 08:10:39');
INSERT INTO `admin_operation_log` VALUES (1215, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:10:41', '2023-09-07 08:10:41');
INSERT INTO `admin_operation_log` VALUES (1216, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:10:42', '2023-09-07 08:10:42');
INSERT INTO `admin_operation_log` VALUES (1217, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:10:44', '2023-09-07 08:10:44');
INSERT INTO `admin_operation_log` VALUES (1218, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:10:45', '2023-09-07 08:10:45');
INSERT INTO `admin_operation_log` VALUES (1219, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 08:10:47', '2023-09-07 08:10:47');
INSERT INTO `admin_operation_log` VALUES (1220, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:10:58', '2023-09-07 08:10:58');
INSERT INTO `admin_operation_log` VALUES (1221, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 08:11:00', '2023-09-07 08:11:00');
INSERT INTO `admin_operation_log` VALUES (1222, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2023-09-07 08:11:04', '2023-09-07 08:11:04');
INSERT INTO `admin_operation_log` VALUES (1223, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:13:05', '2023-09-07 08:13:05');
INSERT INTO `admin_operation_log` VALUES (1224, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 08:13:06', '2023-09-07 08:13:06');
INSERT INTO `admin_operation_log` VALUES (1225, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2023-09-07 08:29:59', '2023-09-07 08:29:59');
INSERT INTO `admin_operation_log` VALUES (1226, 1, 'admin/purchase-orders', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"order_no\":\"CG202309070001\",\"created_at\":\"2023-09-07 08:13:06\",\"status\":\"0\",\"supplier_id\":\"2\",\"other\":\"test\",\"items\":{\"new_1\":{\"product_id\":\"1\",\"sku_id\":null,\"should_num\":\"20\",\"price\":\"7550\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/purchase-orders\"}', '2023-09-07 08:30:13', '2023-09-07 08:30:13');
INSERT INTO `admin_operation_log` VALUES (1227, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:30:14', '2023-09-07 08:30:14');
INSERT INTO `admin_operation_log` VALUES (1228, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-07 08:30:16', '2023-09-07 08:30:16');
INSERT INTO `admin_operation_log` VALUES (1229, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:30:41', '2023-09-07 08:30:41');
INSERT INTO `admin_operation_log` VALUES (1230, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:30:43', '2023-09-07 08:30:43');
INSERT INTO `admin_operation_log` VALUES (1231, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-07 08:30:44', '2023-09-07 08:30:44');
INSERT INTO `admin_operation_log` VALUES (1232, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:32:18', '2023-09-07 08:32:18');
INSERT INTO `admin_operation_log` VALUES (1233, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 08:32:19', '2023-09-07 08:32:19');
INSERT INTO `admin_operation_log` VALUES (1234, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-07 08:32:23', '2023-09-07 08:32:23');
INSERT INTO `admin_operation_log` VALUES (1235, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-07 08:32:26', '2023-09-07 08:32:26');
INSERT INTO `admin_operation_log` VALUES (1236, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-07 08:32:28', '2023-09-07 08:32:28');
INSERT INTO `admin_operation_log` VALUES (1237, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-07 08:33:21', '2023-09-07 08:33:21');
INSERT INTO `admin_operation_log` VALUES (1238, 1, 'admin/purchase-orders/1/edit', 'GET', '127.0.0.1', '[]', '2023-09-07 08:33:22', '2023-09-07 08:33:22');
INSERT INTO `admin_operation_log` VALUES (1239, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 09:00:35', '2023-09-07 09:00:35');
INSERT INTO `admin_operation_log` VALUES (1240, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 09:01:29', '2023-09-07 09:01:29');
INSERT INTO `admin_operation_log` VALUES (1241, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 09:02:08', '2023-09-07 09:02:08');
INSERT INTO `admin_operation_log` VALUES (1242, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2023-09-07 09:02:11', '2023-09-07 09:02:11');
INSERT INTO `admin_operation_log` VALUES (1243, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 09:10:54', '2023-09-07 09:10:54');
INSERT INTO `admin_operation_log` VALUES (1244, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 09:10:57', '2023-09-07 09:10:57');
INSERT INTO `admin_operation_log` VALUES (1245, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 09:10:59', '2023-09-07 09:10:59');
INSERT INTO `admin_operation_log` VALUES (1246, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23368836\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 09:11:29', '2023-09-07 09:11:29');
INSERT INTO `admin_operation_log` VALUES (1247, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23368836\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 09:11:33', '2023-09-07 09:11:33');
INSERT INTO `admin_operation_log` VALUES (1248, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23368835\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 09:11:38', '2023-09-07 09:11:38');
INSERT INTO `admin_operation_log` VALUES (1249, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23368835\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 09:43:20', '2023-09-07 09:43:20');
INSERT INTO `admin_operation_log` VALUES (1250, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23368836\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 09:43:30', '2023-09-07 09:43:30');
INSERT INTO `admin_operation_log` VALUES (1251, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23368838\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 09:43:37', '2023-09-07 09:43:37');
INSERT INTO `admin_operation_log` VALUES (1252, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23368839\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 09:44:17', '2023-09-07 09:44:17');
INSERT INTO `admin_operation_log` VALUES (1253, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23368840\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 09:44:35', '2023-09-07 09:44:35');
INSERT INTO `admin_operation_log` VALUES (1254, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23368841\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 09:45:00', '2023-09-07 09:45:00');
INSERT INTO `admin_operation_log` VALUES (1255, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23368842\",\"name\":null,\"name_zh\":\"\\u624b\\u673a\",\"name_ko\":\"\\ud578\\ub4dc\\ud3f0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:02:23', '2023-09-07 10:02:23');
INSERT INTO `admin_operation_log` VALUES (1256, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:02:56', '2023-09-07 10:02:56');
INSERT INTO `admin_operation_log` VALUES (1257, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:02:57', '2023-09-07 10:02:57');
INSERT INTO `admin_operation_log` VALUES (1258, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:02:58', '2023-09-07 10:02:58');
INSERT INTO `admin_operation_log` VALUES (1259, 1, 'admin/attrs', 'POST', '127.0.0.1', '{\"name\":null,\"name_zh\":\"\\u578b\\u53f7\",\"name_ko\":\"\\ubaa8\\ub378\",\"values\":{\"new_1\":{\"name\":null,\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/attrs\"}', '2023-09-07 10:03:40', '2023-09-07 10:03:40');
INSERT INTO `admin_operation_log` VALUES (1260, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:03:40', '2023-09-07 10:03:40');
INSERT INTO `admin_operation_log` VALUES (1261, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Extensions_Expand_AttrValue\",\"key\":\"5\"}', '2023-09-07 10:03:42', '2023-09-07 10:03:42');
INSERT INTO `admin_operation_log` VALUES (1262, 1, 'admin/attrs/5/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:03:45', '2023-09-07 10:03:45');
INSERT INTO `admin_operation_log` VALUES (1263, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:06:03', '2023-09-07 10:06:03');
INSERT INTO `admin_operation_log` VALUES (1264, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:06:04', '2023-09-07 10:06:04');
INSERT INTO `admin_operation_log` VALUES (1265, 1, 'admin/attrs', 'POST', '127.0.0.1', '{\"name\":null,\"name_zh\":\"\\u578b\\u53f7\",\"name_ko\":\"\\ubaa8\\ub378\",\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/attrs\"}', '2023-09-07 10:06:18', '2023-09-07 10:06:18');
INSERT INTO `admin_operation_log` VALUES (1266, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:06:19', '2023-09-07 10:06:19');
INSERT INTO `admin_operation_log` VALUES (1267, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:07:07', '2023-09-07 10:07:07');
INSERT INTO `admin_operation_log` VALUES (1268, 1, 'admin/attrs', 'POST', '127.0.0.1', '{\"name\":null,\"name_zh\":\"\\u578b\\u53f7\",\"name_ko\":\"\\ubaa8\\ub378\",\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/attrs\"}', '2023-09-07 10:07:15', '2023-09-07 10:07:15');
INSERT INTO `admin_operation_log` VALUES (1269, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:07:16', '2023-09-07 10:07:16');
INSERT INTO `admin_operation_log` VALUES (1270, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:08:24', '2023-09-07 10:08:24');
INSERT INTO `admin_operation_log` VALUES (1271, 1, 'admin/attrs/7/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:08:42', '2023-09-07 10:08:42');
INSERT INTO `admin_operation_log` VALUES (1272, 1, 'admin/attrs/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:08:45', '2023-09-07 10:08:45');
INSERT INTO `admin_operation_log` VALUES (1273, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Extensions_Expand_AttrValue\",\"key\":\"1\"}', '2023-09-07 10:08:51', '2023-09-07 10:08:51');
INSERT INTO `admin_operation_log` VALUES (1274, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Extensions_Expand_AttrValue\",\"key\":\"7\"}', '2023-09-07 10:09:24', '2023-09-07 10:09:24');
INSERT INTO `admin_operation_log` VALUES (1275, 1, 'admin/attrs', 'GET', '127.0.0.1', '[]', '2023-09-07 10:43:40', '2023-09-07 10:43:40');
INSERT INTO `admin_operation_log` VALUES (1276, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:43:42', '2023-09-07 10:43:42');
INSERT INTO `admin_operation_log` VALUES (1277, 1, 'admin/attrs', 'POST', '127.0.0.1', '{\"name\":null,\"name_zh\":\"\\u578b\\u53f7\",\"name_ko\":\"\\ubaa8\\ub378\",\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/attrs\"}', '2023-09-07 10:43:57', '2023-09-07 10:43:57');
INSERT INTO `admin_operation_log` VALUES (1278, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:43:58', '2023-09-07 10:43:58');
INSERT INTO `admin_operation_log` VALUES (1279, 1, 'admin/attrs/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:44:00', '2023-09-07 10:44:00');
INSERT INTO `admin_operation_log` VALUES (1280, 1, 'admin/attrs', 'POST', '127.0.0.1', '{\"name\":null,\"name_zh\":\"\\u989c\\u8272\",\"name_ko\":\"\\uc0c9\\uc0c1\",\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/attrs\"}', '2023-09-07 10:44:14', '2023-09-07 10:44:14');
INSERT INTO `admin_operation_log` VALUES (1281, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:44:14', '2023-09-07 10:44:14');
INSERT INTO `admin_operation_log` VALUES (1282, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:44:18', '2023-09-07 10:44:18');
INSERT INTO `admin_operation_log` VALUES (1283, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:44:19', '2023-09-07 10:44:19');
INSERT INTO `admin_operation_log` VALUES (1284, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:44:21', '2023-09-07 10:44:21');
INSERT INTO `admin_operation_log` VALUES (1285, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:44:23', '2023-09-07 10:44:23');
INSERT INTO `admin_operation_log` VALUES (1286, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23367097\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"HUAWEI\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:46:48', '2023-09-07 10:46:48');
INSERT INTO `admin_operation_log` VALUES (1287, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:47:26', '2023-09-07 10:47:26');
INSERT INTO `admin_operation_log` VALUES (1288, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 10:48:19', '2023-09-07 10:48:19');
INSERT INTO `admin_operation_log` VALUES (1289, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 10:48:20', '2023-09-07 10:48:20');
INSERT INTO `admin_operation_log` VALUES (1290, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:48:48', '2023-09-07 10:48:48');
INSERT INTO `admin_operation_log` VALUES (1291, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:53:00', '2023-09-07 10:53:00');
INSERT INTO `admin_operation_log` VALUES (1292, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:53:10', '2023-09-07 10:53:10');
INSERT INTO `admin_operation_log` VALUES (1293, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:53:40', '2023-09-07 10:53:40');
INSERT INTO `admin_operation_log` VALUES (1294, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:53:56', '2023-09-07 10:53:56');
INSERT INTO `admin_operation_log` VALUES (1295, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:56:21', '2023-09-07 10:56:21');
INSERT INTO `admin_operation_log` VALUES (1296, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:57:02', '2023-09-07 10:57:02');
INSERT INTO `admin_operation_log` VALUES (1297, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:57:36', '2023-09-07 10:57:36');
INSERT INTO `admin_operation_log` VALUES (1298, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:59:19', '2023-09-07 10:59:19');
INSERT INTO `admin_operation_log` VALUES (1299, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:59:41', '2023-09-07 10:59:41');
INSERT INTO `admin_operation_log` VALUES (1300, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 10:59:52', '2023-09-07 10:59:52');
INSERT INTO `admin_operation_log` VALUES (1301, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:03:52', '2023-09-07 11:03:52');
INSERT INTO `admin_operation_log` VALUES (1302, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:14:24', '2023-09-07 11:14:24');
INSERT INTO `admin_operation_log` VALUES (1303, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:15:57', '2023-09-07 11:15:57');
INSERT INTO `admin_operation_log` VALUES (1304, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:16:31', '2023-09-07 11:16:31');
INSERT INTO `admin_operation_log` VALUES (1305, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:17:09', '2023-09-07 11:17:09');
INSERT INTO `admin_operation_log` VALUES (1306, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23364886\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER734\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:17:53', '2023-09-07 11:17:53');
INSERT INTO `admin_operation_log` VALUES (1307, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-07 11:18:18', '2023-09-07 11:18:18');
INSERT INTO `admin_operation_log` VALUES (1308, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 11:18:20', '2023-09-07 11:18:20');
INSERT INTO `admin_operation_log` VALUES (1309, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365732\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:18:47', '2023-09-07 11:18:47');
INSERT INTO `admin_operation_log` VALUES (1310, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365732\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:20:04', '2023-09-07 11:20:04');
INSERT INTO `admin_operation_log` VALUES (1311, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365732\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:20:53', '2023-09-07 11:20:53');
INSERT INTO `admin_operation_log` VALUES (1312, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365732\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:21:34', '2023-09-07 11:21:34');
INSERT INTO `admin_operation_log` VALUES (1313, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365732\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:25:22', '2023-09-07 11:25:22');
INSERT INTO `admin_operation_log` VALUES (1314, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:25:26', '2023-09-07 11:25:26');
INSERT INTO `admin_operation_log` VALUES (1315, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:25:58', '2023-09-07 11:25:58');
INSERT INTO `admin_operation_log` VALUES (1316, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:26:13', '2023-09-07 11:26:13');
INSERT INTO `admin_operation_log` VALUES (1317, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:27:01', '2023-09-07 11:27:01');
INSERT INTO `admin_operation_log` VALUES (1318, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:27:37', '2023-09-07 11:27:37');
INSERT INTO `admin_operation_log` VALUES (1319, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:27:50', '2023-09-07 11:27:50');
INSERT INTO `admin_operation_log` VALUES (1320, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:28:26', '2023-09-07 11:28:26');
INSERT INTO `admin_operation_log` VALUES (1321, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:31:46', '2023-09-07 11:31:46');
INSERT INTO `admin_operation_log` VALUES (1322, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:34:24', '2023-09-07 11:34:24');
INSERT INTO `admin_operation_log` VALUES (1323, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:35:38', '2023-09-07 11:35:38');
INSERT INTO `admin_operation_log` VALUES (1324, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23365733\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"black\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ER777\",\"id\":null,\"_remove_\":\"1\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:35:45', '2023-09-07 11:35:45');
INSERT INTO `admin_operation_log` VALUES (1325, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-07 11:36:09', '2023-09-07 11:36:09');
INSERT INTO `admin_operation_log` VALUES (1326, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 11:36:51', '2023-09-07 11:36:51');
INSERT INTO `admin_operation_log` VALUES (1327, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 11:36:53', '2023-09-07 11:36:53');
INSERT INTO `admin_operation_log` VALUES (1328, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"IpAS7WQiENYAF2V0bFqSBZq4azu7P4NHws8JZGZi\",\"item_no\":\"PD23366833\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"2\",\"attr_value_ids\":\"blue\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 11:37:14', '2023-09-07 11:37:14');
INSERT INTO `admin_operation_log` VALUES (1329, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 11:41:34', '2023-09-07 11:41:34');
INSERT INTO `admin_operation_log` VALUES (1330, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 11:41:35', '2023-09-07 11:41:35');
INSERT INTO `admin_operation_log` VALUES (1331, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 11:43:04', '2023-09-07 11:43:04');
INSERT INTO `admin_operation_log` VALUES (1332, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 11:43:06', '2023-09-07 11:43:06');
INSERT INTO `admin_operation_log` VALUES (1333, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2023-09-07 11:43:08', '2023-09-07 11:43:08');
INSERT INTO `admin_operation_log` VALUES (1334, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 11:45:17', '2023-09-07 11:45:17');
INSERT INTO `admin_operation_log` VALUES (1335, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 11:45:18', '2023-09-07 11:45:18');
INSERT INTO `admin_operation_log` VALUES (1336, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-09-07 11:49:42', '2023-09-07 11:49:42');
INSERT INTO `admin_operation_log` VALUES (1337, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"XBMvvFusRQ8mgeuBZO084wvwKakgYRMGnFhAsvLP\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-09-07 11:49:45', '2023-09-07 11:49:45');
INSERT INTO `admin_operation_log` VALUES (1338, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-07 11:49:45', '2023-09-07 11:49:45');
INSERT INTO `admin_operation_log` VALUES (1339, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 11:49:49', '2023-09-07 11:49:49');
INSERT INTO `admin_operation_log` VALUES (1340, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 11:49:52', '2023-09-07 11:49:52');
INSERT INTO `admin_operation_log` VALUES (1341, 1, 'admin/auth/menu/14/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 11:49:57', '2023-09-07 11:49:57');
INSERT INTO `admin_operation_log` VALUES (1342, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 11:54:55', '2023-09-07 11:54:55');
INSERT INTO `admin_operation_log` VALUES (1343, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 11:54:56', '2023-09-07 11:54:56');
INSERT INTO `admin_operation_log` VALUES (1344, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2023-09-07 11:54:59', '2023-09-07 11:54:59');
INSERT INTO `admin_operation_log` VALUES (1345, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-09-07 14:00:36', '2023-09-07 14:00:36');
INSERT INTO `admin_operation_log` VALUES (1346, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"4CKo1z7b8jE9kAuys5p1JRtnieUjU18BxjRsuK25\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-09-07 14:00:38', '2023-09-07 14:00:38');
INSERT INTO `admin_operation_log` VALUES (1347, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-07 14:00:38', '2023-09-07 14:00:38');
INSERT INTO `admin_operation_log` VALUES (1348, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 14:00:42', '2023-09-07 14:00:42');
INSERT INTO `admin_operation_log` VALUES (1349, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-07 14:00:44', '2023-09-07 14:00:44');
INSERT INTO `admin_operation_log` VALUES (1350, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"D3RsdT5IQbOcgSQ9epFWL5yPJ1IylzZGFyMEZVMo\",\"item_no\":\"PD23362882\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ERP777\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 14:01:34', '2023-09-07 14:01:34');
INSERT INTO `admin_operation_log` VALUES (1351, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"D3RsdT5IQbOcgSQ9epFWL5yPJ1IylzZGFyMEZVMo\",\"item_no\":\"PD23362882\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ERP777\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 14:01:45', '2023-09-07 14:01:45');
INSERT INTO `admin_operation_log` VALUES (1352, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"D3RsdT5IQbOcgSQ9epFWL5yPJ1IylzZGFyMEZVMo\",\"item_no\":\"PD23362882\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ERP777\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 14:01:50', '2023-09-07 14:01:50');
INSERT INTO `admin_operation_log` VALUES (1353, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"D3RsdT5IQbOcgSQ9epFWL5yPJ1IylzZGFyMEZVMo\",\"item_no\":\"PD23362882\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ERP777\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 15:19:39', '2023-09-07 15:19:39');
INSERT INTO `admin_operation_log` VALUES (1354, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"D3RsdT5IQbOcgSQ9epFWL5yPJ1IylzZGFyMEZVMo\",\"item_no\":\"PD23362882\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ERP777\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 15:19:55', '2023-09-07 15:19:55');
INSERT INTO `admin_operation_log` VALUES (1355, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"D3RsdT5IQbOcgSQ9epFWL5yPJ1IylzZGFyMEZVMo\",\"item_no\":\"PD23362882\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ERP777\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 15:20:38', '2023-09-07 15:20:38');
INSERT INTO `admin_operation_log` VALUES (1356, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"D3RsdT5IQbOcgSQ9epFWL5yPJ1IylzZGFyMEZVMo\",\"item_no\":\"PD23362882\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ERP777\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-07 15:51:14', '2023-09-07 15:51:14');
INSERT INTO `admin_operation_log` VALUES (1357, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-07 16:12:43', '2023-09-07 16:12:43');
INSERT INTO `admin_operation_log` VALUES (1358, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 16:12:45', '2023-09-07 16:12:45');
INSERT INTO `admin_operation_log` VALUES (1359, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 16:12:45', '2023-09-07 16:12:45');
INSERT INTO `admin_operation_log` VALUES (1360, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-07 16:12:53', '2023-09-07 16:12:53');
INSERT INTO `admin_operation_log` VALUES (1361, 0, 'admin/auth/login', 'GET', '127.0.0.1', '[]', '2023-09-08 08:20:20', '2023-09-08 08:20:20');
INSERT INTO `admin_operation_log` VALUES (1362, 0, 'admin/auth/login', 'POST', '127.0.0.1', '{\"_token\":\"MZVadcZV7yfLtH13mFawChKsSOjC22zpBPak7T24\",\"username\":\"admin\",\"password\":\"adm******\"}', '2023-09-08 08:20:22', '2023-09-08 08:20:22');
INSERT INTO `admin_operation_log` VALUES (1363, 1, 'admin', 'GET', '127.0.0.1', '[]', '2023-09-08 08:20:22', '2023-09-08 08:20:22');
INSERT INTO `admin_operation_log` VALUES (1364, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:21:14', '2023-09-08 08:21:14');
INSERT INTO `admin_operation_log` VALUES (1365, 1, 'admin/attrs', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:21:17', '2023-09-08 08:21:17');
INSERT INTO `admin_operation_log` VALUES (1366, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Extensions_Expand_AttrValue\",\"key\":\"2\"}', '2023-09-08 08:21:18', '2023-09-08 08:21:18');
INSERT INTO `admin_operation_log` VALUES (1367, 1, 'admin/dcat-api/render', 'GET', '127.0.0.1', '{\"renderable\":\"App_Admin_Extensions_Expand_AttrValue\",\"key\":\"1\"}', '2023-09-08 08:21:19', '2023-09-08 08:21:19');
INSERT INTO `admin_operation_log` VALUES (1368, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:21:22', '2023-09-08 08:21:22');
INSERT INTO `admin_operation_log` VALUES (1369, 1, 'admin/sku-stocks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:21:34', '2023-09-08 08:21:34');
INSERT INTO `admin_operation_log` VALUES (1370, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:24:02', '2023-09-08 08:24:02');
INSERT INTO `admin_operation_log` VALUES (1371, 1, 'admin/units', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:50:48', '2023-09-08 08:50:48');
INSERT INTO `admin_operation_log` VALUES (1372, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:50:54', '2023-09-08 08:50:54');
INSERT INTO `admin_operation_log` VALUES (1373, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:52:40', '2023-09-08 08:52:40');
INSERT INTO `admin_operation_log` VALUES (1374, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:52:42', '2023-09-08 08:52:42');
INSERT INTO `admin_operation_log` VALUES (1375, 1, 'admin/products/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 08:52:43', '2023-09-08 08:52:43');
INSERT INTO `admin_operation_log` VALUES (1376, 1, 'admin/products', 'POST', '127.0.0.1', '{\"_token\":\"6wkZry9kI5B38O6EFH4RX6emiNrHihLXcTHSRAaX\",\"item_no\":\"PD23369510\",\"name\":null,\"name_zh\":\"\\u51b0\\u7bb1\",\"name_ko\":\"\\ub0c9\\uc7a5\\uace0\",\"brand\":\"GREE\",\"unit_id\":\"2\",\"product_attr\":{\"new_1\":{\"attr_id\":\"1\",\"attr_value_ids\":\"ERP111\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"attr_id\":\"2\",\"attr_value_ids\":\"yellow\",\"id\":null,\"_remove_\":\"0\"}},\"_previous_\":\"http:\\/\\/127.0.0.1\\/admin\\/products\"}', '2023-09-08 08:53:19', '2023-09-08 08:53:19');
INSERT INTO `admin_operation_log` VALUES (1377, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:53:19', '2023-09-08 08:53:19');
INSERT INTO `admin_operation_log` VALUES (1378, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 08:53:22', '2023-09-08 08:53:22');
INSERT INTO `admin_operation_log` VALUES (1379, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 08:53:33', '2023-09-08 08:53:33');
INSERT INTO `admin_operation_log` VALUES (1380, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 08:53:34', '2023-09-08 08:53:34');
INSERT INTO `admin_operation_log` VALUES (1381, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 08:54:22', '2023-09-08 08:54:22');
INSERT INTO `admin_operation_log` VALUES (1382, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 08:54:23', '2023-09-08 08:54:23');
INSERT INTO `admin_operation_log` VALUES (1383, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 08:56:22', '2023-09-08 08:56:22');
INSERT INTO `admin_operation_log` VALUES (1384, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 08:56:23', '2023-09-08 08:56:23');
INSERT INTO `admin_operation_log` VALUES (1385, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 08:58:11', '2023-09-08 08:58:11');
INSERT INTO `admin_operation_log` VALUES (1386, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 08:58:12', '2023-09-08 08:58:12');
INSERT INTO `admin_operation_log` VALUES (1387, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 08:58:39', '2023-09-08 08:58:39');
INSERT INTO `admin_operation_log` VALUES (1388, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 08:58:40', '2023-09-08 08:58:40');
INSERT INTO `admin_operation_log` VALUES (1389, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 08:58:56', '2023-09-08 08:58:56');
INSERT INTO `admin_operation_log` VALUES (1390, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 08:58:58', '2023-09-08 08:58:58');
INSERT INTO `admin_operation_log` VALUES (1391, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 08:59:58', '2023-09-08 08:59:58');
INSERT INTO `admin_operation_log` VALUES (1392, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 08:59:59', '2023-09-08 08:59:59');
INSERT INTO `admin_operation_log` VALUES (1393, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:01:19', '2023-09-08 09:01:19');
INSERT INTO `admin_operation_log` VALUES (1394, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:01:20', '2023-09-08 09:01:20');
INSERT INTO `admin_operation_log` VALUES (1395, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:02:00', '2023-09-08 09:02:00');
INSERT INTO `admin_operation_log` VALUES (1396, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:02:02', '2023-09-08 09:02:02');
INSERT INTO `admin_operation_log` VALUES (1397, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:02:42', '2023-09-08 09:02:42');
INSERT INTO `admin_operation_log` VALUES (1398, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:02:43', '2023-09-08 09:02:43');
INSERT INTO `admin_operation_log` VALUES (1399, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:03:11', '2023-09-08 09:03:11');
INSERT INTO `admin_operation_log` VALUES (1400, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:03:12', '2023-09-08 09:03:12');
INSERT INTO `admin_operation_log` VALUES (1401, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:03:43', '2023-09-08 09:03:43');
INSERT INTO `admin_operation_log` VALUES (1402, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:03:45', '2023-09-08 09:03:45');
INSERT INTO `admin_operation_log` VALUES (1403, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:04:05', '2023-09-08 09:04:05');
INSERT INTO `admin_operation_log` VALUES (1404, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:04:06', '2023-09-08 09:04:06');
INSERT INTO `admin_operation_log` VALUES (1405, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:04:19', '2023-09-08 09:04:19');
INSERT INTO `admin_operation_log` VALUES (1406, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:04:22', '2023-09-08 09:04:22');
INSERT INTO `admin_operation_log` VALUES (1407, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:04:24', '2023-09-08 09:04:24');
INSERT INTO `admin_operation_log` VALUES (1408, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:04:26', '2023-09-08 09:04:26');
INSERT INTO `admin_operation_log` VALUES (1409, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:04:49', '2023-09-08 09:04:49');
INSERT INTO `admin_operation_log` VALUES (1410, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:04:50', '2023-09-08 09:04:50');
INSERT INTO `admin_operation_log` VALUES (1411, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:05:05', '2023-09-08 09:05:05');
INSERT INTO `admin_operation_log` VALUES (1412, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:05:07', '2023-09-08 09:05:07');
INSERT INTO `admin_operation_log` VALUES (1413, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:08:12', '2023-09-08 09:08:12');
INSERT INTO `admin_operation_log` VALUES (1414, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:08:13', '2023-09-08 09:08:13');
INSERT INTO `admin_operation_log` VALUES (1415, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:08:33', '2023-09-08 09:08:33');
INSERT INTO `admin_operation_log` VALUES (1416, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:08:34', '2023-09-08 09:08:34');
INSERT INTO `admin_operation_log` VALUES (1417, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:09:13', '2023-09-08 09:09:13');
INSERT INTO `admin_operation_log` VALUES (1418, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:09:14', '2023-09-08 09:09:14');
INSERT INTO `admin_operation_log` VALUES (1419, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:09:16', '2023-09-08 09:09:16');
INSERT INTO `admin_operation_log` VALUES (1420, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:09:17', '2023-09-08 09:09:17');
INSERT INTO `admin_operation_log` VALUES (1421, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 09:09:47', '2023-09-08 09:09:47');
INSERT INTO `admin_operation_log` VALUES (1422, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:09:48', '2023-09-08 09:09:48');
INSERT INTO `admin_operation_log` VALUES (1423, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:10:37', '2023-09-08 09:10:37');
INSERT INTO `admin_operation_log` VALUES (1424, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:10:39', '2023-09-08 09:10:39');
INSERT INTO `admin_operation_log` VALUES (1425, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:10:56', '2023-09-08 09:10:56');
INSERT INTO `admin_operation_log` VALUES (1426, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:10:57', '2023-09-08 09:10:57');
INSERT INTO `admin_operation_log` VALUES (1427, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:12:42', '2023-09-08 09:12:42');
INSERT INTO `admin_operation_log` VALUES (1428, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:12:45', '2023-09-08 09:12:45');
INSERT INTO `admin_operation_log` VALUES (1429, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:13:06', '2023-09-08 09:13:06');
INSERT INTO `admin_operation_log` VALUES (1430, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:13:07', '2023-09-08 09:13:07');
INSERT INTO `admin_operation_log` VALUES (1431, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:13:31', '2023-09-08 09:13:31');
INSERT INTO `admin_operation_log` VALUES (1432, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:13:32', '2023-09-08 09:13:32');
INSERT INTO `admin_operation_log` VALUES (1433, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:22:43', '2023-09-08 09:22:43');
INSERT INTO `admin_operation_log` VALUES (1434, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:22:44', '2023-09-08 09:22:44');
INSERT INTO `admin_operation_log` VALUES (1435, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:23:13', '2023-09-08 09:23:13');
INSERT INTO `admin_operation_log` VALUES (1436, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:23:15', '2023-09-08 09:23:15');
INSERT INTO `admin_operation_log` VALUES (1437, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:26:33', '2023-09-08 09:26:33');
INSERT INTO `admin_operation_log` VALUES (1438, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:26:34', '2023-09-08 09:26:34');
INSERT INTO `admin_operation_log` VALUES (1439, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:27:25', '2023-09-08 09:27:25');
INSERT INTO `admin_operation_log` VALUES (1440, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:27:28', '2023-09-08 09:27:28');
INSERT INTO `admin_operation_log` VALUES (1441, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:27:57', '2023-09-08 09:27:57');
INSERT INTO `admin_operation_log` VALUES (1442, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:27:58', '2023-09-08 09:27:58');
INSERT INTO `admin_operation_log` VALUES (1443, 1, 'admin/api/get-attr-value', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2023-09-08 09:27:58', '2023-09-08 09:27:58');
INSERT INTO `admin_operation_log` VALUES (1444, 1, 'admin/api/get-attr-value', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2023-09-08 09:27:58', '2023-09-08 09:27:58');
INSERT INTO `admin_operation_log` VALUES (1445, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:28:13', '2023-09-08 09:28:13');
INSERT INTO `admin_operation_log` VALUES (1446, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:28:15', '2023-09-08 09:28:15');
INSERT INTO `admin_operation_log` VALUES (1447, 1, 'admin/api/get-attr-value', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2023-09-08 09:28:16', '2023-09-08 09:28:16');
INSERT INTO `admin_operation_log` VALUES (1448, 1, 'admin/api/get-attr-value', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2023-09-08 09:28:16', '2023-09-08 09:28:16');
INSERT INTO `admin_operation_log` VALUES (1449, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:28:31', '2023-09-08 09:28:31');
INSERT INTO `admin_operation_log` VALUES (1450, 1, 'admin/products/1/edit', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:28:32', '2023-09-08 09:28:32');
INSERT INTO `admin_operation_log` VALUES (1451, 1, 'admin/api/get-attr-value', 'GET', '127.0.0.1', '{\"q\":\"2\"}', '2023-09-08 09:28:32', '2023-09-08 09:28:32');
INSERT INTO `admin_operation_log` VALUES (1452, 1, 'admin/api/get-attr-value', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2023-09-08 09:28:32', '2023-09-08 09:28:32');
INSERT INTO `admin_operation_log` VALUES (1453, 1, 'admin/suppliers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 09:28:45', '2023-09-08 09:28:45');
INSERT INTO `admin_operation_log` VALUES (1454, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 09:28:46', '2023-09-08 09:28:46');
INSERT INTO `admin_operation_log` VALUES (1455, 1, 'admin/purchase-orders/create', 'GET', '127.0.0.1', '{\"_dialog_form_\":\"1\"}', '2023-09-08 09:28:47', '2023-09-08 09:28:47');
INSERT INTO `admin_operation_log` VALUES (1456, 1, 'admin/api/get-product', 'GET', '127.0.0.1', '{\"q\":\"1\"}', '2023-09-08 09:28:51', '2023-09-08 09:28:51');
INSERT INTO `admin_operation_log` VALUES (1457, 1, 'admin/purchase-orders', 'GET', '127.0.0.1', '[]', '2023-09-08 09:33:04', '2023-09-08 09:33:04');
INSERT INTO `admin_operation_log` VALUES (1458, 1, 'admin/products', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2023-09-08 09:33:06', '2023-09-08 09:33:06');
INSERT INTO `admin_operation_log` VALUES (1459, 1, 'admin/products', 'GET', '127.0.0.1', '[]', '2023-09-08 09:33:06', '2023-09-08 09:33:06');

-- ----------------------------
-- Table structure for admin_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_permission_menu`;
CREATE TABLE `admin_permission_menu`  (
  `permission_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_permission_menu_permission_id_menu_id_unique`(`permission_id` ASC, `menu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permission_menu
-- ----------------------------

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order` int NOT NULL DEFAULT 0,
  `parent_id` bigint NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, '权限管理', 'auth-management', '', '', 1, 0, '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_permissions` VALUES (2, '管理员', 'users', '', '/auth/users*', 2, 1, '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_permissions` VALUES (3, '角色', 'roles', '', '/auth/roles*', 3, 1, '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_permissions` VALUES (4, '权限', 'permissions', '', '/auth/permissions*', 4, 1, '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_permissions` VALUES (5, '菜单', 'menu', '', '/auth/menu*', 5, 1, '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_permissions` VALUES (6, '日志', 'operation-log', '', '/auth/logs*', 6, 1, '2023-08-21 13:43:34', NULL);
INSERT INTO `admin_permissions` VALUES (7, '产品管理', 'productManager', '', '', 7, 0, '2023-08-28 09:27:12', '2023-08-28 09:27:12');
INSERT INTO `admin_permissions` VALUES (8, '产品档案', 'products', '', '/products*', 8, 7, '2023-08-28 09:28:21', '2023-08-28 09:28:21');
INSERT INTO `admin_permissions` VALUES (9, '产品单位', 'products-unit', '', '/units*', 9, 7, '2023-08-28 09:29:35', '2023-08-28 09:29:35');
INSERT INTO `admin_permissions` VALUES (10, '采购管理', 'purchaseManage', '', '', 10, 0, '2023-08-28 09:36:29', '2023-08-28 09:36:29');
INSERT INTO `admin_permissions` VALUES (11, '供应商档案', 'supplier', '', '/suppliers*', 11, 10, '2023-08-28 09:37:45', '2023-08-28 09:37:45');
INSERT INTO `admin_permissions` VALUES (12, '采购订购单', 'purchers-order', '', '/purchase-orders*', 12, 10, '2023-08-28 09:38:30', '2023-08-28 09:38:30');
INSERT INTO `admin_permissions` VALUES (13, '采购入库单', 'purchase-in-orders', '', '/purchase-in-orders*', 13, 10, '2023-08-28 09:39:19', '2023-08-28 09:39:27');
INSERT INTO `admin_permissions` VALUES (14, '库存管理', 'Inventory-management', '', '', 14, 0, '2023-08-28 09:40:28', '2023-08-28 09:40:28');
INSERT INTO `admin_permissions` VALUES (15, '产品库存', 'sku-stocks', '', '/sku-stocks*', 15, 14, '2023-08-28 09:41:41', '2023-08-28 09:41:41');
INSERT INTO `admin_permissions` VALUES (16, '批次库存', 'sku-stocks-batch', '', '/sku-stock-batchs*', 16, 14, '2023-08-28 09:42:22', '2023-08-28 09:42:29');
INSERT INTO `admin_permissions` VALUES (17, '仓库库位', 'positions', '', '/positions*', 17, 14, '2023-08-28 09:45:07', '2023-08-28 09:45:07');
INSERT INTO `admin_permissions` VALUES (18, '库存往来', 'stock-histories', '', '/stock-historys*', 18, 14, '2023-08-28 09:59:25', '2023-08-28 09:59:25');
INSERT INTO `admin_permissions` VALUES (19, '期初建账', 'init-stock-orders', '', '/init-stock-orders*', 19, 14, '2023-08-28 10:00:13', '2023-08-28 10:00:13');
INSERT INTO `admin_permissions` VALUES (20, '销售管理', 'saleManage', '', '', 20, 0, '2023-08-28 10:00:52', '2023-08-28 10:01:04');
INSERT INTO `admin_permissions` VALUES (21, '客户档案', 'customers', '', '/customers*', 21, 20, '2023-08-28 10:01:43', '2023-08-28 10:01:43');
INSERT INTO `admin_permissions` VALUES (22, '付款人信息', 'drawss', '', '/drawees*', 22, 20, '2023-08-28 10:03:02', '2023-08-28 10:03:02');
INSERT INTO `admin_permissions` VALUES (23, '客户订单', 'sale-orders', '', '/sale-orders*', 23, 20, '2023-08-28 10:03:25', '2023-08-28 10:03:25');
INSERT INTO `admin_permissions` VALUES (24, '客户出货单', 'sale-out-orders', '', '/sale-out-orders*', 24, 20, '2023-08-28 10:08:36', '2023-08-28 10:08:36');
INSERT INTO `admin_permissions` VALUES (25, '客户退货单', 'sale-in-orders', '', '/sale-in-orders*', 25, 20, '2023-08-28 10:09:16', '2023-08-28 10:09:16');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_menu_role_id_menu_id_unique`(`role_id` ASC, `menu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 9, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 10, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 11, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 12, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 13, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 14, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 15, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 16, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 17, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 18, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 19, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 20, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 21, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 22, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 23, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 24, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 25, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 26, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 27, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 28, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 33, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 36, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 41, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (1, 42, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 8, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 9, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 10, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 12, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 13, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 14, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 15, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 16, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 17, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 18, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 19, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 20, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 21, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 22, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 23, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 24, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 25, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 26, NULL, NULL);
INSERT INTO `admin_role_menu` VALUES (2, 27, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_permissions_role_id_permission_id_unique`(`role_id` ASC, `permission_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (2, 8, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 9, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 11, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 12, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 13, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 15, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 16, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 17, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 18, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 19, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 21, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 22, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 23, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 24, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 25, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE INDEX `admin_role_users_role_id_user_id_unique`(`role_id` ASC, `user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2023-08-21 13:43:34', '2023-08-21 13:43:34');
INSERT INTO `admin_roles` VALUES (2, 'User', 'User', '2023-08-28 08:59:01', '2023-08-28 08:59:01');

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$I2iVWA.Q2r1X0EFYFHWYLOzs5YcisofD867xFofqBtSIXuFhERJlK', 'Administrator', NULL, NULL, '2023-08-21 13:43:34', '2023-08-21 13:43:34');
INSERT INTO `admin_users` VALUES (2, 'user', '$2y$10$voOOpaHN3lvsoOnmJmsGQuL9bgJ3ooMjk1Z22Q/a72yJSrnLNHQRO', 'user', NULL, NULL, '2023-08-28 09:03:50', '2023-08-28 09:03:50');

-- ----------------------------
-- Table structure for apply_for_batch
-- ----------------------------
DROP TABLE IF EXISTS `apply_for_batch`;
CREATE TABLE `apply_for_batch`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单明细id',
  `actual_num` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实领数量',
  `stock_batch_id` int UNSIGNED NOT NULL COMMENT '出库批次库存id',
  `standard` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '检验标准',
  `percent` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '含绒量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply_for_batch
-- ----------------------------

-- ----------------------------
-- Table structure for apply_for_item
-- ----------------------------
DROP TABLE IF EXISTS `apply_for_item`;
CREATE TABLE `apply_for_item`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联单据',
  `sku_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品的skuId',
  `cost_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本价格',
  `standard` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '检验标准',
  `percent` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '含绒量',
  `should_num` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '申领数量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `actual_num` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实领数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `apply_for_item_order_id_index`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply_for_item
-- ----------------------------

-- ----------------------------
-- Table structure for apply_for_order
-- ----------------------------
DROP TABLE IF EXISTS `apply_for_order`;
CREATE TABLE `apply_for_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `with_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联任务id',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '单号',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `apply_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核人',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注',
  `review_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `apply_for_order_order_no_unique`(`order_no` ASC) USING BTREE,
  INDEX `apply_for_order_with_id_index`(`with_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apply_for_order
-- ----------------------------

-- ----------------------------
-- Table structure for attr
-- ----------------------------
DROP TABLE IF EXISTS `attr`;
CREATE TABLE `attr`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attr
-- ----------------------------
INSERT INTO `attr` VALUES (1, '型号__모델', NULL, '2023-09-07 10:43:57', '2023-09-07 10:43:57');
INSERT INTO `attr` VALUES (2, '颜色__색상', NULL, '2023-09-07 10:44:14', '2023-09-07 10:44:14');

-- ----------------------------
-- Table structure for attr_value
-- ----------------------------
DROP TABLE IF EXISTS `attr_value`;
CREATE TABLE `attr_value`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `attr_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '属性id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '属性值名称',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attr_value
-- ----------------------------
INSERT INTO `attr_value` VALUES (1, 1, 'ERP111', NULL, '2023-09-08 08:53:19', '2023-09-08 08:53:19');
INSERT INTO `attr_value` VALUES (2, 2, 'yellow', NULL, '2023-09-08 08:53:19', '2023-09-08 08:53:19');

-- ----------------------------
-- Table structure for check_product
-- ----------------------------
DROP TABLE IF EXISTS `check_product`;
CREATE TABLE `check_product`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `sku_stock_batch_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联批次库存id',
  `standard` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '检验标准',
  `carbon_fiber` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '碳纤维',
  `percent` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '含绒量',
  `raw_footage` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '毛片',
  `velvet` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '朵绒',
  `magazine` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '杂志',
  `fluffy_silk` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '绒丝',
  `terrestrial_feather` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '陆禽毛',
  `feather_silk` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '羽丝',
  `heterochromatic_hair` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '异色毛',
  `flower_number` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '朵数',
  `blackhead` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '黑头',
  `cleanliness` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '清洁度',
  `moisture` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '水份',
  `bulkiness` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '蓬松度',
  `odor` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '气味',
  `duck_ratio` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '鸭比',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '质检员',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `prev_sku_stock_batch_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联批次库存id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of check_product
-- ----------------------------

-- ----------------------------
-- Table structure for cost_item
-- ----------------------------
DROP TABLE IF EXISTS `cost_item`;
CREATE TABLE `cost_item`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `cost_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '费用类型',
  `pay_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付类型',
  `should_amount` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '应付金额',
  `actual_amount` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实付金额',
  `with_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '相关订单',
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `with_order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cost_item
-- ----------------------------

-- ----------------------------
-- Table structure for cost_order
-- ----------------------------
DROP TABLE IF EXISTS `cost_order`;
CREATE TABLE `cost_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `category` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0,
  `apply_id` int UNSIGNED NOT NULL DEFAULT 0,
  `review_status` tinyint UNSIGNED NOT NULL DEFAULT 0,
  `accountant_item_id` int UNSIGNED NOT NULL DEFAULT 0,
  `total_amount` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int UNSIGNED NOT NULL DEFAULT 0,
  `settlement_completed` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '结算完成',
  `settlement_amount` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '结算实付金额',
  `discount_amount` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '已优惠金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cost_order_order_no_unique`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cost_order
-- ----------------------------

-- ----------------------------
-- Table structure for craft
-- ----------------------------
DROP TABLE IF EXISTS `craft`;
CREATE TABLE `craft`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of craft
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `link` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '联系人',
  `pay_method` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付方式',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `other` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for customer_address
-- ----------------------------
DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE `customer_address`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '客户档案id',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '地址',
  `other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_address
-- ----------------------------

-- ----------------------------
-- Table structure for customer_drawee
-- ----------------------------
DROP TABLE IF EXISTS `customer_drawee`;
CREATE TABLE `customer_drawee`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '客户档案id',
  `drawee_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '付款人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer_drawee
-- ----------------------------

-- ----------------------------
-- Table structure for demand
-- ----------------------------
DROP TABLE IF EXISTS `demand`;
CREATE TABLE `demand`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '需求描述',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '需求类型',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '开发回复',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demand
-- ----------------------------

-- ----------------------------
-- Table structure for drawee
-- ----------------------------
DROP TABLE IF EXISTS `drawee`;
CREATE TABLE `drawee`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '付款人名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of drawee
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for init_stock_item
-- ----------------------------
DROP TABLE IF EXISTS `init_stock_item`;
CREATE TABLE `init_stock_item`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `sku_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT 'skuId',
  `percent` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '含绒量',
  `standard` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '检验标准',
  `actual_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '期初库存',
  `cost_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '成本价格',
  `position_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '库位',
  `batch_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '批次号',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of init_stock_item
-- ----------------------------

-- ----------------------------
-- Table structure for init_stock_order
-- ----------------------------
DROP TABLE IF EXISTS `init_stock_order`;
CREATE TABLE `init_stock_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '单号',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `apply_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核人',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '备注',
  `review_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `init_stock_order_order_no_unique`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of init_stock_order
-- ----------------------------

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '盘点批次号',
  `start_at` timestamp NULL DEFAULT NULL COMMENT '盘点开始时间',
  `end_at` timestamp NULL DEFAULT NULL COMMENT '盘点结束时间',
  `user_id` int UNSIGNED NOT NULL COMMENT '创建人',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `inventory_order_no_unique`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------

-- ----------------------------
-- Table structure for inventory_item
-- ----------------------------
DROP TABLE IF EXISTS `inventory_item`;
CREATE TABLE `inventory_item`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单id',
  `stock_batch_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '批次库存id',
  `should_num` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '库存数量',
  `actual_num` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '实盘数量',
  `diff_num` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '盈亏数量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cost_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本单价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory_item
-- ----------------------------

-- ----------------------------
-- Table structure for inventory_order
-- ----------------------------
DROP TABLE IF EXISTS `inventory_order`;
CREATE TABLE `inventory_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '单号',
  `with_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联id',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `apply_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核人',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `review_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `inventory_order_order_no_unique`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory_order
-- ----------------------------

-- ----------------------------
-- Table structure for make_product_item
-- ----------------------------
DROP TABLE IF EXISTS `make_product_item`;
CREATE TABLE `make_product_item`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联单据',
  `sku_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '生产入库商品的skuid',
  `should_num` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '计划入库数量',
  `actual_num` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实际入库数量',
  `cost_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本价格',
  `position_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '位置id',
  `batch_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '批次号',
  `percent` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '含绒量',
  `standard` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '检验标准',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sum_cost_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '成本总价格',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `make_product_item_order_id_index`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of make_product_item
-- ----------------------------

-- ----------------------------
-- Table structure for make_product_order
-- ----------------------------
DROP TABLE IF EXISTS `make_product_order`;
CREATE TABLE `make_product_order`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `with_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '相关单据id',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '单号',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建人',
  `apply_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核人',
  `other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `review_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `make_product_order_order_no_unique`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of make_product_order
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2018_08_08_100000_create_telescope_entries_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (6, '2020_08_31_163805_create_erp_tables', 1);
INSERT INTO `migrations` VALUES (7, '2020_09_07_093336_create_demand_table', 1);
INSERT INTO `migrations` VALUES (8, '2020_09_09_112141_change_purchase_order_table', 1);
INSERT INTO `migrations` VALUES (9, '2020_09_11_153432_change_purchase_in_order_table', 1);
INSERT INTO `migrations` VALUES (10, '2020_09_12_105700_change_product_table', 1);
INSERT INTO `migrations` VALUES (11, '2020_09_14_151506_create_stock_history_table', 1);
INSERT INTO `migrations` VALUES (12, '2020_09_15_103519_change_sale_order_table', 1);
INSERT INTO `migrations` VALUES (13, '2020_09_15_143540_change_sale_order_customer_table', 1);
INSERT INTO `migrations` VALUES (14, '2020_09_15_180651_change_sale_item_batch_table', 1);
INSERT INTO `migrations` VALUES (15, '2020_09_16_144109_change_stock_table', 1);
INSERT INTO `migrations` VALUES (16, '2020_12_27_183241_create_check_product_table', 1);
INSERT INTO `migrations` VALUES (17, '2021_05_03_165934_add_percent_into_purchase_in_item_table', 1);
INSERT INTO `migrations` VALUES (18, '2021_05_03_170257_add_percent_into_purchase_item_table', 1);
INSERT INTO `migrations` VALUES (19, '2021_05_03_170455_add_sku_stock_batch_table', 1);
INSERT INTO `migrations` VALUES (20, '2021_05_03_173228_add_stock_history_table', 1);
INSERT INTO `migrations` VALUES (21, '2021_05_03_174314_add_sku_stock_table', 1);
INSERT INTO `migrations` VALUES (22, '2021_05_03_235914_add_percent_into_sale_order_table', 1);
INSERT INTO `migrations` VALUES (23, '2021_05_04_031815_add_order_no_into_check_product_table', 1);
INSERT INTO `migrations` VALUES (24, '2021_05_19_153337_create_task_table', 1);
INSERT INTO `migrations` VALUES (25, '2021_05_19_154045_create_craft_table', 1);
INSERT INTO `migrations` VALUES (26, '2021_05_19_165032_add_product_into_task_table', 1);
INSERT INTO `migrations` VALUES (27, '2021_05_20_102333_create_apply_for_order_table', 1);
INSERT INTO `migrations` VALUES (28, '2021_05_20_104444_create_apply_for_item_table', 1);
INSERT INTO `migrations` VALUES (29, '2021_05_25_115455_add_actual_num_into_apply_for_item_table', 1);
INSERT INTO `migrations` VALUES (30, '2021_05_25_123906_create_apply_for_batch_table', 1);
INSERT INTO `migrations` VALUES (31, '2021_05_25_154146_create_make_product_order_table', 1);
INSERT INTO `migrations` VALUES (32, '2021_05_25_154943_create_make_product_item_table', 1);
INSERT INTO `migrations` VALUES (33, '2021_05_26_173837_create_inventory_table', 1);
INSERT INTO `migrations` VALUES (34, '2021_05_26_180321_create_inventory_order_table', 1);
INSERT INTO `migrations` VALUES (35, '2021_05_26_181228_create_inventory_item_table', 1);
INSERT INTO `migrations` VALUES (36, '2021_05_26_184013_add_status_into_inventory_table', 1);
INSERT INTO `migrations` VALUES (37, '2021_05_27_115145_add_cost_price_into_inventory_item_table', 1);
INSERT INTO `migrations` VALUES (38, '2021_05_27_125904_create_order_no_generator_table', 1);
INSERT INTO `migrations` VALUES (39, '2021_05_27_135412_add_inventory_field_into_stock_history', 1);
INSERT INTO `migrations` VALUES (40, '2021_05_27_153237_create_init_stock_order_table', 1);
INSERT INTO `migrations` VALUES (41, '2021_05_27_154515_create_init_stock_item_table', 1);
INSERT INTO `migrations` VALUES (42, '2021_06_01_151207_create_accountant_date_item_table', 1);
INSERT INTO `migrations` VALUES (43, '2021_06_01_151227_create_accountant_date_table', 1);
INSERT INTO `migrations` VALUES (44, '2021_06_01_155940_add_day_type_into_accountant_date_table', 1);
INSERT INTO `migrations` VALUES (45, '2021_06_01_171441_add_month_into_accountant_date_item_table', 1);
INSERT INTO `migrations` VALUES (46, '2021_06_03_174347_create_purchase_order_amount_table', 1);
INSERT INTO `migrations` VALUES (47, '2021_06_04_093831_add_settlement_into_purchase_order_amount_table', 1);
INSERT INTO `migrations` VALUES (48, '2021_06_04_134800_create_cost_order_table', 1);
INSERT INTO `migrations` VALUES (49, '2021_06_04_135847_create_cost_item_table', 1);
INSERT INTO `migrations` VALUES (50, '2021_06_05_090208_add_company_name_into_cost_order_table', 1);
INSERT INTO `migrations` VALUES (51, '2021_06_05_090233_add_with_order_no_into_cost_item_table', 1);
INSERT INTO `migrations` VALUES (52, '2021_06_05_101228_create_sale_order_amount_table', 1);
INSERT INTO `migrations` VALUES (53, '2021_06_05_103545_add_apply_at_into_purchase_in_order_table', 1);
INSERT INTO `migrations` VALUES (54, '2021_06_05_103621_add_apply_at_into_sale_out_order_table', 1);
INSERT INTO `migrations` VALUES (55, '2021_06_05_120442_create_statement_order_table', 1);
INSERT INTO `migrations` VALUES (56, '2021_06_05_211141_create_statement_item_table', 1);
INSERT INTO `migrations` VALUES (57, '2021_06_06_170840_add_field_into_cost_order_table', 1);
INSERT INTO `migrations` VALUES (58, '2021_06_06_173314_add_discount_amount_into_cost_order_table', 1);
INSERT INTO `migrations` VALUES (59, '2021_06_11_174118_add_cost_price_into_sale_out_table', 1);
INSERT INTO `migrations` VALUES (60, '2021_06_11_174643_add_profit_into_sale_out_item_table', 1);
INSERT INTO `migrations` VALUES (61, '2021_06_11_174955_add_sum_price_into_sale_out_item_table', 1);
INSERT INTO `migrations` VALUES (62, '2021_06_11_210047_add_sum_cost_price_into_make_product_item_table', 1);

-- ----------------------------
-- Table structure for order_no_generator
-- ----------------------------
DROP TABLE IF EXISTS `order_no_generator`;
CREATE TABLE `order_no_generator`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `prefix` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单前缀',
  `happen_date` date NOT NULL COMMENT '日期',
  `number` int UNSIGNED NOT NULL COMMENT '序号',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no_generator_prefix_happen_date_unique`(`prefix` ASC, `happen_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_no_generator
-- ----------------------------
INSERT INTO `order_no_generator` VALUES (1, 'CG', '2023-09-04', 2, '2023-09-04 15:39:52', '2023-09-04 15:52:23');
INSERT INTO `order_no_generator` VALUES (2, 'RK', '2023-09-05', 1, '2023-09-05 08:20:54', '2023-09-05 08:20:54');
INSERT INTO `order_no_generator` VALUES (3, 'CG', '2023-09-07', 1, '2023-09-07 08:30:13', '2023-09-07 08:30:13');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '位置名称',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '产品名称',
  `py_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '拼音码',
  `item_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '产品编号',
  `unit_id` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '单位',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT 0 COMMENT '型号',
  `attribute` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '规格',
  `brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品牌',
  `package` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '包装量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
