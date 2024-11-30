/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.28-MariaDB : Database - store_dani
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`store_dani` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `store_dani`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`description`,`uuid`) values 
(10,'granos','granos como arroz, frijol, arveja..','2fe05665-87e5-11ef-9451-0ae0afa00364'),
(11,'Bedidas enbotelladas','bebidas de todo tipo consumo humano','2fe166ca-87e5-11ef-9451-0ae0afa00364'),
(12,'frutas y verduras','verduras y demas naturales','2fe16828-87e5-11ef-9451-0ae0afa00364'),
(13,'carnes','carnes de cerdo, res, pollo y demas\n','2fe168c6-87e5-11ef-9451-0ae0afa00364'),
(14,'abarrotes','productos generales de uso diario','2fe1695d-87e5-11ef-9451-0ae0afa00364'),
(15,'mascotas','alimentos para mascotas','2fe169f3-87e5-11ef-9451-0ae0afa00364'),
(16,'mecato xunidad','mecato por paquetes unitarios','2fe16a96-87e5-11ef-9451-0ae0afa00364'),
(17,'ropa','ropas de todo tipo','2fe16b2d-87e5-11ef-9451-0ae0afa00364'),
(18,'canasta diaria','','3379c83e-8b54-11ef-9886-0ae0afa00364');

/*Table structure for table `documenttype` */

DROP TABLE IF EXISTS `documenttype`;

CREATE TABLE `documenttype` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `documenttype` */

insert  into `documenttype`(`id`,`type`,`uuid`) values 
(4,'T.I','5edbe3a6-8804-11ef-ade4-0ae0afa00364'),
(5,'C.C','5edbe5dc-8804-11ef-ade4-0ae0afa00364'),
(6,'C.E','5edbe67d-8804-11ef-ade4-0ae0afa00364'),
(7,'r.c','27d98b85-9246-11ef-b347-0ae0afa00364');

/*Table structure for table `invoice` */

DROP TABLE IF EXISTS `invoice`;

CREATE TABLE `invoice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `statusId` int(20) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `total` decimal(10,4) DEFAULT NULL,
  `paymentMethod` int(20) DEFAULT NULL,
  `userId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `statusId` (`statusId`),
  KEY `paymentMethod` (`paymentMethod`),
  KEY `userId` (`userId`),
  CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `invoicestatus` (`id`),
  CONSTRAINT `invoice_ibfk_4` FOREIGN KEY (`paymentMethod`) REFERENCES `paymentmethod` (`id`),
  CONSTRAINT `invoice_ibfk_5` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoice` */

insert  into `invoice`(`id`,`statusId`,`createdAt`,`updatedAt`,`uuid`,`total`,`paymentMethod`,`userId`) values 
(1,1,'2024-10-22 13:37:16',NULL,'51f3c79f-8808-11ef-ade4-0ae0afa00364',NULL,1,1),
(2,2,'2024-10-22 13:37:22',NULL,'61648a95-8808-11ef-ade4-0ae0afa00364',NULL,1,2),
(4,1,'2024-10-30 12:30:48',NULL,'b3dc508f-96e4-11ef-b93c-0ae0afa00364',8000.0000,1,8),
(5,1,'2024-10-30 12:32:30',NULL,'f0ba3641-96e4-11ef-b93c-0ae0afa00364',20000.0000,1,8),
(6,1,'2024-10-30 12:35:36',NULL,'5f9282d3-96e5-11ef-b93c-0ae0afa00364',16000.0000,1,8),
(7,1,'2024-10-30 12:36:34',NULL,'822440fe-96e5-11ef-b93c-0ae0afa00364',8000.0000,1,8),
(8,1,'2024-10-31 11:44:51',NULL,'72afa5c8-97a7-11ef-ac34-0ae0afa00364',16000.0000,1,2),
(9,1,'2024-10-31 11:45:17',NULL,'82343c81-97a7-11ef-ac34-0ae0afa00364',56400.0000,1,2),
(11,1,'2024-11-02 18:32:30',NULL,'ba910b3f-9972-11ef-8688-0ae0afa00364',8000.0000,1,5),
(14,1,'2024-11-02 18:41:50',NULL,'07ee4612-9974-11ef-8688-0ae0afa00364',4000.0000,1,4);

/*Table structure for table `invoiceproduct` */

DROP TABLE IF EXISTS `invoiceproduct`;

CREATE TABLE `invoiceproduct` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `productId` int(20) DEFAULT NULL,
  `invoiceId` int(20) DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `productId` (`productId`),
  KEY `invoiceId` (`invoiceId`),
  CONSTRAINT `invoiceproduct_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `invoiceproduct_ibfk_2` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoiceproduct` */

insert  into `invoiceproduct`(`id`,`productId`,`invoiceId`,`uuid`,`quantity`) values 
(1,11,1,'aa1651a3-880b-11ef-ade4-0ae0afa00364',2),
(2,2,4,'b3dcb730-96e4-11ef-b93c-0ae0afa00364',2),
(3,2,5,'f0babfeb-96e4-11ef-b93c-0ae0afa00364',1),
(4,3,5,'f0bb8a0a-96e4-11ef-b93c-0ae0afa00364',2),
(5,3,6,'5f92e1ef-96e5-11ef-b93c-0ae0afa00364',2),
(6,3,7,'8224b1a1-96e5-11ef-b93c-0ae0afa00364',1),
(7,3,8,'72b1e6f4-97a7-11ef-ac34-0ae0afa00364',2),
(8,4,9,'8234c71f-97a7-11ef-ac34-0ae0afa00364',3),
(9,11,9,'8235bdcf-97a7-11ef-ac34-0ae0afa00364',2),
(11,3,11,'ba93296b-9972-11ef-8688-0ae0afa00364',1),
(14,2,14,'07eea25b-9974-11ef-8688-0ae0afa00364',1);

/*Table structure for table `invoicestatus` */

DROP TABLE IF EXISTS `invoicestatus`;

CREATE TABLE `invoicestatus` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `uuid_2` (`uuid`),
  UNIQUE KEY `uuid_3` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoicestatus` */

insert  into `invoicestatus`(`id`,`name`,`description`,`uuid`) values 
(1,'pagado',NULL,'7c5bf6dd-880d-11ef-ade4-0ae0afa00364'),
(2,'cancelado',NULL,'841f461f-880d-11ef-ade4-0ae0afa00364');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `invoiceId` int(20) DEFAULT NULL,
  `statusId` int(20) DEFAULT NULL,
  `details` tinytext DEFAULT NULL,
  `uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoiceId` (`invoiceId`),
  KEY `statusId` (`statusId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`statusId`) REFERENCES `orderstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `order` */

/*Table structure for table `orderstatus` */

DROP TABLE IF EXISTS `orderstatus`;

CREATE TABLE `orderstatus` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `orderstatus` */

/*Table structure for table `paymentgatewayrecords` */

DROP TABLE IF EXISTS `paymentgatewayrecords`;

CREATE TABLE `paymentgatewayrecords` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `response` text DEFAULT NULL,
  `invoiceId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoiceId` (`invoiceId`),
  CONSTRAINT `paymentgatewayrecords_ibfk_2` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paymentgatewayrecords` */

/*Table structure for table `paymentmethod` */

DROP TABLE IF EXISTS `paymentmethod`;

CREATE TABLE `paymentmethod` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `method` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paymentmethod` */

insert  into `paymentmethod`(`id`,`method`) values 
(1,'Efectivo');

/*Table structure for table `people` */

DROP TABLE IF EXISTS `people`;

CREATE TABLE `people` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `documentTypeId` int(20) DEFAULT NULL,
  `documentNumber` varchar(12) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 0,
  `uuid` char(36) NOT NULL,
  `userId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `documentTypeId` (`documentTypeId`),
  KEY `userId` (`userId`),
  CONSTRAINT `people_ibfk_1` FOREIGN KEY (`documentTypeId`) REFERENCES `documenttype` (`id`),
  CONSTRAINT `people_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `people` */

insert  into `people`(`id`,`firstName`,`lastName`,`address`,`documentTypeId`,`documentNumber`,`phone`,`createdAt`,`updatedAt`,`isActive`,`uuid`,`userId`) values 
(1,'Juan','Perez','Calle 45 22-33',4,'1234567890','32132145','2024-10-29 16:08:59','2024-10-24 15:25:07',1,'f5e18d0a-8a78-11ef-9c33-0ae0afa00364',3),
(2,'Camilo C','Rendon ','Vereda Palermo norte',5,'12536842','3215324830','2024-11-03 07:42:09','2024-11-03 07:42:09',1,'f5e21893-8a78-11ef-9c33-0ae0afa00364',4),
(3,'Camilo ','Calderon','calle 5 #3 sur',5,'1256891','3227569852','2024-10-29 16:08:46','2024-10-20 11:43:12',1,'f5e2198a-8a78-11ef-9c33-0ae0afa00364',1),
(4,'Sarah M','mandrogan','centro',5,'1245002','3226440156','2024-10-29 16:08:55','2024-10-24 15:25:10',1,'f5e21a2f-8a78-11ef-9c33-0ae0afa00364',2),
(5,'Andres','Sambony','mocoa_putumayo_colombia',4,'12345686','3227349082','2024-10-29 17:37:15',NULL,1,'58cfec2d-9646-11ef-89a7-0ae0afa00364',5),
(8,'Final','user','mocoa_putumayo_colombia',4,'2222222','32333','2024-10-29 17:43:21',NULL,1,'32e54b5b-9647-11ef-89a7-0ae0afa00364',8),
(9,'Daniel ','Morales','calle 3 sur- AV northe',5,'124583','3224756839','2024-11-02 19:02:00',NULL,1,'d933f6c6-9976-11ef-8688-0ae0afa00364',9),
(11,'Andres','Iles','carlos Galan',5,'124568','3124569834','2024-11-02 20:58:10',NULL,1,'140fef63-9987-11ef-8688-0ae0afa00364',11),
(19,'admin','admin','center',5,'0','3333','2024-11-03 07:51:45',NULL,1,'621a7fae-99e2-11ef-8465-0ae0afa00364',19);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT 1,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`stock`,`price`,`createdAt`,`updatedAt`,`isActive`,`uuid`) values 
(2,'Leche',24,4000,'2024-10-02 10:01:00','2024-10-30 14:25:22',1,'52a9da61-8a7c-11ef-907d-0ae0afa00364'),
(3,'Pollo (kg)',6,8000,'2024-10-02 10:02:00','2024-10-16 10:39:37',1,'52a9ed50-8a7c-11ef-907d-0ae0afa00364'),
(4,'Carne de Res (kg)',7,18000,'2024-10-02 10:03:00','2024-10-02 10:03:00',1,'52a9ee30-8a7c-11ef-907d-0ae0afa00364'),
(5,'Manzana (unidad)',49,2000,'2024-10-02 10:04:00','2024-10-30 14:25:31',1,'52a9eed3-8a7c-11ef-907d-0ae0afa00364'),
(6,'Jugo (botella)',20,3000,'2024-10-02 10:05:00','2024-10-20 12:30:14',1,'52a9ef69-8a7c-11ef-907d-0ae0afa00364'),
(7,'Huevo (docena)',30,5000,'2024-10-02 10:06:00','2024-10-02 10:06:00',1,'52a9f001-8a7c-11ef-907d-0ae0afa00364'),
(8,'Tetra Pak',40,3000,'2024-10-02 10:07:00','2024-10-02 10:07:00',1,'52a9f094-8a7c-11ef-907d-0ae0afa00364'),
(9,'Hueso perro',10,2500,'2024-10-02 10:08:00','2024-10-02 10:08:00',1,'52a9f123-8a7c-11ef-907d-0ae0afa00364'),
(11,'Galletas xunidad',16,1200,'2024-10-02 16:33:00',NULL,1,'52a9f1b4-8a7c-11ef-907d-0ae0afa00364'),
(12,'agua xL(botella)',18,1500,'2024-10-03 21:26:59',NULL,1,'52a9f24e-8a7c-11ef-907d-0ae0afa00364'),
(16,'Panela x1kl',12,4500,'2024-10-15 19:21:48',NULL,1,'a1eee3af-8b54-11ef-9886-0ae0afa00364'),
(20,'Panela x1kl',12,4500,'2024-10-16 09:43:55',NULL,1,'11c3b277-8bcd-11ef-a996-0ae0afa00364'),
(21,'Panela x1kl',12,4500,'2024-10-30 14:31:18',NULL,1,'8925c2d7-96f5-11ef-b93c-0ae0afa00364'),
(23,'Panela x1kl',12,4500,'2024-10-30 14:34:55',NULL,1,'0ab68d8f-96f6-11ef-b93c-0ae0afa00364');

/*Table structure for table `productcategory` */

DROP TABLE IF EXISTS `productcategory`;

CREATE TABLE `productcategory` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `categoryId` int(20) DEFAULT NULL,
  `productId` int(20) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `categoryId` (`categoryId`),
  KEY `productId` (`productId`),
  CONSTRAINT `productcategory_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`),
  CONSTRAINT `productcategory_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productcategory` */

insert  into `productcategory`(`id`,`categoryId`,`productId`,`uuid`) values 
(31,13,4,'5d878e8b-8a7d-11ef-907d-0ae0afa00364'),
(32,12,5,'5d878f21-8a7d-11ef-907d-0ae0afa00364'),
(33,11,6,'5d878fb0-8a7d-11ef-907d-0ae0afa00364'),
(34,15,7,'5d87903b-8a7d-11ef-907d-0ae0afa00364'),
(35,14,8,'5d8790c3-8a7d-11ef-907d-0ae0afa00364'),
(36,15,9,'5d87914c-8a7d-11ef-907d-0ae0afa00364'),
(38,16,11,'5d8791d3-8a7d-11ef-907d-0ae0afa00364'),
(39,11,12,'5d879260-8a7d-11ef-907d-0ae0afa00364'),
(61,13,3,'d9a570de-8bd4-11ef-a996-0ae0afa00364'),
(65,14,2,'d65bd17e-96e4-11ef-b93c-0ae0afa00364'),
(66,11,2,'d65cafb2-96e4-11ef-b93c-0ae0afa00364'),
(67,18,2,'d65cfdea-96e4-11ef-b93c-0ae0afa00364'),
(68,14,21,'892baccb-96f5-11ef-b93c-0ae0afa00364'),
(69,18,21,'892c1545-96f5-11ef-b93c-0ae0afa00364'),
(72,14,23,'0aba7bfb-96f6-11ef-b93c-0ae0afa00364'),
(73,18,23,'0abc8378-96f6-11ef-b93c-0ae0afa00364');

/*Table structure for table `productdesc` */

DROP TABLE IF EXISTS `productdesc`;

CREATE TABLE `productdesc` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `productId` int(20) DEFAULT NULL,
  `discount` tinyint(1) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `productId` (`productId`),
  CONSTRAINT `productdesc_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productdesc` */

insert  into `productdesc`(`id`,`productId`,`discount`,`uuid`) values 
(1,2,127,'46bd3154-8afb-11ef-b3f0-0ae0afa00364'),
(2,3,100,'46be083f-8afb-11ef-b3f0-0ae0afa00364'),
(4,4,127,'48bfaaff-8afd-11ef-b3f0-0ae0afa00364');

/*Table structure for table `productsstore` */

DROP TABLE IF EXISTS `productsstore`;

CREATE TABLE `productsstore` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `productid` int(20) DEFAULT NULL,
  `storeId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productid` (`productid`),
  KEY `storeId` (`storeId`),
  CONSTRAINT `productsstore_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`id`),
  CONSTRAINT `productsstore_ibfk_2` FOREIGN KEY (`storeId`) REFERENCES `store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productsstore` */

insert  into `productsstore`(`id`,`productid`,`storeId`) values 
(1,2,1),
(2,3,1),
(3,4,1),
(4,5,1),
(5,6,1),
(6,7,1),
(7,8,1),
(8,9,1),
(9,11,1),
(10,12,1),
(12,16,1),
(13,20,1),
(15,23,1);

/*Table structure for table `productsupplier` */

DROP TABLE IF EXISTS `productsupplier`;

CREATE TABLE `productsupplier` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `productId` int(20) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `userId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `productId` (`productId`),
  KEY `userId` (`userId`),
  CONSTRAINT `productsupplier_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `productsupplier_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `productsupplier` */

insert  into `productsupplier`(`id`,`productId`,`uuid`,`userId`) values 
(1,2,'2a310bab-8afe-11ef-b3f0-0ae0afa00364',NULL);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` tinytext DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`description`,`uuid`) values 
(1,'clientes',NULL,'aecaf99d-8afe-11ef-b3f0-0ae0afa00364'),
(2,'Vendedor',NULL,'aecbd866-8afe-11ef-b3f0-0ae0afa00364'),
(3,'Admin',NULL,'329b4608-8aff-11ef-b3f0-0ae0afa00364'),
(4,'Surtidor',NULL,'497669ad-8aff-11ef-b3f0-0ae0afa00364');

/*Table structure for table `store` */

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(155) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `store` */

insert  into `store`(`id`,`name`,`description`) values 
(1,'Store Dani Central',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`createdAt`,`updatedAt`,`uuid`) values 
(1,'','','2024-10-20 11:10:40',NULL,'d9d6617f-8efd-11ef-98bf-0ae0afa00364'),
(2,'','','2024-10-20 11:40:20',NULL,'dc77a6cd-8efd-11ef-98bf-0ae0afa00364'),
(3,'','','2024-10-20 11:11:01',NULL,'e660549e-8efd-11ef-98bf-0ae0afa00364'),
(4,'','','2024-10-20 11:40:30',NULL,'edffd5f7-8efd-11ef-98bf-0ae0afa00364'),
(5,'','','2024-10-29 17:37:15',NULL,'58cf51a7-9646-11ef-89a7-0ae0afa00364'),
(8,'','','2024-10-29 17:43:21',NULL,'32e053c1-9647-11ef-89a7-0ae0afa00364'),
(9,'','','2024-11-02 19:02:00',NULL,'d92dfcc1-9976-11ef-8688-0ae0afa00364'),
(11,'Ilesandres6','$2b$13$vsGSsU.04PdexVFrk6Q/0eB.HD7NDCWtw2RhO4GdWTI6P9.uRpH/O','2024-11-02 20:58:10',NULL,'140c7391-9987-11ef-8688-0ae0afa00364'),
(19,'admin','$2b$13$itb7swrpSjjDgKNQdRNisekSCI3HyeY3K0v/A7s3acYyVjW8R4a6a','2024-11-03 07:51:45',NULL,'6217bc1f-99e2-11ef-8465-0ae0afa00364');

/*Table structure for table `userroles` */

DROP TABLE IF EXISTS `userroles`;

CREATE TABLE `userroles` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `rolId` int(20) DEFAULT NULL,
  `uuid` char(36) NOT NULL,
  `userId` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `rolId` (`rolId`),
  KEY `userId` (`userId`),
  CONSTRAINT `userroles_ibfk_2` FOREIGN KEY (`rolId`) REFERENCES `roles` (`id`),
  CONSTRAINT `userroles_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `userroles` */

insert  into `userroles`(`id`,`rolId`,`uuid`,`userId`) values 
(1,1,'1a7ecf23-8a7a-11ef-9c33-0ae0afa00364',1),
(2,1,'1a7f75f5-8a7a-11ef-9c33-0ae0afa00364',2),
(3,1,'1a7f7702-8a7a-11ef-9c33-0ae0afa00364',3),
(4,2,'1a7f7794-8a7a-11ef-9c33-0ae0afa00364',4),
(5,2,'a40fbf87-8a7b-11ef-907d-0ae0afa00364',1),
(6,1,'62227167-8f02-11ef-98bf-0ae0afa00364',4),
(7,1,'a1e9393e-9646-11ef-89a7-0ae0afa00364',5),
(8,1,'32e5e514-9647-11ef-89a7-0ae0afa00364',8),
(9,1,'d9354426-9976-11ef-8688-0ae0afa00364',9),
(11,2,'1410fc27-9987-11ef-8688-0ae0afa00364',11),
(19,2,'621d61d6-99e2-11ef-8465-0ae0afa00364',19);

/* Trigger structure for table `category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_category` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_category` BEFORE INSERT ON `category` FOR EACH ROW 
begin
	IF NEW.uuid IS NULL OR NEW.uuid ='' THEN 
		SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `documenttype` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_typeDni` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_typeDni` BEFORE INSERT ON `documenttype` FOR EACH ROW 
BEGIN 
	if NEW.uuid IS NULL OR NEW.uuid ='' THEN
	SET NEW.uuid =UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `invoice` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_invoice` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_invoice` BEFORE INSERT ON `invoice` FOR EACH ROW 
BEGIN
  IF NEW.uuid IS NULL OR NEW.uuid = '' THEN
    SET NEW.uuid = UUID();
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `invoiceproduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_productInvoice` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_productInvoice` BEFORE INSERT ON `invoiceproduct` FOR EACH ROW 
BEGIN 
IF NEW.uuid IS NULL OR NEW.uuid='' THEN
SET NEW.uuid=UUID();
END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `invoicestatus` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_invoiceStatus` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_invoiceStatus` BEFORE INSERT ON `invoicestatus` FOR EACH ROW 
BEGIN 
IF NEW.uuid IS NULL OR NEW.uuid= '' THEN
 SET NEW.uuid=UUID();
END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `order` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_order` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_order` BEFORE INSERT ON `order` FOR EACH ROW 
BEGIN 
	IF NEW.uuid IS NULL OR NEW.uuid='' THEN
		SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `people` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_people` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_people` BEFORE INSERT ON `people` FOR EACH ROW 
BEGIN
	IF NEW.uuid IS NULL OR NEW.uuid='' THEN 
		SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `product` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_product` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_product` BEFORE INSERT ON `product` FOR EACH ROW 
BEGIN
	IF NEW.uuid IS NULL OR NEW.uuid='' THEN
		set NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `productcategory` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_product_category` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_product_category` BEFORE INSERT ON `productcategory` FOR EACH ROW 
BEGIN 
	IF NEW.uuid IS NULL OR NEW.uuid='' THEN
	 SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `productdesc` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_product_desc` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_product_desc` BEFORE INSERT ON `productdesc` FOR EACH ROW 
BEGIN 
	IF NEW.uuid IS NULL OR NEW.uuid ='' THEN
		SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `productsupplier` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_producsupplier` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_producsupplier` BEFORE INSERT ON `productsupplier` FOR EACH ROW 
BEGIN
	IF NEW.uuid IS NULL OR NEW.uuid='' THEN 
		SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `roles` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_rol` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_rol` BEFORE INSERT ON `roles` FOR EACH ROW 
BEGIN
	IF NEW.uuid IS NULL OR NEW.uuid='' THEN
		SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `user` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_user` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_user` BEFORE INSERT ON `user` FOR EACH ROW 
BEGIN
	IF NEW.uuid IS NULL OR NEW.uuid='' THEN
		SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `userroles` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_peopl_rol` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_peopl_rol` BEFORE INSERT ON `userroles` FOR EACH ROW 
BEGIN
	IF NEW.uuid IS NULL OR NEW.uuid='' THEN 
		SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `userroles` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `before_insert_people_rol` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `before_insert_people_rol` BEFORE INSERT ON `userroles` FOR EACH ROW 
BEGIN
	IF NEW.uuid IS NULL OR NEW.uuid='' THEN 
		SET NEW.uuid=UUID();
	END IF;
END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
