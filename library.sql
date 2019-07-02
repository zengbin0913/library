#创建图书馆数据库
DROP DATABASE IF EXISTS library;
SET NAMES UTF8;
CREATE DATABASE library CHARSET=UTF8;
USE library;

#1创建图书种类表
CREATE TABLE book_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(32),
	floor_id INT #图书所在楼层及房间号 
);
INSERT INTO book_family VALUES(NULL,"文学类",101);
INSERT INTO book_family VALUES(NULL,"历史类",102);
INSERT INTO book_family VALUES(NULL,"政治类",103);
INSERT INTO book_family VALUES(NULL,"地理类",104);

INSERT INTO book_family VALUES(NULL,"英语类",201);
INSERT INTO book_family VALUES(NULL,"日语类",202);
INSERT INTO book_family VALUES(NULL,"韩语类",203);
INSERT INTO book_family VALUES(NULL,"德语类",204);
INSERT INTO book_family VALUES(NULL,"其他语言类",205);

INSERT INTO book_family VALUES(NULL,"物理类",301);
INSERT INTO book_family VALUES(NULL,"化学类",302);
INSERT INTO book_family VALUES(NULL,"生物类",303);
INSERT INTO book_family VALUES(NULL,"数学类",304);

INSERT INTO book_family VALUES(NULL,"美术类",401);
INSERT INTO book_family VALUES(NULL,"音乐类",402);
INSERT INTO book_family VALUES(NULL,"美食类",403);
INSERT INTO book_family VALUES(NULL,"报纸/杂志/期刊类",404);

#2创建图书表
CREATE TABLE book(
	bid INT PRIMARY KEY AUTO_INCREMENT,
	bname VARCHAR(64),
	pic VARCHAR(128), #图书的图片
	publish VARCHAR(128), #出版社
	publish_time VARCHAR(64), #出版时间
	price DECIMAL(6,2),
	details VARCHAR(1024),#书籍简介
	author VARCHAR(64),#图书作者
	count TINYINT, #可借图书的数量,默认是3本
	is_borrow TINYINT, #图书是否可借  1-可借 0-不可借
	ISBN VARCHAR(64), #图书ISBN号
	fid INT   #外键关联图书种类
);

INSERT INTO book VALUES(NULL,"简爱","img/list/wenxue/4.jpg","人民文学出版社","2018-05-01",45,"作品讲述一位从小变成孤儿的英国女子在各种磨难中不断追求自由与尊严，坚持自我，最终获得幸福的故事。小说引人入胜地展示了男女主人公曲折起伏的爱情经历，歌颂了摆脱一切旧习俗和偏见，成功塑造了一个敢于反抗，敢于争取自由和平等地位的女性形象。","夏洛蒂勃朗特",3,1,"9787020137206",1);
INSERT INTO book VALUES(NULL,"背影-朱自清散文选","img/list/wenxue/3.jpg"," 云南美术出版社","2016-01-01",38,"这篇散文叙述的是作者离开南京到北京大学，父亲送他到浦口火车站，照料他上车，并替他买橘子的情形。在作者脑海里印象最深刻的，是他父亲替他买橘子时在月台爬上攀下时的背影。作者用朴素的文字，把父亲对儿女的爱，表达得深刻细腻，真挚感动，从平凡的事件中，呈现出父亲的关怀和爱护。","朱自清",3,1," 9787548933397",1);

INSERT INTO book VALUES(NULL,"中国近代史","img/list/lishi/4.jpg","江西教育出版社","2017-12-11",19,"中国近代史，是一部充满灾难、落后挨打的屈辱史，是一部中国人民探索救国之路，实现自由、民主的探索史，是一部中华民族抵抗侵略，打倒帝国主义以实现民族解放、打倒封建主义以实现人民富强的斗争史。","蒋廷",3,1,"9787539289533",2);
INSERT INTO book VALUES(NULL,"中国古代史","img/list/lishi/2.jpg","高等教育出版社","2011-01-15",29.90,"中国古代史经历了以下几个阶段：原始社会（170万年前-公元前2070年）、奴隶社会（公元前2070年-公元前476年）和封建社会。","詹子庆",3,1,"9783926745373",2);

INSERT INTO book VALUES(NULL,"政治学","img/list/zhengzhi/4.jpg","	中国人民大学出版社","2014-02-01",27,"政治学是一门以研究政治行为、政治体制以及政治相关领域为主的社会科学学科。","亚里士多德",3,1,"9784526765782",3);
INSERT INTO book VALUES(NULL,"社会契约论","img/list/zhengzhi/2.jpg","中国人民大学出版社","2014-05-07",37,"《社会契约论》中主权在民的思想，是现代民主制度的基石，深刻地影响了逐步废除欧洲君主绝对权力的运动，以及18世纪末北美殖民地摆脱英帝国统治、建立民主制度的斗争。","让·雅克·卢梭",3,1,"9785434567831",3);

INSERT INTO book VALUES(NULL,"地理百科全书","img/list/dili/2.jpg","天津联合出版公司","2016-6-17",41,"《中国国家地理百科全书》的编辑出版，目的在于为全面提升全民族的文化素质提供一部好教材，满足广大读者的需要。","王越",3,1,"9787550222345",4);
INSERT INTO book VALUES(NULL,"地理学与生活","img/list/dili/3.jpg","北京联合出版公司","2014-6-1",19,"生活中应知晓的地理学常识 俯瞰海陆变迁 探索与重塑地球律动之美 纵览全球文化 勾勒并解析世界人地格局","孙颖",3,1,"9787751027854",4);

INSERT INTO book VALUES(NULL,"日常英语口语","img/list/yingyu/1.jpg","大连理工大学出版社社","2013-03-21",34,"本书精选了日常生活中及出国旅游时在各种场合下常用的最简单的短句和对话，其目的是希望帮助那些略懂英语但对英语会话没有把握的读者们流畅地开口说英语。","金利",2,1,"9787561139202",5);
INSERT INTO book VALUES(NULL,"英语四级词汇","img/list/yingyu/3.jpg","海豚出版社","2018-03-01",57,"四级词汇 词根+联想记忆法","俞敏洪",3,1,"9787560542942",5);

INSERT INTO book VALUES(NULL,"现代日语","img/list/yuyan/riyu1.jpg","浙江教育出版社","2013-11-25",24,"日语能力考试1000词搞笑速记","安宁",3,1,"9787540546734",6);
INSERT INTO book VALUES(NULL,"标准日语","img/list/yuyan/riyu1.jpg","人民教育出版社","2016-01-1",34,"这套教材能够充分地体现日语教育以及社会、文化等方面的发展、变化","大连工学院日语教研室",3,1,"9787876546762",6);

INSERT INTO book VALUES(NULL,"标准韩国语","img/list/yuyan/hanyu.jpg","人民教育出版社","2011-5-24",29,"中韩交流,标准韩国语","李红梅",3,1,"	9787506280452",7);
INSERT INTO book VALUES(NULL,"新标准韩国语","img/list/yuyan/hanyu1.jpg","大连出版社社","2018-01-12",52,"此书非常方便学习者学习，有助于学习者更好地掌握教材的内容，从而做到“活学活用、学以致用”。","苗春梅",3,1,"9783478431567",7);

INSERT INTO book VALUES(NULL,"走进德国","img/list/yuyan/deyu.jpg","外语教学与研究出版社","2017-06-01",52,"本套教程适用于有一定德语学习基础并达到欧洲语言共同参考标准B1水平的学习者在德语中高级课堂上使用。","霍夫曼",3,1,"9787521300215",8);
INSERT INTO book VALUES(NULL,"德语","img/list/yuyan/deyu3.jpg","上海交通大学出版社","2006/1/1",62,"全书主要人物贯穿始终，情节前后呼应，透彻讲解德语语法、词汇之余，还全方位、多角度地向读者展现了中国学生留学德国的学习和生活画面。","徐清",3,1,"H125.4/186",8);

INSERT INTO book VALUES(NULL,"阿拉伯语","img/list/yuyan/alaboyu.jpg","北京大学出版社","2016-11-11",37,"本套教程适用于有一定零基础学员。","张甲民",3,1,"9787522300232",9);
INSERT INTO book VALUES(NULL,"泰语","img/list/yuyan/taiyu.jpg","上海交通大学出版社","2015-10-09",38,"本套教程适用于有一定零基础入门学习。","郑焕升",3,1,"9783476597814",9);

INSERT INTO book VALUES(NULL,"量子力学","img/list/wuli/wuli1.jpg","科学出版社","2013-12-01",57,"本书是为物理学专业与应用物理专业本科生学习量子力学课程而编写的，也可以作为理工科其他专业的学生学习量子力学的主要参考书。","曾谨言",3,1,"9789809012784",10);
INSERT INTO book VALUES(NULL,"物理学基础","img/list/wuli/wuli2.jpg","机械工业出版社","2013-01-01",29.9,"本教材最大的特点是，以鲜活的例子激发学生的学习兴趣，一步一步地引导学生掌握知识，提高学生应用物理知识的能力。","张三慧",3,1,"9787111157151",10);

INSERT INTO book VALUES(NULL,"结构化学基础","img/list/wuli/huaxue1.jpg","北京大学出版社","2014-02-01",38,"《结构化学基础》可供三年制师范专科学校和相应的大专院校使用。","周公度",3,1,"9787301057735",11);
INSERT INTO book VALUES(NULL,"有机化学","img/list/wuli/huaxue2.jpg","北京大学出版社","2018-04-01",27,"全书涵盖了有机化学的主要知识领域，同时添加了有机化学领域的新成果。","裴伟伟",3,1,"9787122019035",11);

INSERT INTO book VALUES(NULL,"高中生物基础知识","img/list/wuli/shengwu4.jpg","希望出版社","2018-03-1",39.8,"速查速记 考试必备 简明高效","薛金星",3,1,"9787895640101",12);
INSERT INTO book VALUES(NULL,"缤纷的生命","img/list/wuli/shengwu2.jpg","人民邮电出版社","2014-12-11",42.9,"《缤纷的生命》，仿佛经历一场生命的大冒险。","爱德华.威尔逊",3,1,"	9787508653495",12);

INSERT INTO book VALUES(NULL,"什么是数学","img/list/shuxue/1.jpg","复旦大学出版社","2013-10-13",65,"本书是世界著名的数学科普读物，它搜集了许多经典的数学珍品，对整个数学领域中的基本概念与方法，做了精深而生动的阐述。","R·柯朗 H·罗宾",3,1,"9787309086232",13);
INSERT INTO book VALUES(NULL,"微积分","img/list/shuxue/5.jpg","人民邮电出版社","2010-08-01",83,"本书阐述了求解微积分的技巧, 详细讲解了微积分基础、极限、连续、微分、导数的应用、积分、无穷级数、泰勒级数与幂级数等内容，旨在教会读者如何思考问题从而找到解题 所需的知识点, 着重训练大家自己解答问题的能力。","李建军",3,1,"9787309058333",13);

INSERT INTO book VALUES(NULL,"素描","img/list/meishu/meishu6.jpg","人民邮电出版社","2010-9-13",24,"写给绘画爱好者的素描必备基础书","张玉红",3,1,"9787356987514",14);
INSERT INTO book VALUES(NULL,"世界美术名作20讲","img/list/meishu/meishu3.jpg","人民教育出版社","2016-07-01",32,"抽象的美,在于寻找","傅雷",3,1,"9787356987431",14);

INSERT INTO book VALUES(NULL,"印了笔记六线琴谱","img/list/yin mei/yinle2.jpg","安徽文艺出版社","2010-05-21",21,"学好音乐须学好琴谱","刘小瑛",3,1,"9784537890135",15);
INSERT INTO book VALUES(NULL,"钢琴集","img/list/yin mei/yinle3.jpg","湖南出版社","2013-07-01",57,"号弹,顺手的原版流行钢琴曲","李雄","3",1,"9785506208521",15);

INSERT INTO book VALUES(NULL,"粗糙食堂","img/list/meishi/cucaoshitang2.jpg","人民邮电出版社社","2017-09-08",24,"厨具不丰富,味道不稀奇","连小兔",3,1,"9788905467534",16);
INSERT INTO book VALUES(NULL,"烘焙","img/list/meishi/hongbei.jpg","安徽文艺出版","2018-01-21",24,"散发着爱的香醇与生命的喜悦","坨坨妈",3,1,"9784567321568",16);

INSERT INTO book VALUES(NULL,"特别关注","img/list/zazhi/tebieguanzhu.jpg","中国邮政出版社","2019-05-01",5,"温度,深度","李佳",3,1,"KD-2",17);
INSERT INTO book VALUES(NULL,"生活周刊","img/list/zazhi/shenghuozhoukan4.jpg","二十一世纪出版社","2019-05-18",5,"寻找一杯号咖啡","李雄","3",1,"KD-3",17);

#3用户信息表
CREATE TABLE user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(16), #用户姓名
	email VARCHAR(32), #用户邮箱
	phone VARCHAR(11), #联系方式
	sex TINYINT,  #用户性别 1-男 0-女
	age TINYINT,  #用户年龄
	status TINYINT #用户身份 1-老师 0-学生
);
INSERT INTO user VALUES(NULL,"曾子芹","zengziqin@126.com","13135362978",0,24,0);
INSERT INTO user VALUES(NULL,"李敏","1442184033@qq.com.com","15115756664",0,22,0);
INSERT INTO user VALUES(NULL,"文丽","wenli@sohu.com","18773847455",1,23,0);
INSERT INTO user VALUES(NULL,"何丹","hedan@163.com","15515767548",1,25,0);
INSERT INTO user VALUES(NULL,"徐杜娟","983054134@qq.com","13535356785",0,21,0);
INSERT INTO user VALUES(NULL,"魏红","weihong@hanshou.com","15815538960",1,45,1);#老师
INSERT INTO user VALUES(NULL,"江庭","jiangting@hanshou.com","18934568934",0,43,1);#老师

#4借阅证表
CREATE TABLE book_card(
	cid INT PRIMARY KEY AUTO_INCREMENT, #借书证id
	uid INT, #外键关联用户表
	quantity TINYINT DEFAULT 3,#用户可借书的数量,学生3本,老师5本
	credit TINYINT #用户信誉(是否有过借书未还) 2-信誉很好 0-信誉差 1-信誉一般
);
INSERT INTO book_card VALUES(NULL,1,2,1);#1号用户借了1本书
INSERT INTO book_card VALUES(NULL,2,DEFAULT,1); 
INSERT INTO book_card VALUES(NULL,3,DEFAULT,1);
INSERT INTO book_card VALUES(NULL,4,DEFAULT,1);
INSERT INTO book_card VALUES(NULL,5,DEFAULT,1);
INSERT INTO book_card VALUES(NULL,6,5,1);#老师
INSERT INTO book_card VALUES(NULL,7,5,1);#老师

#5图书借阅信息表
CREATE TABLE book_order(
	oid INT PRIMARY KEY AUTO_INCREMENT,
	bid INT, #外键关联图书id
	lid	INT, #外键关联借阅证id
	borrow_date VARCHAR(64), #借书日期
	back_date VARCHAR(64) #还书日期
);
INSERT INTO book_order VALUES(NULL,9,1,"2019-06-27",NULL);
INSERT INTO book_order VALUES(NULL,NULL,2,NULL,NULL);#未借书
INSERT INTO book_order VALUES(NULL,NULL,3,NULL,NULL);
INSERT INTO book_order VALUES(NULL,NULL,4,NULL,NULL);
INSERT INTO book_order VALUES(NULL,NULL,5,NULL,NULL);
INSERT INTO book_order VALUES(NULL,NULL,6,NULL,NULL);
INSERT INTO book_order VALUES(NULL,NULL,7,NULL,NULL);

#6图书管理员信息表
CREATE TABLE manager(
	mid INT,
	mname VARCHAR(16), #管理员姓名
	tel VARCHAR(11),  #管理员办公室电话
	email VARCHAR(32), #管理员邮箱
	floor_id INT #管理员管理的楼层
);

#7首页轮播图
CREATE TABLE library_carousel(
  carousel_id INT,
  img VARCHAR(128), #轮播图片路径
  title VARCHAR(24) #标题
);
INSERT INTO library_carousel VALUES(NULL,"img/index/banner1.jpg","轮播图1");
INSERT INTO library_carousel VALUES(NULL,"img/index/banner2.jpg","轮播图2");
INSERT INTO library_carousel VALUES(NULL,"img/index/banner3.jpg","轮播图3");
INSERT INTO library_carousel VALUES(NULL,"img/index/banner4.jpg","轮播图4");