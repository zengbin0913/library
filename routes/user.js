const express=require("express");
const pool=require("../pool.js");
//创建用户路由器
var user=express.Router();
//1用户注册
user.post("/v1/reg",(req,res)=>{
	var obj=req.body;
	var sql=`insert into user set ?`;
	pool.query(sql,[obj],(err,result)=>{
		if(err)throw err;
		if(result.affectedRows>0) res.send({code:200,msg:"注册成功"});
		else res.send({code:301,msg:"注册失败"});
	});
});
//2用户登录
user.get("/v1/login/:uname&:upwd",(req,res)=>{
	var obj=req.params;
	var sql=`select uname from user where uname=? and binary upwd=?`
	pool.query(sql,[obj.uname,obj.upwd],(err,result)=>{
		if(err)throw err;
		if(result.length>0)res.send({code:200,msg:"登录成功"});
		else res.send({code:301,msg:"登录失败"});
	});
});
//3用户修改
user.put("/v1/update",(req,res)=>{
	var obj=req.body;
	var sql=`update user set uname=?,upwd=?,email=?,phone=?,sex=?,age=?,status=? where uid=?`;
	pool.query(sql,[obj.uname,obj.upwd,obj.email,obj.phone,obj.sex,obj.age,obj.status,obj.uid],(err,result)=>{
		if(err)throw err;
		if(result.affectedRows>0) res.send({code:200,msg:"修改成功"});
		else res.send({code:301,msg:"修改失败"});
	});
})
//4用户列表查询
user.get("/v1/list",(req,res)=>{
	var obj=req.query;
	obj.pno=parseInt(obj.pno);//页码
	obj.pagesize=parseInt(obj.pagesize);//页面数量

	if(!obj.pno)obj.pno=1;
	if(!obj.pagesize)obj.pagesize=5;
	var start=(obj.pno-1)*obj.pagesize;

	var sql=`select uid,uname,upwd,email,phone,sex,age,status from user limit ?,?`;
	pool.query(sql,[start,obj.pagesize],(err,result)=>{
		if(err)throw err;
		res.send(result);
	})
});
//5用户删除
user.delete("/v1/delete/:uid",(req,res)=>{
	var obj=req.params;
	var sql=`delete from user where uid=?`;
	pool.query(sql,[obj.uid],(err,result)=>{
		if(err)throw err;
		if(result.affectedRows>0) res.send({code:200,msg:"删除成功"});
		else res.send({code:301,msg:"删除失败"});
	});
});
//6查询用户名是否存在
user.get("/v1/seluname/:uname",(req,res)=>{
	var obj=req.params;
	pool.query(`SELECT uname FROM user WHERE uname=?`,[obj.uname],(err,result)=>{
		if(err)throw err;
		if(result.length>0)
			res.send({code:301,msg:"用户名已存在"});
		else res.send({code:200,msg:"用户名可用"});
	});
});
//7用户检索
user.get("/v1/select/:uid",(req,res)=>{
	var obj=req.params;
	pool.query(`SELECT uname,email,phone,sex,age,status FROM user WHERE uid=?`,[obj.uid],(err,result)=>{
		if(err)throw err;
		if(result.length>0)
			res.send(result);
		else res.send({code:301,msg:"查询失败"});//没查到
	});
});
//8用户列表历史借书数量接口---阅读之星
user.get("/v1/book_quantity_list",(req,res)=>{
	var sql=`select cid,uname,hostiry_quantity,status from book_card,user where book_card.uid=user.uid order by hostiry_quantity desc`;
	pool.query(sql,(err,result)=>{
		if(err)throw err;
		res.send(result);
	})
});
//9用户检索历史借书数量查询
user.get("/v1/book_quantity_select/:uname",(req,res)=>{
	var obj=req.params;
	var sql=`select cid,uname,hostiry_quantity,status from book_card,user where book_card.uid=(select uid from user where uname=?) and book_card.uid=user.uid`;
	pool.query(sql,[obj.uname],(err,result)=>{
		if(err)throw err;
		if(result.length>0)res.send(result);
		else res.send({code:301,msg:"暂无此用户借阅信息"});
	})
});
module.exports=user;