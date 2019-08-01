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
	fid INT,   #外键关联图书种类
	seq_recommended TINYINT,  #首页书籍轮播  1-推荐(首页) 0-不推荐 2-推荐(新书推荐目录) 3-推荐(好书推荐)
	href VARCHAR(128), #查看图书简介的跳转地址
	total INT #该图书总共被借的次数
);

INSERT INTO book VALUES(NULL,"简爱","img/list/wenxue/4.jpg","人民文学出版社","2018-05-01",45,"作品讲述一位从小变成孤儿的英国女子在各种磨难中不断追求自由与尊严，坚持自我，最终获得幸福的故事。小说引人入胜地展示了男女主人公曲折起伏的爱情经历，歌颂了摆脱一切旧习俗和偏见，成功塑造了一个敢于反抗，敢于争取自由和平等地位的女性形象。","夏洛蒂勃朗特",3,1,"9787020137206",1,2,"book.html?bid=1",5);
INSERT INTO book VALUES(NULL,"背影-朱自清散文选","img/list/wenxue/3.jpg"," 云南美术出版社","2016-01-01",38,"这篇散文叙述的是作者离开南京到北京大学，父亲送他到浦口火车站，照料他上车，并替他买橘子的情形。在作者脑海里印象最深刻的，是他父亲替他买橘子时在月台爬上攀下时的背影。作者用朴素的文字，把父亲对儿女的爱，表达得深刻细腻，真挚感动，从平凡的事件中，呈现出父亲的关怀和爱护。","朱自清",3,1," 9787548933397",1,2,"book.html?bid=2",10);

INSERT INTO book VALUES(NULL,"中国近代史","img/list/lishi/4.jpg","江西教育出版社","2017-12-11",19,"中国近代史，是一部充满灾难、落后挨打的屈辱史，是一部中国人民探索救国之路，实现自由、民主的探索史，是一部中华民族抵抗侵略，打倒帝国主义以实现民族解放、打倒封建主义以实现人民富强的斗争史。","蒋廷",3,1,"9787539289533",2,2,"book.html?bid=3",5);
INSERT INTO book VALUES(NULL,"中国古代史","img/list/lishi/2.jpg","高等教育出版社","2011-01-15",29.90,"中国古代史经历了以下几个阶段：原始社会（170万年前-公元前2070年）、奴隶社会（公元前2070年-公元前476年）和封建社会。","詹子庆",3,1,"9783926745373",2,2,"book.html?bid=4",10);

INSERT INTO book VALUES(NULL,"政治学","img/list/zhengzhi/4.jpg","	中国人民大学出版社","2014-02-01",27,"政治学是一门以研究政治行为、政治体制以及政治相关领域为主的社会科学学科。","亚里士多德",3,1,"9784526765782",3,2,"book.html?bid=5",5);
INSERT INTO book VALUES(NULL,"社会契约论","img/list/zhengzhi/2.jpg","中国人民大学出版社","2014-05-07",37,"《社会契约论》中主权在民的思想，是现代民主制度的基石，深刻地影响了逐步废除欧洲君主绝对权力的运动，以及18世纪末北美殖民地摆脱英帝国统治、建立民主制度的斗争。","让·雅克·卢梭",3,1,"9785434567831",3,3,"book.html?bid=6",10);

INSERT INTO book VALUES(NULL,"地理百科全书","img/list/dili/2.jpg","天津联合出版公司","2016-6-17",41,"《中国国家地理百科全书》的编辑出版，目的在于为全面提升全民族的文化素质提供一部好教材，满足广大读者的需要。","王越",3,1,"9787550222345",4,3,"book.html?bid=7",15);
INSERT INTO book VALUES(NULL,"地理学与生活","img/list/dili/3.jpg","北京联合出版公司","2014-6-1",19,"生活中应知晓的地理学常识 俯瞰海陆变迁 探索与重塑地球律动之美 纵览全球文化 勾勒并解析世界人地格局","孙颖",3,1,"9787751027854",4,3,"book.html?bid=8",5);

INSERT INTO book VALUES(NULL,"日常英语口语","img/list/yingyu/1.jpg","大连理工大学出版社社","2013-03-21",34,"本书精选了日常生活中及出国旅游时在各种场合下常用的最简单的短句和对话，其目的是希望帮助那些略懂英语但对英语会话没有把握的读者们流畅地开口说英语。","金利",2,1,"9787561139202",5,3,"book.html?bid=9",50);
INSERT INTO book VALUES(NULL,"英语四级词汇","img/list/yingyu/3.jpg","海豚出版社","2018-03-01",57,"四级词汇 词根+联想记忆法","俞敏洪",3,1,"9787560542942",5,3,"book.html?bid=10",75);

INSERT INTO book VALUES(NULL,"现代日语","img/list/yuyan/riyu1.jpg","浙江教育出版社","2013-11-25",24,"日语能力考试1000词搞笑速记","安宁",3,1,"9787540546734",6,0,"book.html?bid=11",5);
INSERT INTO book VALUES(NULL,"标准日语","img/list/yuyan/riyu1.jpg","人民教育出版社","2016-01-1",34,"这套教材能够充分地体现日语教育以及社会、文化等方面的发展、变化","大连工学院日语教研室",3,1,"9787876546762",6,0,"book.html?bid=12",5);

INSERT INTO book VALUES(NULL,"标准韩国语","img/list/yuyan/hanyu.jpg","人民教育出版社","2011-5-24",29,"中韩交流,标准韩国语","李红梅",3,1,"	9787506280452",7,0,"book.html?bid=13",1);
INSERT INTO book VALUES(NULL,"新标准韩国语","img/list/yuyan/hanyu1.jpg","大连出版社社","2018-01-12",52,"此书非常方便学习者学习，有助于学习者更好地掌握教材的内容，从而做到“活学活用、学以致用”。","苗春梅",3,1,"9783478431567",7,0,"book.html?bid=14",5);

INSERT INTO book VALUES(NULL,"走进德国","img/list/yuyan/deyu.jpg","外语教学与研究出版社","2017-06-01",52,"本套教程适用于有一定德语学习基础并达到欧洲语言共同参考标准B1水平的学习者在德语中高级课堂上使用。","霍夫曼",3,1,"9787521300215",8,0,"book.html?bid=15",1);
INSERT INTO book VALUES(NULL,"德语","img/list/yuyan/deyu3.jpg","上海交通大学出版社","2006/1/1",62,"全书主要人物贯穿始终，情节前后呼应，透彻讲解德语语法、词汇之余，还全方位、多角度地向读者展现了中国学生留学德国的学习和生活画面。","徐清",3,1,"H125.4/186",8,0,"book.html?bid=16",3);

INSERT INTO book VALUES(NULL,"阿拉伯语","img/list/yuyan/alaboyu.jpg","北京大学出版社","2016-11-11",37,"本套教程适用于有一定零基础学员。","张甲民",3,1,"9787522300232",9,0,"book.html?bid=17",2);
INSERT INTO book VALUES(NULL,"泰语","img/list/yuyan/taiyu.jpg","上海交通大学出版社","2015-10-09",38,"本套教程适用于有一定零基础入门学习。","郑焕升",3,1,"9783476597814",9,0,"book.html?bid=18",1);

INSERT INTO book VALUES(NULL,"量子力学","img/list/wuli/wuli1.jpg","科学出版社","2013-12-01",57,"本书是为物理学专业与应用物理专业本科生学习量子力学课程而编写的，也可以作为理工科其他专业的学生学习量子力学的主要参考书。","曾谨言",3,1,"9789809012784",10,0,"book.html?bid=19",5);
INSERT INTO book VALUES(NULL,"物理学基础","img/list/wuli/wuli2.jpg","机械工业出版社","2013-01-01",29.9,"本教材最大的特点是，以鲜活的例子激发学生的学习兴趣，一步一步地引导学生掌握知识，提高学生应用物理知识的能力。","张三慧",3,1,"9787111157151",10,0,"book.html?bid=20",15);

INSERT INTO book VALUES(NULL,"结构化学基础","img/list/wuli/huaxue1.jpg","北京大学出版社","2014-02-01",38,"《结构化学基础》可供三年制师范专科学校和相应的大专院校使用。","周公度",3,1,"9787301057735",11,0,"book.html?bid=21",25);
INSERT INTO book VALUES(NULL,"有机化学","img/list/wuli/huaxue2.jpg","北京大学出版社","2018-04-01",27,"全书涵盖了有机化学的主要知识领域，同时添加了有机化学领域的新成果。","裴伟伟",3,1,"9787122019035",11,0,"book.html?bid=22",50);

INSERT INTO book VALUES(NULL,"高中生物基础知识","img/list/wuli/shengwu4.jpg","希望出版社","2018-03-1",39.8,"速查速记 考试必备 简明高效","薛金星",3,1,"9787895640101",12,0,"book.html?bid=23",15);
INSERT INTO book VALUES(NULL,"缤纷的生命","img/list/wuli/shengwu2.jpg","人民邮电出版社","2014-12-11",42.9,"《缤纷的生命》，仿佛经历一场生命的大冒险。","爱德华.威尔逊",3,1,"	9787508653495",12,0,"book.html?bid=24",1);

INSERT INTO book VALUES(NULL,"什么是数学","img/list/shuxue/1.jpg","复旦大学出版社","2013-10-13",65,"本书是世界著名的数学科普读物，它搜集了许多经典的数学珍品，对整个数学领域中的基本概念与方法，做了精深而生动的阐述。","R·柯朗 H·罗宾",3,1,"9787309086232",13,0,"book.html?bid=25",5);
INSERT INTO book VALUES(NULL,"微积分","img/list/shuxue/5.jpg","人民邮电出版社","2010-08-01",83,"本书阐述了求解微积分的技巧, 详细讲解了微积分基础、极限、连续、微分、导数的应用、积分、无穷级数、泰勒级数与幂级数等内容，旨在教会读者如何思考问题从而找到解题 所需的知识点, 着重训练大家自己解答问题的能力。","李建军",3,1,"9787309058333",13,0,"book.html?bid=26",100);

INSERT INTO book VALUES(NULL,"素描","img/list/meishu/meishu6.jpg","人民邮电出版社","2010-9-13",24,"写给绘画爱好者的素描必备基础书","张玉红",3,1,"9787356987514",14,0,"book.html?bid=27",3);
INSERT INTO book VALUES(NULL,"世界美术名作20讲","img/list/meishu/meishu3.jpg","人民教育出版社","2016-07-01",32,"抽象的美,在于寻找","傅雷",3,1,"9787356987431",14,0,"book.html?bid=28",5);

INSERT INTO book VALUES(NULL,"印了笔记六线琴谱","img/list/yin mei/yinle2.jpg","安徽文艺出版社","2010-05-21",21,"学好音乐须学好琴谱","刘小瑛",3,1,"9784537890135",15,0,"book.html?bid=29",4);
INSERT INTO book VALUES(NULL,"钢琴集","img/list/yin mei/yinle3.jpg","湖南出版社","2013-07-01",57,"号弹,顺手的原版流行钢琴曲","李雄","3",1,"9785506208521",15,0,"book.html?bid=30",5);

INSERT INTO book VALUES(NULL,"粗糙食堂","img/list/meishi/cucaoshitang2.jpg","人民邮电出版社社","2017-09-08",24,"厨具不丰富,味道不稀奇","连小兔",3,1,"9788905467534",16,0,"book.html?bid=31",1);
INSERT INTO book VALUES(NULL,"烘焙","img/list/meishi/hongbei.jpg","安徽文艺出版","2018-01-21",24,"散发着爱的香醇与生命的喜悦","坨坨妈",3,1,"9784567321568",16,0,"book.html?bid=32",1);

INSERT INTO book VALUES(NULL,"特别关注","img/list/zazhi/tebieguanzhu.jpg","中国邮政出版社","2019-05-01",5,"温度,深度","李佳",3,1,"KD-2",17,0,"book.html?bid=33",10);
INSERT INTO book VALUES(NULL,"生活周刊","img/list/zazhi/shenghuozhoukan4.jpg","二十一世纪出版社","2019-05-18",5,"寻找一杯号咖啡","李雄",3,1,"KD-3",17,0,"book.html?bid=34",15);

/*首页轮播的书籍*/

INSERT INTO book VALUES(NULL,"中国抗日战争全纪录","img/index/3.jpg","二十一世纪出版社","2015-06-01",30,"作者长期从事中国现代史和抗日战争史的研究，搜集了大量宝贵而罕见的文字和图片资料。历经数年撰成这本编年体抗战纪实，目的就是摒除普罗大众以往对抗日战争模糊不清，甚至人为扭曲的认识，全景而形象地呈现那段血与火的过去。本书所收录的抗战照片完整且清晰，直观地展现了当年中国军人在抗日战争中英勇无畏的民族气节","李继锋",3,1,"9835612345689",2,1,"book.html?bid=35",15);

INSERT INTO book VALUES(NULL,"全民社交","img/index/4.jpg","北京联合出版社","2015-04-11",20.99,"本书用非常接地气的语言详细介绍了新媒体的是什么，新媒体如何用来赚钱。采取了使用新浪官方案例的模式，披露一些别人无法得知的数据。用政府的危机公关处理，用名企业的公关危机处理，来讲述如何把营销变成市场价值。","申晨锋",3,1,"9835612345688",17,1,"book.html?bid=36",20);

INSERT INTO book VALUES(NULL,"四个全面","img/index/5.jpg","新华出版社","2015-03-01",29.99,"“四个全面”，即全面建成小康社会、全面深化改革、全面推进依法治国、全面从严治党。本书选取新华社、人民日报等中央主流媒体的权威报道，以总论、全面建成小康社会、全面深化改革、全面推进依法治国和全面从严治党为章节，对“四个全面”进行了全面系统的深入解读。","党员干部学习读本编写组",3,1,"9835612345687",3,1,"book.html?bid=37",25);

INSERT INTO book VALUES(NULL,"移动互联网时代","img/index/6.jpg","企业管理出版社","2015-05-01",19.99,"全书讲述了移动互联网产生原因、背景与现状，并对未来的趋势做出了精准的预测。移动互联网如潮水一般席卷着世界，无论是个人还是企业，无论是我们的工作还是生活，都受其极大的影响。移动互联网已经成为全世界商业和科技创新的源泉，发展的加速器。其滂沱气势正革新着旧有的世界与秩序，成为当下时代最大的机遇与挑战。作者深入十余个当下做火爆的行业，系统而详实地讲述，移动互联网背景下个人、企业的机遇、挑战与转型升级。","易北辰",3,1,"9835612345686",17,1,"book.html?bid=38",30);

INSERT INTO book VALUES(NULL,"盐多必失","img/index/7.jpg","山西科学技术出版社","2015-01-21",55.99,"根据中国人的体质、饮食习惯、地域差异，结合现代营养学，对中国居民膳食进行了更深入更细化的阐述，分为营养膳食总则、不同人群营养膳食指南、疾病患者膳食指南三部分，分别介绍了各类食物的营养功能和正确饮食方法，针对不同的人群分别介绍了正确的饮食方式，使广大读者能够通过本书了解各类食物的营养，选择适合自己的膳食，避免因多盐等不合理膳食带来的各种疾病。","李宁",3,1,"9835612345685",1,1,"book.html?bid=39",25);

INSERT INTO book VALUES(NULL,"开着坦克去唐朝","img/index/1.jpg","宁夏人民出版社","2017-01-21",17.99,"收录了作者创作的8个中篇小说，其中既有新作《开着坦克去唐朝》、《太阳山谷》、《是谁赶走了我们的树》、《烟墩》，又有旧作《快乐人生》、《迷生》、《哨马营》、《发生在边远小镇上的幽默故事》。","葛林",3,1,"9835612345684",1,1,"book.html?bid=40",15);

INSERT INTO book VALUES(NULL,"中国自信","img/index/2.jpg","北京联合出版社","2018-01-21",17.99,"《中国自信 民族复兴大思维》从政治文化理论的维度，对当前中国人热议的民族精神话题，进行多个方面的论证和阐述，涉及政治、经济、社会、文化、民族、宗教、哲学和国际关系。作者作为著名文化评论人，文化底蕴深厚，熟悉中外人文历史，对当代中西交往关系研究颇深，针对当前国内外重大现实问题，见解独到，言之成理，也有一些可能引发争论的观点和话题。","刘仰",3,1,"9835612345682",3,1,"book.html?bid=41",50);

INSERT INTO book VALUES(NULL,"中国未来30年","img/index/8.jpg","中央编译出版社","2019-01-21",21.99,"《中国未来30年》中国改革开放30年取得了辉煌的成就，同时也遇到了一定的困难。在未来的30年，中国如何发展，成为世人瞩目的焦点，也是近年来热门的话题。中央编译出版社邀请国内外17位知名学者为中国未来的发展趋势把脉，内容涉及社会、经济、政治、文化、环境、贸易、农业等方面，为我们勾画了未来中国发展的大致轮廓，以及应该关注的问题，对读者有较大的启发。","吴敬琏",3,1,"9835612345681",3,1,"book.html?bid=42",25);

INSERT INTO book VALUES(NULL,"国学道德经典导读","img/index/9.jpg","中央编译出版社","2017-01-21",18.99,"慧与智同步开发是民族教育的根本。中华民族丢失科学创造力源泉的原因，在于丢失传统根文化中的“慧性”教育，仅进行“智性”教育，从而残缺了重要的一半。本书是国学名家熊先生近年来倾心于宏扬中华民族优秀道德根文化，着力于继承、研究传统文化宝库中的精华，凝聚、提炼出道德文化精髓——“德慧智”三个字，形成了独创性的“德慧智”教育理念和经典诵读实践的科学方法论。","熊春锦",3,1,"9835612345671",1,1,"book.html?bid=43",21);

INSERT INTO book VALUES(NULL,"人生只有一次","img/index/10.jpg","北京联合出版社","2018-09-21",25.99,"美国摩西奶奶基金会授权，摩西奶奶后人钦定译者姜雪晴翻译并亲自推荐。风靡全球、火爆网络的摩西奶奶生前经典作品首次出版，写给万千读者的治愈之作！影响马云、稻盛和夫、俞敏洪、李嘉诚、渡边淳一、梵高、村上春树等无数成功人士的根本力量。摩西奶奶说，怎样才是的一生？其实，求很简单。做你自己喜欢的事情，与你喜欢的人在一起。上帝会高兴地帮你打开幸福之门。人到底该在什么时候做什么事，并没有谁明确规定。如果我们想做，就从现在开始。","(美)摩西奶奶",3,1,"9835612345672",1,1,"book.html?bid=44",20);

#2-1图书在线状态
CREATE TABLE book_status(
	sid INT PRIMARY KEY AUTO_INCREMENT, #图书条形码
	bstatus TINYINT, #图书现状 1-在架上 0-已借出
	bid INT #外键关联图书表
);
INSERT INTO book_status VALUES(16000,1,1);
INSERT INTO book_status VALUES(NULL,0,1);
INSERT INTO book_status VALUES(NULL,1,1);

INSERT INTO book_status VALUES(16100,1,2);
INSERT INTO book_status VALUES(NULL,0,2);
INSERT INTO book_status VALUES(NULL,1,2);

INSERT INTO book_status VALUES(17000,1,3);
INSERT INTO book_status VALUES(NULL,0,3);
INSERT INTO book_status VALUES(NULL,1,3);

INSERT INTO book_status VALUES(17100,1,4);
INSERT INTO book_status VALUES(NULL,1,4);
INSERT INTO book_status VALUES(NULL,1,4);

INSERT INTO book_status VALUES(18000,1,5);
INSERT INTO book_status VALUES(NULL,0,5);
INSERT INTO book_status VALUES(NULL,1,5);

INSERT INTO book_status VALUES(18100,1,6);
INSERT INTO book_status VALUES(NULL,0,6);
INSERT INTO book_status VALUES(NULL,1,6);

INSERT INTO book_status VALUES(19000,1,7);
INSERT INTO book_status VALUES(NULL,0,7);
INSERT INTO book_status VALUES(NULL,1,7);

INSERT INTO book_status VALUES(19100,1,8);
INSERT INTO book_status VALUES(NULL,1,8);
INSERT INTO book_status VALUES(NULL,1,8);

INSERT INTO book_status VALUES(20000,1,9);
INSERT INTO book_status VALUES(NULL,1,9);
INSERT INTO book_status VALUES(NULL,1,9);

INSERT INTO book_status VALUES(20100,1,10);
INSERT INTO book_status VALUES(NULL,0,10);
INSERT INTO book_status VALUES(NULL,1,10);

INSERT INTO book_status VALUES(21000,1,11);
INSERT INTO book_status VALUES(NULL,0,11);
INSERT INTO book_status VALUES(NULL,1,11);

INSERT INTO book_status VALUES(21100,1,12);
INSERT INTO book_status VALUES(NULL,1,12);
INSERT INTO book_status VALUES(NULL,1,12);

INSERT INTO book_status VALUES(22000,1,13);
INSERT INTO book_status VALUES(NULL,0,13);
INSERT INTO book_status VALUES(NULL,1,13);

INSERT INTO book_status VALUES(22100,1,14);
INSERT INTO book_status VALUES(NULL,0,14);
INSERT INTO book_status VALUES(NULL,0,14);

INSERT INTO book_status VALUES(23000,1,15);
INSERT INTO book_status VALUES(NULL,1,15);
INSERT INTO book_status VALUES(NULL,1,15);

INSERT INTO book_status VALUES(23100,1,16);
INSERT INTO book_status VALUES(NULL,0,16);
INSERT INTO book_status VALUES(NULL,1,16);

INSERT INTO book_status VALUES(24000,1,17);
INSERT INTO book_status VALUES(NULL,0,17);
INSERT INTO book_status VALUES(NULL,1,17);

INSERT INTO book_status VALUES(24100,1,18);
INSERT INTO book_status VALUES(NULL,1,18);
INSERT INTO book_status VALUES(NULL,1,18);

INSERT INTO book_status VALUES(25000,1,19);
INSERT INTO book_status VALUES(NULL,1,19);
INSERT INTO book_status VALUES(NULL,1,19);

INSERT INTO book_status VALUES(25100,1,20);
INSERT INTO book_status VALUES(NULL,0,20);
INSERT INTO book_status VALUES(NULL,1,20);

INSERT INTO book_status VALUES(26000,1,21);
INSERT INTO book_status VALUES(NULL,1,21);
INSERT INTO book_status VALUES(NULL,1,21);

INSERT INTO book_status VALUES(26100,1,22);
INSERT INTO book_status VALUES(NULL,0,22);
INSERT INTO book_status VALUES(NULL,1,22);

INSERT INTO book_status VALUES(27000,1,23);
INSERT INTO book_status VALUES(NULL,0,23);
INSERT INTO book_status VALUES(NULL,1,23);

INSERT INTO book_status VALUES(27100,1,24);
INSERT INTO book_status VALUES(NULL,0,24);
INSERT INTO book_status VALUES(NULL,1,24);

INSERT INTO book_status VALUES(28000,1,25);
INSERT INTO book_status VALUES(NULL,0,25);
INSERT INTO book_status VALUES(NULL,1,25);

INSERT INTO book_status VALUES(28100,1,26);
INSERT INTO book_status VALUES(NULL,0,26);
INSERT INTO book_status VALUES(NULL,1,26);

INSERT INTO book_status VALUES(29000,1,27);
INSERT INTO book_status VALUES(NULL,0,27);
INSERT INTO book_status VALUES(NULL,1,27);

INSERT INTO book_status VALUES(29100,1,28);
INSERT INTO book_status VALUES(NULL,1,28);
INSERT INTO book_status VALUES(NULL,1,28);

INSERT INTO book_status VALUES(30000,1,29);
INSERT INTO book_status VALUES(NULL,0,29);
INSERT INTO book_status VALUES(NULL,1,29);

INSERT INTO book_status VALUES(30100,1,30);
INSERT INTO book_status VALUES(NULL,0,30);
INSERT INTO book_status VALUES(NULL,1,30);

INSERT INTO book_status VALUES(31000,1,31);
INSERT INTO book_status VALUES(NULL,0,31);
INSERT INTO book_status VALUES(NULL,1,31);

INSERT INTO book_status VALUES(31100,1,32);
INSERT INTO book_status VALUES(NULL,0,32);
INSERT INTO book_status VALUES(NULL,1,32);

INSERT INTO book_status VALUES(32000,1,33);
INSERT INTO book_status VALUES(NULL,0,33);
INSERT INTO book_status VALUES(NULL,1,33);

INSERT INTO book_status VALUES(32100,1,34);
INSERT INTO book_status VALUES(NULL,0,34);
INSERT INTO book_status VALUES(NULL,1,34);

INSERT INTO book_status VALUES(33000,1,35);
INSERT INTO book_status VALUES(NULL,0,35);
INSERT INTO book_status VALUES(NULL,1,35);

INSERT INTO book_status VALUES(33100,1,36);
INSERT INTO book_status VALUES(NULL,0,36);
INSERT INTO book_status VALUES(NULL,1,36);

INSERT INTO book_status VALUES(34000,1,37);
INSERT INTO book_status VALUES(NULL,0,37);
INSERT INTO book_status VALUES(NULL,1,37);

INSERT INTO book_status VALUES(34100,1,38);
INSERT INTO book_status VALUES(NULL,0,38);
INSERT INTO book_status VALUES(NULL,1,38);

INSERT INTO book_status VALUES(35000,1,39);
INSERT INTO book_status VALUES(NULL,0,39);
INSERT INTO book_status VALUES(NULL,1,39);

INSERT INTO book_status VALUES(35100,1,40);
INSERT INTO book_status VALUES(NULL,0,40);
INSERT INTO book_status VALUES(NULL,1,40);

INSERT INTO book_status VALUES(36000,1,41);
INSERT INTO book_status VALUES(NULL,0,41);
INSERT INTO book_status VALUES(NULL,1,41);

INSERT INTO book_status VALUES(36100,1,42);
INSERT INTO book_status VALUES(NULL,0,42);
INSERT INTO book_status VALUES(NULL,1,42);

INSERT INTO book_status VALUES(37000,1,43);
INSERT INTO book_status VALUES(NULL,0,43);
INSERT INTO book_status VALUES(NULL,1,43);

INSERT INTO book_status VALUES(37100,1,44);
INSERT INTO book_status VALUES(NULL,0,44);
INSERT INTO book_status VALUES(NULL,1,44);

#3用户信息表
CREATE TABLE user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(16), #用户姓名
	upwd VARCHAR(16),#用户密码 必须是6-8且包含大写字母和数字
	email VARCHAR(32), #用户邮箱
	phone VARCHAR(11), #联系方式
	sex TINYINT,  #用户性别 1-男 0-女
	age TINYINT,  #用户年龄
	status TINYINT #用户身份 1-老师 0-学生
);
INSERT INTO user VALUES(NULL,"曾子芹","1A3456","zengziqin@126.com","13135362978",0,24,0);
INSERT INTO user VALUES(NULL,"李敏","1B3456","1442184033@qq.com.com","15115756664",0,22,0);
INSERT INTO user VALUES(NULL,"文丽","1C3456","wenli@sohu.com","18773847455",1,23,0);
INSERT INTO user VALUES(NULL,"何丹","1D3456","hedan@163.com","15515767548",1,25,0);
INSERT INTO user VALUES(NULL,"徐杜娟","1E3456","983054134@qq.com","13535356785",0,21,0);
INSERT INTO user VALUES(NULL,"魏红","1F3456","weihong@hanshou.com","15815538960",1,45,1);#老师
INSERT INTO user VALUES(NULL,"江庭","1G3456","jiangting@hanshou.com","18934568934",0,43,1);#老师
INSERT INTO user VALUES(NULL,"tom","1G3456","tom@hanshou.com","18934568934",0,15,0);
INSERT INTO user VALUES(NULL,"lucy","1G3456","lucy@hanshou.com","18934568934",0,18,0);
INSERT INTO user VALUES(NULL,"lily","1G3456","lily@hanshou.com","18934568934",0,40,1);#老师
INSERT INTO user VALUES(NULL,"jerry","1G3456","jerry@hanshou.com","18934568934",0,17,0);
INSERT INTO user VALUES(NULL,"Bob","1G3456","Bob@hanshou.com","18934568934",0,18,0);

#4借阅证表
CREATE TABLE book_card(
	cid INT PRIMARY KEY AUTO_INCREMENT, #借书证id
	uid INT, #外键关联用户表
	quantity TINYINT DEFAULT 3,#用户可借书的数量,学生3本,老师5本
	credit TINYINT, #用户信誉(是否有过借书未还) 2-信誉很好 0-信誉差 1-信誉一般
	hostiry_quantity INT #历史借书数量 ,评出阅读之星的标准
);
INSERT INTO book_card VALUES(1342000,1,2,1,50);#1号用户借了1本书
INSERT INTO book_card VALUES(NULL,2,DEFAULT,1,40); 
INSERT INTO book_card VALUES(NULL,3,DEFAULT,1,30);
INSERT INTO book_card VALUES(NULL,4,DEFAULT,1,20);
INSERT INTO book_card VALUES(NULL,5,DEFAULT,1,10);
INSERT INTO book_card VALUES(NULL,6,5,1,10);#老师
INSERT INTO book_card VALUES(NULL,7,5,1,5);#老师
INSERT INTO book_card VALUES(NULL,8,DEFAULT,1,42);
INSERT INTO book_card VALUES(NULL,9,DEFAULT,1,32);
INSERT INTO book_card VALUES(NULL,10,5,1,2);#老师
INSERT INTO book_card VALUES(NULL,11,DEFAULT,1,2);
INSERT INTO book_card VALUES(NULL,12,DEFAULT,1,2);

#5图书借阅信息表
CREATE TABLE book_order(
	oid INT PRIMARY KEY AUTO_INCREMENT,
	bid INT, #外键关联图书id
	cid	INT, #外键关联借阅证id
	borrow_date VARCHAR(64), #借书日期
	back_date VARCHAR(64) #还书日期
);
INSERT INTO book_order VALUES(NULL,9,1342000,"2019-06-27","");
INSERT INTO book_order VALUES(NULL,1,1342001,"2019-01-15","2019-02-01");
INSERT INTO book_order VALUES(NULL,2,1342002,"2019-03-01","2019-03-15");
INSERT INTO book_order VALUES(NULL,1,1342003,"2019-02-26","2019-03-15");
INSERT INTO book_order VALUES(NULL,2,1342004,"2019-04-15","2019-05-01");
INSERT INTO book_order VALUES(NULL,2,1342005,"2019-05-01","2019-06-01");
INSERT INTO book_order VALUES(NULL,13,1342006,"2019-02-22","2019-03-15");

#6图书管理员信息表
CREATE TABLE manager(
	mid INT PRIMARY KEY AUTO_INCREMENT,
	mname VARCHAR(16), #管理员姓名
	tel VARCHAR(11),  #管理员办公室电话
	email VARCHAR(32), #管理员邮箱
	floor_id INT #管理员管理的楼层
);

#7首页轮播图
CREATE TABLE library_carousel(
  carousel_id INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128), #轮播图片路径
  title VARCHAR(24) #标题
);
INSERT INTO library_carousel VALUES(NULL,"img/index/banner1.jpg","轮播图1");
INSERT INTO library_carousel VALUES(NULL,"img/index/banner2.jpg","轮播图2");
INSERT INTO library_carousel VALUES(NULL,"img/index/banner3.jpg","轮播图3");

#8阅读指导
CREATE TABLE library_activity(
	aid INT PRIMARY KEY AUTO_INCREMENT,
	theme VARCHAR(64),#活动主题
	activity_time VARCHAR(32), #活动的时间
	tag TINYINT, #区分的标志 1-最新内容,2-美文共赏,3-读书活动 0-活动回顾
	activity_href VARCHAR(128), #跳转路径
	content VARCHAR(2056) #内容
);
INSERT INTO library_activity VALUES(NULL,"担心垃圾不够用","2019/1/1",1,"ReadingGuides_activity.html?aid=1","全世界都发愁垃圾太多，只有瑞典担心不够用。除了阿巴乐队，瑞典又找到了一个让自己享誉世界的理由。这个国土面积不算辽阔的北欧国家正在创造历史——与垃圾有关的历史。瑞典利用垃圾制造能源的计划取得了极大的成功，但这项成就引发了一个意料之外的麻烦：垃圾不够用了。");

INSERT INTO library_activity VALUES(NULL,"说好这些话，赢得好人缘","2019/2/1",1,"ReadingGuides_activity.html?aid=2","交代工作却不破坏对方情绪——“能不能抽空过来一下……”托付他人重任时——“有件事要拜托给你才行……”被他人表扬穿的西装很有品位，该如何回应呢？——“你的领带也相当不错嘛！”想要得到他人的好感，对其作评价时可以欲扬先抑——“做法虽然强硬，但是还算得上细致周到。”");

INSERT INTO library_activity VALUES(NULL,"不坐空桌子就餐","2019/3/1",1,"ReadingGuides_activity.html?aid=3","高中时，由于父亲投资失败，家里负债累累。为了减轻家里的负担，我在繁重的课务之余，抽时间在一家西式快餐厅兼职做服务员。有一个周末，我的同桌兼好朋友孙乾到我兼职的餐厅吃饭。孙乾本想请我一起吃，但我没时间陪他吃，因为店里的生意很好，我不能离开自己的工作岗位。见此，孙乾就一个人点了一份汉堡加可乐的套餐。");

INSERT INTO library_activity VALUES(NULL,"培育一朵自信的花儿","2019/4/1",1,"ReadingGuides_activity.html?aid=4","丫丫怕黑，不是一般的怕，即使在家里，晚上不开灯的地方她也不敢去。打小，她就生活在爸爸妈妈、姥姥姥爷的娇宠里，在家里娇气、任性；可在外面，胆小、怕事，见了生人就往大人身后躲，姥爷说她是“老鼠扛枪——窝里横”。上了小学，丫丫成绩不理想。曾有一次，数学考了98分，我这个当爸爸的还挺得意，自豪地拍拍她的小脑袋，大声地鼓励道：“不错，我女儿真棒！”哪知她用更大的声音说：“不错什么呀，老师说98分是倒数第七名！”");

INSERT INTO library_activity VALUES(NULL,"让剑拔弩张消弭于人情味中","2019/5/1",1,"ReadingGuides_activity.html?aid=5","《鲁豫有约》的录制时间是下午两点，但有一段时间，总是迟迟不能开始录制。陈鲁豫对此很是恼火。一天，陈鲁豫化好了妆，可等了一个小时还是无法开始。原来是编导在公司编辑节目中要放的片子，还没弄完。当编导匆忙赶到后，火冒三丈的陈鲁豫严厉地问：“为什么迟到？你知道全场有多少观众在等着你吗？你知道所有工种都在等着你吗？为什么不能准时把自己该做的工作做完！”编导被批评得无话可说，甚至留下了眼泪。这时，陈鲁豫语气也温和了下来，说：“我刚才的话确实有些过于严厉了，请你谅解。我能理解，现在节目组人员少，任务重，你一个人承担那么大的工作量，确实为难你了。不过无论如何，哪怕我们再累一些，也不应该让那么多观众等着我们，你说是吗？”编导听后，认真地点点头。她不但没有因此而记恨陈鲁豫，反而觉得陈鲁豫是一位能理解下属的好领导，从此工作更加认真了，再也没有迟到过。");

INSERT INTO library_activity VALUES(NULL,"土豆是怎样流行的","2018/1/1",2,"ReadingGuides_activity.html?aid=6","18世纪前，大多数欧洲人认为土豆有毒，食用后将危及生命。法国著名农学家巴曼奇在德国一个村落考察时，无意中品尝到用土豆做成的面包，觉得味道很不错，而且了解到当地种植土豆有200多年历史。土豆营养价值高、产量大且适种性强，于是巴曼奇计划回国以后推广种植。巴曼奇带着一些土豆块茎在家乡热心地向人们宣传，并打算免费派发给农民种植。可不论他怎么说，周围的人都不相信。大家都认为这种奇形怪状的家伙会损害健康，甚至会让土地变得“寸草不生”。不得已，巴曼奇开出高价，悬赏第一个愿意种植土豆的农民。尽管奖金一天天上涨，依旧没有人敢于尝试，大家越发担心种下土豆会惹祸上身。");

INSERT INTO library_activity VALUES(NULL,"洗手间里消消气","2018/2/1",2,"ReadingGuides_activity.html?aid=7","我和老公结婚前约法三章，其中一条就是有话好好说。等真正走进围城之后，我才发现，这个约定简直幼稚得可笑。我们之间的第一次大战，起因是让他洗碗。那天，我在公司被领导批评，回家忍住委屈、做好晚饭。吃饭的时候，我说：“今天你洗碗吧”。他嘴上说好，吃完饭后就窝在沙发上看球赛。我强压住怒火，又催了他一遍，这次他居然很不耐烦地说，“回家看个球赛都不得安生，你洗个碗就会少块肉啊！”这句话彻底激怒了我，我数落他：“咱俩白天都要上班，我挣的钱不比你少。凭什么你每天吃现成的，叫你洗次碗你竟然跟我嚷嚷？”老公嘟噜了一句“毛病”，继续看电视。我的火气又升一级。一想到下半辈子要与这样一个男人度过，我解下围裙，朝沙发上用力一摔，冲进洗手间哭了起来。");

INSERT INTO library_activity VALUES(NULL,"浇灌对方的瓜田","2018/3/1",2,"ReadingGuides_activity.html?aid=8","梁国和楚国相邻，两国都出产瓜。梁国人很勤劳，经常浇灌他们的瓜田，瓜长得又大又甜。楚国人懒惰，很少浇灌他们的瓜田，瓜长得都不好看，也不好吃。楚国人嫉妒梁国的瓜种得好，常在夜里破坏梁国的瓜田，给梁国造成了不少损失。梁国人有些气愤，请求梁王允许他们也去破坏对方的瓜田。梁王说：“彼此结怨，如何能了？何必心胸狭窄到如此程度呢？”他命令士兵每晚偷偷地去浇灌楚国的瓜田。楚国人十分惊讶，有人浇灌自己的瓜田，后来才知道是梁人所为。楚地的县令将此事告诉了楚王，楚王感到很惭愧，并称赞梁人的做法。从此两国结下了深厚的情谊。人们都向往和谐的人际关系，遇到纠葛时，学学古人，为对方的“瓜田”浇浇水吧。");

INSERT INTO library_activity VALUES(NULL,"好婚姻吵出来","2018/4/1",2,"ReadingGuides_activity.html?aid=9","我和徐扬带着好奇与体验的心态去见珍妮·弗丝——一位42岁的美国女士。她从事家庭顾问工作已经有十年了，而且在蒙特利尔的Hoklon街道，大家都认为珍妮的工作很重要，在这里，她的办公室也被大家称为“幸福开始的地方”。第一次去见珍妮，当我和徐扬各自陈述完对对方的不满时，珍妮居然开心地对我们说：“其实意见不合的婚姻并没有你们想象的那么糟糕，这意味着你们对生活有更高的要求与愿望，并希望对方更好，所以，要坚持吵下去……”面对我们的错愕，珍妮笑得更开心了，她接着说：“不过，吵的形式需要变一下，否则吵着就没了新意，没新意就不爱吵了。”");

INSERT INTO library_activity VALUES(NULL,"让孩子成为他自己","2018/5/1",2,"ReadingGuides_activity.html?aid=10","孩子是完整的，而父母的头脑和我们的社会准则会强行将他分裂成两部分——好和坏。我们只能接受我们认为孩子好的那一面，无法接受孩子另外一面。在孩子刚刚懂事的时候，我们就开始用各种手段“教育”他，假如孩子做到了我们期望的，就开心、表扬、给予奖励；反之，则惩罚、制止甚至责骂。简单地用“好”和“坏”定性和评价孩子的表现，是我们的认识过于片面。好和坏是价值观和道德层面的范围，远远无法涵盖孩子丰富又细腻的世界。家长不要在幼儿阶段就给孩子套上道德观，否则会让孩子变得压抑，使他陷入内心真正需求和家长标准之间的矛盾中，无法发展出健全、完善的人格。");

INSERT INTO library_activity VALUES(NULL,"只有中国人在玩命","2018/6/1",2,"ReadingGuides_activity.html?aid=11","我听一个从欧洲回来的领导跟我说起这样一件事。十几年前，意大利的一个小镇上一共有两万居民。后来，有两个中国人移民过去，在这个小镇开了一家饭馆，生意挺红火。于是，亲朋好友陆续移民到这个小镇，开洗衣店、开小超市，做各种生意。现在这个小镇还是两万居民，不过全都是中国人——意大利人一个都呆不下去，他们的工作机会和生意都被中国人抢走了。意大利人每天都睡到快中午才开店，晚上又早早打烊享受个人时光，而中国人早上六点就起床，一直到晚上十二点都不休息，意大利人怎么拼得过中国人？所以最后，只有中国人留下来。每当听到这种故事，我就想，我们中国人为什么总是活的这么辛苦呢？");


INSERT INTO library_activity VALUES(NULL,"心灵驿站","2019/9/1",3,"ReadingGuides_activity.html?aid=12","img/index/xinling.PNG");
INSERT INTO library_activity VALUES(NULL,"创想汇","2019/10/1",3,"ReadingGuides_activity.html?aid=13","img/index/activity2.png");
INSERT INTO library_activity VALUES(NULL,"星期讲座","2019/11/1",3,"ReadingGuides_activity.html?aid=14","img/index/xingqi.PNG");
INSERT INTO library_activity VALUES(NULL,"英语沙龙","2019/12/1",3,"ReadingGuides_activity.html?aid=15","img/index/shalong.PNG");

INSERT INTO library_activity VALUES(NULL,"小图书馆员职业体验","2019/6/1",0,"ReadingGuides_activity.html?aid=16","img/index/zhiye.jpg");
INSERT INTO library_activity VALUES(NULL,"亲子Fun读英文","2019/7/1",0,"ReadingGuides_activity.html?aid=17","img/index/qinzi.PNG");
INSERT INTO library_activity VALUES(NULL,"谈谈都市人的睡眠问题","2019/7/15",0,"ReadingGuides_activity.html?aid=18","img/index/jiankang.PNG");
INSERT INTO library_activity VALUES(NULL,"视障读者服务项目","2019/6/15",0,"ReadingGuides_activity.html?aid=19","img/index/shitu.PNG");
