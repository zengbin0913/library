const express=require("express");
const pool=require("../pool.js");
//创建用户路由器
var carousel=express.Router();
//获得轮播图的图片个数和张数
carousel.get("/v1/carousel",(req,res)=>{	
	var sql=`select carousel_id,img,title from library_carousel`;
	pool.query(sql,(err,result)=>{
		if(err)throw err;
		res.send(result);
	})
});
module.exports=carousel;