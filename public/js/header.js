$(function(){
  $.ajax({
    url:"header.html",
    type:"get",
    //datatype:"json" //由于返回的是html片段,所以不用写datatype
    success(result){
      $(result).replaceAll("#header");//替换index.html中的原本内容
      $(`<link rel="stylesheet" href="css/header.css">`).appendTo("head");
      //动态创建link元素,并自动追加到<head>中
    }
  })
})