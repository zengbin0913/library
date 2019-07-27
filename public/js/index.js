//1轮播图
$(function(){
	$.ajax({
		url:"http://127.0.0.1:8080/carousel/v1/carousel",
		type:"get",
		datatype:"json",
		success(result){
			html="";
			for(var ban of result)
				html+=`<li><img src="${ban.img}"></li>`;
			$("#ul-imgs").prepend(html);
		}
	})
});
//2登录模块
$(function(){
	//单击登录按钮
	$("#login").click(function(){
		var uname=$("#uname").val();
		var upwd=$("#upwd").val();
		$.ajax({
			url:"http://127.0.0.1:8080/user/v1/login/"+`${uname}&${upwd}`,
			type:"get",
			datatype:"json",
			success:function(result){
				if(result.code==200 && $("#u_name").prop("checked")==true){//用户密码正确
					$("#login-library").removeClass("d-none");//提示
					$("#sure").click(function(){//当点击提示按钮的确认后
					  $("#login-library").addClass("d-none");//提示按钮消失
					  $(".logon_content").html(`<h3 class="text-danger pl-2">${uname}</h3>   
						                        <h5 class="text-center">欢迎您登录汉寿一中图书馆!!</h5>
											    <p class="">
						                          <a class="btn btn-primary" href="personal_center.html">进入个人中心</a>
												  <a class="btn btn-danger ml-2" href="index.html">注销</a>
						                        </p>`);//登录的内容变化
					});
					$(window).click(function(){//当点击其它的地方时
						$("#login-library").addClass("d-none");
					});
				}
				else {//用户密码错误
					$("#login-library").removeClass("d-none");//提示
					$("#login-library>p").html("用户名或密码错误");//提示信息变更
					$("#login-library>a").attr("href","javascript:;");//跳转地址变更
					$(window).click(function(){//当点击其它的地方时
						$("#login-library").addClass("d-none");
					});
				}
			}
		})
	})
	//单击取消按钮
	$("#cancel").click(function(){
		$("#uname").val("");upwd=$("#upwd").val("");
	})	
});
//3阅读之星模块
$(function(){
	$.ajax({
		url:"http://127.0.0.1:8080/user/v1/book_quantity_list",
		type:"get",
		datatype:"json",
		success(result){
			var $html="";
			for(var i=0;i<6;i++){
				var {uname,hostiry_quantity}=result[i];
					$html+=`<li class="d-flex mb-1">
						<div class="w-30 px-1">${uname}</div>
						<div clas="w-70">`;
					for(var j=0;j<parseInt(hostiry_quantity/10);j++)
						$html+=`<img src="img/index/Star.gif">`;
					$html+=`</div></li>`;							
			}
			$("#book_quantity").prepend($html);//整体加到父元素之前
		}
	})
});
//4书籍轮播图
$(function(){
	$.ajax({
		url:"http://127.0.0.1:8080/book/v1/book_carousel",
		type:"get",
		datatype:"json",
		success(result){
			var html="";
			for(var i=0;i<result.length;i++)
				html+=`<li><a href="${result[i].href}"><img src="${result[i].pic}" class="pb-1"><br>${result[i].bname}</a></li>`;
			$("#ul-imgss").html(html)
		}
	})
});
//5活动
$(function(){
	$.ajax({
		url:"http://127.0.0.1:8080/activity/v1/new_activity_list",
		type:"get",
		datatype:"json",
		success(result){
			var html="",html2="";
			var count=0,count1=0;
			for(var i=0;i<result.length;i++){
				if(result[i].tag==3 && count!=3){//读书活动
					html+=`<li class="mb-1"><a href="${result[i].activity_href}">${result[i].theme}...</a></li>`;
					count++;
				}
				if(result[i].tag==0 && count1!=3){//读书活动
					html2+=`<li class="mb-1"><a href="${result[i].activity_href}">${result[i].theme}...</a></li>`;
					count1++;
				}
			}
			$("#p_activity").prepend(html);
			$("#e_activity").prepend(html2);
		}
	})
})
