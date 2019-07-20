const express=require("express");
var server=express();
//监听端口
server.listen(8080);
//挂载静态资源
server.use(express.static("public"));
//引入第三方模块cors
const cors=require("cors");

//引入第三方模块
const bodyParser=require("body-parser");
//挂载第三方模块
server.use(bodyParser.urlencoded({
	extended:false
}));
//1引入首页路由器模块
const indexRouter=require("./routes/index.js");
//挂载路由
server.use("/index",indexRouter)

//2引入用户路由器模块
const userRouter=require("./routes/user.js");
//挂载路由
server.use("/user",userRouter)