$(function(){
  $.ajax({
    url:"footer.html",
    type:"get",
    //datatype:"json" //由于返回的是html片段,所以不用写datatype
    success(result){
      console.log(result);
      $(result).replaceAll("footer");//替换index.html中的原本内容
      $(`<link rel="stylesheet" href="css/footer.css">`).appendTo("head");
      //动态创建link元素,并自动追加到<head>中
    }
  })
})