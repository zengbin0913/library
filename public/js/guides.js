(function(){
      //1查找触发事件的元素
      var i=10; //累计z-index的值
      var as=document.querySelectorAll(".guider>.guider_nav>ul>li>[data-toggle=tab]");
      //2绑定事件处理函数
      for(var a of as){
        a.onclick=function(){
          var a=this;
          //3查找要修改的元素
         var id=a.dataset.target;
         var div=document.getElementById(id);
		 //4修改元素
          div.style.zIndex=i++;
		  div.className="";
		}
	}
})()