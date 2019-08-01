//书籍轮播--跳转
$(function(){
	var bid=location.search.split("=")[1];
	if(bid){
		$.ajax({
			url:"http://127.0.0.1:8080/book/v1/book_details/"+`${bid}`,
			type:"get",
			datatype:"json",
			success(result){
				var b=result[0];
				var {bname,pic,publish,publish_time,details,author}=b;
				var html="";
				html+=`<tr>
					<td rowspan="6" class="text-center"><img src="${pic}" class="py-2"></td>
					<td>${bname}</td>
				</tr>
				<tr><td>作者：${author}</td></tr>
				<tr>
					<td>出版社：${publish}</td>
				</tr>
				<tr><td>出版时间：${publish_time}</td></tr>
				<tr><td>页数：未知</td></tr>
				<tr><td>版次：未知</td></tr>
			    <tr><td colspan="2" class="py-2">${details}</td></tr>
				<tr><td colspan="2" class="text-center"><a href="javascript:;">图书预约</a></tr>
				`;
				$("title").html(`好书推荐-${bname}`)
				$("#detail").html(html);
				$("#detail a").click(function(){
					$.ajax({
						url:"http://127.0.0.1:8080/user/session",
						type:"get",
						datatype:"json",
						success(result){
							if(result.user!=undefined &&result.user!=""){
								alert("预约成功")
							}
							else alert("尚未登录")
						}
					})
				})
			}
		})
	}
});

//书籍在线状态
$(function(){
	var bid=location.search.split("=")[1];
	if(bid){
		$.ajax({
			url:"http://127.0.0.1:8080/book/v1/book_status/"+`${bid}`,
			type:"get",
			datatype:"json",
			success(result){
				for(var i=0,html="";i<result.length;i++)
				{
					var {sid,bstatus,ISBN,floor_id}=result[i];
					bstatus==1?bstatus="在架上":bstatus="已借出";
					html+=`<tr>
							<td>${floor_id}室</td>
							<td>${ISBN}</td>
							<td>${sid}</td>
							<td>${bstatus}</td>
				    </tr> `;
				}
				$("#status").html(html);
			}
		})
	}
});