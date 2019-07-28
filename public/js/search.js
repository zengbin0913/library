//图书查询
$(function(){
	$.ajax({
		url:"http://127.0.0.1:8080/book/v1/book_list",
		type:"get",
		datatype:"json",
		success(result){
			(function(){//1所有书籍列表
				var count=5;//每页默认5条数据
				var current=1;//当前页
				var maxpno=Math.ceil(result.length/count);
				for(var i=(current-1)*count,html="";i<current*count;i++){ //默认--第一页
					html+=`<tr>
						<td><a href="${result[i].href}">${result[i].bname}</a></td>
						<td>${result[i].author}</td>
						<td>${result[i].ISBN}</td>
						<td>${result[i].publish}</td>
						<td>${result[i].publish_time}</td>
					</tr>`;	
				}
				$("#blist").html(html);
				//页码按钮
				for(var i=1,html1="";i<=maxpno;i++){
					if(i==1)
						html1+=`<li class="page-item active"><button class="page-link">${i}</button></li>`;
					else html1+=`<li class="page-item"><button class="page-link">${i}</button></li>`;
				}
				$("#prepno").after(html1);
				//当只有一页时,下一页按钮禁用
				if(maxpno<2) $("#nextpno").addClass("disabled"); 
				var lis=$("#pagination li");//页面选中状态
				//跳转函数
				function go(n){
					current=n;
					if(current*count>result.length){	
						for(var j=(current-1)*count,html="";j<result.length;j++)
							html+=`<tr>
								<td><a href="${result[i].href}">${result[j].bname}</a></td>
								<td>${result[j].author}</td>
								<td>${result[j].ISBN}</td>
								<td>${result[j].publish}</td>
								<td>${result[j].publish_time}</td>
							</tr>`;	
						$("#blist").html(html);
					}
					else{
						for(var j=(current-1)*count,html="";j<current*count;j++)
						  html+=`<tr>
							<td><a href="${result[i].href}">${result[j].bname}</a></td>
							<td>${result[j].author}</td>
							<td>${result[j].ISBN}</td>
							<td>${result[j].publish}</td>
							<td>${result[j].publish_time}</td>
						  </tr>`;
					    $("#blist").html(html);
					}
					for(k=0;k<lis.length;k++)$(lis[k]).removeClass("active");//先清除所有
					$(lis[current]).addClass("active");//在添加具体
				}
				//按钮跳转
				$("#pagination").click("#pagination button",function(e){
					var btn=$(e.target);
					var now=btn.html();//取button的内容
					if(now==maxpno){go(now); $("#nextpno").addClass("disabled"); }
					else if(now==1){go(now);$("#prepno").addClass("disabled");}
					else if(now=="下一页"){
						if(current==maxpno-1){go(maxpno);$("#nextpno").addClass("disabled");}
						else {go(current+1);$("#prepno").removeClass("disabled");}
					}
					else if(now=="上一页"){
						if(current==2){go(current-1);$("#prepno").addClass("disabled");	}
						else  go(current-1);
					}else {
						go(now);
						$("#prepno").removeClass("disabled");
						$("#nextpno").removeClass("disabled");
					}
				});
			
			})();

			(function(){ //2详细搜索
				var kw=["请选择","书名","作者","ISBN","出版社"];
				$("#types").change(function(){//option的改变
					var n=this.selectedIndex;//option的下标--Dom
					$("#info_select").click(function(){//button按钮的查询
						var info=$("#info").val();
						var arr=[];
						for(var i=0;i<result.length;i++){
							if(kw[n]=="书名" && result[i].bname.indexOf(info)!=-1) arr.push(result[i]);
							if(kw[n]=="作者" && result[i].author.indexOf(info)!=-1)arr.push(result[i]);
							if(kw[n]=="ISBN" && result[i].ISBN.indexOf(info)!=-1) arr.push(result[i]);
							if(kw[n]=="出版社" && result[i].publish.indexOf(info)!=-1)arr.push(result[i]);
						}
						for(var i=0,html="";i<arr.length;i++){ 
							html+=`<tr>
								<td><a href="${result[i].href}">${arr[i].bname}</a></td>
								<td>${arr[i].author}</td>
								<td>${arr[i].ISBN}</td>
								<td>${arr[i].publish}</td>
								<td>${arr[i].publish_time}</td>
							</tr>`;	
						}
						$("#blist").html(html);
						$("#bfoot").html("");
					})
				})
			})();
		}
	})	
});
//分类查询
$(function(){
	var lis=$("#kind li");
	lis.click(function(e){
		var li=$(e.target);
		var cname=li.html().slice(2);
		$.ajax({
			url:"http://127.0.0.1:8080/book/v1/book_type/"+cname,
			type:"get",
			datatype:"json",
			success(result){
				var html=`<table class="m-auto">
							<tr>
								<th>书名</th>
								<th>作者</th>
								<th>ISBN号</th>
								<th>出版社</th>
								<th>出版时间</th>
							</tr>`;
				for(var i=0;i<result.length;i++){ 
					html+=`<tr>
						<td><a href="${result[i].href}">${result[i].bname}</a></td>
						<td>${result[i].author}</td>
						<td>${result[i].ISBN}</td>
						<td>${result[i].publish}</td>
						<td>${result[i].publish_time}</td>
					</tr>`;	
				}
				html+=`</table>`;
				$("#kindul").siblings().html("");
				$("#kind").append(html);
			}
		})	
	})
})