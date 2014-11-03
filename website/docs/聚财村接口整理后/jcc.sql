/*
Navicat MySQL Data Transfer

Source Server         : jcc2
Source Server Version : 50045
Source Host           : localhost:3306
Source Database       : jcc

Target Server Type    : MYSQL
Target Server Version : 50045
File Encoding         : 65001

Date: 2014-11-01 23:54:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chat`
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL auto_increment,
  `seid` int(11) default NULL,
  `reid` int(11) default NULL,
  `regtime` datetime default NULL,
  `content` varchar(3000) collate gbk_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=759 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES ('510', '73', '70', '2014-09-17 12:10:59', '你好');
INSERT INTO `chat` VALUES ('511', '73', '70', '2014-09-17 13:56:22', '哈');
INSERT INTO `chat` VALUES ('512', '72', '74', '2014-09-17 15:09:29', '哈喽');
INSERT INTO `chat` VALUES ('513', '72', '74', '2014-09-17 15:10:42', '哦了啦咯啦咯了');
INSERT INTO `chat` VALUES ('514', '70', '73', '2014-09-18 10:22:19', '你好');
INSERT INTO `chat` VALUES ('515', '70', '73', '2014-09-18 10:55:35', '你好');
INSERT INTO `chat` VALUES ('516', '81', '76', '2014-09-18 11:23:53', '凯哥？');
INSERT INTO `chat` VALUES ('517', '81', '77', '2014-09-18 11:24:39', '质押10％？');
INSERT INTO `chat` VALUES ('518', '70', '73', '2014-09-18 14:05:52', '你好，');
INSERT INTO `chat` VALUES ('519', '70', '73', '2014-09-18 14:31:36', '你好');
INSERT INTO `chat` VALUES ('520', '70', '73', '2014-09-18 19:37:13', '图图');
INSERT INTO `chat` VALUES ('521', '78', '73', '2014-09-19 10:33:40', '你好，关注一下');
INSERT INTO `chat` VALUES ('522', '78', '71', '2014-09-19 10:58:12', '你好啊');
INSERT INTO `chat` VALUES ('523', '73', '70', '2014-09-19 11:38:07', '你好');
INSERT INTO `chat` VALUES ('524', '70', '73', '2014-09-19 12:50:44', '你好，我刚登陆，发到我这来了');
INSERT INTO `chat` VALUES ('525', '78', '71', '2014-09-19 12:51:22', '');
INSERT INTO `chat` VALUES ('526', '78', '70', '2014-09-19 12:51:37', '？');
INSERT INTO `chat` VALUES ('527', '81', '83', '2014-09-19 14:42:13', '能收到吗？');
INSERT INTO `chat` VALUES ('528', '83', '81', '2014-09-19 14:42:41', '收到了');
INSERT INTO `chat` VALUES ('529', '70', '70', '2014-09-20 14:54:27', '图');
INSERT INTO `chat` VALUES ('530', '81', '70', '2014-09-20 16:03:55', '高哥，得把你资料好好写额');
INSERT INTO `chat` VALUES ('531', '86', '70', '2014-09-21 17:28:26', '你好！');
INSERT INTO `chat` VALUES ('532', '70', '86', '2014-09-21 17:29:49', '你好');
INSERT INTO `chat` VALUES ('533', '86', '70', '2014-09-21 17:31:04', '我刚注册这个聚财村，试试功能，哈哈');
INSERT INTO `chat` VALUES ('534', '86', '73', '2014-09-21 17:31:30', '你好！');
INSERT INTO `chat` VALUES ('535', '86', '73', '2014-09-21 17:31:50', '你甩的那个单子我公司可以做。');
INSERT INTO `chat` VALUES ('536', '86', '70', '2014-09-21 17:32:31', '我公司主做小贷，以后请多关照呀！');
INSERT INTO `chat` VALUES ('537', '87', '86', '2014-09-21 17:53:14', '美女');
INSERT INTO `chat` VALUES ('538', '87', '81', '2014-09-21 17:55:58', '帅哥。进来了我');
INSERT INTO `chat` VALUES ('539', '87', '70', '2014-09-21 18:15:42', '您好');
INSERT INTO `chat` VALUES ('540', '81', '87', '2014-09-21 18:29:06', '好啊');
INSERT INTO `chat` VALUES ('541', '81', '87', '2014-09-21 18:29:09', '清和');
INSERT INTO `chat` VALUES ('542', '81', '87', '2014-09-21 18:29:28', '多提点意见，满足大家需求');
INSERT INTO `chat` VALUES ('543', '86', '87', '2014-09-21 18:41:22', '嗨');
INSERT INTO `chat` VALUES ('544', '70', '87', '2014-09-21 19:38:15', '你好哥们');
INSERT INTO `chat` VALUES ('545', '87', '81', '2014-09-21 19:46:11', '好啊');
INSERT INTO `chat` VALUES ('546', '81', '87', '2014-09-21 19:48:59', '现在感觉哪儿用起来不顺畅的没？');
INSERT INTO `chat` VALUES ('547', '81', '86', '2014-09-21 19:50:09', '谢谢美女支持啊！现在软件封测，用起来，感觉怎么样');
INSERT INTO `chat` VALUES ('548', '81', '86', '2014-09-21 19:50:18', '一定要提意见啊');
INSERT INTO `chat` VALUES ('549', '87', '81', '2014-09-21 20:00:54', '目前还没有');
INSERT INTO `chat` VALUES ('550', '81', '87', '2014-09-21 20:05:16', '换单位了？');
INSERT INTO `chat` VALUES ('551', '86', '81', '2014-09-21 20:09:11', '高端，大气，上档次1真心觉得不错');
INSERT INTO `chat` VALUES ('552', '81', '86', '2014-09-21 20:24:25', '现在估计还不能满足你需求啊！美女有什么需求，随时说啊');
INSERT INTO `chat` VALUES ('553', '86', '81', '2014-09-21 20:30:55', '嗯，慢慢完善吧！');
INSERT INTO `chat` VALUES ('554', '73', '86', '2014-09-21 20:57:40', '你好，有机会聊聊');
INSERT INTO `chat` VALUES ('555', '86', '73', '2014-09-21 22:26:53', '好的，我的微信rina266');
INSERT INTO `chat` VALUES ('556', '87', '81', '2014-09-21 22:28:02', '没有换，这个也是');
INSERT INTO `chat` VALUES ('557', '81', '87', '2014-09-21 22:40:48', '额，平时在哪个地方上班啊');
INSERT INTO `chat` VALUES ('558', '81', '71', '2014-09-21 22:41:42', '试试消息');
INSERT INTO `chat` VALUES ('559', '81', '71', '2014-09-21 22:41:55', '这个地方还发现一个，不一样的');
INSERT INTO `chat` VALUES ('560', '71', '81', '2014-09-21 22:42:16', '收到了');
INSERT INTO `chat` VALUES ('561', '81', '71', '2014-09-21 22:42:22', '看法没？');
INSERT INTO `chat` VALUES ('562', '81', '71', '2014-09-21 22:42:27', '切换如何');
INSERT INTO `chat` VALUES ('563', '71', '81', '2014-09-21 22:44:19', '没发现问题');
INSERT INTO `chat` VALUES ('564', '81', '71', '2014-09-21 22:44:35', '我这下也好了');
INSERT INTO `chat` VALUES ('565', '81', '71', '2014-09-21 22:44:49', '估计是设置问题');
INSERT INTO `chat` VALUES ('566', '81', '71', '2014-09-21 22:45:04', '刚微信里又发了一个');
INSERT INTO `chat` VALUES ('567', '81', '86', '2014-09-21 22:45:33', '有什么需求一定提呀');
INSERT INTO `chat` VALUES ('568', '71', '70', '2014-09-22 11:12:03', '你好');
INSERT INTO `chat` VALUES ('569', '71', '70', '2014-09-22 11:12:22', '囖');
INSERT INTO `chat` VALUES ('570', '71', '70', '2014-09-22 11:12:29', '摸JJ了');
INSERT INTO `chat` VALUES ('571', '70', '71', '2014-09-22 11:12:40', '您低');
INSERT INTO `chat` VALUES ('572', '70', '71', '2014-09-22 11:12:53', '个股');
INSERT INTO `chat` VALUES ('573', '70', '71', '2014-09-22 11:13:16', '了周佳');
INSERT INTO `chat` VALUES ('574', '70', '71', '2014-09-22 11:13:28', '浏览器');
INSERT INTO `chat` VALUES ('575', '70', '71', '2014-09-22 11:13:44', '居然');
INSERT INTO `chat` VALUES ('576', '70', '71', '2014-09-22 11:14:00', '句');
INSERT INTO `chat` VALUES ('577', '70', '71', '2014-09-22 11:14:19', '公司');
INSERT INTO `chat` VALUES ('578', '73', '70', '2014-09-22 12:15:35', '经济基础');
INSERT INTO `chat` VALUES ('579', '73', '70', '2014-09-22 12:16:03', '');
INSERT INTO `chat` VALUES ('580', '73', '70', '2014-09-22 12:16:07', '机会好');
INSERT INTO `chat` VALUES ('581', '70', '73', '2014-09-22 12:16:52', 'cvvd');
INSERT INTO `chat` VALUES ('582', '87', '81', '2014-09-22 12:33:51', '利信的多');
INSERT INTO `chat` VALUES ('583', '73', '70', '2014-09-22 12:53:55', '您好');
INSERT INTO `chat` VALUES ('584', '73', '70', '2014-09-22 12:54:24', '哼哼唧唧');
INSERT INTO `chat` VALUES ('585', '87', '70', '2014-09-22 15:55:57', '我是厚泽贷的，有件可以甩过来');
INSERT INTO `chat` VALUES ('586', '81', '73', '2014-09-22 18:08:37', '在吗');
INSERT INTO `chat` VALUES ('587', '73', '81', '2014-09-22 18:08:59', '在');
INSERT INTO `chat` VALUES ('588', '73', '81', '2014-09-22 18:09:07', '？');
INSERT INTO `chat` VALUES ('589', '81', '73', '2014-09-22 18:09:44', ' 没事，测试一下附近人功能');
INSERT INTO `chat` VALUES ('590', '70', '81', '2014-09-22 18:11:22', '你先取消关注我');
INSERT INTO `chat` VALUES ('591', '81', '70', '2014-09-22 18:11:54', '取消了');
INSERT INTO `chat` VALUES ('592', '70', '81', '2014-09-22 18:12:03', '好');
INSERT INTO `chat` VALUES ('593', '70', '71', '2014-09-23 16:36:09', '哈哈');
INSERT INTO `chat` VALUES ('594', '71', '70', '2014-09-23 16:36:49', '可能认识的人有问题');
INSERT INTO `chat` VALUES ('595', '70', '71', '2014-09-23 16:37:19', '刚改了');
INSERT INTO `chat` VALUES ('596', '71', '70', '2014-09-23 16:38:34', '还跟刚才一样');
INSERT INTO `chat` VALUES ('597', '70', '71', '2014-09-23 16:39:29', '客户端刚改了，你那需要更新版本');
INSERT INTO `chat` VALUES ('598', '87', '86', '2014-09-24 22:27:15', '美女好');
INSERT INTO `chat` VALUES ('599', '73', '70', '2014-09-25 17:30:57', '哦你好');
INSERT INTO `chat` VALUES ('600', '70', '73', '2014-09-25 17:31:16', '你好也');
INSERT INTO `chat` VALUES ('601', '73', '70', '2014-09-26 10:24:01', '收到没');
INSERT INTO `chat` VALUES ('602', '70', '73', '2014-09-26 10:24:15', '收到了');
INSERT INTO `chat` VALUES ('603', '70', '73', '2014-09-26 10:24:25', '你呢');
INSERT INTO `chat` VALUES ('604', '73', '70', '2014-09-26 10:24:41', '哈哈可以');
INSERT INTO `chat` VALUES ('605', '70', '73', '2014-09-26 10:24:50', 'OK');
INSERT INTO `chat` VALUES ('606', '73', '70', '2014-09-26 10:25:19', '我试试长的我试试长的我试试长的我试试长的我试试长的我试试长的');
INSERT INTO `chat` VALUES ('607', '73', '70', '2014-09-26 10:26:11', '你咯loll啦咯OK了快乐快乐就咯来咯哦哦OK啦');
INSERT INTO `chat` VALUES ('608', '70', '73', '2014-09-26 10:26:49', '我试试长的我试试长的我试试长的我试试长的我试试长的我试试长的');
INSERT INTO `chat` VALUES ('609', '70', '73', '2014-09-26 10:26:59', '收到了');
INSERT INTO `chat` VALUES ('610', '73', '70', '2014-09-26 10:27:02', '嗯是这个');
INSERT INTO `chat` VALUES ('611', '73', '70', '2014-09-26 10:27:05', '好');
INSERT INTO `chat` VALUES ('612', '73', '70', '2014-09-26 10:28:48', '1');
INSERT INTO `chat` VALUES ('613', '73', '70', '2014-09-26 10:28:49', '2');
INSERT INTO `chat` VALUES ('614', '73', '70', '2014-09-26 10:28:50', '3');
INSERT INTO `chat` VALUES ('615', '73', '70', '2014-09-26 10:28:51', '4');
INSERT INTO `chat` VALUES ('616', '73', '70', '2014-09-26 10:28:52', '5');
INSERT INTO `chat` VALUES ('617', '73', '70', '2014-09-26 10:28:53', '6');
INSERT INTO `chat` VALUES ('618', '73', '70', '2014-09-26 10:34:10', '1');
INSERT INTO `chat` VALUES ('619', '73', '70', '2014-09-26 10:34:11', '2');
INSERT INTO `chat` VALUES ('620', '73', '70', '2014-09-26 10:34:12', '3');
INSERT INTO `chat` VALUES ('621', '73', '70', '2014-09-26 10:34:13', '4');
INSERT INTO `chat` VALUES ('622', '73', '70', '2014-09-26 10:34:14', '5');
INSERT INTO `chat` VALUES ('623', '73', '70', '2014-09-26 10:34:15', '6');
INSERT INTO `chat` VALUES ('624', '73', '70', '2014-09-26 10:35:18', '一个');
INSERT INTO `chat` VALUES ('625', '73', '70', '2014-09-26 10:53:39', '就发这一个');
INSERT INTO `chat` VALUES ('626', '73', '70', '2014-09-26 10:54:50', '再发一个');
INSERT INTO `chat` VALUES ('627', '70', '73', '2014-09-26 10:55:32', '为什么');
INSERT INTO `chat` VALUES ('628', '73', '70', '2014-09-26 10:58:29', '只发一个');
INSERT INTO `chat` VALUES ('629', '70', '73', '2014-09-26 10:58:39', '看看');
INSERT INTO `chat` VALUES ('630', '73', '70', '2014-09-26 10:58:59', '嗯');
INSERT INTO `chat` VALUES ('631', '73', '70', '2014-09-26 10:59:23', '好的');
INSERT INTO `chat` VALUES ('632', '70', '73', '2014-09-26 10:59:30', '好了');
INSERT INTO `chat` VALUES ('633', '73', '70', '2014-09-26 10:59:43', '发的不一样');
INSERT INTO `chat` VALUES ('634', '70', '87', '2014-09-29 14:36:57', 'ok');
INSERT INTO `chat` VALUES ('635', '70', '77', '2014-09-29 14:37:13', 'hello');
INSERT INTO `chat` VALUES ('636', '73', '77', '2014-09-29 19:21:36', '你好');
INSERT INTO `chat` VALUES ('637', '77', '73', '2014-09-29 19:21:50', '你好啊');
INSERT INTO `chat` VALUES ('638', '77', '73', '2014-09-29 19:22:01', '在哪');
INSERT INTO `chat` VALUES ('639', '71', '70', '2014-09-29 20:07:59', '你好');
INSERT INTO `chat` VALUES ('640', '87', '86', '2014-10-02 09:06:17', '郑颖兰爱吃屁');
INSERT INTO `chat` VALUES ('641', '73', '81', '2014-10-15 21:10:27', 'Hi');
INSERT INTO `chat` VALUES ('642', '73', '81', '2014-10-15 21:10:37', 'Hi hug');
INSERT INTO `chat` VALUES ('643', '71', '73', '2014-10-15 22:49:44', '在？');
INSERT INTO `chat` VALUES ('644', '71', '73', '2014-10-15 22:50:12', '在不');
INSERT INTO `chat` VALUES ('645', '71', '73', '2014-10-15 22:50:23', '～');
INSERT INTO `chat` VALUES ('646', '71', '81', '2014-10-15 22:50:40', '在');
INSERT INTO `chat` VALUES ('647', '73', '71', '2014-10-15 22:58:53', '在');
INSERT INTO `chat` VALUES ('648', '87', '81', '2014-10-16 14:32:16', '有没有要甩件的');
INSERT INTO `chat` VALUES ('649', '123', '81', '2014-10-17 16:35:54', '在么1');
INSERT INTO `chat` VALUES ('650', '123', '77', '2014-10-17 16:36:31', '你还');
INSERT INTO `chat` VALUES ('651', '81', '123', '2014-10-17 16:38:21', '在');
INSERT INTO `chat` VALUES ('652', '81', '123', '2014-10-17 16:38:47', '这个页面，头像下面的名称，可以不显示吗？');
INSERT INTO `chat` VALUES ('653', '81', '123', '2014-10-17 16:38:48', '多余');
INSERT INTO `chat` VALUES ('654', '81', '123', '2014-10-17 16:39:02', '时间也显示的太多了');
INSERT INTO `chat` VALUES ('655', '81', '123', '2014-10-17 16:39:37', '聊天对象直接在该页面最上面的蓝边显示对方姓名就好');
INSERT INTO `chat` VALUES ('656', '123', '81', '2014-10-17 16:41:25', '在');
INSERT INTO `chat` VALUES ('657', '123', '81', '2014-10-17 16:42:24', '我咋觉得头像下面显示名字挺舒服的呢');
INSERT INTO `chat` VALUES ('658', '123', '81', '2014-10-17 16:43:23', '噢。我明白你的意思了');
INSERT INTO `chat` VALUES ('659', '123', '81', '2014-10-17 16:43:43', '这个时间显示的是多余');
INSERT INTO `chat` VALUES ('660', '81', '123', '2014-10-17 16:44:05', '这个意见之前就提过了');
INSERT INTO `chat` VALUES ('661', '123', '81', '2014-10-17 16:44:17', '可这改说是没问题。但是现在主要精力还不在这');
INSERT INTO `chat` VALUES ('662', '81', '123', '2014-10-17 16:44:29', '你的不显示姓名呢？');
INSERT INTO `chat` VALUES ('663', '81', '123', '2014-10-17 16:44:59', '嗯，后期在改吧，分期主次');
INSERT INTO `chat` VALUES ('664', '123', '81', '2014-10-17 16:45:14', '这个改没问题。别人电话用不习惯总错字');
INSERT INTO `chat` VALUES ('665', '123', '81', '2014-10-17 16:45:46', '?');
INSERT INTO `chat` VALUES ('666', '123', '81', '2014-10-17 16:46:14', '还说是有问题啊');
INSERT INTO `chat` VALUES ('667', '123', '81', '2014-10-17 16:46:41', '不实时显示消息');
INSERT INTO `chat` VALUES ('668', '123', '81', '2014-10-17 16:47:41', '我的名字就是杨');
INSERT INTO `chat` VALUES ('669', '123', '77', '2014-10-17 16:47:58', '你好');
INSERT INTO `chat` VALUES ('670', '81', '123', '2014-10-17 16:50:22', '嗯');
INSERT INTO `chat` VALUES ('671', '81', '123', '2014-10-17 16:50:38', '不实时显示。需要刷新');
INSERT INTO `chat` VALUES ('672', '71', '77', '2014-10-20 08:03:35', '你好');
INSERT INTO `chat` VALUES ('673', '81', '126', '2014-10-20 09:27:17', '能收到吧？');
INSERT INTO `chat` VALUES ('674', '132', '71', '2014-10-20 10:21:54', '你好');
INSERT INTO `chat` VALUES ('675', '126', '81', '2014-10-20 23:43:41', '真能收到');
INSERT INTO `chat` VALUES ('676', '71', '73', '2014-10-22 08:03:36', '在不');
INSERT INTO `chat` VALUES ('677', '73', '71', '2014-10-22 08:04:50', '你好啊');
INSERT INTO `chat` VALUES ('678', '73', '71', '2014-10-22 08:05:20', '你好');
INSERT INTO `chat` VALUES ('679', '73', '71', '2014-10-22 08:05:59', '吃饭了没');
INSERT INTO `chat` VALUES ('680', '71', '73', '2014-10-22 08:06:53', '你在干嘛');
INSERT INTO `chat` VALUES ('681', '137', '126', '2014-10-22 13:12:47', '我也注册了一个');
INSERT INTO `chat` VALUES ('682', '126', '77', '2014-10-23 09:07:16', '相互关注嘛');
INSERT INTO `chat` VALUES ('683', '87', '70', '2014-10-24 10:10:22', '在吗');
INSERT INTO `chat` VALUES ('684', '87', '70', '2014-10-24 10:10:29', '有单子没');
INSERT INTO `chat` VALUES ('685', '143', '86', '2014-10-24 14:10:26', '你好');
INSERT INTO `chat` VALUES ('686', '126', '86', '2014-10-24 16:19:49', '你好');
INSERT INTO `chat` VALUES ('687', '126', '76', '2014-10-24 16:19:58', '你好');
INSERT INTO `chat` VALUES ('688', '126', '78', '2014-10-24 16:20:05', '你好');
INSERT INTO `chat` VALUES ('689', '126', '75', '2014-10-24 16:20:16', '你好');
INSERT INTO `chat` VALUES ('690', '126', '79', '2014-10-24 16:20:25', '你好');
INSERT INTO `chat` VALUES ('691', '70', '73', '2014-10-24 18:32:39', '没了？');
INSERT INTO `chat` VALUES ('692', '73', '70', '2014-10-24 18:34:44', '没');
INSERT INTO `chat` VALUES ('693', '73', '70', '2014-10-24 18:34:51', '没有标记');
INSERT INTO `chat` VALUES ('694', '70', '73', '2014-10-24 18:53:46', '看到你了');
INSERT INTO `chat` VALUES ('695', '73', '70', '2014-10-24 18:56:02', '发了');
INSERT INTO `chat` VALUES ('696', '71', '73', '2014-10-24 19:34:41', '你好');
INSERT INTO `chat` VALUES ('697', '71', '73', '2014-10-24 19:46:58', '听见么');
INSERT INTO `chat` VALUES ('698', '71', '73', '2014-10-24 19:46:59', '');
INSERT INTO `chat` VALUES ('699', '71', '73', '2014-10-24 19:47:05', '周互相');
INSERT INTO `chat` VALUES ('700', '73', '71', '2014-10-24 21:31:21', '我在舞台');
INSERT INTO `chat` VALUES ('701', '73', '71', '2014-10-24 21:52:56', '图他实事求是');
INSERT INTO `chat` VALUES ('702', '86', '143', '2014-10-24 23:18:31', '你好！');
INSERT INTO `chat` VALUES ('703', '86', '126', '2014-10-24 23:19:19', '你好！');
INSERT INTO `chat` VALUES ('704', '86', '126', '2014-10-24 23:19:51', '我是利信金融郑颖兰，你呢？是哪家公司');
INSERT INTO `chat` VALUES ('705', '131', '70', '2014-10-24 23:24:44', '发挥');
INSERT INTO `chat` VALUES ('706', '70', '131', '2014-10-24 23:25:00', '更好');
INSERT INTO `chat` VALUES ('707', '70', '131', '2014-10-24 23:25:33', '新经济');
INSERT INTO `chat` VALUES ('708', '70', '131', '2014-10-24 23:25:45', '特意');
INSERT INTO `chat` VALUES ('709', '70', '131', '2014-10-24 23:25:49', '古人');
INSERT INTO `chat` VALUES ('710', '131', '70', '2014-10-24 23:26:32', '法规和');
INSERT INTO `chat` VALUES ('711', '131', '70', '2014-10-24 23:27:00', '快捷键');
INSERT INTO `chat` VALUES ('712', '131', '70', '2014-10-24 23:29:54', '具体');
INSERT INTO `chat` VALUES ('713', '131', '70', '2014-10-24 23:30:16', '结果发');
INSERT INTO `chat` VALUES ('714', '131', '70', '2014-10-24 23:31:35', '韩国队');
INSERT INTO `chat` VALUES ('715', '131', '70', '2014-10-24 23:34:22', '如同鱼');
INSERT INTO `chat` VALUES ('716', '70', '131', '2014-10-24 23:48:25', '科技');
INSERT INTO `chat` VALUES ('717', '70', '131', '2014-10-24 23:48:36', '共和党');
INSERT INTO `chat` VALUES ('718', '70', '131', '2014-10-25 09:23:28', '好大');
INSERT INTO `chat` VALUES ('719', '131', '70', '2014-10-25 09:23:41', '高圆圆');
INSERT INTO `chat` VALUES ('720', '70', '73', '2014-10-25 09:37:39', '聊天内容uname=王老五');
INSERT INTO `chat` VALUES ('721', '70', '73', '2014-10-25 09:39:04', '聊天内容');
INSERT INTO `chat` VALUES ('722', '131', '70', '2014-10-25 09:50:06', '科技化');
INSERT INTO `chat` VALUES ('723', '131', '70', '2014-10-25 09:50:19', '广东队的');
INSERT INTO `chat` VALUES ('724', '131', '70', '2014-10-25 09:52:08', '想得到');
INSERT INTO `chat` VALUES ('725', '73', '71', '2014-10-25 10:17:17', '你好');
INSERT INTO `chat` VALUES ('726', '71', '73', '2014-10-25 10:18:01', '我考虑考虑');
INSERT INTO `chat` VALUES ('727', '127', '73', '2014-10-25 10:33:04', 'yzzy');
INSERT INTO `chat` VALUES ('728', '127', '73', '2014-10-25 10:34:14', '能收到么');
INSERT INTO `chat` VALUES ('729', '73', '127', '2014-10-25 10:35:02', '再发');
INSERT INTO `chat` VALUES ('730', '127', '73', '2014-10-25 10:35:37', '第三个');
INSERT INTO `chat` VALUES ('731', '127', '73', '2014-10-25 10:35:38', '');
INSERT INTO `chat` VALUES ('732', '70', '131', '2014-10-25 10:53:07', '？再发');
INSERT INTO `chat` VALUES ('733', '127', '73', '2014-10-25 11:34:40', '啊');
INSERT INTO `chat` VALUES ('734', '145', '145', '2014-10-25 21:38:26', '就算');
INSERT INTO `chat` VALUES ('735', '127', '73', '2014-10-26 11:40:06', '敬了礼');
INSERT INTO `chat` VALUES ('736', '73', '127', '2014-10-26 11:40:26', '你好');
INSERT INTO `chat` VALUES ('737', '73', '127', '2014-10-26 11:41:07', '无条件了');
INSERT INTO `chat` VALUES ('738', '147', '126', '2014-10-28 13:52:36', '你好！');
INSERT INTO `chat` VALUES ('739', '147', '81', '2014-10-28 13:52:51', '巧啊');
INSERT INTO `chat` VALUES ('740', '147', '77', '2014-10-28 13:53:39', '你好！');
INSERT INTO `chat` VALUES ('741', '126', '147', '2014-10-28 22:19:59', '你好');
INSERT INTO `chat` VALUES ('742', '126', '86', '2014-10-28 22:20:47', '我是华信金融的');
INSERT INTO `chat` VALUES ('743', '126', '86', '2014-10-28 22:21:16', '你主做啥');
INSERT INTO `chat` VALUES ('744', '127', '73', '2014-10-28 23:58:28', '哦哦哦厉害了');
INSERT INTO `chat` VALUES ('745', '147', '126', '2014-10-29 12:33:19', '咱们是微信好友');
INSERT INTO `chat` VALUES ('746', '126', '147', '2014-10-29 14:02:32', '是的');
INSERT INTO `chat` VALUES ('747', '73', '127', '2014-10-29 21:22:04', 'なに？');
INSERT INTO `chat` VALUES ('748', '70', '131', '2014-10-30 15:40:51', '发广告');
INSERT INTO `chat` VALUES ('749', '131', '70', '2014-10-30 15:43:13', '聚聚');
INSERT INTO `chat` VALUES ('750', '70', '131', '2014-10-30 15:43:28', '不v 吃');
INSERT INTO `chat` VALUES ('751', '131', '70', '2014-10-30 15:43:44', '规划好');
INSERT INTO `chat` VALUES ('752', '70', '131', '2014-10-30 15:44:08', '还好过分');
INSERT INTO `chat` VALUES ('753', '70', '131', '2014-10-30 15:44:22', '雨天');
INSERT INTO `chat` VALUES ('754', '131', '70', '2014-10-30 15:44:29', '好丰富');
INSERT INTO `chat` VALUES ('755', '73', '70', '2014-10-31 08:33:47', '你好');
INSERT INTO `chat` VALUES ('756', '70', '131', '2014-10-31 09:14:24', '加个头像吧');
INSERT INTO `chat` VALUES ('757', '81', '147', '2014-11-01 16:40:46', '耶！');
INSERT INTO `chat` VALUES ('758', '81', '147', '2014-11-01 16:40:51', '注册进来啦');

-- ----------------------------
-- Table structure for `chat_user`
-- ----------------------------
DROP TABLE IF EXISTS `chat_user`;
CREATE TABLE `chat_user` (
  `id` int(11) NOT NULL auto_increment,
  `seid` int(11) default NULL,
  `reid` int(11) default NULL,
  `regtime` datetime default NULL,
  `lastcontent` varchar(3000) collate gbk_bin default NULL,
  `u_name` varchar(255) collate gbk_bin default NULL,
  `kpno` varchar(255) collate gbk_bin default NULL,
  `avatar` varchar(255) collate gbk_bin default NULL,
  `reu_name` varchar(255) collate gbk_bin default NULL,
  `rekpno` varchar(255) collate gbk_bin default NULL,
  `reavatar` varchar(255) collate gbk_bin default NULL,
  `hasread` varchar(1) collate gbk_bin default NULL,
  `hehasread` varchar(1) collate gbk_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of chat_user
-- ----------------------------
INSERT INTO `chat_user` VALUES ('90', '73', '70', '2014-10-31 08:33:47', '你好', '高峰', '98', '141027141445.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('91', '70', '73', '2014-10-31 08:33:47', '你好', '', '138', '140918172151.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('92', '72', '74', '2014-09-17 15:10:42', '哦了啦咯啦咯了', '王龙', '70', '', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('93', '74', '72', '2014-09-17 15:10:42', '哦了啦咯啦咯了', '冯佳', '65', '140917114324.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('94', '81', '76', '2014-09-18 11:23:53', '凯哥？', '游龙刚', '61', '140918105705.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('95', '76', '81', '2014-09-18 11:23:53', '凯哥？', '王凯', '62', '140918093921.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('96', '81', '77', '2014-09-18 11:24:39', '质押10％？', '游龙刚', '61', '140918105705.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('97', '77', '81', '2014-09-18 11:24:39', '质押10％？', '任梦涵', '62', '140918094818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('98', '78', '73', '2014-09-19 10:33:40', '你好，关注一下', '彭骏', '61', '140918100805.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('99', '73', '78', '2014-09-19 10:33:40', '你好，关注一下', '高峰', '67', '140918104046.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('100', '78', '71', '2014-09-19 12:51:22', '', '彭骏', '61', '140918100805.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('101', '71', '78', '2014-09-19 12:51:22', '', '宏杰', '76', '140917141156.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('102', '78', '70', '2014-09-19 12:51:37', '？', '彭骏', '61', '140918100805.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('103', '70', '78', '2014-09-19 12:51:37', '？', '天宇', '77', '140918172151.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('104', '81', '83', '2014-09-19 14:42:41', '收到了', '游龙刚', '61', '140918105705.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('105', '83', '81', '2014-09-19 14:42:41', '收到了', '黄伟涛', '61', '', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('106', '70', '70', '2014-09-20 14:54:27', '图', '天宇', '78', '140918172151.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('107', '81', '70', '2014-09-22 18:12:03', '好', '游龙刚', '64', '140918105705.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('108', '70', '81', '2014-09-22 18:12:03', '好', '天宇', '79', '140918172151.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('109', '86', '70', '2014-09-21 17:32:31', '我公司主做小贷，以后请多关照呀！', '郑颖兰', '61', '140921172741.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('110', '70', '86', '2014-09-21 17:32:31', '我公司主做小贷，以后请多关照呀！', '天宇', '79', '140918172151.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('111', '86', '73', '2014-09-21 22:26:53', '好的，我的微信rina266', '郑颖兰', '63', '140921172741.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('112', '73', '86', '2014-09-21 22:26:53', '好的，我的微信rina266', '高峰', '68', '140918104046.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('113', '87', '86', '2014-10-02 09:06:17', '郑颖兰爱吃屁', '王清和', '63', '140921180546.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('114', '86', '87', '2014-10-02 09:06:17', '郑颖兰爱吃屁', '', '64', '140921172741.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('115', '87', '81', '2014-10-16 14:32:16', '有没有要甩件的', '王清和', '63', '140921180546.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('116', '81', '87', '2014-10-16 14:32:16', '有没有要甩件的', '', '64', '140918105705.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('117', '87', '70', '2014-10-24 10:10:29', '有单子没', '王清和', '68', '140921180546.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('118', '70', '87', '2014-10-24 10:10:29', '有单子没', '', '139', '140918172151.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('119', '81', '86', '2014-09-21 22:45:33', '有什么需求一定提呀', '游龙刚', '64', '140918105705.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('120', '86', '81', '2014-09-21 22:45:33', '有什么需求一定提呀', '郑颖兰', '63', '140921172741.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('121', '81', '71', '2014-10-15 22:50:40', '在', '', '64', '140918105705.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('122', '71', '81', '2014-10-15 22:50:40', '在', '宏杰', '82', '141008102251.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('123', '71', '70', '2014-09-29 20:07:59', '你好', '宏杰', '77', '140917141156.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('124', '70', '71', '2014-09-29 20:07:59', '你好', '', '79', '140918172151.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('125', '81', '73', '2014-10-15 21:10:37', 'Hi hug', '', '64', '140918105705.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('126', '73', '81', '2014-10-15 21:10:37', 'Hi hug', '高峰', '73', '140918104046.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('127', '70', '77', '2014-09-29 14:37:13', 'hello', '天宇', '79', '140918172151.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('128', '77', '70', '2014-09-29 14:37:13', 'hello', '任梦涵', '74', '140918094818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('129', '73', '77', '2014-09-29 19:22:01', '在哪', '', '68', '140918104046.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('130', '77', '73', '2014-09-29 19:22:01', '在哪', '任梦涵', '74', '140918094818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('131', '71', '73', '2014-10-25 10:18:01', '我考虑考虑', '宏杰', '107', '141008102251.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('132', '73', '71', '2014-10-25 10:18:01', '我考虑考虑', '', '100', '140918104046.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('133', '123', '81', '2014-10-17 16:50:38', '不实时显示。需要刷新', '', '60', '', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('134', '81', '123', '2014-10-17 16:50:38', '不实时显示。需要刷新', '游龙刚', '69', '140918105705.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('135', '123', '77', '2014-10-17 16:47:58', '你好', '杨', '60', '', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('136', '77', '123', '2014-10-17 16:47:58', '你好', '', '79', '140918094818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('137', '71', '77', '2014-10-20 08:03:35', '你好', '宏杰', '92', '141008102251.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('138', '77', '71', '2014-10-20 08:03:35', '你好', '任梦涵', '84', '140918094818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('139', '81', '126', '2014-10-20 23:43:41', '真能收到', '', '74', '140918105705.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('140', '126', '81', '2014-10-20 23:43:41', '真能收到', '陈振忠', '70', '141020012818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('141', '132', '71', '2014-10-20 10:21:54', '你好', '于广伟', '60', '', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('142', '71', '132', '2014-10-20 10:21:54', '你好', '宏杰', '97', '141008102251.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('143', '137', '126', '2014-10-22 13:12:47', '我也注册了一个', '史文轩', '60', '141022051224.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('144', '126', '137', '2014-10-22 13:12:47', '我也注册了一个', '陈振忠', '70', '141020012818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('145', '126', '77', '2014-10-23 09:07:16', '相互关注嘛', '陈振忠', '75', '141020012818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('146', '77', '126', '2014-10-23 09:07:16', '相互关注嘛', '任梦涵', '84', '140918094818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('147', '143', '86', '2014-10-24 23:18:31', '你好！', '', '60', '', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('148', '86', '143', '2014-10-24 23:18:31', '你好！', '郑颖兰', '74', '140921172741.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('149', '126', '86', '2014-10-28 22:21:16', '你主做啥', '陈振忠', '75', '141020012818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('150', '86', '126', '2014-10-28 22:21:16', '你主做啥', '', '75', '140921172741.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('151', '126', '76', '2014-10-24 16:19:58', '你好', '陈振忠', '75', '141020012818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('152', '76', '126', '2014-10-24 16:19:58', '你好', '王凯', '67', '140918093921.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('153', '126', '78', '2014-10-24 16:20:05', '你好', '陈振忠', '75', '141020012818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('154', '78', '126', '2014-10-24 16:20:05', '你好', '彭骏', '66', '140918100805.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('155', '126', '75', '2014-10-24 16:20:16', '你好', '陈振忠', '75', '141020012818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('156', '75', '126', '2014-10-24 16:20:16', '你好', '龚若楠', '61', '140918092135.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('157', '126', '79', '2014-10-24 16:20:25', '你好', '陈振忠', '75', '141020012818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('158', '79', '126', '2014-10-24 16:20:25', '你好', '阿哲', '60', '140918103025.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('159', '131', '70', '2014-10-31 09:14:24', '加个头像吧', '', '60', '', null, null, null, '0', '1');
INSERT INTO `chat_user` VALUES ('160', '70', '131', '2014-10-31 09:14:24', '加个头像吧', '天宇', '138', '140918172151.jpg', null, null, null, '1', '0');
INSERT INTO `chat_user` VALUES ('161', '127', '73', '2014-10-29 21:22:04', 'なに？', '', '66', '141025134143.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('162', '73', '127', '2014-10-29 21:22:04', 'なに？', '高峰', '98', '141027141445.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('163', '145', '145', '2014-10-25 21:38:26', '就算', '', '61', '', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('164', '147', '126', '2014-10-29 14:02:32', '是的', '', '61', '141028062749.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('165', '126', '147', '2014-10-29 14:02:32', '是的', '陈振忠', '75', '141020012818.jpg', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('166', '147', '81', '2014-11-01 16:40:51', '注册进来啦', '', '61', '141030040647.jpg', null, null, null, '0', '1');
INSERT INTO `chat_user` VALUES ('167', '81', '147', '2014-11-01 16:40:51', '注册进来啦', '游龙刚', '74', '140918105705.jpg', null, null, null, '1', '0');
INSERT INTO `chat_user` VALUES ('168', '147', '77', '2014-10-28 13:53:39', '你好！', '叶龙海', '60', '', null, null, null, '1', '1');
INSERT INTO `chat_user` VALUES ('169', '77', '147', '2014-10-28 13:53:39', '你好！', '任梦涵', '85', '140918094818.jpg', null, null, null, '1', '1');

-- ----------------------------
-- Table structure for `info`
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` int(11) NOT NULL auto_increment,
  `ver` varchar(255) collate gbk_bin default NULL,
  `alert` varchar(255) collate gbk_bin default NULL,
  `locat` varchar(255) collate gbk_bin default NULL,
  `aboutkpno` varchar(6000) collate gbk_bin default NULL,
  `aboutus` varchar(6000) collate gbk_bin default NULL,
  `regtime` datetime default NULL,
  `androidpath` varchar(255) collate gbk_bin default NULL,
  `iospath` varchar(255) collate gbk_bin default NULL,
  `user_joinnum` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES ('40', '1.0.0', '1', '0', 'kaopuzhushushuoming', 'aboutus', null, 'http://www.baidu.com', 'http://www.google.com', '319');

-- ----------------------------
-- Table structure for `jccpush`
-- ----------------------------
DROP TABLE IF EXISTS `jccpush`;
CREATE TABLE `jccpush` (
  `uid` varchar(50) NOT NULL,
  `pushid` varchar(50) NOT NULL,
  `device` varchar(50) NOT NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of jccpush
-- ----------------------------
INSERT INTO `jccpush` VALUES ('', '890550071447974070', '4');
INSERT INTO `jccpush` VALUES ('0', '998053743441062963', '3');
INSERT INTO `jccpush` VALUES ('1', '99', '4');
INSERT INTO `jccpush` VALUES ('117', '653139065905626886', '4');
INSERT INTO `jccpush` VALUES ('118', '627504546058422041', '3');
INSERT INTO `jccpush` VALUES ('126', '647968595792752021', '4');
INSERT INTO `jccpush` VALUES ('131', '810510952711922464', '4');
INSERT INTO `jccpush` VALUES ('133', '975795023938687793', '4');
INSERT INTO `jccpush` VALUES ('138', '793582003888178467', '3');
INSERT INTO `jccpush` VALUES ('141', '988995325168744699', '3');
INSERT INTO `jccpush` VALUES ('144', '914291289947328413', '4');
INSERT INTO `jccpush` VALUES ('145', '927113688916018785', '4');
INSERT INTO `jccpush` VALUES ('146', '927852982628341172', '3');
INSERT INTO `jccpush` VALUES ('148', '878204585227147632', '3');
INSERT INTO `jccpush` VALUES ('151', '623781887467376448', '4');
INSERT INTO `jccpush` VALUES ('2', '99', '4');
INSERT INTO `jccpush` VALUES ('20', '900', '3');
INSERT INTO `jccpush` VALUES ('22222', '100', '4');
INSERT INTO `jccpush` VALUES ('30', '1146069893470858455', '3');
INSERT INTO `jccpush` VALUES ('31', '89', '4');
INSERT INTO `jccpush` VALUES ('39', '594868457419974970', '3');
INSERT INTO `jccpush` VALUES ('40', '973520447633333614', '4');
INSERT INTO `jccpush` VALUES ('44', '644109453181907525', '4');
INSERT INTO `jccpush` VALUES ('46', '1010365733728782051', '3');
INSERT INTO `jccpush` VALUES ('47', '999855442162598342', '3');
INSERT INTO `jccpush` VALUES ('48', '620051795075286960', '3');
INSERT INTO `jccpush` VALUES ('49', '694999357757267184', '4');
INSERT INTO `jccpush` VALUES ('50', '1146069893470858455', '3');
INSERT INTO `jccpush` VALUES ('51', '660678759498115392', '3');
INSERT INTO `jccpush` VALUES ('54', '998169509237528481', '3');
INSERT INTO `jccpush` VALUES ('64', '660678759498115392', '3');
INSERT INTO `jccpush` VALUES ('66', '1146069893470858455', '3');
INSERT INTO `jccpush` VALUES ('69', '1146069893470858455', '3');
INSERT INTO `jccpush` VALUES ('70', '711722817987596180', '4');
INSERT INTO `jccpush` VALUES ('71', '711722817987596180', '4');
INSERT INTO `jccpush` VALUES ('72', '1146069893470858455', '3');
INSERT INTO `jccpush` VALUES ('73', '1082536103609263950', '4');
INSERT INTO `jccpush` VALUES ('74', '644109453181907525', '4');
INSERT INTO `jccpush` VALUES ('75', '972501358099077537', '4');
INSERT INTO `jccpush` VALUES ('77', '972501358099077537', '4');
INSERT INTO `jccpush` VALUES ('78', '660678759498115392', '3');
INSERT INTO `jccpush` VALUES ('81', '638827484398098491', '3');
INSERT INTO `jccpush` VALUES ('82', '921512838744467898', '3');
INSERT INTO `jccpush` VALUES ('83', '945049635010503351', '3');
INSERT INTO `jccpush` VALUES ('84', '622367516125783724', '3');
INSERT INTO `jccpush` VALUES ('86', '856571392401765926', '3');

-- ----------------------------
-- Table structure for `jdan`
-- ----------------------------
DROP TABLE IF EXISTS `jdan`;
CREATE TABLE `jdan` (
  `id` int(11) NOT NULL auto_increment,
  `jd_id` int(11) NOT NULL,
  `jd_name` varchar(255) collate gbk_bin default NULL COMMENT '发起人姓名',
  `jd_phone` varchar(255) collate gbk_bin default NULL COMMENT '电话',
  `jd_kpno` varchar(8000) collate gbk_bin default NULL COMMENT '简介',
  `jd_content` varchar(8000) collate gbk_bin default NULL COMMENT '简介',
  `jd_regtime` datetime default NULL COMMENT '时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of jdan
-- ----------------------------

-- ----------------------------
-- Table structure for `msg`
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL auto_increment,
  `phone` varchar(255) collate gbk_bin default NULL,
  `reid` varchar(255) collate gbk_bin default NULL,
  `regtime` datetime default NULL,
  `content` varchar(2000) collate gbk_bin default NULL,
  `read` varchar(1) collate gbk_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of msg
-- ----------------------------

-- ----------------------------
-- Table structure for `party`
-- ----------------------------
DROP TABLE IF EXISTS `party`;
CREATE TABLE `party` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `u_name` varchar(255) collate gbk_bin default NULL COMMENT '发起人姓名',
  `phone` varchar(255) collate gbk_bin default NULL COMMENT '电话',
  `regtime` datetime default NULL COMMENT '时间',
  `state` varchar(255) collate gbk_bin default NULL COMMENT '状态',
  `type` varchar(255) collate gbk_bin default NULL COMMENT '业务类型',
  `partytime` datetime default NULL COMMENT '金额',
  `city` varchar(255) collate gbk_bin default NULL COMMENT '区域',
  `area` varchar(255) collate gbk_bin default NULL COMMENT '区域',
  `adr` varchar(255) collate gbk_bin default NULL COMMENT '放款期限',
  `membernum` varchar(255) collate gbk_bin default NULL COMMENT '放款周期',
  `joinnum` varchar(255) collate gbk_bin default NULL COMMENT '参加人数',
  `title` varchar(255) collate gbk_bin default NULL COMMENT '放款周期',
  `content` varchar(8000) collate gbk_bin default NULL COMMENT '简介',
  `joinlist` varchar(12000) collate gbk_bin default NULL COMMENT '接单者列表',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of party
-- ----------------------------
INSERT INTO `party` VALUES ('55', '70', '%E9%AB%98%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-17 10:44:26', '0', '聚餐', '2014-09-18 18:30:00', '北京 朝阳区', '世贸天阶', '汉拿山世贸天阶店', '6', '6', '世贸天阶聚餐', '同行聚会，每人50元', '|72|73|71|76|75|78');
INSERT INTO `party` VALUES ('56', '72', '%E7%8E%8B%E9%BE%99', '18310292618', '2014-09-17 11:09:23', '0', '郊游', '2014-09-24 11:17:00', '黑龙江 七台河市 其他', '中关村', '12路', '58', '7', '旅游', '欢迎大家', '|73|76|75|78|70|84|85');
INSERT INTO `party` VALUES ('57', '70', '%E9%AB%98%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-17 11:12:42', '0', '泡吧', '2014-09-19 22:00:00', '北京 朝阳区', '工体', 'Mix', '6', '6', '工体聚会', '同行聚会，有人买单', '|73|71|76|75|78|81');
INSERT INTO `party` VALUES ('58', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-09-18 14:18:07', '0', '交流会', '2014-09-18 15:20:00', '北京 海淀', '中关村', '中关村3W咖啡', '2', '2', '同行交流', '有在中关村的同行聚聚', '|77|71');
INSERT INTO `party` VALUES ('59', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-09-18 14:27:37', '0', '唱歌', '2014-09-18 20:30:00', '北京 海淀', '中关村', '十七英里', '15', '5', '同行聚会唱歌', '同行聚会，有人请客', '|77|71|76|75|78');
INSERT INTO `party` VALUES ('60', '71', '%E5%AE%8F%E6%9D%B0', '18610668688', '2014-09-18 15:36:13', '0', '交流会', '2014-09-18 15:45:00', '北京 海淀', '中关村', '车库咖啡', '2', '2', '银行人聚会', '聚会', '|70|73');
INSERT INTO `party` VALUES ('63', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-19 12:41:56', '0', '泡吧', '2014-09-19 22:45:00', '北京 朝阳', '三里屯', '夜色', '2', '2', '泡吧', '抓紧啊', '|73');
INSERT INTO `party` VALUES ('64', '78', '%E5%BD%AD%E9%AA%8F', '13701272188', '2014-09-19 15:07:46', '0', '泡吧', '2014-09-19 22:00:00', '北京 海淀', '五道口', '五角星', '2', '2', '五道口泡吧', '我请客', '|70|73');
INSERT INTO `party` VALUES ('65', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-22 19:58:59', '0', '聚餐', '2014-09-29 18:00:00', '北京 朝阳', '亚运村', '湘鄂情', '2', '1', '同行聚会', '聚聚', '|73');
INSERT INTO `party` VALUES ('66', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-23 16:15:20', '0', '其他', '2014-09-03 16:15:00', '北京 海淀', '中关村', '28号', '60', '0', '轮滑刷街', '热爱运动的朋友们来吧', '');
INSERT INTO `party` VALUES ('67', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-23 16:40:46', '0', '打球', '2014-09-27 16:42:00', '北京 海淀', '中关村', '16号', '66', '1', '打篮球', '快来吧', '|73');
INSERT INTO `party` VALUES ('68', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-26 17:23:41', '0', '泡吧', '2014-09-26 22:30:00', '北京 朝阳', '三里屯', '青年', '5', '0', '三里屯聚会', 'aa', '');
INSERT INTO `party` VALUES ('69', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-29 20:02:47', '0', '交流会', '2014-10-05 15:00:00', '北京 海淀', '中关村', '车库咖啡', '2', '2', '中关村聚会', '同行聚聚', '|73|71');
INSERT INTO `party` VALUES ('70', '71', '%E5%AE%8F%E6%9D%B0', '18610668688', '2014-09-29 20:30:20', '0', '交流会', '2014-09-30 14:32:00', '北京 朝阳', '亚运村', '花舍咖啡', '2', '1', '银行同业交流', '聊聊', '|73');
INSERT INTO `party` VALUES ('71', '78', '%E5%BD%AD%E9%AA%8F', '13701272188', '2014-09-29 20:42:04', '0', '泡吧', '2014-09-30 22:20:00', '北京 朝阳', '国贸', '秀吧', '2', '1', '酒吧聚聚', '聚聚', '|73');
INSERT INTO `party` VALUES ('73', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-29 21:25:24', '0', '泡吧', '2014-09-29 22:27:00', '北京 朝阳', '三里屯', '男孩女孩', '3', '0', '酒吧聚聚', '聚聚', '');
INSERT INTO `party` VALUES ('75', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-10-15 21:24:44', '0', '交流会', '2014-10-18 10:25:00', '北京 海淀', '万柳', '万柳 迪佳广场 maan coffee', '10', '2', '万柳交流会', '初来乍到 多多关照 随便聊聊', '|71|70');
INSERT INTO `party` VALUES ('76', '71', '%E5%AE%8F%E6%9D%B0', '18610668688', '2014-10-25 22:57:51', '0', '交流会', '2014-10-25 09:00:00', '北京 西城', '金融街', '星巴克', '2', '2', '同业聚会', '聊聊', '|118|73');
INSERT INTO `party` VALUES ('79', '126', '%E9%99%88%E6%8C%AF%E5%BF%A0', '13671302770', '2014-10-30 10:51:51', '0', '交流会', '2014-10-31 09:15:00', '北京 朝阳', '国贸', '北京财富中心', '5', '0', '国贸同行交流会', '行业交流，政策更新', '');
INSERT INTO `party` VALUES ('80', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-10-30 12:59:50', '1', '交流会', '2014-11-04 12:00:00', '北京 海淀', '海淀', '3W咖啡', '5', '1', '中关村聚会', '大家聊聊', '|126');

-- ----------------------------
-- Table structure for `sdan`
-- ----------------------------
DROP TABLE IF EXISTS `sdan`;
CREATE TABLE `sdan` (
  `id` int(11) NOT NULL auto_increment,
  `uid` varchar(255) collate gbk_bin default NULL COMMENT '发起人姓名',
  `u_name` varchar(255) collate gbk_bin default NULL COMMENT '电话',
  `phone` varchar(255) collate gbk_bin default NULL COMMENT '电话',
  `regtime` datetime default NULL COMMENT '时间',
  `state` varchar(255) collate gbk_bin default NULL COMMENT '状态',
  `area` varchar(255) collate gbk_bin default NULL COMMENT '区域',
  `type` varchar(255) collate gbk_bin default NULL COMMENT '业务类型',
  `money` varchar(255) collate gbk_bin default NULL COMMENT '金额',
  `limitdate` varchar(255) collate gbk_bin default NULL COMMENT '放款期限',
  `howlong` varchar(255) collate gbk_bin default NULL COMMENT '放款周期',
  `title` varchar(255) collate gbk_bin default NULL COMMENT '放款周期',
  `assessnum` varchar(255) collate gbk_bin default NULL COMMENT '评价',
  `assesstxt` varchar(255) collate gbk_bin default NULL COMMENT '评价内容',
  `content` varchar(8000) collate gbk_bin default NULL COMMENT '简介',
  `joinlist` varchar(12000) collate gbk_bin default NULL COMMENT '接单者列表',
  `joinnum` varchar(255) collate gbk_bin default NULL COMMENT '放款周期',
  `selectid` varchar(255) collate gbk_bin default NULL,
  `selectname` varchar(255) collate gbk_bin default NULL,
  `selectavatar` varchar(255) collate gbk_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of sdan
-- ----------------------------
INSERT INTO `sdan` VALUES ('94', '70', '%E9%AB%98%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-17 09:38:38', '0', '北京 朝阳', '银行抵押贷款', '380', '40', '60', '朝阳800万房产贷380万', '1', '满意的交易', '直户，看过房产，无贷款足值，谁能做报个底点', '|73', '1', '73', '高峰', '');
INSERT INTO `sdan` VALUES ('95', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-09-17 12:14:18', '1', '北京 西城区', '房产抵押', '200', '2', '3', '房产质押要200万', '3', '满意的交易', '用三个月，报下底点', '|70|77|78|87', '4', '', '天宇', '140918101913.jpg');
INSERT INTO `sdan` VALUES ('97', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-09-18 14:25:43', '1', '北京 丰台', '过桥垫资', '50', '5', '1', '过桥垫资50万', '', '', '客户在民生银行的抵押经营贷，有批贷函，谁能做报点位', '|78|70', '2', null, null, null);
INSERT INTO `sdan` VALUES ('98', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-09-18 14:29:25', '1', '北京 西城', '小额贷款', '20', '30', '12', '白领借20万', '', '', '白领借款，在央企工作', '|78|70|76|86|87', '5', null, null, null);
INSERT INTO `sdan` VALUES ('99', '77', '%E4%BB%BB%E6%A2%A6%E6%B6%B5', '13370176399', '2014-09-18 14:33:57', '0', '北京 朝阳', '房产质押', '200', '2', '3', '北京房质押', '1', '不错', '客户比较着急，房产足值', '|73', '1', '73', '高峰', '140918104046.jpg');
INSERT INTO `sdan` VALUES ('100', '78', '%E5%BD%AD%E9%AA%8F', '13701272188', '2014-09-19 10:40:25', '1', '北京 石景山', '车辆质押', '100', '3', '3', '豪车用钱', '', '', '法拉利新车，谁能做报一下', '|73|81', '2', null, null, null);
INSERT INTO `sdan` VALUES ('101', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-19 11:05:34', '2', '北京 朝阳', '银行抵押贷款', '1200', '3', '6', '北京别墅贷款1200万', '', '', '中央别墅区', '|78|73', '2', '73', '高峰', '140918104046.jpg');
INSERT INTO `sdan` VALUES ('102', '81', '%E6%B8%B8%E9%BE%99%E5%88%9A', '18510510168', '2014-09-20 15:40:31', '1', '北京 东城区', '银行抵押贷款', '133', '2', '12', '啦咯啦咯啦咯啦咯啦咯吐了咯啦咯', '', '', 'pps去8图兔兔突击了了', '|85|73', '2', null, null, null);
INSERT INTO `sdan` VALUES ('103', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-22 20:42:25', '0', '北京 东城', '车辆质押', '100', '10', '12', '北京汽车贷款110', '1', '不错', '韩寒靠谱不完', '|73', '1', '73', '高峰', '140918104046.jpg');
INSERT INTO `sdan` VALUES ('104', '81', '%E6%B8%B8%E9%BE%99%E5%88%9A', '18510510168', '2014-09-23 09:35:00', '1', '北京 东城区', '房产抵押', '200', '7', '12', '转单200万，节前放款', '', '', '客户北京人，在京2套房（另一套已抵押无余值），有公司，房产市值250万，上家借款2个月200万。', '|87', '1', null, null, null);
INSERT INTO `sdan` VALUES ('105', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-26 17:21:24', '1', '北京 海淀', '房产质押', '200', '3', '4', '海淀房产质押', '', '', '世纪城的房子，谁能做报一下', '|87', '1', null, null, null);
INSERT INTO `sdan` VALUES ('106', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-29 20:00:51', '2', '北京 丰台', '银行信用贷款', '500', '20', '12', '公司流水贷款', '', '', '客户公司每年流水五个亿左右，希望走银行流水贷', '|73', '1', '73', '高峰', '140918104046.jpg');
INSERT INTO `sdan` VALUES ('107', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-09-29 20:53:36', '1', '北京 昌平', '其他', '2500', '15', '3', '保理业务2500万', '', '', '保理业务谁能做？异地保', '|118|70|127', '3', null, null, null);
INSERT INTO `sdan` VALUES ('108', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-09-29 20:56:07', '0', '北京 丰台', '房产质押', '260', '2', '3', '260万房产质押', '3', '靠谱！', '速速', '|70', '1', '70', '天宇', '140918172151.jpg');
INSERT INTO `sdan` VALUES ('109', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-09-29 21:46:20', '0', '北京 朝阳', '车辆质押', '25', '3', '3', '豪车质押在朝阳', '3', '高峰靠谱', '豪车', '|73', '1', '73', '高峰', '140918104046.jpg');
INSERT INTO `sdan` VALUES ('110', '71', '%E5%AE%8F%E6%9D%B0', '18610668688', '2014-10-15 22:59:49', '1', '北京 丰台', '信用卡', '10', '10', '5', '办理高额度信用卡', '', '', '客户有房有车，希望额度10万', '|73|85|70|118|127', '5', null, null, null);
INSERT INTO `sdan` VALUES ('111', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-10-15 23:14:07', '2', '北京 东城', '信用卡', '10', '1', '10', '北京大额信用卡', '', '', '大额度信用卡', '|70|81|123', '3', '81', '游龙刚', '140918105705.jpg');
INSERT INTO `sdan` VALUES ('112', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-10-16 15:25:16', '0', '北京 西城', '银行信用贷款', '50', '30', '24', '北京金融央企客户信用贷款', '1', '嗯\n', '客户在金融央企工作，名校学历，在北京有房有车，收入证明开的45万左右，希望贷款是月息还本的，能办的回复消息', '|81|70', '2', '70', '天宇', '140918172151.jpg');
INSERT INTO `sdan` VALUES ('113', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-10-21 09:58:17', '0', '北京 西城', '房产质押', '300', '10', '36', '房产质押', '3', '不错，人靠谱\n', '优质客户', '|81|126', '2', '81', '游龙刚', '140918105705.jpg');
INSERT INTO `sdan` VALUES ('114', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-10-23 18:23:43', '0', '北京 丰台', '银行抵押贷款', '300', '40', '60', '优质客户房产抵押贷', '1', '不错哈', '优质客户，房产在丰台区的一个次新盘，市值400万以上，客户希望尽可能多贷，走经营贷，月息还本的，谁能做给我报一下', '|73', '1', '73', '高峰', '140918104046.jpg');
INSERT INTO `sdan` VALUES ('115', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-10-24 18:15:40', '0', '北京 西城', '银行信用贷款', '50', '30', '12', '信用贷单子', '1', '厉害', '客户在央企，资质不错，年收入50多万', '|70', '1', '70', '天宇', '140918172151.jpg');
INSERT INTO `sdan` VALUES ('116', '70', '%E5%A4%A9%E5%AE%87', '13466754325', '2014-10-24 18:26:23', '1', '北京 东城', '银行抵押贷款', '100', '14', '12', '甩个单子', '', '', '有人接单吗', '|86|73|118|126', '4', null, null, null);
INSERT INTO `sdan` VALUES ('117', '127', '%E7%8E%8B%E8%8A%B3', '13944518823', '2014-10-25 13:33:31', '0', '辽宁 本溪市', '房产质押', '100', '3', '12', '家里', '3', 'hfftgv', '了解了', '|73|70', '2', '70', '天宇', '140918172151.jpg');
INSERT INTO `sdan` VALUES ('118', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-10-27 10:12:16', '1', '北京 西城', '房产质押', '200', '5', '3', '市区房质押贷款200万', '', '', '西城的足值房产，客户开饭店，流水可以', '|70|147|127', '3', null, null, null);
INSERT INTO `sdan` VALUES ('120', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-10-29 21:25:43', '1', '北京 西城', '其他', '50', '30', '12', '朋友要办大额度信用卡', '', '', '朋友要近期办理大额度信用卡，越快越好。', '', '0', null, null, null);
INSERT INTO `sdan` VALUES ('121', '126', '%E9%99%88%E6%8C%AF%E5%BF%A0', '13671302770', '2014-10-29 23:46:30', '1', '北京 东城', '房产质押', '2000', '7', '3', '北京2000万房产质押', '', '', '北京四合院，评估价3500万，因上一家公司需回笼资金，故决定转单。', '', '0', null, null, null);
INSERT INTO `sdan` VALUES ('124', '73', '%E9%AB%98%E5%B3%B0', '18610079117', '2014-10-30 12:57:23', '1', '北京 朝阳', '房产质押', '100', '2', '4', '北京质押贷款100万', '', '', '急用钱足值', '', '0', null, null, null);
INSERT INTO `sdan` VALUES ('125', '81', '%E6%B8%B8%E9%BE%99%E5%88%9A', '18510510168', '2014-11-01 16:34:14', '1', '山东 青岛市', '房产质押', '8000', '7', '3', '青岛项目房产质押', '', '', '青岛项目，房产在黄岛区政府旁边，很多个房本，包括：商铺、别墅、住宅，市值2亿+。借款8000万，用于交信用证保证金（中国进出口银行山东分行授信4亿，保证金20％）。', '', '0', null, null, null);

-- ----------------------------
-- Table structure for `sdan_chat`
-- ----------------------------
DROP TABLE IF EXISTS `sdan_chat`;
CREATE TABLE `sdan_chat` (
  `id` int(11) NOT NULL auto_increment,
  `sdanid` varchar(255) collate gbk_bin default NULL,
  `seid` varchar(255) collate gbk_bin default NULL,
  `reid` varchar(255) collate gbk_bin default NULL,
  `regtime` datetime default NULL,
  `message` varchar(5000) collate gbk_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of sdan_chat
-- ----------------------------
INSERT INTO `sdan_chat` VALUES ('193', '94', '73', '70', '2014-09-17 11:45:50', '我能做，给你一个点底点，高出全返，40天没问题');
INSERT INTO `sdan_chat` VALUES ('194', '94', '70', '73', '2014-09-17 11:47:03', '有其他费用没？');
INSERT INTO `sdan_chat` VALUES ('195', '95', '70', '73', '2014-09-17 12:15:12', '底点2');
INSERT INTO `sdan_chat` VALUES ('196', '95', '73', '70', '2014-09-17 12:16:16', '能当天放款么');
INSERT INTO `sdan_chat` VALUES ('197', '95', '70', '73', '2014-09-17 12:16:51', '可以');
INSERT INTO `sdan_chat` VALUES ('198', '95', '70', '73', '2014-09-17 12:17:24', '没有服务费');
INSERT INTO `sdan_chat` VALUES ('199', '96', '70', '72', '2014-09-18 10:45:15', '你好');
INSERT INTO `sdan_chat` VALUES ('200', '95', '73', '70', '2014-09-18 11:50:26', '嗯');
INSERT INTO `sdan_chat` VALUES ('201', '95', '70', '73', '2014-09-18 11:50:56', '好的');
INSERT INTO `sdan_chat` VALUES ('202', '95', '73', '70', '2014-09-18 11:51:36', '好');
INSERT INTO `sdan_chat` VALUES ('203', '95', '73', '70', '2014-09-18 11:55:22', '你先忙');
INSERT INTO `sdan_chat` VALUES ('204', '95', '73', '70', '2014-09-18 14:04:26', '你好');
INSERT INTO `sdan_chat` VALUES ('205', '95', '70', '73', '2014-09-18 14:05:13', '你好');
INSERT INTO `sdan_chat` VALUES ('206', '95', '70', '73', '2014-09-18 14:06:25', '你好');
INSERT INTO `sdan_chat` VALUES ('207', '95', '73', '70', '2014-09-18 14:07:04', '努力');
INSERT INTO `sdan_chat` VALUES ('208', '95', '73', '70', '2014-09-18 14:07:16', '你好');
INSERT INTO `sdan_chat` VALUES ('209', '95', '73', '70', '2014-09-18 14:10:13', '哈喽');
INSERT INTO `sdan_chat` VALUES ('210', '95', '73', '70', '2014-09-18 14:19:52', '哈喽');
INSERT INTO `sdan_chat` VALUES ('211', '95', '73', '70', '2014-09-18 14:24:25', '好的');
INSERT INTO `sdan_chat` VALUES ('212', '95', '70', '73', '2014-09-18 14:24:36', '哦哦哦');
INSERT INTO `sdan_chat` VALUES ('213', '95', '70', '73', '2014-09-18 14:25:07', '你好');
INSERT INTO `sdan_chat` VALUES ('214', '95', '70', '73', '2014-09-18 14:25:24', '你好啊');
INSERT INTO `sdan_chat` VALUES ('215', '95', '70', '73', '2014-09-18 14:26:46', '你哈');
INSERT INTO `sdan_chat` VALUES ('216', '95', '70', '73', '2014-09-18 14:27:16', '好');
INSERT INTO `sdan_chat` VALUES ('217', '95', '70', '73', '2014-09-18 14:27:43', '好');
INSERT INTO `sdan_chat` VALUES ('218', '95', '77', '73', '2014-09-18 14:31:09', '我能做');
INSERT INTO `sdan_chat` VALUES ('219', '95', '70', '73', '2014-09-18 14:39:32', '好好');
INSERT INTO `sdan_chat` VALUES ('220', '95', '70', '73', '2014-09-18 14:40:22', '好');
INSERT INTO `sdan_chat` VALUES ('221', '95', '70', '73', '2014-09-18 14:40:44', '了');
INSERT INTO `sdan_chat` VALUES ('222', '95', '70', '73', '2014-09-18 14:41:04', '哈喽');
INSERT INTO `sdan_chat` VALUES ('223', '95', '70', '73', '2014-09-18 14:50:23', '哈喽');
INSERT INTO `sdan_chat` VALUES ('224', '95', '70', '73', '2014-09-18 14:54:03', '接口');
INSERT INTO `sdan_chat` VALUES ('225', '95', '70', '73', '2014-09-18 14:56:37', '好的');
INSERT INTO `sdan_chat` VALUES ('226', '95', '73', '70', '2014-09-18 14:56:49', '嗯');
INSERT INTO `sdan_chat` VALUES ('227', '95', '73', '70', '2014-09-18 14:57:11', '现在');
INSERT INTO `sdan_chat` VALUES ('228', '95', '73', '70', '2014-09-18 14:57:22', '哦哦');
INSERT INTO `sdan_chat` VALUES ('229', '99', '73', '77', '2014-09-18 15:55:18', '我能做');
INSERT INTO `sdan_chat` VALUES ('230', '99', '77', '73', '2014-09-18 15:55:43', '恩');
INSERT INTO `sdan_chat` VALUES ('231', '99', '73', '77', '2014-09-18 16:55:38', '你好');
INSERT INTO `sdan_chat` VALUES ('232', '99', '77', '73', '2014-09-18 16:56:39', '底点多少');
INSERT INTO `sdan_chat` VALUES ('233', '95', '78', '73', '2014-09-19 10:30:49', '底点2.2');
INSERT INTO `sdan_chat` VALUES ('234', '98', '78', '73', '2014-09-19 10:31:22', '这个我能接');
INSERT INTO `sdan_chat` VALUES ('235', '97', '78', '73', '2014-09-19 10:31:44', '你好');
INSERT INTO `sdan_chat` VALUES ('236', '96', '78', '72', '2014-09-19 10:32:06', '55天？');
INSERT INTO `sdan_chat` VALUES ('237', '100', '73', '78', '2014-09-19 10:52:47', '我能做');
INSERT INTO `sdan_chat` VALUES ('238', '100', '78', '73', '2014-09-19 10:53:31', '多少？');
INSERT INTO `sdan_chat` VALUES ('239', '100', '73', '78', '2014-09-19 10:54:14', '见面说吧');
INSERT INTO `sdan_chat` VALUES ('240', '100', '78', '73', '2014-09-19 10:55:41', '好，电话吧');
INSERT INTO `sdan_chat` VALUES ('241', '101', '78', '70', '2014-09-19 11:06:48', '要不要走银行？');
INSERT INTO `sdan_chat` VALUES ('242', '101', '70', '78', '2014-09-19 11:07:38', ' 先质押，然后转银行');
INSERT INTO `sdan_chat` VALUES ('243', '101', '73', '70', '2014-09-19 15:48:21', '我能接不？哥们');
INSERT INTO `sdan_chat` VALUES ('244', '97', '70', '73', '2014-09-20 10:22:59', '你好');
INSERT INTO `sdan_chat` VALUES ('245', '101', '73', '70', '2014-09-20 10:23:50', '你好啊');
INSERT INTO `sdan_chat` VALUES ('246', '97', '73', '70', '2014-09-20 10:27:26', '哪个公司？');
INSERT INTO `sdan_chat` VALUES ('247', '97', '73', '70', '2014-09-20 10:28:31', '聊聊');
INSERT INTO `sdan_chat` VALUES ('248', '101', '70', '73', '2014-09-20 10:32:46', '聊聊');
INSERT INTO `sdan_chat` VALUES ('249', '97', '73', '70', '2014-09-20 10:33:55', '你在哪');
INSERT INTO `sdan_chat` VALUES ('250', '97', '73', '70', '2014-09-20 10:34:19', '你在哪里');
INSERT INTO `sdan_chat` VALUES ('251', '97', '73', '70', '2014-09-20 10:34:47', '你在哪里？');
INSERT INTO `sdan_chat` VALUES ('252', '97', '73', '70', '2014-09-20 10:37:54', '你好');
INSERT INTO `sdan_chat` VALUES ('253', '98', '76', '73', '2014-09-20 10:42:32', '你好，我能做');
INSERT INTO `sdan_chat` VALUES ('254', '97', '70', '73', '2014-09-20 10:42:33', '啊');
INSERT INTO `sdan_chat` VALUES ('255', '98', '76', '73', '2014-09-20 10:43:13', '你好');
INSERT INTO `sdan_chat` VALUES ('256', '98', '76', '73', '2014-09-20 10:43:29', '你好');
INSERT INTO `sdan_chat` VALUES ('257', '97', '70', '73', '2014-09-20 10:44:07', '哈吧');
INSERT INTO `sdan_chat` VALUES ('258', '97', '70', '73', '2014-09-20 10:53:40', '间距');
INSERT INTO `sdan_chat` VALUES ('259', '101', '70', '73', '2014-09-20 10:54:04', '试试');
INSERT INTO `sdan_chat` VALUES ('260', '101', '70', '73', '2014-09-20 10:54:37', '试试');
INSERT INTO `sdan_chat` VALUES ('261', '101', '70', '73', '2014-09-20 10:54:41', '试试');
INSERT INTO `sdan_chat` VALUES ('262', '101', '70', '73', '2014-09-20 10:54:43', '试试');
INSERT INTO `sdan_chat` VALUES ('263', '97', '70', '73', '2014-09-20 10:57:59', '试试');
INSERT INTO `sdan_chat` VALUES ('264', '101', '70', '73', '2014-09-20 10:58:28', '是好多了');
INSERT INTO `sdan_chat` VALUES ('265', '101', '70', '73', '2014-09-20 11:07:21', '看看');
INSERT INTO `sdan_chat` VALUES ('266', '97', '70', '73', '2014-09-20 11:08:04', '零零落落');
INSERT INTO `sdan_chat` VALUES ('267', '97', '73', '70', '2014-09-20 11:08:42', '你好');
INSERT INTO `sdan_chat` VALUES ('268', '97', '73', '70', '2014-09-20 11:08:47', '好不好');
INSERT INTO `sdan_chat` VALUES ('269', '97', '73', '70', '2014-09-20 11:12:24', '好的');
INSERT INTO `sdan_chat` VALUES ('270', '97', '73', '70', '2014-09-20 11:14:08', '发了');
INSERT INTO `sdan_chat` VALUES ('271', '97', '70', '73', '2014-09-20 11:16:47', '哈喽');
INSERT INTO `sdan_chat` VALUES ('272', '97', '70', '73', '2014-09-20 11:18:19', '黄鹤楼');
INSERT INTO `sdan_chat` VALUES ('273', '97', '70', '73', '2014-09-20 11:18:23', '嘎扣');
INSERT INTO `sdan_chat` VALUES ('274', '97', '70', '73', '2014-09-20 11:19:35', 'uuu');
INSERT INTO `sdan_chat` VALUES ('275', '97', '70', '73', '2014-09-20 11:19:38', '哦哦哦');
INSERT INTO `sdan_chat` VALUES ('276', '97', '73', '70', '2014-09-20 11:19:49', '何厚铧');
INSERT INTO `sdan_chat` VALUES ('277', '97', '73', '70', '2014-09-20 11:19:53', '看看看');
INSERT INTO `sdan_chat` VALUES ('278', '97', '73', '70', '2014-09-20 11:20:21', '收到');
INSERT INTO `sdan_chat` VALUES ('279', '97', '70', '73', '2014-09-20 11:20:31', '没问题啊');
INSERT INTO `sdan_chat` VALUES ('280', '101', '73', '70', '2014-09-20 11:20:46', '今后改革');
INSERT INTO `sdan_chat` VALUES ('281', '97', '70', '73', '2014-09-20 11:20:53', '都收到了');
INSERT INTO `sdan_chat` VALUES ('282', '97', '70', '73', '2014-09-20 11:21:33', '1');
INSERT INTO `sdan_chat` VALUES ('283', '97', '70', '73', '2014-09-20 11:21:34', '2');
INSERT INTO `sdan_chat` VALUES ('284', '97', '70', '73', '2014-09-20 11:21:35', '3');
INSERT INTO `sdan_chat` VALUES ('285', '97', '70', '73', '2014-09-20 11:21:36', '4');
INSERT INTO `sdan_chat` VALUES ('286', '97', '70', '73', '2014-09-20 11:21:37', '5');
INSERT INTO `sdan_chat` VALUES ('287', '97', '70', '73', '2014-09-20 11:21:39', '6');
INSERT INTO `sdan_chat` VALUES ('288', '101', '73', '70', '2014-09-20 11:21:48', '7');
INSERT INTO `sdan_chat` VALUES ('289', '101', '73', '70', '2014-09-20 11:21:49', '8');
INSERT INTO `sdan_chat` VALUES ('290', '101', '73', '70', '2014-09-20 11:21:50', '9');
INSERT INTO `sdan_chat` VALUES ('291', '101', '73', '70', '2014-09-20 11:21:52', '10');
INSERT INTO `sdan_chat` VALUES ('292', '97', '70', '73', '2014-09-20 11:22:41', '7');
INSERT INTO `sdan_chat` VALUES ('293', '97', '73', '70', '2014-09-20 11:22:56', '8');
INSERT INTO `sdan_chat` VALUES ('294', '97', '73', '70', '2014-09-20 11:23:02', '1');
INSERT INTO `sdan_chat` VALUES ('295', '97', '73', '70', '2014-09-20 11:23:03', '2');
INSERT INTO `sdan_chat` VALUES ('296', '97', '73', '70', '2014-09-20 11:23:04', '3');
INSERT INTO `sdan_chat` VALUES ('297', '97', '73', '70', '2014-09-20 11:23:04', '4');
INSERT INTO `sdan_chat` VALUES ('298', '97', '73', '70', '2014-09-20 11:23:05', '5');
INSERT INTO `sdan_chat` VALUES ('299', '97', '73', '70', '2014-09-20 11:23:06', '6');
INSERT INTO `sdan_chat` VALUES ('300', '101', '70', '73', '2014-09-20 11:33:18', '试试');
INSERT INTO `sdan_chat` VALUES ('301', '101', '70', '73', '2014-09-20 11:49:19', '静候');
INSERT INTO `sdan_chat` VALUES ('302', '101', '73', '70', '2014-09-20 11:49:23', '回家');
INSERT INTO `sdan_chat` VALUES ('303', '97', '70', '73', '2014-09-20 11:49:47', '处女膜');
INSERT INTO `sdan_chat` VALUES ('304', '97', '73', '70', '2014-09-20 11:50:13', '你奶奶');
INSERT INTO `sdan_chat` VALUES ('305', '97', '73', '70', '2014-09-20 11:50:21', '哈哈镜');
INSERT INTO `sdan_chat` VALUES ('306', '97', '70', '73', '2014-09-20 11:51:01', '发挥好');
INSERT INTO `sdan_chat` VALUES ('307', '101', '70', '73', '2014-09-20 11:51:14', '脚后跟');
INSERT INTO `sdan_chat` VALUES ('308', '101', '70', '73', '2014-09-20 11:55:08', '考虑一下');
INSERT INTO `sdan_chat` VALUES ('309', '101', '70', '73', '2014-09-20 11:55:28', '不知道');
INSERT INTO `sdan_chat` VALUES ('310', '101', '73', '70', '2014-09-20 11:56:10', '拜拜');
INSERT INTO `sdan_chat` VALUES ('311', '101', '73', '70', '2014-09-20 11:56:23', '发广告');
INSERT INTO `sdan_chat` VALUES ('312', '101', '73', '70', '2014-09-20 12:00:25', '热腾腾');
INSERT INTO `sdan_chat` VALUES ('313', '101', '73', '70', '2014-09-20 12:04:10', '更丰富');
INSERT INTO `sdan_chat` VALUES ('314', '101', '73', '70', '2014-09-20 12:04:46', '而');
INSERT INTO `sdan_chat` VALUES ('315', '101', '73', '70', '2014-09-20 12:05:24', '很尴尬');
INSERT INTO `sdan_chat` VALUES ('316', '101', '73', '70', '2014-09-20 12:05:56', '晕乎乎');
INSERT INTO `sdan_chat` VALUES ('317', '101', '73', '70', '2014-09-20 12:10:04', '回家看');
INSERT INTO `sdan_chat` VALUES ('318', '101', '73', '70', '2014-09-20 12:12:35', '脚后跟');
INSERT INTO `sdan_chat` VALUES ('319', '97', '73', '70', '2014-09-20 12:15:06', '黄家驹');
INSERT INTO `sdan_chat` VALUES ('320', '97', '73', '70', '2014-09-20 12:15:24', '哦 i');
INSERT INTO `sdan_chat` VALUES ('321', '97', '73', '70', '2014-09-20 12:15:47', '上饭否');
INSERT INTO `sdan_chat` VALUES ('322', '97', '70', '73', '2014-09-20 12:19:41', '拒');
INSERT INTO `sdan_chat` VALUES ('323', '97', '73', '70', '2014-09-20 12:24:17', '那后果');
INSERT INTO `sdan_chat` VALUES ('324', '97', '73', '70', '2014-09-20 12:24:32', '法规和');
INSERT INTO `sdan_chat` VALUES ('325', '101', '73', '70', '2014-09-20 12:25:00', '法规和');
INSERT INTO `sdan_chat` VALUES ('326', '101', '70', '73', '2014-09-20 12:25:07', '回家看');
INSERT INTO `sdan_chat` VALUES ('327', '101', '73', '70', '2014-09-20 12:26:15', '看看');
INSERT INTO `sdan_chat` VALUES ('328', '101', '70', '73', '2014-09-20 12:26:30', '那过程');
INSERT INTO `sdan_chat` VALUES ('329', '101', '73', '70', '2014-09-20 12:26:50', '何厚铧');
INSERT INTO `sdan_chat` VALUES ('330', '101', '70', '73', '2014-09-20 12:28:10', 'u 有');
INSERT INTO `sdan_chat` VALUES ('331', '101', '73', '70', '2014-09-20 12:28:24', '更好');
INSERT INTO `sdan_chat` VALUES ('332', '101', '70', '73', '2014-09-20 12:28:50', '又热');
INSERT INTO `sdan_chat` VALUES ('333', '101', '73', '70', '2014-09-20 12:29:18', '骨灰盒');
INSERT INTO `sdan_chat` VALUES ('334', '101', '73', '70', '2014-09-20 12:31:41', '黄家驹');
INSERT INTO `sdan_chat` VALUES ('335', '101', '73', '70', '2014-09-20 12:32:25', '快捷键');
INSERT INTO `sdan_chat` VALUES ('336', '101', '73', '70', '2014-09-20 12:32:34', 'ui');
INSERT INTO `sdan_chat` VALUES ('337', '101', '70', '73', '2014-09-20 12:32:39', '也');
INSERT INTO `sdan_chat` VALUES ('338', '101', '70', '73', '2014-09-20 12:32:43', '回复的');
INSERT INTO `sdan_chat` VALUES ('339', '101', '73', '70', '2014-09-20 12:32:47', 'i 快看看');
INSERT INTO `sdan_chat` VALUES ('340', '97', '73', '70', '2014-09-20 12:33:01', '健康');
INSERT INTO `sdan_chat` VALUES ('341', '97', '73', '70', '2014-09-20 12:33:15', '将加快');
INSERT INTO `sdan_chat` VALUES ('342', '97', '70', '73', '2014-09-20 12:33:19', '回答说');
INSERT INTO `sdan_chat` VALUES ('343', '101', '73', '70', '2014-09-20 12:33:56', '看见');
INSERT INTO `sdan_chat` VALUES ('344', '101', '70', '73', '2014-09-20 12:34:01', '静候');
INSERT INTO `sdan_chat` VALUES ('345', '97', '73', '70', '2014-09-20 12:34:21', '回家看');
INSERT INTO `sdan_chat` VALUES ('346', '97', '70', '73', '2014-09-20 12:34:25', '不是说');
INSERT INTO `sdan_chat` VALUES ('347', '97', '73', '70', '2014-09-20 12:34:36', '打广告');
INSERT INTO `sdan_chat` VALUES ('348', '97', '73', '70', '2014-09-20 12:36:31', '黄家驹');
INSERT INTO `sdan_chat` VALUES ('349', '97', '73', '70', '2014-09-20 12:41:42', '国家级');
INSERT INTO `sdan_chat` VALUES ('350', '97', '73', '70', '2014-09-20 12:43:02', '结婚');
INSERT INTO `sdan_chat` VALUES ('351', '97', '73', '70', '2014-09-20 12:44:25', 'iu');
INSERT INTO `sdan_chat` VALUES ('352', '97', '73', '70', '2014-09-20 12:45:36', '的关怀');
INSERT INTO `sdan_chat` VALUES ('353', '97', '73', '70', '2014-09-20 12:47:49', '就解决');
INSERT INTO `sdan_chat` VALUES ('354', '97', '73', '70', '2014-09-20 12:48:30', '事实上');
INSERT INTO `sdan_chat` VALUES ('355', '97', '73', '70', '2014-09-20 12:56:27', '黄家驹发');
INSERT INTO `sdan_chat` VALUES ('356', '97', '73', '70', '2014-09-20 12:57:30', '看看看');
INSERT INTO `sdan_chat` VALUES ('357', '97', '73', '70', '2014-09-20 12:58:35', '拍拍拍');
INSERT INTO `sdan_chat` VALUES ('358', '97', '73', '70', '2014-09-20 13:02:03', '淡淡的');
INSERT INTO `sdan_chat` VALUES ('359', '101', '73', '70', '2014-09-20 13:02:37', '两路口');
INSERT INTO `sdan_chat` VALUES ('360', '97', '73', '70', '2014-09-20 13:04:00', '刚刚');
INSERT INTO `sdan_chat` VALUES ('361', '97', '73', '70', '2014-09-20 13:05:32', '浏览量');
INSERT INTO `sdan_chat` VALUES ('362', '97', '73', '70', '2014-09-20 13:06:50', '你奶奶');
INSERT INTO `sdan_chat` VALUES ('363', '97', '73', '73', '2014-09-20 13:06:59', '静候');
INSERT INTO `sdan_chat` VALUES ('364', '97', '73', '73', '2014-09-20 13:07:07', '参加大会');
INSERT INTO `sdan_chat` VALUES ('365', '97', '73', '70', '2014-09-20 13:07:14', '发广告');
INSERT INTO `sdan_chat` VALUES ('366', '97', '73', '73', '2014-09-20 13:07:21', '脚后跟');
INSERT INTO `sdan_chat` VALUES ('367', '97', '73', '73', '2014-09-20 13:07:34', '拍拍拍');
INSERT INTO `sdan_chat` VALUES ('368', '97', '70', '73', '2014-09-20 13:08:12', '电话号');
INSERT INTO `sdan_chat` VALUES ('369', '97', '70', '73', '2014-09-20 13:08:32', '具有');
INSERT INTO `sdan_chat` VALUES ('370', '97', '73', '70', '2014-09-20 13:08:47', '脚后跟也');
INSERT INTO `sdan_chat` VALUES ('371', '97', '73', '73', '2014-09-20 13:08:59', '风格换');
INSERT INTO `sdan_chat` VALUES ('372', '97', '73', '70', '2014-09-20 13:09:53', '结婚高峰');
INSERT INTO `sdan_chat` VALUES ('373', '97', '70', '73', '2014-09-20 13:10:04', '官方');
INSERT INTO `sdan_chat` VALUES ('374', '97', '73', '70', '2014-09-20 13:11:19', '阿萨德的');
INSERT INTO `sdan_chat` VALUES ('375', '97', '70', '73', '2014-09-20 13:11:29', '可恢复');
INSERT INTO `sdan_chat` VALUES ('376', '97', '73', '70', '2014-09-20 13:14:58', '宝宝吧');
INSERT INTO `sdan_chat` VALUES ('377', '97', '73', '70', '2014-09-20 13:15:42', '常常吃');
INSERT INTO `sdan_chat` VALUES ('378', '97', '73', '70', '2014-09-20 13:16:34', '的地方');
INSERT INTO `sdan_chat` VALUES ('379', '97', '70', '73', '2014-09-20 13:16:44', '减肥的');
INSERT INTO `sdan_chat` VALUES ('380', '97', '70', '73', '2014-09-20 13:16:47', '容易');
INSERT INTO `sdan_chat` VALUES ('381', '101', '70', '73', '2014-09-20 13:17:09', 'v 健康');
INSERT INTO `sdan_chat` VALUES ('382', '101', '73', '70', '2014-09-20 13:17:25', 'v 不能新的');
INSERT INTO `sdan_chat` VALUES ('383', '101', '73', '70', '2014-09-20 13:17:37', '为二人');
INSERT INTO `sdan_chat` VALUES ('384', '101', '73', '70', '2014-09-20 13:18:35', '将结果');
INSERT INTO `sdan_chat` VALUES ('385', '101', '73', '70', '2014-09-20 13:20:22', '破译');
INSERT INTO `sdan_chat` VALUES ('386', '101', '73', '70', '2014-09-20 13:23:55', '国际');
INSERT INTO `sdan_chat` VALUES ('387', '97', '73', '70', '2014-09-20 13:24:23', '很坎坷');
INSERT INTO `sdan_chat` VALUES ('388', '97', '70', '73', '2014-09-20 13:24:36', '回复的');
INSERT INTO `sdan_chat` VALUES ('389', '97', '73', '70', '2014-09-20 13:24:43', '法规和');
INSERT INTO `sdan_chat` VALUES ('390', '101', '73', '70', '2014-09-20 13:25:02', '感觉吗');
INSERT INTO `sdan_chat` VALUES ('391', '101', '70', '73', '2014-09-20 13:25:13', '想回家');
INSERT INTO `sdan_chat` VALUES ('392', '101', '73', '70', '2014-09-20 13:25:36', '具有');
INSERT INTO `sdan_chat` VALUES ('393', '100', '81', '78', '2014-09-20 16:46:27', '我也能做');
INSERT INTO `sdan_chat` VALUES ('394', '102', '85', '81', '2014-09-21 13:40:11', '请问请问请问');
INSERT INTO `sdan_chat` VALUES ('395', '98', '86', '73', '2014-09-21 17:20:32', '');
INSERT INTO `sdan_chat` VALUES ('396', '102', '73', '81', '2014-09-22 09:45:09', '你好');
INSERT INTO `sdan_chat` VALUES ('397', '102', '73', '81', '2014-09-22 12:55:34', '你好');
INSERT INTO `sdan_chat` VALUES ('398', '101', '70', '73', '2014-09-23 16:36:40', '嗯');
INSERT INTO `sdan_chat` VALUES ('399', '101', '73', '70', '2014-09-25 17:31:47', '呢');
INSERT INTO `sdan_chat` VALUES ('400', '101', '73', '70', '2014-09-25 17:32:06', 'nh');
INSERT INTO `sdan_chat` VALUES ('401', '101', '70', '73', '2014-09-29 10:20:29', '试试');
INSERT INTO `sdan_chat` VALUES ('402', '106', '73', '70', '2014-09-29 20:03:40', '我做吧');
INSERT INTO `sdan_chat` VALUES ('403', '106', '70', '73', '2014-09-29 20:04:16', '利率多少');
INSERT INTO `sdan_chat` VALUES ('404', '106', '73', '70', '2014-09-29 20:11:00', '11左右');
INSERT INTO `sdan_chat` VALUES ('405', '108', '70', '73', '2014-09-30 09:32:06', '我能做');
INSERT INTO `sdan_chat` VALUES ('406', '108', '73', '70', '2014-09-30 09:33:28', '几个点？');
INSERT INTO `sdan_chat` VALUES ('407', '108', '70', '73', '2014-09-30 09:34:03', '电话说吧');
INSERT INTO `sdan_chat` VALUES ('408', '108', '70', '73', '2014-09-30 09:40:49', '恩');
INSERT INTO `sdan_chat` VALUES ('409', '109', '73', '70', '2014-09-30 09:52:51', '你好啊');
INSERT INTO `sdan_chat` VALUES ('410', '109', '70', '73', '2014-09-30 09:53:45', '能做？');
INSERT INTO `sdan_chat` VALUES ('411', '109', '70', '73', '2014-09-30 09:53:45', '');
INSERT INTO `sdan_chat` VALUES ('412', '109', '70', '73', '2014-09-30 09:54:21', '多少');
INSERT INTO `sdan_chat` VALUES ('413', '110', '73', '71', '2014-10-15 23:15:44', '银行有要求么？');
INSERT INTO `sdan_chat` VALUES ('414', '112', '81', '73', '2014-10-16 21:04:27', '北京银行公积金贷款');
INSERT INTO `sdan_chat` VALUES ('415', '112', '70', '73', '2014-10-16 21:18:54', '聊聊');
INSERT INTO `sdan_chat` VALUES ('416', '110', '85', '71', '2014-10-16 23:57:47', '复活节过');
INSERT INTO `sdan_chat` VALUES ('417', '110', '70', '71', '2014-10-17 07:54:32', '资质怎样');
INSERT INTO `sdan_chat` VALUES ('418', '111', '70', '73', '2014-10-17 08:35:22', '你好');
INSERT INTO `sdan_chat` VALUES ('419', '111', '81', '73', '2014-10-17 08:42:21', '什么资质？');
INSERT INTO `sdan_chat` VALUES ('420', '111', '123', '73', '2014-10-17 15:41:08', '');
INSERT INTO `sdan_chat` VALUES ('421', '112', '73', '81', '2014-10-21 00:40:17', 'test');
INSERT INTO `sdan_chat` VALUES ('422', '113', '81', '73', '2014-10-22 14:41:56', '');
INSERT INTO `sdan_chat` VALUES ('423', '113', '126', '73', '2014-10-23 16:49:51', '哎呀');
INSERT INTO `sdan_chat` VALUES ('424', '114', '73', '70', '2014-10-23 22:12:08', '我能做');
INSERT INTO `sdan_chat` VALUES ('425', '113', '73', '81', '2014-10-23 22:18:37', '聊聊');
INSERT INTO `sdan_chat` VALUES ('426', '103', '73', '70', '2014-10-23 22:41:26', '看看');
INSERT INTO `sdan_chat` VALUES ('427', '105', '87', '70', '2014-10-24 10:14:31', '');
INSERT INTO `sdan_chat` VALUES ('428', '104', '87', '81', '2014-10-24 10:15:23', '');
INSERT INTO `sdan_chat` VALUES ('429', '98', '87', '73', '2014-10-24 10:16:40', '');
INSERT INTO `sdan_chat` VALUES ('430', '95', '87', '73', '2014-10-24 10:17:30', '2');
INSERT INTO `sdan_chat` VALUES ('431', '115', '70', '73', '2014-10-24 18:24:23', '接单');
INSERT INTO `sdan_chat` VALUES ('432', '116', '86', '70', '2014-10-24 23:16:19', '客户要做几抵');
INSERT INTO `sdan_chat` VALUES ('433', '116', '73', '70', '2014-10-25 10:29:33', '我能做不');
INSERT INTO `sdan_chat` VALUES ('434', '116', '70', '73', '2014-10-25 10:31:31', ' 聊聊啊');
INSERT INTO `sdan_chat` VALUES ('435', '116', '118', '70', '2014-10-25 10:35:49', '测试');
INSERT INTO `sdan_chat` VALUES ('436', '107', '118', '73', '2014-10-25 10:38:23', '接单');
INSERT INTO `sdan_chat` VALUES ('437', '107', '118', '73', '2014-10-25 10:41:09', '我发了一个');
INSERT INTO `sdan_chat` VALUES ('438', '107', '73', '118', '2014-10-25 10:42:00', '嗯？');
INSERT INTO `sdan_chat` VALUES ('439', '110', '118', '71', '2014-10-25 10:46:04', '韩国国会');
INSERT INTO `sdan_chat` VALUES ('440', '107', '118', '73', '2014-10-25 10:46:53', '收到');
INSERT INTO `sdan_chat` VALUES ('441', '107', '73', '118', '2014-10-25 10:48:02', '你在哪？');
INSERT INTO `sdan_chat` VALUES ('442', '107', '118', '73', '2014-10-25 10:48:17', '可以');
INSERT INTO `sdan_chat` VALUES ('443', '107', '73', '118', '2014-10-25 10:49:05', '能收到消息么');
INSERT INTO `sdan_chat` VALUES ('444', '107', '118', '73', '2014-10-25 10:49:56', '可以收到');
INSERT INTO `sdan_chat` VALUES ('445', '116', '73', '70', '2014-10-25 10:53:49', '嗯');
INSERT INTO `sdan_chat` VALUES ('446', '116', '70', '73', '2014-10-25 10:54:27', '你在哪');
INSERT INTO `sdan_chat` VALUES ('447', '116', '73', '70', '2014-10-25 10:55:03', '中关村');
INSERT INTO `sdan_chat` VALUES ('448', '116', '70', '73', '2014-10-25 10:55:29', '好的');
INSERT INTO `sdan_chat` VALUES ('449', '107', '70', '73', '2014-10-25 10:56:30', '你好');
INSERT INTO `sdan_chat` VALUES ('450', '107', '73', '70', '2014-10-25 10:56:59', '嗯');
INSERT INTO `sdan_chat` VALUES ('451', '107', '70', '73', '2014-10-25 10:57:20', '在哪');
INSERT INTO `sdan_chat` VALUES ('452', '107', '73', '70', '2014-10-25 10:59:07', '中关村');
INSERT INTO `sdan_chat` VALUES ('453', '107', '70', '73', '2014-10-25 11:00:18', '嗯嗯');
INSERT INTO `sdan_chat` VALUES ('454', '116', '73', '70', '2014-10-25 11:00:51', '1');
INSERT INTO `sdan_chat` VALUES ('455', '116', '70', '73', '2014-10-25 11:01:24', '？');
INSERT INTO `sdan_chat` VALUES ('456', '110', '127', '71', '2014-10-25 11:33:05', '把车');
INSERT INTO `sdan_chat` VALUES ('457', '117', '73', '127', '2014-10-26 12:10:00', '你好');
INSERT INTO `sdan_chat` VALUES ('458', '117', '70', '127', '2014-10-26 12:19:07', '我能做');
INSERT INTO `sdan_chat` VALUES ('459', '107', '127', '73', '2014-10-26 17:57:21', '');
INSERT INTO `sdan_chat` VALUES ('460', '116', '73', '70', '2014-10-27 09:51:13', '电话吧');
INSERT INTO `sdan_chat` VALUES ('461', '116', '70', '73', '2014-10-27 09:51:46', '好的');
INSERT INTO `sdan_chat` VALUES ('462', '116', '70', '73', '2014-10-27 09:54:12', '你关注我，否则看不到电话');
INSERT INTO `sdan_chat` VALUES ('463', '116', '73', '70', '2014-10-27 09:54:49', '关注了');
INSERT INTO `sdan_chat` VALUES ('464', '116', '73', '70', '2014-10-27 09:55:01', '关注了');
INSERT INTO `sdan_chat` VALUES ('465', '118', '70', '73', '2014-10-27 10:13:37', '接个单可以吗');
INSERT INTO `sdan_chat` VALUES ('466', '118', '73', '70', '2014-10-27 10:16:53', '能做？');
INSERT INTO `sdan_chat` VALUES ('467', '118', '73', '70', '2014-10-27 10:18:14', '你在哪现在');
INSERT INTO `sdan_chat` VALUES ('468', '118', '73', '70', '2014-10-27 10:20:34', '嗯');
INSERT INTO `sdan_chat` VALUES ('469', '118', '70', '73', '2014-10-27 10:22:49', '试试');
INSERT INTO `sdan_chat` VALUES ('470', '118', '147', '73', '2014-10-28 13:55:20', '房产市值多少？   我们最低起贷时间为30天，之后可以按天计息。');
INSERT INTO `sdan_chat` VALUES ('471', '118', '127', '73', '2014-10-29 00:58:50', '我来可以做出来');
INSERT INTO `sdan_chat` VALUES ('472', '118', '127', '73', '2014-10-29 01:00:57', '在么');
INSERT INTO `sdan_chat` VALUES ('473', '118', '127', '73', '2014-10-29 01:02:24', '这是什么事宜呢');
INSERT INTO `sdan_chat` VALUES ('474', '118', '127', '73', '2014-10-29 01:03:32', '这个是测试');
INSERT INTO `sdan_chat` VALUES ('475', '116', '126', '70', '2014-10-29 23:47:10', '有');

-- ----------------------------
-- Table structure for `sdan_chat_user`
-- ----------------------------
DROP TABLE IF EXISTS `sdan_chat_user`;
CREATE TABLE `sdan_chat_user` (
  `id` int(11) NOT NULL auto_increment,
  `sdanid` varchar(255) collate gbk_bin default NULL,
  `seid` varchar(255) collate gbk_bin default NULL,
  `reid` varchar(255) collate gbk_bin default NULL,
  `regtime` datetime default NULL,
  `lastcontent` varchar(3000) collate gbk_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of sdan_chat_user
-- ----------------------------
INSERT INTO `sdan_chat_user` VALUES ('68', '94', '', '73', '2014-09-17 11:47:03', '有其他费用没？');
INSERT INTO `sdan_chat_user` VALUES ('69', '95', '', '70', '2014-09-18 14:57:22', '哦哦');
INSERT INTO `sdan_chat_user` VALUES ('70', '95', null, '73', '2014-09-18 14:57:22', '哦哦');
INSERT INTO `sdan_chat_user` VALUES ('71', '96', '', '70', '2014-09-18 10:45:15', '你好');
INSERT INTO `sdan_chat_user` VALUES ('72', '95', '', '77', '2014-09-18 14:57:22', '哦哦');
INSERT INTO `sdan_chat_user` VALUES ('73', '99', '', '73', '2014-09-18 16:56:39', '底点多少');
INSERT INTO `sdan_chat_user` VALUES ('74', '99', null, '77', '2014-09-18 16:56:39', '底点多少');
INSERT INTO `sdan_chat_user` VALUES ('75', '95', '', '78', '2014-09-19 10:30:49', '底点2.2');
INSERT INTO `sdan_chat_user` VALUES ('76', '98', '', '78', '2014-09-20 10:43:29', '你好');
INSERT INTO `sdan_chat_user` VALUES ('77', '97', '', '78', '2014-09-20 13:24:43', '法规和');
INSERT INTO `sdan_chat_user` VALUES ('78', '96', '', '78', '2014-09-19 10:32:06', '55天？');
INSERT INTO `sdan_chat_user` VALUES ('79', '100', '', '73', '2014-09-19 10:55:41', '好，电话吧');
INSERT INTO `sdan_chat_user` VALUES ('80', '100', null, '78', '2014-09-19 10:55:41', '好，电话吧');
INSERT INTO `sdan_chat_user` VALUES ('81', '101', '', '78', '2014-09-29 10:20:29', '试试');
INSERT INTO `sdan_chat_user` VALUES ('82', '101', '', '73', '2014-09-29 10:20:29', '试试');
INSERT INTO `sdan_chat_user` VALUES ('83', '97', '', '70', '2014-09-20 13:24:43', '法规和');
INSERT INTO `sdan_chat_user` VALUES ('84', '101', null, '70', '2014-09-29 10:20:29', '试试');
INSERT INTO `sdan_chat_user` VALUES ('85', '98', '', '76', '2014-09-20 10:43:29', '你好');
INSERT INTO `sdan_chat_user` VALUES ('86', '97', null, '73', '2014-09-20 13:24:43', '法规和');
INSERT INTO `sdan_chat_user` VALUES ('87', '98', null, '73', '2014-09-20 10:43:29', '你好');
INSERT INTO `sdan_chat_user` VALUES ('88', '100', '', '81', '2014-09-20 16:46:27', '我也能做');
INSERT INTO `sdan_chat_user` VALUES ('89', '102', '', '85', '2014-09-21 13:40:11', '请问请问请问');
INSERT INTO `sdan_chat_user` VALUES ('90', '98', '', '86', '2014-09-21 17:20:32', '');
INSERT INTO `sdan_chat_user` VALUES ('91', '102', '', '73', '2014-09-22 09:45:09', '你好');
INSERT INTO `sdan_chat_user` VALUES ('92', '102', null, '81', '2014-09-22 12:55:34', '你好');
INSERT INTO `sdan_chat_user` VALUES ('93', '106', '', '73', '2014-09-29 20:04:16', '利率多少');
INSERT INTO `sdan_chat_user` VALUES ('94', '106', null, '70', '2014-09-29 20:11:00', '11左右');
INSERT INTO `sdan_chat_user` VALUES ('95', '108', '', '70', '2014-09-30 09:40:49', '恩');
INSERT INTO `sdan_chat_user` VALUES ('96', '108', null, '73', '2014-09-30 09:40:49', '恩');
INSERT INTO `sdan_chat_user` VALUES ('97', '109', '', '73', '2014-09-30 09:54:21', '多少');
INSERT INTO `sdan_chat_user` VALUES ('98', '110', '', '73', '2014-10-15 23:15:44', '银行有要求么？');
INSERT INTO `sdan_chat_user` VALUES ('99', '112', '', '81', '2014-10-21 00:40:17', 'test');
INSERT INTO `sdan_chat_user` VALUES ('100', '112', '', '70', '2014-10-21 00:40:17', 'test');
INSERT INTO `sdan_chat_user` VALUES ('101', '110', '', '85', '2014-10-16 23:57:47', '复活节过');
INSERT INTO `sdan_chat_user` VALUES ('102', '110', '', '70', '2014-10-17 07:54:32', '资质怎样');
INSERT INTO `sdan_chat_user` VALUES ('103', '111', '', '70', '2014-10-17 08:35:22', '你好');
INSERT INTO `sdan_chat_user` VALUES ('104', '111', '', '81', '2014-10-17 08:42:21', '什么资质？');
INSERT INTO `sdan_chat_user` VALUES ('105', '111', '', '123', '2014-10-17 15:41:08', '');
INSERT INTO `sdan_chat_user` VALUES ('106', '113', '', '81', '2014-10-23 22:18:37', '聊聊');
INSERT INTO `sdan_chat_user` VALUES ('107', '113', '', '126', '2014-10-23 22:18:37', '聊聊');
INSERT INTO `sdan_chat_user` VALUES ('108', '114', '', '73', '2014-10-23 22:12:08', '我能做');
INSERT INTO `sdan_chat_user` VALUES ('109', '103', '', '73', '2014-10-23 22:41:26', '看看');
INSERT INTO `sdan_chat_user` VALUES ('110', '105', '', '87', '2014-10-24 10:14:31', '');
INSERT INTO `sdan_chat_user` VALUES ('111', '104', '', '87', '2014-10-24 10:15:23', '');
INSERT INTO `sdan_chat_user` VALUES ('112', '98', '', '87', '2014-10-24 10:16:40', '');
INSERT INTO `sdan_chat_user` VALUES ('113', '95', '', '87', '2014-10-24 10:17:30', '2');
INSERT INTO `sdan_chat_user` VALUES ('114', '115', '', '70', '2014-10-24 18:24:23', '接单');
INSERT INTO `sdan_chat_user` VALUES ('115', '116', '', '86', '2014-10-27 09:55:01', '关注了');
INSERT INTO `sdan_chat_user` VALUES ('116', '116', '', '73', '2014-10-27 09:55:01', '关注了');
INSERT INTO `sdan_chat_user` VALUES ('117', '116', '', '118', '2014-10-27 09:55:01', '关注了');
INSERT INTO `sdan_chat_user` VALUES ('118', '107', '', '118', '2014-10-25 11:00:18', '嗯嗯');
INSERT INTO `sdan_chat_user` VALUES ('119', '107', null, '73', '2014-10-25 11:00:18', '嗯嗯');
INSERT INTO `sdan_chat_user` VALUES ('120', '110', '', '118', '2014-10-25 10:46:04', '韩国国会');
INSERT INTO `sdan_chat_user` VALUES ('121', '116', null, '70', '2014-10-27 09:55:01', '关注了');
INSERT INTO `sdan_chat_user` VALUES ('122', '107', '', '70', '2014-10-25 11:00:18', '嗯嗯');
INSERT INTO `sdan_chat_user` VALUES ('123', '110', '', '127', '2014-10-25 11:33:05', '把车');
INSERT INTO `sdan_chat_user` VALUES ('124', '117', '', '73', '2014-10-26 12:10:00', '你好');
INSERT INTO `sdan_chat_user` VALUES ('125', '117', '', '70', '2014-10-26 12:19:07', '我能做');
INSERT INTO `sdan_chat_user` VALUES ('126', '107', '', '127', '2014-10-26 17:57:21', '');
INSERT INTO `sdan_chat_user` VALUES ('127', '118', '', '70', '2014-10-29 01:03:32', '这个是测试');
INSERT INTO `sdan_chat_user` VALUES ('128', '118', null, '73', '2014-10-29 01:03:32', '这个是测试');
INSERT INTO `sdan_chat_user` VALUES ('129', '118', '', '147', '2014-10-29 01:03:32', '这个是测试');
INSERT INTO `sdan_chat_user` VALUES ('130', '118', '', '127', '2014-10-29 01:03:32', '这个是测试');
INSERT INTO `sdan_chat_user` VALUES ('131', '116', '', '126', '2014-10-29 23:47:10', '有');

-- ----------------------------
-- Table structure for `sdan_message`
-- ----------------------------
DROP TABLE IF EXISTS `sdan_message`;
CREATE TABLE `sdan_message` (
  `id` int(11) NOT NULL auto_increment,
  `sdanid` varchar(255) collate gbk_bin default NULL COMMENT '发起人姓名',
  `uid` varchar(255) collate gbk_bin default NULL COMMENT '电话',
  `regtime` datetime default NULL COMMENT '时间',
  `message` varchar(12000) collate gbk_bin default NULL COMMENT '接单者列表',
  `u_name` varchar(255) collate gbk_bin default NULL COMMENT '电话',
  `kpno` varchar(255) collate gbk_bin default NULL COMMENT '电话',
  `avatar` varchar(255) collate gbk_bin default NULL COMMENT '电话',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of sdan_message
-- ----------------------------
INSERT INTO `sdan_message` VALUES ('131', '94', '73', '2014-09-17 11:45:50', '我能做，给你一个点底点，高出全返，40天没问题', '高峰', '60', '');
INSERT INTO `sdan_message` VALUES ('132', '95', '70', '2014-09-17 12:15:12', '底点2', '高天宇', '75', '140917110922.jpg');
INSERT INTO `sdan_message` VALUES ('133', '96', '70', '2014-09-18 10:45:15', '你好', '天宇', '77', '140918101913.jpg');
INSERT INTO `sdan_message` VALUES ('134', '95', '77', '2014-09-18 14:31:09', '我能做', '任梦涵', '62', '140918094818.jpg');
INSERT INTO `sdan_message` VALUES ('135', '99', '73', '2014-09-18 15:55:18', '我能做', '高峰', '66', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('136', '95', '78', '2014-09-19 10:30:49', '底点2.2', '彭骏', '61', '140918100805.jpg');
INSERT INTO `sdan_message` VALUES ('137', '98', '78', '2014-09-19 10:31:22', '这个我能接', '彭骏', '61', '140918100805.jpg');
INSERT INTO `sdan_message` VALUES ('138', '97', '78', '2014-09-19 10:31:44', '你好', '彭骏', '61', '140918100805.jpg');
INSERT INTO `sdan_message` VALUES ('139', '96', '78', '2014-09-19 10:32:06', '55天？', '彭骏', '61', '140918100805.jpg');
INSERT INTO `sdan_message` VALUES ('140', '100', '73', '2014-09-19 10:52:47', '我能做', '高峰', '67', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('141', '101', '78', '2014-09-19 11:06:48', '要不要走银行？', '彭骏', '61', '140918100805.jpg');
INSERT INTO `sdan_message` VALUES ('142', '101', '73', '2014-09-19 15:48:21', '我能接不？哥们', '高峰', '67', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('143', '97', '70', '2014-09-20 10:22:59', '你好', '天宇', '77', '140918172151.jpg');
INSERT INTO `sdan_message` VALUES ('144', '98', '76', '2014-09-20 10:42:32', '你好，我能做', '王凯', '62', '140918093921.jpg');
INSERT INTO `sdan_message` VALUES ('145', '100', '81', '2014-09-20 16:46:27', '我也能做', '游龙刚', '62', '140918105705.jpg');
INSERT INTO `sdan_message` VALUES ('146', '102', '85', '2014-09-21 13:40:11', '请问请问请问', '', '60', '');
INSERT INTO `sdan_message` VALUES ('147', '98', '86', '2014-09-21 17:20:32', '', '郑颖兰', '60', '');
INSERT INTO `sdan_message` VALUES ('148', '102', '73', '2014-09-22 09:45:09', '你好', '高峰', '68', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('149', '106', '73', '2014-09-29 20:03:40', '我做吧', '高峰', '68', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('150', '108', '70', '2014-09-30 09:32:06', '我能做', '天宇', '94', '140918172151.jpg');
INSERT INTO `sdan_message` VALUES ('151', '109', '73', '2014-09-30 09:52:51', '你好啊', '高峰', '68', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('152', '110', '73', '2014-10-15 23:15:44', '银行有要求么？', '高峰', '78', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('153', '112', '81', '2014-10-16 21:04:27', '北京银行公积金贷款', '游龙刚', '64', '140918105705.jpg');
INSERT INTO `sdan_message` VALUES ('154', '112', '70', '2014-10-16 21:18:54', '聊聊', '天宇', '84', '140918172151.jpg');
INSERT INTO `sdan_message` VALUES ('155', '110', '85', '2014-10-16 23:57:47', '复活节过', '', '60', '');
INSERT INTO `sdan_message` VALUES ('156', '110', '70', '2014-10-17 07:54:32', '资质怎样', '天宇', '84', '140918172151.jpg');
INSERT INTO `sdan_message` VALUES ('157', '111', '70', '2014-10-17 08:35:22', '你好', '天宇', '84', '140918172151.jpg');
INSERT INTO `sdan_message` VALUES ('158', '111', '81', '2014-10-17 08:42:21', '什么资质？', '游龙刚', '64', '140918105705.jpg');
INSERT INTO `sdan_message` VALUES ('159', '111', '123', '2014-10-17 15:41:08', '', '杨', '60', '');
INSERT INTO `sdan_message` VALUES ('160', '113', '81', '2014-10-22 14:41:56', '', '游龙刚', '74', '140918105705.jpg');
INSERT INTO `sdan_message` VALUES ('161', '113', '126', '2014-10-23 16:49:51', '哎呀', '陈振忠', '75', '141020012818.jpg');
INSERT INTO `sdan_message` VALUES ('162', '114', '73', '2014-10-23 22:12:08', '我能做', '高峰', '85', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('163', '103', '73', '2014-10-23 22:41:26', '看看', '高峰', '95', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('164', '105', '87', '2014-10-24 10:14:31', '', '王清和', '68', '140921180546.jpg');
INSERT INTO `sdan_message` VALUES ('165', '104', '87', '2014-10-24 10:15:23', '', '王清和', '68', '140921180546.jpg');
INSERT INTO `sdan_message` VALUES ('166', '98', '87', '2014-10-24 10:16:40', '', '王清和', '68', '140921180546.jpg');
INSERT INTO `sdan_message` VALUES ('167', '95', '87', '2014-10-24 10:17:30', '2', '王清和', '68', '140921180546.jpg');
INSERT INTO `sdan_message` VALUES ('168', '115', '70', '2014-10-24 18:24:23', '接单', '天宇', '139', '140918172151.jpg');
INSERT INTO `sdan_message` VALUES ('169', '116', '86', '2014-10-24 23:16:19', '客户要做几抵', '郑颖兰', '74', '140921172741.jpg');
INSERT INTO `sdan_message` VALUES ('170', '116', '73', '2014-10-25 10:29:33', '我能做不', '高峰', '100', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('171', '116', '118', '2014-10-25 10:35:49', '测试', '王老五', '60', '');
INSERT INTO `sdan_message` VALUES ('172', '107', '118', '2014-10-25 10:38:23', '接单', '王老五', '60', '');
INSERT INTO `sdan_message` VALUES ('173', '110', '118', '2014-10-25 10:46:04', '韩国国会', '王老五', '60', '');
INSERT INTO `sdan_message` VALUES ('174', '107', '70', '2014-10-25 10:56:30', '你好', '天宇', '134', '140918172151.jpg');
INSERT INTO `sdan_message` VALUES ('175', '110', '127', '2014-10-25 11:33:05', '把车', '王芳', '60', '');
INSERT INTO `sdan_message` VALUES ('176', '117', '73', '2014-10-26 12:10:00', '你好', '高峰', '100', '140918104046.jpg');
INSERT INTO `sdan_message` VALUES ('177', '117', '70', '2014-10-26 12:19:07', '我能做', '天宇', '134', '140918172151.jpg');
INSERT INTO `sdan_message` VALUES ('178', '107', '127', '2014-10-26 17:57:21', '', '王芳', '65', '141025134143.jpg');
INSERT INTO `sdan_message` VALUES ('179', '118', '70', '2014-10-27 10:13:37', '接个单可以吗', '天宇', '139', '140918172151.jpg');
INSERT INTO `sdan_message` VALUES ('180', '118', '147', '2014-10-28 13:55:20', '房产市值多少？   我们最低起贷时间为30天，之后可以按天计息。', '叶龙海', '60', '');
INSERT INTO `sdan_message` VALUES ('181', '118', '127', '2014-10-29 00:58:50', '我来可以做出来', '王芳', '66', '141025134143.jpg');
INSERT INTO `sdan_message` VALUES ('182', '116', '126', '2014-10-29 23:47:10', '有', '陈振忠', '75', '141020012818.jpg');

-- ----------------------------
-- Table structure for `suggest`
-- ----------------------------
DROP TABLE IF EXISTS `suggest`;
CREATE TABLE `suggest` (
  `id` int(11) NOT NULL auto_increment,
  `txt` varchar(255) collate gbk_bin default NULL,
  `regtime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of suggest
-- ----------------------------

-- ----------------------------
-- Table structure for `tousu`
-- ----------------------------
DROP TABLE IF EXISTS `tousu`;
CREATE TABLE `tousu` (
  `id` int(11) NOT NULL auto_increment,
  `seid` varchar(255) collate gbk_bin default NULL,
  `reid` varchar(255) collate gbk_bin default NULL,
  `regtime` datetime default NULL,
  `content` varchar(2000) collate gbk_bin default NULL,
  `type` varchar(1) collate gbk_bin default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of tousu
-- ----------------------------
INSERT INTO `tousu` VALUES ('18', '73', '70', '2014-09-17 11:49:55', '靠谱', '1');
INSERT INTO `tousu` VALUES ('19', '77', '70', '2014-09-29 19:21:02', '举报此人', '1');
INSERT INTO `tousu` VALUES ('20', '73', '77', '2014-10-15 13:06:12', '举报此人', '1');
INSERT INTO `tousu` VALUES ('21', '71', '73', '2014-10-15 22:51:50', '举报此人', '1');
INSERT INTO `tousu` VALUES ('22', '73', '70', '2014-10-21 01:05:48', '举报此人', '1');
INSERT INTO `tousu` VALUES ('23', '73', '127', '2014-10-26 12:09:43', '举报此人', '1');
INSERT INTO `tousu` VALUES ('24', '127', '', '2014-10-28 23:31:36', '你好', '2');
INSERT INTO `tousu` VALUES ('25', '127', '', '2014-10-28 23:35:02', '啊啊不', '2');
INSERT INTO `tousu` VALUES ('26', '127', '73', '2014-10-28 23:39:08', '\'\'呵呵好吧', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `u_name` varchar(255) collate gbk_bin default NULL,
  `u_pwd` varchar(255) collate gbk_bin default NULL,
  `regtime` datetime default NULL,
  `phone` varchar(255) collate gbk_bin default NULL,
  `company` varchar(255) collate gbk_bin default NULL,
  `kpno` int(11) default NULL,
  `address` varchar(255) collate gbk_bin default NULL,
  `sex` varchar(255) collate gbk_bin default NULL,
  `old` varchar(255) collate gbk_bin default NULL,
  `area` varchar(255) collate gbk_bin default NULL,
  `keyword` varchar(255) collate gbk_bin default NULL,
  `industy` varchar(255) collate gbk_bin default NULL,
  `business` varchar(255) collate gbk_bin default NULL,
  `dan_count` varchar(255) collate gbk_bin default NULL,
  `year` varchar(255) collate gbk_bin default NULL,
  `cont` varchar(255) collate gbk_bin default NULL,
  `lnglat` varchar(255) collate gbk_bin default NULL,
  `followcount` varchar(255) collate gbk_bin default NULL,
  `followmecount` varchar(255) collate gbk_bin default NULL,
  `followbothcount` varchar(255) collate gbk_bin default NULL,
  `follow_list` varchar(255) collate gbk_bin default NULL,
  `avatar` varchar(255) collate gbk_bin default NULL,
  `logtime` datetime default NULL,
  `lng` varchar(255) collate gbk_bin default NULL,
  `lat` varchar(255) collate gbk_bin default NULL,
  `alert` varchar(1) collate gbk_bin default '1',
  `locat` varchar(1) collate gbk_bin default '1',
  `alert2` varchar(1) collate gbk_bin default '1',
  `tmp` varchar(20000) character set gbk default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('70', '天宇', 'qqqqqq', '2014-10-23 22:09:12', '13466754325', '独立投资', '139', '北京海淀区万柳中路6号', '1', '32', '北京 海淀', '闲散资金投资，直户资源', '其他', '银行信用贷款  ', '0', '1', '闲散资金投资，直户资源', null, '6', '5', '3', '|13370176399|18610668688|13553133089|13366663351|18908007122|13671302770', '140918172151.jpg', '2014-11-01 06:35:18', '116.3457188504498', '39.84135099209824', '1', '1', '1', null);
INSERT INTO `user` VALUES ('71', '宏杰', 'pppppp', '2014-10-29 16:50:50', '18610668688', '中国银行', '107', '西城区复兴门内大街一号', '1', '31', '北京 西城', '信用类资金业务', '银行', '银行信用贷款  信用卡  ', '0', '6', '总行六年从业经验', null, '5', '6', '3', '|13466754325|13671302770|18610668688|13370176399|13553133089', '141008102251.jpg', '2014-10-30 08:00:41', '116.3457341025943', '39.84133953120774', '1', '1', '1', null);
INSERT INTO `user` VALUES ('73', '高峰', 'pppppp', '2014-09-17 11:32:20', '18610079117', '聚信', '98', '海淀区西大街2号', '1', '26', '北京 朝阳', '文创企业信用贷年化11%，月息还本，底点3，高出全返', '担保', '银行信用贷款 ', '0', '5', '文创类企业成立两年以上有可能走流水贷最高200万，还款方式月息还本，年化利息11%，底点3，兄弟姐妹们快关注我甩单吧', null, '3', '2', '-3', '|13553133089|18610079117|18601007910', '141027141445.jpg', '2014-11-01 21:47:19', '116.3038', '39.97792', '1', '1', '1', null);
INSERT INTO `user` VALUES ('75', '龚若楠', '447665', '2014-09-17 14:52:39', '18311447665', '中天质押', '61', '朝阳区安定路33号', '0', '23', '北京 朝阳', '质押2%高出全返，垫资10天1', '担保', '银行抵押贷款 银行信用贷款 房产质押 ', '0', '1', '质押全2.5返0.5，分2.5，5000万以下、8成当天放款。垫资多家银行直接合作，效率灵活10天1！银行抵押，公司基础业务，让利大家，消费贷无上限，服务费可返50%！', null, '0', '0', '0', '', '140918092135.jpg', null, '', '', '1', '1', '1', null);
INSERT INTO `user` VALUES ('76', '王凯', '179005', '2014-09-17 14:52:39', '18811179005', '中荣华业', '67', '丰台东方庄六号', '1', '23', '北京 丰台', '豪车质押，2小时放款，押车月月返，不含糊', '担保', '车辆质押 ', '0', '2', '京牌押车押手续2                                       京牌车只押手续3                                      公司名下车                                                外地车                                                      主做豪车 ，放评估值的70％～130％        节假日正常放款', null, '0', '1', '0', '', '140918093921.jpg', null, '', '', '1', '1', '1', null);
INSERT INTO `user` VALUES ('77', '任梦涵', '176399', '2014-09-17 14:52:39', '13370176399', '中泽', '86', '丰台镇国寺北街恋日嘉园底商', '0', '23', '北京 丰台', '质押月月10%提成加月月返点', '担保', '房产质押 ', '1', '1', '公司资金丰厚着急放款主做质押。现在同行合作月月10%提成加月月返点，可直接挂兼职。', null, '0', '5', '0', '', '140918094818.jpg', '2014-09-29 19:19:23', '120.451', '37.65967', '1', '1', '1', null);
INSERT INTO `user` VALUES ('78', '彭骏', '272188', '2014-09-17 14:52:39', '13701272188', '宝瑞通典当行', '66', '阜成门外大街6号', '1', '25', '北京 西城', '房车质押返点够给力', '其他', '房产质押 车辆质押 ', '0', '3', '公司主做大额房产质押（个人、公司名下 :普住 商业 土地 厂房 平房 四合院），全2.5分3。可接转单，市值7成放款，底点也可一次性返收入15%，加点最高4，高出月月返', null, '0', '1', '0', '', '140918100805.jpg', '2014-09-29 19:17:59', '120.451', '37.65971', '1', '1', '1', null);
INSERT INTO `user` VALUES ('79', '阿哲', '129299', '2014-09-17 14:52:39', '18310129299', '厚泽担保', '60', '朝阳区通联大厦一层', '1', '26', '北京 朝阳', '房产质押返点给力', '担保', '房产质押 ', '0', '3', '返点给力，月月返', null, '0', '0', '0', '', '140918103025.jpg', '2014-09-29 19:18:53', '120.4511', '37.6596', '1', '1', '1', null);
INSERT INTO `user` VALUES ('81', '游龙刚', '18510510168', '2014-09-18 10:52:05', '18510510168', '华信金融', '74', null, '1', '26', '北京 朝阳区', '银行抵押，银行信用', '担保', '银行抵押贷款  银行信用贷款  ', '0', '2', '银行抵押消费贷\n1.年费用4.56％\n2.最高100万\n3.最长4年\n4.等额本息还款\n\n银行信用贷\n1.最高100万\n2.最长10年\n3.日息万分之5\n4.先息后本', null, '2', '2', '1', '|13671302770|13366663351', '140918105705.jpg', '2014-11-01 18:46:36', '116.31338', '39.990017', '1', '1', '1', null);
INSERT INTO `user` VALUES ('82', '', 'wjnjucaicun', '2014-09-19 05:57:40', '15801248719', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-18 13:46:04', '116.4959', '40.030647', '1', '1', '1', null);
INSERT INTO `user` VALUES ('83', '黄伟涛', 'wo19930202*.jpg', '2014-09-19 14:03:54', '13261422171', '智信朴华', '66', null, '1', '21', '北京 朝阳', '银行抵押贷  信用贷  ', '担保', '银行抵押贷款  银行信用贷款  ', '0', '2', '刚从亚联财小贷公司出来没多久，目前处在学习阶段。', null, '2', '2', '1', '|13370176399|18510510168', '140919171422.jpg', '2014-11-01 01:33:15', '116.30921', '40.010868', '1', '1', '1', null);
INSERT INTO `user` VALUES ('84', '', '123456', '2014-09-19 18:35:47', '13581724762', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, null, '', '', '1', '1', '1', null);
INSERT INTO `user` VALUES ('85', '', 'ddsd ', '2014-10-17 00:04:57', '18908007123', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-01 22:42:29', '', '', '1', '1', '1', null);
INSERT INTO `user` VALUES ('86', '郑颖兰', '198604231314zxy', '2014-09-21 17:16:18', '18210013053', '利信银丰投资管理有限公司', '75', '北京市海淀区信息路1号国际科技创业园1号院2号楼304室', null, null, '北京 海淀', '主做个人，企业无抵押信用贷款', '小贷', '小额贷款  ', '0', '2', null, null, '2', '7', '2', '|18510510168|18001022213', '140921172741.jpg', '2014-10-24 23:19:01', '116.32097', '39.88725', '1', '1', '1', null);
INSERT INTO `user` VALUES ('87', '王清和', '112799', '2014-09-21 17:46:05', '18001022213', '厚泽贷', '68', '朝阳区建国路88号SOHO现代城3号楼1210', '1', '33', '北京 朝阳', '个人企业无抵押贷款', '小贷', '小额贷款  ', '0', '2', null, null, '3', '4', '3', '|18210013053|18510510168|13466754325', '140921180546.jpg', '2014-10-24 10:28:21', '116.483795', '39.91283', '1', '0', '1', null);
INSERT INTO `user` VALUES ('88', '', 'w4a9m5i2', '2014-09-29 14:35:43', '13699236865', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, null, '', '', '1', '1', '1', null);
INSERT INTO `user` VALUES ('89', '范何', 'fml888', '2014-09-29 16:55:34', '18576723230', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-09-29 16:56:04', '120.451', '37.65965', '1', '1', '1', null);
INSERT INTO `user` VALUES ('90', 'aaaa', 'dddddd', '2014-10-03 22:32:35', '139000000', null, '60', null, null, null, null, null, null, null, '0', null, 'bbbbb', null, '0', '0', '0', '', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('111', 'Fff', 'erregg', '2014-10-04 01:22:37', '137000000', null, '60', null, null, null, null, null, null, null, '0', null, 'Dog', null, '0', '0', '0', '', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('112', '你快乐', 'llllll', '2014-10-04 06:47:18', '13466754326', null, '60', null, null, null, null, null, null, null, '0', null, '来看看咯哦么看看集群莫粉末小心翼翼小心翼翼她雨天', null, '0', '0', '0', '', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('113', '刘锋', 'pppppp', '2014-10-04 09:25:13', '18610886555', null, '60', null, null, null, null, null, null, null, '0', null, '高息', null, '0', '0', '0', '', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('114', '大锅饭的', 'aaaa', '2014-10-07 01:16:29', '139000001', null, '60', null, null, null, null, null, null, '发挥好', '0', null, null, null, '0', '0', '0', '', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('115', 'rtyu', 'aaaa', '2014-10-07 01:18:26', '1370000', null, '60', null, null, null, null, null, null, '鹅腿也', '0', null, null, null, '0', '0', '0', '', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('116', '', '\nPassword', '2014-10-09 11:42:56', '18501217365', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, null, '1', '1', '1', '1', '1', null);
INSERT INTO `user` VALUES ('117', '王雁飞', '4113', '2014-10-16 16:17:20', '18910819200', '智信朴华', '60', null, null, null, '北京 朝阳', '垫资2.5', null, null, '0', null, null, null, '0', '0', '0', '', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('118', '王老五', 'gggg', '2014-10-17 00:13:30', '18908007121', '百度%', '60', '北京市中关村', '1', '31-41', '朝阳区', '金融,贷款', '银行业', '设计行业十年经验', '0', '10', '本人高富帅', null, '0', '0', '0', '', null, '2014-10-27 12:02:12', '104.03589', '30.594393', '1', '1', '1', '%2B8613982890522%2C13518255896%2C13648046116%2C13882027263%2C13981811895%2C18881847555%2C7407%2CCQH%2CDENG1LAI%2CFUJINGYIN%2CK6cd%2CLIUYUN%2CMiss%E5%BE%90%2CYUANZONG%2Czjww%2C%E8%94%A1%E5%90%AF%E6%98%8E%2C%E5%B8%B8%E8%B0%A8%2C%E9%99%88%E7%BA%A2%E6%B5%AA%2C%E9%99%88%E8%8C%82%E6%9E%97%2C%E9%99%88%E6%97%AD%E6%98%8C%2C%E5%A4%A7%E5%A7%90%2C%E5%A4%A7%E8%88%85%E5%AE%B6%2C%E5%A4%A7%E8%88%85%E5%AE%B6%2C%E9%82%93%E5%8D%A2%E6%98%8E%2C%E8%91%A3%E7%88%B1%E6%B0%91%2C%E4%BA%8C%E5%A7%90%2C%E4%BB%98%E9%9D%99%E8%8B%B1%2C%E9%AB%98%E6%88%90%E5%88%9A%2C%E8%BE%9C%E5%AF%84%E8%93%89%2C%E9%83%AD%E9%9D%92%2C%E6%9D%AD%E5%B7%9E%E5%86%AF%2C%E4%BD%95%E5%AD%A6%2C%E9%BB%84%E6%B6%9B%2C%E9%BB%84%E5%BD%B1%2C%E5%90%89%E5%88%A9%E7%BB%B4%E4%BF%AE%E7%AB%99%2C%E5%90%89%E5%88%A9%E7%BB%B4%E4%BF%AE%E7%AB%99%2C%E6%B1%9F%E6%96%B0%2C%E8%92%8B%E7%8E%B2%2C%E7%84%A6%E7%82%8E%E5%AE%87%2C%E7%84%A6%E7%82%8E%E5%AE%87%2C%E6%99%B6%E6%99%B6%2C%E4%B9%9D%E6%9E%97%2C%E5%BA%B7%E5%88%9A%2C%E8%B5%96%E5%A8%9F%2C%E6%9D%8E%E5%B3%B0%2C%E4%BD%99%E7%83%81%2C%E6%9D%8E%E5%AE%B6%E6%98%8E%2C%E7%B2%B1%E6%96%87%E7%A7%91%2C%E8%81%8A%2C%E5%BB%96%E6%89%BF%E5%96%BB%2C%E5%88%98%E8%80%81%E5%B8%88%2C%E5%88%98%E5%BA%86%E6%A2%85%2C%E5%88%98%E7%A5%A5%E7%8E%96%2C%E7%BD%97%E5%87%AF%2C%E9%A9%AC%E5%88%97%E7%BA%A2%2C%E7%BE%8E%E6%9C%AF%E9%99%88%E8%80%81%E5%B8%88%2C%E6%AC%A7%E9%98%B3%E5%B9%B3%2C%E8%92%B2%E6%9C%9D%E6%98%8E%2C%E9%82%B1%E7%8E%B2%2C%E9%82%B1%E6%98%93%2C%E5%86%89%E5%90%AF%E6%97%AD%2C%E4%BB%BB%E6%84%8F%E9%80%9A%2C%E6%B2%88%E6%96%8C%2C%E5%B8%88%E7%AB%8B%E5%BF%A0%2C%E5%AD%99%E5%96%BB%2C%E5%AD%99%E7%8E%A5%2C%E7%94%B0%E5%A7%90%2C%E4%B8%87%E6%B1%9F%2C%E6%B1%AA%E4%B8%BD%2C%E6%B1%AA%E5%BF%83%E8%8C%B9%2C%E7%8E%8B%E8%8A%B3%E7%90%B3%2C%E7%8E%8B%E6%B2%B3%E5%8C%97%2C%E7%8E%8B%E5%B0%8F%E5%8D%AB%2C%E6%9C%AA%E7%9F%A5%E5%91%BC%E5%8F%AB%E4%BA%BA%2C%E6%B8%A9%E6%98%8E%E7%BA%A2%2C%E9%97%BB%E5%BB%BA%E5%8D%8E%2C%E4%BC%8D%E6%B3%BD%E6%B0%91%2C%E4%BC%8D%E6%B3%BD%E6%B0%91%2C%E5%A4%8F%E5%8D%AB%2C%E5%B0%8F%E9%BE%99%2C%E5%B0%8F%E5%90%B4%2C%E8%82%96%E8%8C%82%E7%85%9C%2C%E8%82%96%E8%8C%82%E7%85%9C%2C%E7%86%8A%E8%89%B3%2C%E5%BB%96%E8%80%81%E5%B8%88%EF%BC%88%E7%94%9F%2C%E8%AE%B8%E4%B8%B9%2C%E9%84%A2%2C%E6%99%8F%E5%AE%97%E6%96%B0%2C%E4%BD%99%E7%AE%AD%2C%E4%BD%99%E5%B0%8F%E7%90%B4%2C%E9%A2%84%E7%BA%A6%E5%8D%A1%2C%E9%A2%84%E7%BA%A6%E5%8D%A1%2C%E5%96%BB%E5%89%91%2C%E5%BC%A0%E6%96%8C%2C%E5%BC%A0%E5%BB%BA%2C%E5%BC%A0%E8%80%81%E5%B8%88%2C%E5%BC%A0%E8%80%81%E5%B8%88%2C%E5%BC%A0%E8%BF%81%2C%E5%BC%A0%E7%BF%BC%2C%E5%BC%A0%E6%B0%B8%E4%B9%89%2C%E8%B5%B5%E6%B7%BC%2C%E8%B5%B5%E9%91%AB%2C%E6%A4%8D%E5%B0%8F%E5%85%B5%2C%E6%A4%8D%E5%B0%8F%E5%85%B5%2C%E5%91%A8%E7%BA%A2%E8%8B%B1%2C%E5%91%A8%E6%99%93%E5%88%9A%2C%E6%9C%B1%E6%AD%A3%E4%BD%99%2C%E5%AE%97%E5%8D%AB%2C%E8%92%B2%E6%96%87%E7%91%9C%2C%E7%8E%8B%E6%9C%9D%E6%99%96%2C%E8%92%B2%E6%96%87%E7%91%9C%2C%E6%9D%8E%E6%81%92%E6%98%8C%2C%E6%9E%97%E8%99%8E%2C%E6%9E%97%E8%99%8E%2C%E5%86%AF%E8%B6%85');
INSERT INTO `user` VALUES ('120', '', 'pppppp', '2014-10-17 08:54:10', '15010117024', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, null, '116.3456500357343', '39.84121749491921', '1', '1', '1', null);
INSERT INTO `user` VALUES ('121', 'Iris Yi', '512600159', '2014-10-17 10:15:42', '18600843041', null, '60', null, null, null, '北京 西城', null, null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-17 23:05:07', '116.35302', '39.93367', '1', '1', '1', null);
INSERT INTO `user` VALUES ('122', '', '123456', '2014-10-17 10:58:54', '18310292618', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, null, '1', '1', '1', '1', '1', null);
INSERT INTO `user` VALUES ('124', '马钰', 'password', '2014-10-19 10:19:04', '13146506269', '玲珑世界', '60', null, null, null, '北京 东城', '小额贷款', null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-19 10:20:25', '125.77653', '41.66321', '1', '1', '1', null);
INSERT INTO `user` VALUES ('125', '马同德', '321123', '2014-10-19 10:29:58', '15844511958', null, '60', null, '1', null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-24 05:38:48', '125.77653', '41.66321', '1', '1', '1', null);
INSERT INTO `user` VALUES ('126', '陈振忠', 'czz321', '2014-10-19 16:06:24', '13671302770', '华信金融', '78', '北京财富中心35层华信金融', '1', '28', '北京 朝阳', '给力银行抵押贷款', '担保', '银行抵押贷款 房产质押 过桥垫资 ', '0', '5', null, null, '5', '6', '4', '|18510510168|18610668688|13264163440|13370176399|13466754325', '141020012818.jpg', '2014-11-01 19:52:19', '119.1562', '33.72276', '1', '1', '1', null);
INSERT INTO `user` VALUES ('127', '王芳', 'password', '2014-10-19 17:13:59', '13944518823', '百度', '66', null, '0', null, '北京 东城', '贷款', '担保', null, '0', null, null, null, '2', '1', '0', '|18210013053|13944518823', '141025134143.jpg', '2014-10-29 07:46:21', '116.30843', '40.085945', '1', '1', '1', null);
INSERT INTO `user` VALUES ('131', '冯佳', '222222', '2014-10-23 23:30:14', '18510919882', '酷讯', '60', null, null, null, '北京 朝阳', '犯产抵押', null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-30 17:26:27', '116.3486165785345', '40.0406291491902', '1', '1', '1', '18701501761%2C15004236117%2C18940660070%2C15931300728%2C1377982980%2C18617006295%2C15133612118%2C15504999901%2C13897855921%2C13516084319%2C18789400510%2C13909869530%2C13555888921%2C15714162630%2C15210940816%2C13478443052%2C04167368621%2C18301776230%2C13476133617%2C15818694808%2C15699660196%2C15011381553%2C13804061651%2C18611015372%2C13228878837%2C18602417569%2C13555815407%2C13889885820%2C18612326160%2C15210604532%2C15011210106%2C13901017355%2C18612538661%2C15940576290%2C18611035453%2C15604964236%2C18700829506%2C15142636182%2C13349967659%2C15040061028%2C13898990903%2C13840115771%2C15140607920%2C13654033025%2C18612131435%2C13604055786%2C18611805884%2C18600429382%2C18698829089%2C18811551594%2C13426165735%2C13821718853%2C18010197923%2C18612536138%2C15022964544%2C13898841812%2C15871361470%2C13548983692%2C18645079512%2C13501350249%2C13718790921%2C18919084342%2C13564730270%2C18698829581%2C1864037299%2C15201032513%2C18210584912%2C15910594689%2C18733517067%2C18210572315%2C15652186243%2C18698829068%2C18811386861%2C18604018433%2C13720098914%2C13120313532%2C15832557275%2C13287345729%2C15101070327%2C13520499449%2C18610582882%2C18600793075%2C18151722972%2C13514282869%2C15621002171%2C15201382619%2C18698842112%2C01082425623%2C18604939022%2C15652310503%2C18802736761%2C13464500691%2C18510327558%2C13693608343%2C13552105228%2C18640358320%2C13511067593%2C18600336436%2C18811502935%2C18249049940%2C15998858198%2C18600227096%2C15201068517%2C18612123859%2C13718190180%2C15820700627%2C15891944094%2C18510919883%2C18611724883%2C13488771839%2C18910317941%2C18611471897%2C13466754325%2C15810521089%2C13897863924%2C13840687127%2C13464696632%2C18694506709%2C03517625902%2C03517625901%2C13910385279%2C18310292618%2C18241629799%2C15941624645%2C15040863037%2C15841687527%2C18323377671%2C15117989180%2C13436730367%2C18010155535');
INSERT INTO `user` VALUES ('132', '于广伟', 'pppppp', '2014-10-20 10:21:01', '13553133089', '建行', '61', '丰田总部基地', '1', '27', '北京 丰台', '信用卡', '银行', '信用卡 ', '0', '5', null, null, '2', '1', '2', '|13466754325|18610668688', '141020050627.jpg', '2014-10-20 17:47:06', '116.3457035538911', '39.84131666171444', '1', '1', '1', null);
INSERT INTO `user` VALUES ('133', '徐汇', 'aaaa', '2014-10-21 12:27:58', '18908007122', null, '61', null, null, null, null, null, null, '小额贷款', '0', null, null, null, '0', '1', '0', '', null, '2014-10-30 10:34:44', '104.0899', '30.65172', '1', '1', '1', '13708098192%2C13880650798%2C13908236511%2C13669999520%2C18006452950%2C13651306685%2C84078318%2C84078318%2C13618041326%2C13466754325%2C13816126499%2C073182156114%2C18982189129%2C13916537154%2C15181191060%2C13908947706%2C18228127296%2C13730601422%2C18628347793%2C18980663663%2C18708122052%2C13778220333%2C15828318741%2C13350098836%2C13980191509%2C15881851728%2C13808221139%2C13778341002%2C18160055008%2C13683414944%2C13350896533');
INSERT INTO `user` VALUES ('134', 'GG刚刚给', 'aaaa', '2014-10-21 12:50:49', '18908007124', null, '60', null, null, null, null, null, null, '广告费发发汗', '0', null, null, null, '0', '0', '0', '', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('135', '刘琰玲', 'zhaolong2012', '2014-10-21 14:38:41', '18290140198', null, '60', null, null, null, '广西 桂林市', null, null, null, '0', null, null, null, '0', '0', '0', '', null, null, '1', '1', '1', '1', '1', null);
INSERT INTO `user` VALUES ('136', '哈哈还好过分', 'aaaa', '2014-10-21 17:35:01', '18908007125', null, '60', null, null, null, null, null, null, '过后就会更丰富', '0', null, null, null, '0', '0', '0', '', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('137', '史文轩', '123456', '2014-10-22 13:10:07', '13264163440', '北京华夏银行易达金', '65', '北京市西城区月坛北街恒华国际商务中心', '1', null, '北京 西城', '个人无抵押信用贷', '银行', '银行信用贷款 ', '0', '3', '华夏银行个人信用贷款', null, '8', '1', '1', '|13671302770|18210013053|13466754325|18610668688|18001022213|18811179005|13701272188|13261422171', '141022051224.jpg', '2014-10-22 13:19:32', '116.402', '39.97818', '1', '1', '1', null);
INSERT INTO `user` VALUES ('138', '李宇', 'liyu1234', '2014-10-22 13:48:25', '13702135580', '嘉宇聘金融公司', '60', null, '1', null, '天津 河西区', '做卡，养卡，办卡，小额网带', null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-26 00:20:43', '117.2164', '39.075745', '1', '1', '1', null);
INSERT INTO `user` VALUES ('139', '刘雷', 'll19931227', '2014-10-23 09:01:43', '15634805539', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-23 09:02:08', '117.1891', '36.690285', '1', '1', '1', null);
INSERT INTO `user` VALUES ('140', '', 'susanxue', '2014-10-23 12:10:39', '15810790479', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-23 12:00:47', '1', '1', '1', '1', '1', null);
INSERT INTO `user` VALUES ('141', '胡继红', 'hujihong', '2014-10-23 13:28:22', '13488783965', 'us', '60', null, null, null, '北京 海淀', '财务', null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-27 17:35:55', '116.240486', '40.073376', '1', '1', '1', null);
INSERT INTO `user` VALUES ('142', '王腾飞', '123456', '2014-10-24 10:26:51', '13488772420', 'll', '60', null, null, null, '北京 石景山', null, null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-24 10:57:47', '116.2339', '39.909805', '1', '1', '1', null);
INSERT INTO `user` VALUES ('143', '王伟', 'wangwei520', '2014-10-24 14:06:01', '13659853356', '智迅创源科技有限公司', '60', null, '1', null, '湖北 武汉市', '一次性输液器', null, null, '0', '10', null, null, '0', '0', '0', '', null, '2014-10-24 14:28:24', '113.98916', '30.687807', '1', '1', '1', null);
INSERT INTO `user` VALUES ('144', '傅斌', 'kofyaoshan', '2014-10-25 08:47:20', '18621755856', '腾讯', '60', null, null, null, '上海 黄浦', '借钱', null, null, '0', null, null, null, '0', '0', '0', '', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('145', '梓寒', 'password', '2014-10-25 21:32:13', '18686643847', '汤姆逊集团', '61', null, null, null, '北京 朝阳', '交友 理财', null, null, '0', null, null, null, '1', '1', '0', '|18686643847', null, '2014-10-27 03:43:43', '116.5154', '39.94185', '1', '0', '1', null);
INSERT INTO `user` VALUES ('146', '卡卡', '111111', '2014-10-26 20:47:59', '18710255938', '阿里巴巴', '60', null, null, null, '北京 石景山', '无', null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-10-30 13:39:09', '116.23364', '39.909954', '1', '1', '1', null);
INSERT INTO `user` VALUES ('147', '叶龙海', '834198', '2014-10-28 13:44:24', '13366663351', '北京吉信小额贷款股份有限公司', '62', '北京市海淀区海淀大街38号银科大厦底商1-10号', '1', '31', '北京 海淀', '房产（二次）抵押贷款，月息2%，可按天计息，无其它费用。', '银行', '房产质押  车辆质押  大额贷款  ', '0', '6', '比银行贷款更快捷！  \n比典当融资更优惠！  \n比民间借贷更规范！ \n\n1、全额发放贷款，放款当日免息；\n2、每月后收息，30天起贷，可按天计息（日息=2%除以30天）；\n3、可办理循环授信，用则计息，不用不计息，可分批领款及还款；\n4、不办理委托买卖、租赁、扣留证件等不合理手续；', null, '1', '2', '0', '|13370176399', '141030040647.jpg', '2014-10-30 14:02:59', '116.305824', '39.981377', '1', '1', '1', null);
INSERT INTO `user` VALUES ('148', '隋洁', '165345', '2014-10-30 10:12:06', '18513096660', '华信金融', '60', null, null, null, '北京 朝阳', '抵押贷款，无抵押贷款，二手房买卖，质押垫资，高息理财', null, null, '0', null, null, null, '1', '0', '0', '|13671302770', null, '2014-10-30 13:43:38', '116.468346', '39.920887', '1', '1', '1', null);
INSERT INTO `user` VALUES ('149', '', 'zzmm09050716', '2014-10-30 13:21:09', '13436833268', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '1', '0', '0', '|13671302770', null, null, '0', '0', '1', '1', '1', null);
INSERT INTO `user` VALUES ('150', '', 'guo810821', '2014-10-31 08:53:57', '18850611011', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, null, '1', '1', '1', '1', '1', null);
INSERT INTO `user` VALUES ('151', '白先生', '555555', '2014-11-01 21:45:31', '18601915555', '阿里咪咪', '60', null, null, null, '北京 东城', '放贷', null, null, '0', null, null, null, '0', '0', '0', '', null, '2014-11-01 21:49:57', '116.304', '39.97483', '1', '1', '1', null);
INSERT INTO `user` VALUES ('152', '', 'hujihong', '2014-11-01 22:35:23', '18910888402', null, '60', null, null, null, null, null, null, null, '0', null, null, null, '0', '0', '0', '', null, null, '1', '1', '1', '1', '1', null);

-- ----------------------------
-- Table structure for `yzm`
-- ----------------------------
DROP TABLE IF EXISTS `yzm`;
CREATE TABLE `yzm` (
  `id` int(11) NOT NULL auto_increment,
  `phone` varchar(255) collate gbk_bin default NULL,
  `yzm` varchar(255) collate gbk_bin default NULL,
  `regtime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=gbk COLLATE=gbk_bin;

-- ----------------------------
-- Records of yzm
-- ----------------------------
INSERT INTO `yzm` VALUES ('63', '13466754325', '8483', '2014-10-23 14:07:28');
INSERT INTO `yzm` VALUES ('64', '刘峰', '6365', '2014-09-17 09:39:33');
INSERT INTO `yzm` VALUES ('65', '18610668688', '4307', '2014-10-29 08:50:38');
INSERT INTO `yzm` VALUES ('66', '18310292618', '7099', '2014-10-17 02:58:26');
INSERT INTO `yzm` VALUES ('67', '18610079117', '4740', '2014-09-17 11:31:57');
INSERT INTO `yzm` VALUES ('68', '18510919882', '0946', '2014-10-23 15:30:00');
INSERT INTO `yzm` VALUES ('69', '18510510168', '5724', '2014-09-18 10:51:45');
INSERT INTO `yzm` VALUES ('70', '15801248719', '7669', '2014-09-19 05:57:11');
INSERT INTO `yzm` VALUES ('71', '13261422171', '0796', '2014-09-19 14:03:11');
INSERT INTO `yzm` VALUES ('72', '13581724762', '4965', '2014-09-19 18:35:27');
INSERT INTO `yzm` VALUES ('73', '18908007121', '1328', '2014-10-16 16:13:07');
INSERT INTO `yzm` VALUES ('74', 'xtet4321', '3004', '2014-09-21 06:52:14');
INSERT INTO `yzm` VALUES ('75', '18210013053', '3311', '2014-09-21 17:15:39');
INSERT INTO `yzm` VALUES ('76', '……18001022214', '4942', '2014-09-21 17:44:41');
INSERT INTO `yzm` VALUES ('77', '18001022213', '3316', '2014-09-21 17:45:21');
INSERT INTO `yzm` VALUES ('78', '200000', '7089', '2014-09-25 10:40:46');
INSERT INTO `yzm` VALUES ('79', '\'TEST\'', '2753', '2014-09-27 19:05:56');
INSERT INTO `yzm` VALUES ('80', '13699236865', '5763', '2014-09-29 14:35:19');
INSERT INTO `yzm` VALUES ('81', '18576723230', '6501', '2014-09-29 16:55:05');
INSERT INTO `yzm` VALUES ('82', '18501217365', '2040', '2014-10-27 02:11:00');
INSERT INTO `yzm` VALUES ('83', '18601915333', '1692', '2014-10-16 00:56:23');
INSERT INTO `yzm` VALUES ('84', '18910819200', '4143', '2014-10-16 08:16:54');
INSERT INTO `yzm` VALUES ('85', '18610668699', '2045', '2014-10-16 12:54:42');
INSERT INTO `yzm` VALUES ('86', '15010117024', '7413', '2014-10-17 00:55:09');
INSERT INTO `yzm` VALUES ('87', '18600843041', '5590', '2014-10-17 09:47:53');
INSERT INTO `yzm` VALUES ('88', '18601007910', '8082', '2014-10-17 07:23:16');
INSERT INTO `yzm` VALUES ('89', '13737362888', '3077', '2014-10-17 12:06:52');
INSERT INTO `yzm` VALUES ('90', '13146506269', '0131', '2014-10-19 02:18:22');
INSERT INTO `yzm` VALUES ('91', '15844511958', '0970', '2014-10-19 02:29:33');
INSERT INTO `yzm` VALUES ('92', '13671302770', '9964', '2014-10-19 08:06:03');
INSERT INTO `yzm` VALUES ('93', '13944518823', '6031', '2014-10-19 09:13:17');
INSERT INTO `yzm` VALUES ('94', '18510919883', '3048', '2014-10-19 15:06:23');
INSERT INTO `yzm` VALUES ('95', '13553133089', '0987', '2014-10-20 02:20:41');
INSERT INTO `yzm` VALUES ('96', '18290140198', '3957', '2014-10-21 06:37:53');
INSERT INTO `yzm` VALUES ('97', '13264163440', '6894', '2014-10-22 05:09:42');
INSERT INTO `yzm` VALUES ('98', '23702135580', '5962', '2014-10-22 05:47:51');
INSERT INTO `yzm` VALUES ('99', '13702135580', '1907', '2014-10-22 05:47:58');
INSERT INTO `yzm` VALUES ('100', '15634805539', '4182', '2014-10-23 01:01:21');
INSERT INTO `yzm` VALUES ('101', '15810790479', '3294', '2014-10-23 04:08:34');
INSERT INTO `yzm` VALUES ('102', '13488783965', '7827', '2014-10-23 05:27:18');
INSERT INTO `yzm` VALUES ('103', '18610668388', '5669', '2014-10-23 13:13:31');
INSERT INTO `yzm` VALUES ('104', '13488772420', '3710', '2014-10-24 02:26:27');
INSERT INTO `yzm` VALUES ('105', '13659853356', '7561', '2014-10-24 06:05:33');
INSERT INTO `yzm` VALUES ('106', '18621755856', '2928', '2014-10-25 00:46:59');
INSERT INTO `yzm` VALUES ('107', '15815904170', '9732', '2014-10-25 02:07:42');
INSERT INTO `yzm` VALUES ('108', '18686643847', '1668', '2014-10-25 13:31:56');
INSERT INTO `yzm` VALUES ('109', '18710255938', '7883', '2014-10-26 12:47:06');
INSERT INTO `yzm` VALUES ('110', '13366663351', '1659', '2014-10-28 05:43:49');
INSERT INTO `yzm` VALUES ('111', '18513096660', '1655', '2014-10-30 02:11:45');
INSERT INTO `yzm` VALUES ('112', '13436833268', '5923', '2014-10-30 05:20:41');
INSERT INTO `yzm` VALUES ('113', '18850611011', '8867', '2014-10-31 00:53:23');
INSERT INTO `yzm` VALUES ('114', '18601915555', '0147', '2014-11-01 13:45:01');
INSERT INTO `yzm` VALUES ('115', '18910888402', '6514', '2014-11-01 14:34:13');
