const express=require("express");
const pool=require("../pool.js");
//创建活动路由器
var activity=express.Router();
//1阅读指导-活动
activity.get("/v1/new_activity_list",(req,res)=>{
	var sql=`select * from library_activity`;
	pool.query(sql,(err,result)=>{
		if(err)throw err;
		if(result.length>0) res.send(result);
	})
});
//2阅读指导-活动详情查询
activity.get("/v1/new_activity_details/:aid",(req,res)=>{
	var obj=req.params;
	var sql=`select * from library_activity where aid=?`;
	pool.query(sql,[obj.aid],(err,result)=>{
		if(err)throw err;
		if(result.length>0) res.send(result);
	})
});
module.exports=activity;
