const express=require("express");
var server=express();
//监听端口
server.listen(8080);
//挂载静态资源
server.use(express.static("public"));
//引入模块cors
const cors=require("cors");
server.use(cors({
	origin:"http://127.0.0.1:5500"
}));
//引入第三方模块
const bodyParser=require("body-parser");
//挂载第三方模块
server.use(bodyParser.urlencoded({
	extended:false
}));
//引入模块express-session,cookie-parser
const session=require("express-session");
const cookieParser=require("cookie-parser");
//挂载模块
server.use(cookieParser());
server.use(session({
	secret:"12345",   
    resave:true,           
    saveUninitialized:true  
}));



//2引入轮播图路由器模块
const carouselRouter=require("./routes/carousel.js");
//挂载路由
server.use("/carousel",carouselRouter);

//3引入用户路由器模块
const userRouter=require("./routes/user.js");
//挂载路由
server.use("/user",userRouter);

//4引入书籍路由器模块
const bookRouter=require("./routes/book.js");
//挂载路由
server.use("/book",bookRouter);

//5引入活动路由器模块
const activityRouter=require("./routes/activity.js");
//挂载路由
server.use("/activity",activityRouter);