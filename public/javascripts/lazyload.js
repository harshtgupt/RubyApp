$(function(){
$("img.lazy").each(function(index,value){$(this).attr("data-original","http:"+$(this).attr("data-original"))});
$("img.lazy").lazyload();
});
