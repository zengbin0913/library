//1阅读之星列表整体
$(function(){
	$.ajax({
		url:"http://127.0.0.1:8080/user/v1/book_quantity_list",
		type:"get",
		datatype:"json",
		success(result){
			var count=5;
			var current=1;
			var maxpno=Math.ceil(result.length/count);
			var maxpnohtml=`第${current}页/共${maxpno}页`;
			$("#maxpno").html(maxpnohtml);
			for(var i=(current-1)*count,html="";i<current*count;i++){ //默认
				var {cid,uname,status,hostiry_quantity}=result[i];
				status==1?status="老师":status="学生";
				html+=`<tr>
					<td>${cid}</td>
					<td>${uname}</td>
					<td>${status}</td>
					<td>${hostiry_quantity}</td>
				</tr>`;	
			}
			$("#readers").html(html);
			
			if(maxpno<2) {//当只有一页时,下一页按钮禁用
				$("#nextpage").prop("disabled",true);
				$("#lastpage").prop("disabled",true);
			}
			
			if(current==1){
				$("#prepage").prop("disabled",true);//开始状态
				$("#firstpage").prop("disabled",true);
			} 

			var $ul=$("#page");
			$ul.click(function(e){
				$btn=$(e.target);
				$btn.addClass("active");//当前选中
				$btn.parent().siblings().children().removeClass("active");//其余不选中
				var selected=$btn.attr("value");
				
				if(selected=="-1"){ //上一页
					current--;
					$("#nextpage").prop("disabled",false);
					$("#lastpage").prop("disabled",false);
					if(current==1){
						$("#prepage").prop("disabled",true);
						$("#firstpage").prop("disabled",true);
					}
					maxpnohtml=`第${current}页/共${maxpno}页`;
					$("#maxpno").html(maxpnohtml);
				}
				if(selected=="1") {//下一页
					current++; 
					$("#prepage").prop("disabled",false);
					$("#firstpage").prop("disabled",false);
					if(current==maxpno){
						$("#nextpage").prop("disabled",true);
						$("#lastpage").prop("disabled",true);
					}
					maxpnohtml=`第${current}页/共${maxpno}页`;
					$("#maxpno").html(maxpnohtml);
				}
				if(selected=="0") {//首页
					current=1;
					$("#nextpage").prop("disabled",false);
					$("#lastpage").prop("disabled",false);
					$("#prepage").prop("disabled",true);
					$("#firstpage").prop("disabled",true);
					maxpnohtml=`第${current}页/共${maxpno}页`;
					$("#maxpno").html(maxpnohtml);
				}
				if(selected=="100") { //尾页
					current=maxpno;
					$("#prepage").prop("disabled",false);
					$("#firstpage").prop("disabled",false);
					$("#nextpage").prop("disabled",true);
					$("#lastpage").prop("disabled",true);
					maxpnohtml=`第${current}页/共${maxpno}页`;
					$("#maxpno").html(maxpnohtml);
				}				

				if(current*count>result.length)
				{	for(var j=(current-1)*count,html="";j<result.length;j++){
						var {cid,uname,status,hostiry_quantity}=result[j];
						status==1?status="老师":status="学生";
						html+=`<tr>
							<td>${cid}</td>
							<td>${uname}</td>
							<td>${status}</td>
							<td>${hostiry_quantity}</td>
						</tr>`;	
					}
					$("#readers").html(html);
				}
				else{
					for(var j=(current-1)*count,html="";j<current*count;j++){
						var {cid,uname,status,hostiry_quantity}=result[j];
						status==1?status="老师":status="学生";
						html+=`<tr>
							<td>${cid}</td>
							<td>${uname}</td>
							<td>${status}</td>
							<td>${hostiry_quantity}</td>
						</tr>`;	
					}
					$("#readers").html(html);
				}
			});	
		}
	})
});

//2用户单独检索查询
$(function(){	
	$("#selected").click(function(){
		var uname=$("#uname").val();
		$.ajax({
			url:"http://127.0.0.1:8080/user/v1/book_quantity_select/"+uname,
			type:"get",
			datatype:"json",
			success(result){
				var html="";
				if(result.length!=undefined){
					var [student]=result;
					var {cid,uname,status,hostiry_quantity}=student;
					status==1?status="老师":status="学生";
					html+=`<tr>
						<td>${cid}</td>
						<td>${uname}</td>
						<td>${status}</td>
						<td>${hostiry_quantity}</td>
					</tr>`;	
					$("#readers").html(html);
				}else{
					html+=`<tr><td colspan="4">${result.msg}</td></tr>`;
					$("#readers").html(html);
				}
			}
		})
	})
});

//3借阅排行
$(function(){	
	$.ajax({
		url:"http://127.0.0.1:8080/book/v1/book_total",
		type:"get",
		datatype:"json",
		success(result){
			for(var i=0,html="";i<5;i++)
			{
				html+=`<tr>
						<td>${result[i].bname}</td>
						<td>${result[i].author}著</td>
						<td>${result[i].ISBN}</td>
						<td>${result[i].publish}</td>
						<td>${result[i].publish_time}</td>
						<td>${result[i].total}</td>
					</tr> `;
			}
			$("#book_total").html(html);
		}
	})
});

//4书籍单独检索借阅总数
$(function(){	
	$("#sel").click(function(){
		var bname=$("#bname").val();
		$.ajax({
			url:"http://127.0.0.1:8080/book/v1/book_details_total/"+bname,
			type:"get",
			datatype:"json",
			success(result){
				var html="";
				if(result.length!=undefined)
				{	html+=`<tr>
						<td>${result[0].bname}</td>
						<td>${result[0].author}著</td>
						<td>${result[0].ISBN}</td>
						<td>${result[0].publish}</td>
						<td>${result[0].publish_time}</td>
						<td>${result[0].total}</td>
					</tr> `;	
					$("#book_total").html(html);
				}
				else {
					html+=`<tr><td colspan="6">${result.msg}</td></tr> `
					$("#book_total").html(html);
				}
			}
		})
	})
});


