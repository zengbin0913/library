(function(){
	var $txtName=$(":input:text");console.log($txtName);
	var $txtPwd=$(":input:password");
	function vali($txt,minlen,maxlen,msg){
		var $span=$txt.parent().next().children(); console.log($span);
		if($txt.val().length>=minlen &&$txt.val().length<=maxlen)
			$span.html(`<img src="img/index/ok.png">`);
		else $span.html(`<img src="img/index/err.png">${msg}`);
	}
	$txtName.blur(function(){		
		vali($(this),6,12,"介于6~12位之间!")
	})
	$txtPwd.blur(function(){		
		vali($(this),6,8,"介于6~8位之间!")
	})
})()