const express=require("express");
const pool=require("../pool.js");
//创建书籍路由器
var book=express.Router();

//1书籍轮播图
book.get("/v1/book_carousel",(req,res)=>{
	var sql=`select bname,pic,href from book where seq_recommended=1`;
	pool.query(sql,(err,result)=>{
		if(err)throw err;
		if(result.length>0) res.send(result);
	})
});
//2书籍详情
book.get("/v1/book_details/:bid",(req,res)=>{
	var obj=req.params;
	var sql=`select * from book where bid=?`;
	pool.query(sql,[obj.bid],(err,result)=>{
		if(err)throw err;
		if(result.length>0) res.send(result);
	})
});
//3书籍在线状态查询
book.get("/v1/book_status/:bid",(req,res)=>{
	var obj=req.params;
	var sql=`select sid,bstatus,ISBN,floor_id from book_status,book,book_family where book_status.bid=book.bid and book_family.fid=book.fid and book.bid=?`;
	pool.query(sql,[obj.bid],(err,result)=>{
		if(err)throw err;
		if(result.length>0) res.send(result);
	})
});
//4所有书籍列表
book.get("/v1/book_list",(req,res)=>{
	var sql=`select * from book`;
	pool.query(sql,(err,result)=>{
		if(err)throw err;
		if(result.length>0) res.send(result);
	})
});
//4借阅排行
book.get("/v1/book_total",(req,res)=>{
	var sql=`select * from book order by total desc`;
	pool.query(sql,(err,result)=>{
		if(err)throw err;
		if(result.length>0) res.send(result);
	})
});
//5借阅排行详情
book.get("/v1/book_details_total/:bname",(req,res)=>{
	var obj=req.params;
	var sql=`select * from book where bname=?`;
	pool.query(sql,[obj.bname],(err,result)=>{
		if(err)throw err;
		if(result.length>0) res.send(result);
		else res.send({code:301,msg:"暂无图书信息"});
	})
});
//6分类查询
book.get("/v1/book_type/:cname",(req,res)=>{
	var obj=req.params;
	var sql=`select * from book where book.fid=(select fid from book_family where cname=?)`;
	pool.query(sql,[obj.cname],(err,result)=>{
		if(err)throw err;
		if(result.length>0) res.send(result);
	})
});
module.exports=book;