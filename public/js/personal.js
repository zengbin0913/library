$(function(){
	$.ajax({
		url:"http://127.0.0.1:8080/user/session",
		type:"get",
		datatype:"json",
		success(result){	
			if(result.user!=undefined &&result.user!=""){
				var uname=result.user.uname;
				$("#personal").addClass("hide");
				$.ajax({
					url:"http://127.0.0.1:8080/user/v1/book_order_information/"+`${uname}`,
					type:"get",
					datatype:"json",
					success:function(result){
						var {uname,sex,email,status,phone}=result[2][0];
						sex=(sex==1?"男":"女");
						status=(status==1?"老师":"学生")
						$("#personal1").removeClass("hide");
						var html=""; //用户基本信息
						html=`<tr><td>姓名：</td><td>${uname}</td></tr>
							  <tr><td>性别：</td><td>${sex}</td></tr>
							  <tr><td>身份：</td><td>${status}</td></tr>
							  <tr><td>邮箱：</td><td>${email}</td></tr>
							  <tr><td>联系方式：</td><td>${phone}</td></tr>`;
						$("#base_information").html(html);
						var {bname,author}=result[0][0];
						var {borrow_date,back_date}=result[1][0]
						html=`<tr>//用户借阅信息
								<td>${bname}</td>
								<td>${author}</td>
								<td>${borrow_date}</td>
								<td>${back_date}</td>
							</tr>`;
						$("#book_order_information").html(html);
					}
				})
			}	
		}
	})
});