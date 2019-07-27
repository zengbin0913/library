//新书推荐
$(function(){
	$.ajax({
		url:"http://127.0.0.1:8080/book/v1/book_list",
		type:"get",
		datatype:"json",
		success(result){ 
			for(j=0,html="",html2="",count=0,count2=0;j<result.length;j++){
				if(count<5 && result[j].seq_recommended==2)//新书推荐
				{	html+=`<li class="mb-2 pl-2 pt-2">  
							<a href="${result[j].href}">${result[j].bname}</a>
							<span>|</span>
							<span>${result[j].publish_time}</span>
					</li>`;
				}
				if(count2<5 && result[j].seq_recommended==3){ //好书推荐
					html2+=`<li><a href="${result[j].href}">${result[j].bname}</a></li>`;
				}
			}
			$("#book_intr").html(html);
			$("#introduce1>ul").html(html2);

			for(var i=0,res=[];i<result.length;i++) //新书通报
			{
				var date=new Date(result[i].publish_time);
				var times=date.getTime();
				result[i].publish_time=times;	
			}
			result.sort((a,b)=>b-a); //把所有书籍按时间从大到小排序
			
			for(var k=0,html="";k<5;k++){
				html+=`<tr>
					<td><a href="${result[k].href}" class="text-primary">${result[k].bname}</a></td>
					<td>${result[k].author}</td>
					<td>${result[k].ISBN}</td>
					<td>${result[k].publish}</td>
					</tr>`;
			}console.log(html)
			$("#new_book").html(html);
		}
	})
})