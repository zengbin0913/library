//阅读指导
$(function(){
	$.ajax({
		url:"http://127.0.0.1:8080/activity/v1/new_activity_list",
		type:"get",
		datatype:"json",
		success(result){
			var html="",html2="",html3="",html4="";
			for(var i=0;i<result.length;i++){
				if(result[i].tag==1){//最新内容	
					html+=`<li class="mb-2 pl-2 pt-2">
						<a href="${result[i].activity_href}">${result[i].theme}</a>
						<span>|</span>
						<span>${result[i].activity_time}</span>
					</li>`;
				}
				if(result[i].tag==2){//美文共享
					html2+=`<li>
						<a href="${result[i].activity_href}">${result[i].theme}</a>
					</li>`
				}
				if(result[i].tag==3){//读书活动
					html3+=`<li class="mb-1 pl-1"><a href="${result[i].activity_href}" >${result[i].theme}</a></li>`;
				}
				if(result[i].tag==0){//读书活动
					html4+=`<li class="mb-1 pl-1"><a href="${result[i].activity_href}" >${result[i].theme}</a></li>`;
				}
			}
			$("#read ul").html(html);
			$("#read2 ul").html(html2);
			$("#read4 #pre_acitvity").html(html3);
			$("#read4 #end_acitvity").html(html4);
		}
	})	
});
//阅读指导-文档详情
$(function(){	
	var aid=location.search.split("=")[1];
	if(aid){
		$.ajax({
			url:"http://127.0.0.1:8080/activity/v1/new_activity_details/"+`${aid}`,
			type:"get",
			datatype:"json",
			success(result){
				console.log(result);
				var html="";
				if(result[0].tag==1) $("title").html(`${result[0].theme}`)
				if(result[0].tag==2) $("title").html(`美文共赏-${result[0].theme}`)
				html+=`<h1 class="text-center">${result[0].theme}</h1>
					<p class="pb-2">${result[0].content}</p>	
				`;
				if(result[0].tag==3 || result[0].tag==0) {
					var html="";
					html+=`<h1 class="text-center">${result[0].theme}</h1>
					<p class="pb-2 text-center"><img src="${result[0].content}"></p>	
					`;
					$("title").html(`活动-${result[0].theme}`)
				}
				$("#article").html(html);
			}
		})
	}
})