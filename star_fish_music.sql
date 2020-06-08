/*
 Navicat Premium Data Transfer

 Source Server         : JackeyLov9
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 127.0.0.1:3306
 Source Schema         : star_fish_music

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 07/04/2020 14:12:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播图表id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图标题',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图url',
  `sort` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播图排名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (10, '风,继续吹', 'carouselPic/4bdde365-1a24-4490-bb1f-a4e47c966819f83dc6c1-1af2-4fd1-abe7-91b647a5db5f.jpg', '1');
INSERT INTO `carousel` VALUES (11, 'Troye Sivan', 'carouselPic/53c11398-d734-4e60-bca5-47f6cda531b24ba251c5-cf37-441e-bfb0-ea452947280d.jpg', '2');
INSERT INTO `carousel` VALUES (12, '少年行', 'carouselPic/acbd4304-5bcd-4161-beb8-edbe051bb5b83c698170-b165-41e0-b574-d0b66fa12f81.jpg', '3');
INSERT INTO `carousel` VALUES (13, '岚', 'carouselPic/2511c39a-c4bb-45aa-95e3-1c5d6fea84aaa5163b59-d629-4826-b183-bc40a8dd5593.jpg', '5');
INSERT INTO `carousel` VALUES (14, '错的人', 'carouselPic/9a5eb49c-72c7-4160-96b2-7085b32fe3da681d67c5-b389-4ca0-874a-0c06282afb3e.jpg', '4');

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌手类型id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '歌手类型名(如华语、欧美、日韩...)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES (2, '华语');
INSERT INTO `classify` VALUES (3, '欧美');
INSERT INTO `classify` VALUES (4, '日本');
INSERT INTO `classify` VALUES (5, '韩国');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论表id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `comment_time` datetime(0) NOT NULL COMMENT '评论时间',
  `up` int(11) NULL DEFAULT NULL COMMENT '点赞数',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '外键(指向用户表)',
  `song_id` int(11) NULL DEFAULT NULL COMMENT '外键(指向歌曲表)',
  `song_list_id` int(11) NULL DEFAULT NULL COMMENT '外键(指向歌单表)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `song_id`(`song_id`) USING BTREE,
  INDEX `song_list_id`(`song_list_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_5` FOREIGN KEY (`song_list_id`) REFERENCES `song_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '哇，超级好听', '2020-03-30 16:57:15', NULL, 18, 11, NULL);
INSERT INTO `comment` VALUES (3, 'GD我男神', '2020-03-30 17:50:36', NULL, 19, 11, NULL);
INSERT INTO `comment` VALUES (4, '测试数据', '2020-04-02 18:07:22', NULL, 23, 8, NULL);
INSERT INTO `comment` VALUES (5, '您好啊', '2020-04-02 18:08:58', NULL, 23, 8, NULL);
INSERT INTO `comment` VALUES (6, '深入灵魂的声音', '2020-04-02 18:17:41', NULL, 23, 42, NULL);
INSERT INTO `comment` VALUES (7, '超级好听', '2020-04-02 18:18:20', NULL, 23, 42, NULL);
INSERT INTO `comment` VALUES (10, '此人太懒什么都没有留下', '2020-04-02 18:24:40', NULL, 23, 42, NULL);
INSERT INTO `comment` VALUES (19, '男神，太好听啦~~', '2020-04-02 21:24:40', NULL, 19, 42, NULL);
INSERT INTO `comment` VALUES (34, 'JJ Project冲呀!!!', '2020-04-03 00:27:10', NULL, 19, 53, NULL);
INSERT INTO `comment` VALUES (36, '你好啊', '2020-04-03 11:02:35', NULL, 23, 42, NULL);

-- ----------------------------
-- Table structure for my_song
-- ----------------------------
DROP TABLE IF EXISTS `my_song`;
CREATE TABLE `my_song`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '我的音乐表id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `song_id` int(11) NOT NULL COMMENT '歌曲id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `song_id`(`song_id`) USING BTREE,
  CONSTRAINT `my_song_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `my_song_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of my_song
-- ----------------------------
INSERT INTO `my_song` VALUES (1, 19, 11);
INSERT INTO `my_song` VALUES (2, 19, 16);
INSERT INTO `my_song` VALUES (3, 19, 18);
INSERT INTO `my_song` VALUES (4, 19, 10);
INSERT INTO `my_song` VALUES (5, 19, 9);
INSERT INTO `my_song` VALUES (6, 19, 7);
INSERT INTO `my_song` VALUES (7, 19, 48);
INSERT INTO `my_song` VALUES (8, 19, 42);
INSERT INTO `my_song` VALUES (9, 19, 41);
INSERT INTO `my_song` VALUES (22, 23, 42);
INSERT INTO `my_song` VALUES (24, 23, 41);

-- ----------------------------
-- Table structure for singer
-- ----------------------------
DROP TABLE IF EXISTS `singer`;
CREATE TABLE `singer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌手id',
  `singer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '歌手名',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌手照片url',
  `debut_time` date NULL DEFAULT NULL COMMENT '歌手出道时间',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌手所属地(中国大陆、中国台湾...)',
  `rank` int(11) NULL DEFAULT NULL COMMENT '歌手排名',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '歌手介绍',
  `classify_id` int(11) NULL DEFAULT NULL COMMENT '外键,指向歌手类型表',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rank`(`rank`) USING BTREE,
  INDEX `classify_id`(`classify_id`) USING BTREE,
  CONSTRAINT `singer_ibfk_1` FOREIGN KEY (`classify_id`) REFERENCES `classify` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of singer
-- ----------------------------
INSERT INTO `singer` VALUES (3, 'G-Dragon', '/singerListPic/fcbcb11b-876e-4c28-8199-af99b8670db1da40e2fe-d44d-4b0a-af68-6cde8647c360.jpg', '2006-08-19', '韩国首尔', 1, 'G-DRAGON（权志龙、권지용），1988年8月18日出生于韩国首尔，韩国男歌手，男子演唱组合BIGBANG队长，所属经纪公司YG Entertainment词曲制作人。2001年，因参与特别企划专辑《大韩民国Hip-Hop Flex》而出道。2006年，作为组合BIGBANG成员身份正式出道。', 5);
INSERT INTO `singer` VALUES (4, '五月天', '/singerListPic/25b6dc44-94a1-4113-9a73-d0989247f11dd8cee065-d9ae-4dc8-85ba-697ad484ba45.jpg', '1997-03-29', '中国台湾', 2, '五月天（Mayday），中国台湾摇滚乐团，由温尚翊（怪兽）、陈信宏（阿信）、石锦航（石头）、蔡升晏（玛莎）、刘谚明（冠佑）五位成员组成。\r\n乐团前身为“So Band”乐团，在1997年3月29日更名为“五月天”。', 2);
INSERT INTO `singer` VALUES (5, 'BIGBANG', '/singerListPic/012dec1e-a6f1-4e9c-ab06-a3b5b91fb509b2f6e348-79a2-4f8b-ac12-b1c780e4d712.jpg', '2006-08-19', '韩国首尔', 3, 'BIGBANG（빅뱅），韩国男子演唱组合，由G-DRAGON（权志龙）、T.O.P（崔胜铉）、TAEYANG（东永裴）、DAESUNG（姜大声）、SEUNGRI（李胜贤，已退出）五位成员组成   。\r\n2006年8月19日，BIGBANG在YG Family世界巡回演唱会首尔站上正式出道，并于同年12月22日发行首张正规专辑《BIGBANGVOL.1 SINCE2007》。2007年5月，BIGBANG开始进行全国巡回演唱会，并于7月推出了第一张迷你专辑《Always》。2008年8月8日，BIGBANG发行MINI专辑《STAND UP》，专辑中的歌曲《一天一天》在KTF连续六周蝉联第一名。 2009年，BIGBANG赴日本发展。2011年，BIGBANG成为历史上第一个获得MTV欧洲音乐大奖“Worldwide Act”的亚洲组合，并于2012年上半年登上美国格莱美官方网页，成为首个被格莱美介绍的韩国歌手', 5);
INSERT INTO `singer` VALUES (7, 'en', '/singerListPic/7ba6a75a-4f46-4db8-8878-752735a1d3dd093d727e-fc78-4250-ba4c-f8328dda6ff3.jpg', '2019-05-16', '山东青岛', 11, '暂无介绍', 2);
INSERT INTO `singer` VALUES (8, '周杰伦', '/singerListPic/cf220ea1-cfe7-49d4-9738-fe6e526efbf4e78c451f-0477-4322-87d0-b1279739323e.jpg', '2000-11-07', '中国台湾', 4, '周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，祖籍福建省泉州市永春县，中国台湾流行乐男歌手、原创音乐人、演员、导演等，毕业于淡江中学。\r\n2000年发行首张个人专辑《Jay》。2001年发行的专辑《范特西》奠定其融合中西方音乐的风格 。2002年举行“The One”世界巡回演唱会  。2003年成为美国《时代周刊》封面人物 。2005年凭借动作片《头文字D》获得台湾电影金马奖、香港电影金像奖最佳新人奖。2007年自编自导的文艺片《不能说的秘密》获得台湾电影金马奖年度台湾杰出电影奖。\r\n2009年入选美国CNN评出的“25位亚洲最具影响力的人物” 。2010年入选美国《Fast Company》评出的“全球百大创意人物” 。2011年主演好莱坞电影《青蜂侠》。2012年登福布斯中国名人榜榜首。2014年发行华语乐坛首张数字音乐专辑《哎呦，不错哦》  。2018年举行“地表最强2”世界巡回演唱会  。\r\n截至2019年，他发行了14张个人专辑 ，累积创作数百首歌曲 ，创作并演唱的《双截棍》《晴天》《东风破》《七里香》《千里之外》《青花瓷》等歌曲广为传唱；曾获得金曲奖最佳作曲人奖，两次获得金曲奖最佳国语男歌手奖，四次获得金曲奖最佳国语专辑奖，四次获得世界音乐大奖中国区最畅销艺人奖。\r\n演艺事业外，他还涉足商业、设计等领域。2007年成立杰威尔有限公司。2011年担任华硕笔电设计师并入股香港文化传信集团  。\r\n周杰伦热心公益慈善，多次向中国内地灾区捐款捐物。2008年捐款援建希望小学 。2014年担任中国禁毒宣传形象大使', 2);
INSERT INTO `singer` VALUES (9, 'Taylor Swift', '/singerListPic/1c1409b3-8595-4ed3-adae-fbf8f43ce0f14a44270e-ccdc-48cd-9450-3cecea3f0014.jpg', '2006-06-19', '美国', 6, '泰勒·斯威夫特（Taylor Swift），1989年12月13日出生于美国宾夕法尼亚州，美国流行音乐、乡村音乐创作型女歌手、音乐制作人、演员、慈善家。\r\n2006年发行首张录音室专辑《泰勒·斯威夫特》，获美国唱片业协会认证5倍白金唱片。2008年发行第二张录音室专辑《Fearless》，在美国公告牌专辑榜上获11周冠军，是2009年全美最畅销专辑，认证7倍白金唱片，专辑获第52届格莱美奖年度专辑，使泰勒成为获此奖项的最年轻歌手，也是获奖最多的乡村音乐专辑。', 3);
INSERT INTO `singer` VALUES (10, 'GD&TOP', '/singerListPic/738a8db9-f06f-4a69-b4ca-c234d6cc3ad921d3a9f9-0ec7-43dc-90b1-f9036121166b.jpg', '2010-11-28', '韩国首尔', 7, '韩国人气组合，由bigbang队长G-Dragon和队员Top组成的小分队2011年7月发布第一张专辑《GD&TOP》。\r\n在BigBang中的两位Rap担当以小分队的形式一起活动，此次正规专辑中的收录歌曲大部分由两位成员自己作词作曲。专辑中共收录了11首歌曲，其中的《HIGH HIGH》与《OH YEAH》等两首歌曲被定位主打歌。风格也和作为BigBang组合活动时有所不同', 5);
INSERT INTO `singer` VALUES (14, 'EXO', '/singerListPic/286ec21a-4745-4d08-93e5-9db6a1b6ecf9b3a56acb-d163-4e93-b2b4-3867d3f5096e.jpg', '2012-04-08', '韩国首尔', 8, 'EXO，韩国男子流行演唱组合，现以金珉锡（XIUMIN）、金俊勉（SUHO）、张艺兴（LAY）、边伯贤（BAEKHYUN）、金钟大（CHEN）、朴灿烈（CHANYEOL）、都敬秀（D.O.）、金钟仁（KAI）、吴世勋（SEHUN）9名成员的形式展开活动', 5);
INSERT INTO `singer` VALUES (15, '朴宰范', '/singerListPic/9488619e-e924-4b76-9572-21d7b4a1f6617257597f-efd9-4f6d-8cd0-8f077e736107.jpg', '2008-09-04', '韩国首尔', 9, '朴宰范，1987年4月25日出生于美国西雅图，流行歌手、舞者、音乐制作人，毕业于檀国大学。2008年以偶像组合2pm队长身份出道，2009年退队，2010年初与JYP解除合约并签约韩国 SidusHQ公司。2010年3月在youtube上传了自己改编歌词并且翻唱的B.O.B的《Nothing on you》，同年6月重返韩国主演好莱坞影片《Hype Nation》 ，7月13日推出首张个人迷你专辑《相信我》夺韩国唱片预售排行第一。2012年1月13日获得第26届韩国金唱片大奖音乐本奖，同年2月6日发行个人第一张正规专辑专辑《New Breed》在韩国唱片排行榜Mnet上夺冠', 5);
INSERT INTO `singer` VALUES (16, 'Gray', '/singerListPic/9c3066da-e686-4e91-8f84-5a0e6e12dbf1ec2c6da5-cd93-4997-928d-3b3a1acb947e.jpg', '2012-05-16', '韩国首尔', 10, 'Rap/Hiphop歌手Gray为Jaypark独立工作室AOMG旗下优秀艺人、Rapper、R&B与HIP-HOP的音乐制作人。因长相帅气被称为AOMG的门面，在加入AOMG的一年中制作出很多韩国HIP-HOP界众所周知的名曲', 5);
INSERT INTO `singer` VALUES (17, 'JJ Project', '/singerListPic/50148c96-628f-4969-962a-16a27d7fff410ad4fe5f-b9ce-40be-9961-87745a49739d.jpg', '2012-05-12', '韩国首尔', 5, 'JJ Project是JYP娱乐于2012年5月22日推出的韩国男子演唱组合，由林在范、朴珍荣两位成员组成。2012年5月，JJ Project通过首张单曲专辑《Bounce》正式出道 。2014年1月，两位成员随组合GOT7出道。2015年12月，为《CECI》拍摄时尚画报。2017年7月31日，发行首张迷你专辑《Verse 2》', 5);
INSERT INTO `singer` VALUES (18, '胡歌', '/singerListPic/cd0a302b-f9cc-47fe-8efe-4e9342507dd13493e7c6-829a-4b91-9730-16149d9b42d3.jpg', '2005-01-24', '上海', 12, '胡歌，1982年9月20日出生于上海市徐汇区，中国内地男演员、歌手。1996年，14岁的胡歌便成为上海教育电视台的小主持人，2005年毕业于上海戏剧学院表演系，同年在仙侠剧《仙剑奇侠传》中塑造了“李逍遥”一角，并演唱该剧插曲《六月的雨》《逍遥叹》。2006年8月遭受严重车祸，2007年6月复出。2009年主演仙侠剧《仙剑奇侠传三》，并演唱片尾曲《忘记时间》\r\n                ', 2);
INSERT INTO `singer` VALUES (19, 'Justin Bieber', '/singerListPic/1b64099b-a3bb-40d3-8bf7-c376ebe137828f17742c-b21a-462a-a769-0b749bb6a239.jpg', '2009-05-18', '加拿大', 13, '贾斯汀·比伯（Justin Bieber），1994年3月1日出生于加拿大安大略省斯特拉特福市，加拿大男歌手。2008年，贾斯汀·比伯在视频网站YouTube上被其经纪人斯科特发现，随后被亚瑟小子培养进入歌坛。2009年，发行第一张个人专辑《My Worlds》，并凭借专辑获得全美音乐奖年度艺人奖。2010年3月，第二张个人专辑《My World2.0》发行一周便登上了公告牌专辑冠军。11月，凭借单曲《Baby》获得第27届MTV音乐奖最佳新人。2011年8月，凭借歌曲《U Smile》获得第28届MTV音乐录影带大奖最佳男歌手录影带奖 。11月，获得欧洲MTV音乐奖最佳流行歌手奖和最佳男歌手奖。', 3);
INSERT INTO `singer` VALUES (20, 'IU', '/singerListPic/8d54d4dc-2f3c-4dbf-a389-e7d67af76de8bc6985c3-0aeb-43b3-bec9-34c599816ad5.jpg', '2008-09-23', '韩国首尔', 14, '李知恩（이지은、Lee Ji Eun），艺名IU，1993年5月16日出生于韩国首尔特别市，韩国女歌手、演员、主持人。2008年9月，在Mnet音乐节目《M! Countdown》中演唱歌曲《迷儿》，正式出道；随后发行首张迷你专辑《Lost And Found》。2009年，发行首张正规专辑《Growing Up》 ，同年11月发行迷你专辑《IU...Im》 。2010年，发行迷你专辑《Real》，主打歌《好日子》连续五周位居韩国Gaon榜榜首。2011年，发行第二张正规专辑《Last Fantasy》，全专歌曲总下载量超过1700万次 。2012年，名列韩国福布斯名人榜第三位 ', 5);
INSERT INTO `singer` VALUES (21, 'keshi', '/singerListPic/e84d4913-17b0-4161-883c-3390e8deb64077439a7b-44ac-49f5-9e5f-eaa517d7d3e7.jpg', '2016-12-08', '越南', 15, 'keshi 原名Casey Luong 美籍越南裔 来自美国德克萨斯州休斯顿市 歌手,作曲家，音乐制作人. 自述无固定音乐风格,根据心情和最近听的歌而定,近期多为alternative hiphop/pop/R&B/upbeat trap 12岁时为了撩妹自学吉他，15岁开始萌发作曲的念头,大二开始通过YouTube等网络资源学习音乐制作', 3);
INSERT INTO `singer` VALUES (22, 'EXO-CBX', '/singerListPic/491ff790-cdf8-4843-aca6-81ff9a97d9b0ec0b02b1-5528-4e5f-8c64-441c1ea662df.jpg', '2016-10-30', '韩国首尔', 16, 'EXO-CBX是SM娱乐旗下韩国男子音乐组合EXO在2016年组成的子团体，组合名称是由三位成员Xiumin、伯贤Baekhyun和Chen的英文名开头字母组成，并于10月31日推出首张迷你专辑《Hey Mama!》。', 5);
INSERT INTO `singer` VALUES (23, '米津玄師', '/singerListPic/3823a72c-9e00-435d-8de9-bfa51c65068f567b02df-5e55-4b84-8323-fe56117b558d.jpg', '2012-02-20', '日本', 17, '米津玄师，日本音乐人。活跃在早期niconico上，后转战自作自唱歌曲创作，从2009年至2011年投稿VOCALOID作品，此后从2012年02月20日起开始以本名“米津玄师”投稿自作自唱作品。2018年，其为电视剧《非自然死亡》创作并演唱的歌曲《Lemon》，获得第96届日剧学院赏最佳主题曲奖2020年2月，第34届日本金唱片大奖年度最佳下载单曲”被授予米津玄师的《马与鹿》。2020年，米津玄师为日剧《MIU404》献唱主题曲《感电》。', 4);
INSERT INTO `singer` VALUES (24, '嵐', '/singerListPic/cc6f3c51-a7bd-4367-9cec-effbfa85beeec37ca0f8-319d-42b5-a1a6-27eb96f5590f.jpg', '1999-11-03', '日本', 18, '岚（ARASHI），是1999年出道的杰尼斯事务所旗下的男子偶像歌唱团体，由队长大野智、樱井翔、相叶雅纪、二宫和也、松本润5名成员组成', 4);
INSERT INTO `singer` VALUES (25, '林俊杰', '/singerListPic/08171279-30e1-43a0-b92c-ad9e56db83e59a0005b4-a38e-4145-b23c-afd46d29caef.jpg', '2003-04-01', '新加坡', 19, ' 林俊杰（JJ Lin），1981年3月27日出生于新加坡，祖籍中国福建省厦门市同安区，华语流行乐男歌手、词曲创作人、音乐制作人、潮牌主理人。2003年发行首张创作专辑《乐行者》。2004年凭借专辑《第二天堂》中的主打歌《江南》获得广泛关注。2014年凭借专辑《因你而在》夺得第25届台湾金曲奖最佳国语男歌手奖 。2016年凭借专辑《和自己对话》获得第27届台湾金曲奖最佳国语男歌手奖 ， 并推出个人首部音乐纪录片《听·见林俊杰》 。截止到2019年，已发行13张正式专辑，累计创作数百首歌曲。\r\n                ', 2);
INSERT INTO `singer` VALUES (26, 'Shawn Mendes', '/singerListPic/44938b62-c7b8-442f-9eca-b1c12728109f5710b5c1-201e-4d9f-9de4-6c3132d22650.jpg', '2014-06-26', '加拿大', 20, '肖恩·蒙德兹（Shawn Mendes），1998年8月8日出生于安大略省多伦多市，加拿大男歌手。2013年，肖恩·蒙德兹在网上发布翻唱视频而被网友认识。2014年1月，加入小岛唱片；同年6月26日，因发行个人首支单曲《Life Of The Party》而正式出道。2015年4月，肖恩·蒙德兹发行个人首张专辑《Handwritten》，并凭借该专辑获得欧洲MTV音乐录影带最佳男歌手奖。2016年09月，发行个人第二张专辑《Illuminate》，并于发行首周获得美国公告牌专辑榜冠军。2017年，入围人民选择奖最佳男歌手，获得MTV欧洲音乐奖的最佳艺人奖、最佳单曲奖以及最具人气奖', 3);
INSERT INTO `singer` VALUES (27, 'Charlie Puth', '/singerListPic/57331853-b29a-4ddb-8c5b-d25d89a1d2b6cdf79fc8-3ffa-49f4-800e-38bc907bd763.jpg', '2010-12-02', '美国', 21, '查理·普斯（Charlie Puth），1991年12月2日出生于美国新泽西州，美国男歌手。2011年，查理·普斯将翻唱的歌曲上传至Youtube，由此获得了上百万的点击量 [1]  。2013年10月，发布个人原创专辑《Ego》。2015年2月10日，发行与梅根·特瑞娜合作的单曲《Marvin Gaye》。3月17日，发行与维兹·卡利法合作的单曲《See You Again》，该单曲在公告牌百强单曲榜获得冠军。2016年1月，发行首张专辑《Nine Track Mind》', 3);

-- ----------------------------
-- Table structure for song
-- ----------------------------
DROP TABLE IF EXISTS `song`;
CREATE TABLE `song`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌曲id',
  `song_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '歌曲名',
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专辑名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '歌曲添加时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '歌曲更新时间',
  `song_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌曲url',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌曲专辑照片url',
  `lyric` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌词url',
  `singer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL COMMENT '歌曲播放次数',
  `singer_id` int(11) NULL DEFAULT NULL COMMENT '外键,指向歌手表id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `singer_id`(`singer_id`) USING BTREE,
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`singer_id`) REFERENCES `singer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song
-- ----------------------------
INSERT INTO `song` VALUES (4, '后来的我们', '自传', '2020-03-27 20:41:19', NULL, 'song/五月天 - 后来的我们.mp3', 'introductionPic/640d23ce-d744-4b0d-8c00-e92e80c383b33176874f-5828-4b68-af19-26465ac264da.jpg', 'lyric/五月天 - 后来的我们.lrc', '五月天', 7, 4);
INSERT INTO `song` VALUES (5, '嚣张', '嚣张', '2020-03-27 20:55:21', NULL, 'song/en - 嚣张.mp3', 'introductionPic/33f0d931-ab01-469a-aa86-f93f963c04234d872d3a-5838-4c5f-bffd-75db2a3adcc3.jpg', 'lyric/en - 嚣张.lrc', 'en', 0, 7);
INSERT INTO `song` VALUES (6, '玫瑰少年', '玫瑰少年', '2020-03-28 14:59:50', NULL, 'song/五月天 - 玫瑰少年.mp3', 'introductionPic/928dee46-5231-4499-8679-2eae652fca3fab0b6288-2300-485b-937f-968dcdb9250e.jpg', 'lyric/五月天 - 玫瑰少年.lrc', '五月天', 7, 4);
INSERT INTO `song` VALUES (7, '好久不见', '跨时代', '2020-03-28 15:11:23', NULL, 'song/周杰伦 - 好久不见.flac', 'introductionPic/24e1caa9-3f98-4a03-a257-06f808cd2635948aded3-55fc-45f9-8fd8-4581bc085962.jpg', 'lyric/ 周杰伦 - 好久不见.lrc', '周杰伦', 1, 8);
INSERT INTO `song` VALUES (8, 'Missing You', 'One Of A Kind', '2020-03-28 15:23:11', NULL, 'song/G-Dragon - Missing You.mp3', 'introductionPic/9f3de570-0bcc-413b-a923-d0dd164d9ba56fb8c58f-e96f-4bf5-bf1f-36a983929dfd.jpg', 'lyric/G-Dragon - Missing You.lrc', 'G-Dragon', 20, 3);
INSERT INTO `song` VALUES (9, '雨下一整晚', '跨时代', '2020-03-28 21:19:59', NULL, 'song/周杰伦 - 雨下一整晚.flac', 'introductionPic/24e1caa9-3f98-4a03-a257-06f808cd2635948aded3-55fc-45f9-8fd8-4581bc085962.jpg', 'lyric/周杰伦 - 雨下一整晚.lrc', '周杰伦', 2, 8);
INSERT INTO `song` VALUES (10, 'Black', 'COUP D\'ETAT', '2020-03-28 23:35:52', NULL, 'song/G-Dragon - BLACK (FEAT.JENNIE KIM OF YG NEW ARTIST).mp3', 'introductionPic/64b77333-eed5-4613-a48f-6ec1d9666b5c81d4d980-f4ae-4376-97cc-6662de9a3d44.jpg', 'lyric/G-Dragon - Black.lrc', 'G-Dragon', 6, 3);
INSERT INTO `song` VALUES (11, 'Window', 'COUP D\'ETAT', '2020-03-28 23:37:17', NULL, 'song/G-Dragon - Window.mp3', 'introductionPic/64b77333-eed5-4613-a48f-6ec1d9666b5c81d4d980-f4ae-4376-97cc-6662de9a3d44.jpg', 'lyric/G-Dragon - WINDOW.lrc', 'G-Dragon', 13, 3);
INSERT INTO `song` VALUES (14, '삐딱 하게(CROOKED)', 'COUP D\'ETAT', '2020-03-28 23:48:03', NULL, 'song/G-Dragon - 삐딱 하게(CROOKED).mp3', 'introductionPic/64b77333-eed5-4613-a48f-6ec1d9666b5c81d4d980-f4ae-4376-97cc-6662de9a3d44.jpg', 'lyric/G-Dragon - 삐딱 하게(CROOKED).lrc', 'G-Dragon', 7, 3);
INSERT INTO `song` VALUES (15, 'Who You?', 'COUP D\'ETAT', '2020-03-28 23:52:48', NULL, 'song/G-Dragon - 니가 뭔데 (WHO YOU).mp3', 'introductionPic/64b77333-eed5-4613-a48f-6ec1d9666b5c81d4d980-f4ae-4376-97cc-6662de9a3d44.jpg', 'lyric/G-Dragon - Who You.lrc', 'G-Dragon', 1, 3);
INSERT INTO `song` VALUES (16, '결국(结果)', 'One Of A Kind', '2020-03-28 23:54:42', NULL, 'song/G-Dragon - 결국(结果).mp3', 'introductionPic/9f3de570-0bcc-413b-a923-d0dd164d9ba56fb8c58f-e96f-4bf5-bf1f-36a983929dfd.jpg', 'lyric/G-Dragon - 결국(结果).lrc', 'G-Dragon', 2, 3);
INSERT INTO `song` VALUES (17, '그XX', 'One Of A Kind', '2020-03-28 23:56:51', NULL, 'song/G-Dragon - 그XX.mp3', 'introductionPic/9f3de570-0bcc-413b-a923-d0dd164d9ba56fb8c58f-e96f-4bf5-bf1f-36a983929dfd.jpg', 'lyric/G-Dragon - 그XX.lrc', 'G-Dragon', 0, 3);
INSERT INTO `song` VALUES (18, '악몽(噩梦)', 'GD & TOP 정규앨범 1집', '2020-03-29 00:01:17', NULL, 'song/GD&TOP - 악몽(噩梦).mp3', 'introductionPic/5a59420b-d4dc-4e49-aab0-41b9cb4b8c8b456bf56c-4a60-4cf4-947a-fde6915e0f7f.jpg', 'lyric/G-Dragon - 악몽(噩梦).lrc', 'GD&TOP', 3, 10);
INSERT INTO `song` VALUES (20, '집에 가지마(不要回家)', 'GD & TOP 정규앨범 1집', '2020-03-29 12:26:33', NULL, 'song/G-Dragon - 집에 가지마(不要回家).mp3', 'introductionPic/5a59420b-d4dc-4e49-aab0-41b9cb4b8c8b456bf56c-4a60-4cf4-947a-fde6915e0f7f.jpg', 'lyric/G-Dragon - 집에 가지마(不要回家).lrc', 'GD&TOP', 0, 10);
INSERT INTO `song` VALUES (21, '给我一首歌的时间', '魔杰座', '2020-03-29 12:55:30', NULL, 'song/周杰伦 - 给我一首歌的时间.flac', 'introductionPic/b33d1b1b-5fa4-4dae-a2b4-cb352ac493e108eaebc4-2815-4b90-996d-8de58fd7925c.jpg', 'lyric/周杰伦 - 给我一首歌的时间.lrc', '周杰伦', 7, 8);
INSERT INTO `song` VALUES (23, '稻香', '魔杰座', '2020-03-29 14:58:05', NULL, 'song/周杰伦 - 稻香.flac', 'introductionPic/b33d1b1b-5fa4-4dae-a2b4-cb352ac493e108eaebc4-2815-4b90-996d-8de58fd7925c.jpg', 'lyric/周杰伦 - 稻香.lrc', '周杰伦', 1, 8);
INSERT INTO `song` VALUES (24, '花海', '魔杰座', '2020-03-29 14:58:35', NULL, 'song/周杰伦 - 花海.flac', 'introductionPic/b33d1b1b-5fa4-4dae-a2b4-cb352ac493e108eaebc4-2815-4b90-996d-8de58fd7925c.jpg', 'lyric/周杰伦 - 花海.lrc', '周杰伦', 1, 8);
INSERT INTO `song` VALUES (26, 'Monster', 'Monster', '2020-03-29 19:24:30', NULL, 'song/EXO - Monster.mp3', 'introductionPic/c3324d5e-2a6e-49bb-a82e-9a65e318d8c52e90d879-e064-4aa1-89e1-c2c26e537a9b.jpg', 'lyric/EXO - Monster.lrc', 'EXO', 2, 14);
INSERT INTO `song` VALUES (27, '断了的弦', '寻找周杰伦', '2020-03-30 13:14:08', NULL, 'song/周杰伦 - 断了的弦.flac', 'introductionPic/4d4ed72a-d56d-4257-ae4b-56b1d7bccdedac6666b4-d92d-4b41-8174-a3d3018f622a.jpg', 'lyric/周杰伦 - 断了的弦.lrc', '周杰伦', 0, 8);
INSERT INTO `song` VALUES (28, '轨迹', '寻找周杰伦', '2020-03-30 13:14:39', NULL, 'song/周杰伦 - 轨迹.flac', 'introductionPic/4d4ed72a-d56d-4257-ae4b-56b1d7bccdedac6666b4-d92d-4b41-8174-a3d3018f622a.jpg', 'lyric/周杰伦 - 轨迹.lrc', '周杰伦', 2, 8);
INSERT INTO `song` VALUES (29, 'CALL ME BABY', 'LOVE ME RIGHT', '2020-03-30 23:41:14', NULL, 'song/EXO - CALL ME BABY.mp3', 'introductionPic/67ec939a-cecc-407b-87fd-ee454f9e79b705ca6830-4142-4f85-a245-2cd80ac090b2.jpg', 'lyric/EXO - Call Me Baby.lrc', 'EXO', 5, 14);
INSERT INTO `song` VALUES (30, 'LOVE ME RIGHT', 'LOVE ME RIGHT', '2020-03-30 23:42:11', NULL, 'song/EXO - LOVE ME RIGHT.mp3', 'introductionPic/67ec939a-cecc-407b-87fd-ee454f9e79b705ca6830-4142-4f85-a245-2cd80ac090b2.jpg', 'lyric/EXO - LOVE ME RIGHT.lrc', 'EXO', 9, 14);
INSERT INTO `song` VALUES (31, 'Sing For You', 'Sing For You', '2020-03-30 23:43:04', NULL, 'song/EXO - Sing For You.mp3', 'introductionPic/5f82afb4-7ed8-4f2c-a0e3-7da736ec075339eb39cb-ff9d-490e-a5c8-f929087ca4c8.jpg', 'lyric/EXO - Sing For You.lrc', 'EXO', 10, 14);
INSERT INTO `song` VALUES (32, '初雪', '十二月的奇迹', '2020-03-30 23:44:16', NULL, 'song/EXO - 初雪.mp3', 'introductionPic/2e2efe51-af2d-40f5-a2fe-831619491e533f1992b0-82a5-4ae1-9e6f-60215b47dead.jpg', 'lyric/EXO - 初雪.lrc', 'EXO', 0, 14);
INSERT INTO `song` VALUES (33, 'Walk On Memories', 'THE WAR ', '2020-03-30 23:45:44', NULL, 'song/EXO - Walk On Memories.mp3', 'introductionPic/406a331f-1b87-45d6-a4cb-8fc0fa423bcdc57f7568-d8db-4c70-a2dc-dba1da621f32.jpg', 'lyric/EXO - Walk On Memories.lrc', 'EXO', 0, 14);
INSERT INTO `song` VALUES (34, '蝴蝶少女 (Don\'t Go)', 'XOXO', '2020-03-30 23:47:30', NULL, 'song/EXO - 蝴蝶少女.mp3', 'introductionPic/e57773ad-96c9-4ba9-8120-d8c045c1038def0bd21c-3c01-481f-942c-89555d88d620.jpg', 'lyric/EXO - 蝴蝶少女（Don\'t Go）.lrc', 'EXO', 2, 14);
INSERT INTO `song` VALUES (35, '上瘾', 'Overdose', '2020-03-30 23:50:13', NULL, 'song/EXO - 上瘾.mp3', 'introductionPic/8b387c61-7eb9-4b44-b20c-82c332de68ff42422a64-6389-4a04-a95e-e90af8262c01.jpg', 'lyric/EXO - 上瘾.lrc', 'EXO', 0, 14);
INSERT INTO `song` VALUES (36, '十二月的奇迹', '十二月的奇迹', '2020-03-30 23:51:38', NULL, 'song/EXO - 十二月的奇迹.mp3', 'introductionPic/2e2efe51-af2d-40f5-a2fe-831619491e533f1992b0-82a5-4ae1-9e6f-60215b47dead.jpg', 'lyric/EXO - 十二月的奇迹.lrc', 'EXO', 1, 14);
INSERT INTO `song` VALUES (37, '月光', 'Overdose', '2020-03-30 23:53:05', NULL, 'song/EXO - 月光.mp3', 'introductionPic/8b387c61-7eb9-4b44-b20c-82c332de68ff42422a64-6389-4a04-a95e-e90af8262c01.jpg', 'lyric/EXO - 月光.lrc', 'EXO', 1, 14);
INSERT INTO `song` VALUES (38, '咆哮', 'XOXO', '2020-03-30 23:54:33', NULL, 'song/EXO - 咆哮.mp3', 'introductionPic/e57773ad-96c9-4ba9-8120-d8c045c1038def0bd21c-3c01-481f-942c-89555d88d620.jpg', 'lyric/EXO - 咆哮.lrc', 'EXO', 0, 14);
INSERT INTO `song` VALUES (39, '으르렁 (Growl)', 'XOXO(Kiss & Hug)', '2020-03-30 23:56:11', NULL, 'song/EXO - 으르렁 (Growl).mp3', 'introductionPic/c1269a4c-96f8-4457-833b-3e3e8ade132e09252537-7250-44a9-bf2a-909f0ee7b363.jpg', 'lyric/EXO - 咆哮.lrc', 'EXO', 1, 14);
INSERT INTO `song` VALUES (40, 'The Eve', 'THE WAR', '2020-03-30 23:58:47', NULL, 'song/EXO - The Eve.mp3', 'introductionPic/406a331f-1b87-45d6-a4cb-8fc0fa423bcdc57f7568-d8db-4c70-a2dc-dba1da621f32.jpg', 'lyric/EXO - The Eve.lrc', 'EXO', 0, 14);
INSERT INTO `song` VALUES (41, 'All I Wanna Do (K)', 'EVERYTHING YOU WANTED', '2020-03-31 00:06:40', NULL, 'song/朴宰范 - All I Wanna Do (K).mp3', 'introductionPic/3669573f-2af6-41c4-9f3e-74cb8cbb44bd424647bf-f623-4e72-a944-ddfcaf1f65e6.jpg', 'lyric/朴宰范 - All I Wanna Do (K).lrc', '朴宰范', 21, 15);
INSERT INTO `song` VALUES (42, '2 soon', '2 soon', '2020-03-31 00:10:35', NULL, 'song/keshi - 2 soon.mp3', 'introductionPic/5e595861-a6e6-4a54-ae11-530b8ab69d20e4da2641-92b4-40b8-aec2-27eef092b877.jpg', 'lyric/keshi - 2 soon.lrc', 'keshi', 76, 21);
INSERT INTO `song` VALUES (43, 'Coming Home', 'Verse 2', '2020-03-31 00:18:07', NULL, 'song/JJ Project - Coming Home.mp3', 'introductionPic/736fe609-a8cd-4886-bb10-8b1c3c1f3ab6a34d94bf-5ac3-4eed-a93b-8a65ac360c7f.jpg', 'lyric/JJ Project - Coming Home.lrc', 'JJ Project', 8, 17);
INSERT INTO `song` VALUES (46, 'On&On', 'Verse 2', '2020-03-31 00:30:02', NULL, 'song/JJ Project - On&On.mp3', 'introductionPic/736fe609-a8cd-4886-bb10-8b1c3c1f3ab6a34d94bf-5ac3-4eed-a93b-8a65ac360c7f.jpg', 'lyric/JJ Project - On&On.lrc', 'JJ Project', 2, 17);
INSERT INTO `song` VALUES (47, '그날', 'Verse 2', '2020-03-31 00:30:38', NULL, 'song/JJ Project - 그날.mp3', 'introductionPic/736fe609-a8cd-4886-bb10-8b1c3c1f3ab6a34d94bf-5ac3-4eed-a93b-8a65ac360c7f.jpg', 'lyric/JJ Project - 그날.lrc', 'JJ Project', 0, 17);
INSERT INTO `song` VALUES (48, '내일, 오늘', 'Verse 2', '2020-03-31 00:31:11', NULL, 'song/JJ Project - 내일, 오늘.mp3', 'introductionPic/736fe609-a8cd-4886-bb10-8b1c3c1f3ab6a34d94bf-5ac3-4eed-a93b-8a65ac360c7f.jpg', 'lyric/JJ Project - 내일, 오늘.lrc', 'JJ Project', 10, 17);
INSERT INTO `song` VALUES (51, '春雷', 'BOOTLEG', '2020-03-31 16:53:28', NULL, 'song/米津玄師 - 春雷.mp3', 'introductionPic/58dca684-c9e9-4441-9110-57921d7745192eeee1fc-7e4f-4767-b466-01765f7ebfd2.jpg', 'lyric/米津玄師 - 春雷.lrc', '米津玄師', 0, 23);
INSERT INTO `song` VALUES (52, 'A-RA-SHI：Reborn', 'A-RA-SHI：Reborn', '2020-03-31 17:04:05', NULL, 'song/嵐 - A-RA-SHI：Reborn.mp3', 'introductionPic/9ad06e22-01e9-45e7-b4cc-b6239f2266ab9acc07f8-ba46-4792-91b2-7df1d3b4a82b.jpg', 'lyric/嵐 - A-RA-SHI：Reborn.lrc', '嵐', 0, 24);
INSERT INTO `song` VALUES (53, 'Don\'t Wanna Know', 'Verse 2', '2020-04-03 00:23:59', NULL, 'song/JJ Project - Don\'t Wanna Know.mp3', 'introductionPic/ee4e33a0-80ff-413a-88a8-399938873f5bc31b1868-57ac-4498-b1a7-c60ae0dce1e8.jpg', 'lyric/JJ Project - Don\'t Wanna Know.lrc', 'JJ Project', 4, 17);

-- ----------------------------
-- Table structure for song_list
-- ----------------------------
DROP TABLE IF EXISTS `song_list`;
CREATE TABLE `song_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌单表id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '歌单标题',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌单图片url',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '歌单介绍',
  `style` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '歌单类型(如华语、轻音乐、BGM)',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '外键(指向用户表)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `song_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song_list
-- ----------------------------
INSERT INTO `song_list` VALUES (1, '寻找周杰伦', 'songListPic/fd745c57-2428-46d7-bbc6-d0213c224e1fb02676af-5c42-4576-a5a0-ef2a3558ab0f.jpg', '《周杰伦&叶惠美：寻找周杰伦EP》是与同名电影作为结合的一张EP专辑，收录了主题曲“轨迹”、插曲“断了的弦”及其卡拉OK版本。为了感谢Jay歌迷一直的支持，随EP特别加送他上一张专辑《叶惠美》11首MV之VCD，让歌迷可以完整收藏Jay的每一首歌曲！爱情就像一张遗失的唱片，在这出《寻找周杰伦》电影里，那是一张神秘的周杰伦唱片，说它神秘，是因唱片里面藏有一首神秘的歌曲，当整张唱片所有曲目播完时，才会突然出现的“hidden track”，它没有名字，没有封面说明！“hidden track”曾经伴著片中的女主角的初恋一起燃烧过，失恋后的她为了找回那种燃烧的感觉，于是展开一次《寻找周杰伦》的旅程。\r\n　　周杰伦遇上电影的第一次，创造出绝美的情歌。', '华语', NULL);
INSERT INTO `song_list` VALUES (5, 'JJ Project 冲呀!!!', 'songListPic/b0c85c2e-a2d0-49a9-9c32-a1ba913eb487e818d5c4-3ca3-444f-8889-8fa318b32eb4.jpg', 'JJ Project时隔5年携第二张迷你专辑《Verse 2》回归！以感性成熟的面貌揭开 JJ Project 的第二章', '日韩', NULL);
INSERT INTO `song_list` VALUES (6, '试着做个善良的人', 'songListPic/445ea8a9-2d34-413c-ad9a-e1d08251cfa9a47e3ba6-654b-46c3-adca-2ef7f19a25ec.jpg', 'Maybe someone remembers me', '欧美', NULL);
INSERT INTO `song_list` VALUES (7, '五五五 MayDay', 'songListPic/7157968e-0e90-4eb1-bd0a-750b3ef0c7715eea9850-0126-4d4b-b773-cc954b6e7ad6.jpg', '专属五月天的歌单', '华语', NULL);
INSERT INTO `song_list` VALUES (8, '周董 Jay Chou', 'songListPic/c0cf0e14-57e4-4d10-af3d-2f44d142773d206ac73a-3e09-4916-a3be-29b6e8af63ed.jpg', '每个人的记忆都有一首属于周董的歌!\r\n                ', '流行', NULL);
INSERT INTO `song_list` VALUES (9, '最强王者G-Dragon', 'songListPic/d02ad73f-188c-4577-a392-7716e35d4939ade8b031-983f-4502-a980-4de21a064862.jpg', '地表最强即将回归---敬请期待', '日韩', NULL);
INSERT INTO `song_list` VALUES (10, 'EXO', 'songListPic/c2c6c3a5-ab82-4e7c-afea-7cc45b76890f6d471715-a766-421a-8a81-206bbbe525a0.jpg', '以前的亚洲天团\r\n现在的前辈', '日韩', NULL);
INSERT INTO `song_list` VALUES (11, '朴社长专属', 'songListPic/337f88dd-feca-4df7-b4af-48f4f56565ab301b2d9d-2504-4e25-832c-4cf0fedb7523.jpg', '该歌单暂无介绍', '日韩', NULL);

-- ----------------------------
-- Table structure for song_list_song
-- ----------------------------
DROP TABLE IF EXISTS `song_list_song`;
CREATE TABLE `song_list_song`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '歌单表和歌曲表中间表id',
  `song_id` int(11) NULL DEFAULT NULL COMMENT '外键(指向歌曲表id)',
  `song_list_id` int(11) NULL DEFAULT NULL COMMENT '外键(指向歌单表id)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `song_id`(`song_id`) USING BTREE,
  INDEX `song_list_id`(`song_list_id`) USING BTREE,
  CONSTRAINT `song_list_song_ibfk_3` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `song_list_song_ibfk_4` FOREIGN KEY (`song_list_id`) REFERENCES `song_list` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of song_list_song
-- ----------------------------
INSERT INTO `song_list_song` VALUES (2, 28, 1);
INSERT INTO `song_list_song` VALUES (20, 9, 1);
INSERT INTO `song_list_song` VALUES (23, 7, 1);
INSERT INTO `song_list_song` VALUES (24, 41, 11);
INSERT INTO `song_list_song` VALUES (25, 43, 5);
INSERT INTO `song_list_song` VALUES (26, 46, 5);
INSERT INTO `song_list_song` VALUES (27, 47, 5);
INSERT INTO `song_list_song` VALUES (28, 48, 5);
INSERT INTO `song_list_song` VALUES (29, 42, 6);
INSERT INTO `song_list_song` VALUES (30, 4, 7);
INSERT INTO `song_list_song` VALUES (31, 6, 7);
INSERT INTO `song_list_song` VALUES (32, 7, 8);
INSERT INTO `song_list_song` VALUES (33, 9, 8);
INSERT INTO `song_list_song` VALUES (34, 21, 8);
INSERT INTO `song_list_song` VALUES (35, 23, 8);
INSERT INTO `song_list_song` VALUES (36, 24, 8);
INSERT INTO `song_list_song` VALUES (39, 27, 8);
INSERT INTO `song_list_song` VALUES (40, 28, 8);
INSERT INTO `song_list_song` VALUES (41, 8, 9);
INSERT INTO `song_list_song` VALUES (42, 10, 9);
INSERT INTO `song_list_song` VALUES (43, 11, 9);
INSERT INTO `song_list_song` VALUES (44, 14, 9);
INSERT INTO `song_list_song` VALUES (45, 15, 9);
INSERT INTO `song_list_song` VALUES (46, 16, 9);
INSERT INTO `song_list_song` VALUES (47, 17, 9);
INSERT INTO `song_list_song` VALUES (48, 18, 9);
INSERT INTO `song_list_song` VALUES (49, 26, 10);
INSERT INTO `song_list_song` VALUES (50, 29, 10);
INSERT INTO `song_list_song` VALUES (51, 30, 10);
INSERT INTO `song_list_song` VALUES (52, 31, 10);
INSERT INTO `song_list_song` VALUES (53, 53, 5);
INSERT INTO `song_list_song` VALUES (54, 23, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(唯一)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号(唯一)',
  `email` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `birthday` date NULL DEFAULT NULL COMMENT '用户生日',
  `signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户个性签名',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在地区',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像所在url',
  `last_time` datetime(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `this_time` datetime(0) NULL DEFAULT NULL COMMENT '本次登录时间',
  `is_admin` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户权限(0为普通用户,1为管理员)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (14, 'admin', '4776bbc8046841be78074cb5e63c794e', NULL, '', '', '1988-08-18', NULL, NULL, 'userPic/admin.jpg', '2020-03-31 10:59:22', '2020-04-07 14:11:43', '1');
INSERT INTO `user` VALUES (18, 'JackeyLov9', '65b00c55d9e805fd16d746a23561282c', '男', '13899998888', '1353009769@qq.com', '1999-07-03', 'ADGap', '湖北', 'userPic/49f0c1c9-2586-4c9b-983b-b2c7ddd9768144655775-a9cb-4c42-9ff6-ea4ac12dd70f.jpeg', '2020-04-04 17:25:07', '2020-04-07 14:11:22', '1');
INSERT INTO `user` VALUES (19, 'shy', '5a697d1bbabacfcb7c5b89b5008dab0a', '男', '18688321362', '827169326@qq.com', '1999-03-01', '民主TOP,我就是全世界最帅、最强的男人，你服吗？不服杀了你', '上海', 'userPic/56ba3bc2-be04-475c-805b-618965f8e4ce1668bd78-6f83-4b53-889b-c66a9c22d379.jpg', '2020-04-02 21:23:57', '2020-04-03 00:26:54', '0');
INSERT INTO `user` VALUES (23, '2soon', 'd6b24088717509d53c8cc00a309b3d9c', '男', '18171243625', 'cx1353009769@outlook.com', '2020-04-02', '此人太懒什么也没留下', '湖北', 'userPic/5019bd70-8113-4e6b-9b3b-afdaf932f93569008676-2a76-4684-949e-22dcdde7b26f.jpg', '2020-04-04 15:37:21', '2020-04-04 17:13:08', '0');

SET FOREIGN_KEY_CHECKS = 1;
