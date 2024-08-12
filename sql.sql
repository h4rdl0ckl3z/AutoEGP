/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : egp

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 08/07/2023 13:18:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for egp
-- ----------------------------
DROP TABLE IF EXISTS `egp`;
CREATE TABLE `egp`  (
  `EGPID` int NOT NULL AUTO_INCREMENT,
  `numID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pubDate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pubt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pubd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pubm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `puby` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`EGPID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of egp
-- ----------------------------
INSERT INTO `egp` VALUES (1, '1484217300', 'จ้างจัดทำป้ายไวนิลเพื่อประชาสัมพันธ์งานจราจรและการรักษาความปลอดภัย จำนวน ๓ รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037480710&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-24', '1', '24', '3', '2023');
INSERT INTO `egp` VALUES (2, '1484217300', 'ซื้อวัสดุภัณฑ์ทางเคมีประจำสระว่ายน้ำ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037502604&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-24', '1', '24', '3', '2023');
INSERT INTO `egp` VALUES (3, '1484217300', 'จ้างซ่อมแซมสุขภัณฑ์ห้องน้ำคณะมนุษยศาสตร์และสังคมศาสตร์ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037118339&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=3', '2023-03-24', '1', '24', '3', '2023');
INSERT INTO `egp` VALUES (4, '1484217300', 'จ้างซ่อมแซมเครื่องปรับอากาศโครงการจัดตั้งกองบริการวิชาการพัฒนาท้องถิ่น จำนวน ๑ งาน โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037457397&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');
INSERT INTO `egp` VALUES (5, '1484217300', 'จ้างเหมาบันทึกวิดีโอและถ่ายทอดสดในพิธีรับมอบใบรับรองคุณวุฒิสำหรับผู้สำเร็จการศึกษาหลักสูตรพยาบาลศาสตรบัณฑิต รุ่นที่ 12 จำนวน 1 งาน โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037480011&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');
INSERT INTO `egp` VALUES (6, '1484217300', 'ซื้อกล่องกระดาษสำหรับบรรจุน้ำดื่มแบบแก้ว ๒๒๐ มิลลิลิตร จำนวน ๑ รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037463240&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');
INSERT INTO `egp` VALUES (7, '1484217300', 'ซื้อวัสดุสำหรับใช้งานประกอบการดำเนินงานทำความสะอาดของมหาวิทยาลัย (สำนักจัดการทรัพย์สิน) จำนวน ๓ รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037476276&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');
INSERT INTO `egp` VALUES (8, '1484217300', 'ซื้อวัสดุสำหรับสนับสนุนการเรียนการสอนคณะมนุษยศาสตร์และสังคมศาสตร์ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037472540&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');
INSERT INTO `egp` VALUES (9, '1484217300', 'ซื้อวัสดุอุปกรณ์ชุดกรองน้ำหมึกพิมพ์วันที่ จำนวน ๑ รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037471481&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');
INSERT INTO `egp` VALUES (10, '1484217300', 'ซื้อหนังสือสำหรับการจัดการเรียนการสอนนักศึกษานิติศาสตร์ ภาคบัณฑิต รุ่นที่ ๑๑,๑๓-๑๔ จำนวน ๑ รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037453326&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');
INSERT INTO `egp` VALUES (11, '1484217300', 'ซื้อหมึกพิมพ์คณะนิติศาสตร์ จำนวน ๑ รายการ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037461817&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');
INSERT INTO `egp` VALUES (12, '1484217300', 'จ้างจ้างเหมาบริการรถยนต์(ตู้)ปรับอากาศพร้อมคนขับน้ำมันเชื้อเพลิงโครงการนิเทศนักศึกษาฝึกประสบการณ์วิชาชีพ ปี2565จำนวน 5 วัน โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037422522&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-22', '1', '22', '3', '2023');
INSERT INTO `egp` VALUES (13, '1484217300', 'จ้างแต่งหน้านักแสดง โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037199132&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-22', '1', '22', '3', '2023');
INSERT INTO `egp` VALUES (14, '1484217300', 'จ้างปรับปรุงพื้นรั่วซึมบริเวณดาดฟ้า จำนวน ๑ งาน โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037417846&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-22', '1', '22', '3', '2023');
INSERT INTO `egp` VALUES (15, '1484217300', 'จ้างไวนิลประชาสัมพันธ์รับสมัครนักศึกษาระดับบัณฑิตศึกษา ปีการศึกษา 2566 โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037421067&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-22', '1', '22', '3', '2023');
INSERT INTO `egp` VALUES (16, '1484217300', 'เช่าเครื่องแต่งกายสำหรับการแสดง โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037199035&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-22', '1', '22', '3', '2023');
INSERT INTO `egp` VALUES (17, '1484217300', 'ซื้อถังน้ำดื่มพร้อมฝาถังพร้อมสกรีนSRUประจำวิทยาลัยนานาชาติการท่องเที่ยวอำเภอเกาะสมุย โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037439407&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-22', '1', '22', '3', '2023');
INSERT INTO `egp` VALUES (18, '1484217300', 'ซื้อยางรถบัสพร้อมตั้งศูนย์ถ่วงล้อ หมายเลขทะเบียน 40-0156 สุราษฎร์ธานี จำนวน 2 เส้น โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037435978&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-22', '1', '22', '3', '2023');
INSERT INTO `egp` VALUES (19, '1484217300', 'ซื้อวัสดุคอมพิวเตอร์ กิจกรรมปรับปรุงหลักสูตรครุศาสตรบัณฑิตฉบับปรับปรุง พ.ศ. ๒๕๖๗ (ระยะที่ ๑) จำนวน ๑ งาน โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037422258&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-22', '1', '22', '3', '2023');
INSERT INTO `egp` VALUES (20, '1484217300', 'ซื้อวัสดุสนับสนุนการศึกษาสาขาวิชาคณิตศาสตร์ จำนวน ๑ งาน โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037441132&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-22', '1', '22', '3', '2023');
INSERT INTO `egp` VALUES (21, '1484217300', 'ประกวดราคาซื้อครุภัณฑ์การฝึกปฏิบัติการเรียนรู้การช่วยชีวิต การดูแลภาวะฉุกเฉิน และสาธารณภัยคุกคามของชีวิต ตำบลขุนทะเล อำเภอเมืองสุราษฎร์ธานี จังหวัดสุราษฎร์ธานี ๑ ชุด ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9951BServlet?projectId=66037293062&itemNo=0&fileName=66037293062_25660320150902_2.zip', '2023-03-20', '9', '20', '3', '2023');
INSERT INTO `egp` VALUES (22, '1484217300', 'ประกวดราคาซื้อเครื่องกระตุ้นหัวใจด้วยไฟฟ้าแบบอัตโนมัติ ตำบลขุนทะเล อำเภอเมืองสุราษฎร์ธานี จังหวัดสุราษฎร์ธานี ๓๐ ชุด ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9951BServlet?projectId=66037288811&itemNo=0&fileName=66037288811_25660320150749_2.zip', '2023-03-20', '9', '20', '3', '2023');
INSERT INTO `egp` VALUES (23, '1484217300', 'ประกวดราคาจ้างก่อสร้างปรับปรุงโรงเรียนสาธิตแห่งมหาวิทยาลัยราชภัฏสุราษฎร์ธานี 1 รายการ ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037154911&templateType=D2&temp_Announ=A&temp_itemNo=0&seqNo=0', '2023-03-23', '5', '23', '3', '2023');
INSERT INTO `egp` VALUES (24, '1484217300', 'ประกวดราคาซื้อชุดปฏิบัติการศูนย์การเรียนรู้และพัฒนาทักษะสะเต็มศึกษาด้านเทคโนโลยีหุ่นยนต์ขั้นพื้นฐาน ตำบลขุนทะเล อำเภอเมืองสุราษฎร์ธานี จังหวัดสุราษฎร์ธานี ๑ ชุด ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66027466562&templateType=D2&temp_Announ=A&temp_itemNo=0&seqNo=0', '2023-03-22', '5', '22', '3', '2023');
INSERT INTO `egp` VALUES (25, '1484217300', 'ครุภัณฑ์การศึกษา จำนวน ๒ รายการ', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=M66030016395&templateType=P0&temp_Announ=P&temp_itemNo=&seqNo=', '2023-03-22', '3', '22', '3', '2023');
INSERT INTO `egp` VALUES (26, '1484217300', 'จ้างซ่อมแซมสุขภัณฑ์ห้องน้ำคณะมนุษยศาสตร์และสังคมศาสตร์ โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037118339&templateType=W2&temp_Announ=D&temp_itemNo=1&seqNo=2', '2023-03-24', '6', '24', '3', '2023');
INSERT INTO `egp` VALUES (27, '1484217300', 'ประกวดราคาจ้างก่อสร้างปรับปรุงโรงเรียนสาธิตแห่งมหาวิทยาลัยราชภัฏสุราษฎร์ธานี 1 รายการ ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9965AttachServ?projectId=66037154911&fileName=pricebuild_2015900000_66037154911.zip', '2023-03-23', '4', '23', '3', '2023');
INSERT INTO `egp` VALUES (28, '1484217300', 'ประกวดราคาซื้อชุดปฏิบัติการศูนย์การเรียนรู้และพัฒนาทักษะสะเต็มศึกษาด้านเทคโนโลยีหุ่นยนต์ขั้นพื้นฐาน ตำบลขุนทะเล อำเภอเมืองสุราษฎร์ธานี จังหวัดสุราษฎร์ธานี ๑ ชุด ด้วยวิธีประกวดราคาอิเล็กทรอนิกส์ (e-bidding)', 'http://process3.gprocurement.go.th/egp2procmainWeb/FPRO9965AttachServ?projectId=66027466562&fileName=pricebuild_2015900000_66027466562.zip', '2023-03-22', '4', '22', '3', '2023');
INSERT INTO `egp` VALUES (29, '1484217300', 'จ้างเหมาบริการรถตู้ปรับอากาศใช้ในกิจกรรม 1107400025 ในวันที่ 28-29 มีนาคม 2566 จำนวน 1 คัน โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037411569&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');
INSERT INTO `egp` VALUES (30, '1484217300', 'จ้างเหมาบริการรถตู้ปรับอากาศใช้ในกิจกรรม  1107400045 ในวันที่ 24-26 เมษายน 66 จำนวน 1 คัน โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037470387&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');
INSERT INTO `egp` VALUES (31, '1484217300', 'จ้างเหมาบริการรถตู้ปรับอากาศใช้ในกิจกรรม  1107400081 (1.1.6) ในวันที่ 3-5 เม.ย.66 จำนวน 1 คัน โดยวิธีเฉพาะเจาะจง', 'http://process3.gprocurement.go.th/egp2procmainWeb/jsp/procsearch.sch?servlet=gojsp&proc_id=ShowHTMLFile&processFlows=Procure&projectId=66037506883&templateType=W2&temp_Announ=A&temp_itemNo=0&seqNo=1', '2023-03-23', '1', '23', '3', '2023');

-- ----------------------------
-- Table structure for egp_id
-- ----------------------------
DROP TABLE IF EXISTS `egp_id`;
CREATE TABLE `egp_id`  (
  `EGPID` int NOT NULL AUTO_INCREMENT,
  `ename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `numID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `eaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `etel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `efax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `eweb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `eEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `eMap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `eMassage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ecal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `eper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `esta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `epak` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ecity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`EGPID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of egp_id
-- ----------------------------
INSERT INTO `egp_id` VALUES (1, 'มหาวิทยาลัยราชภัฏสุราษฏร์ธานี', '1484217300', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
