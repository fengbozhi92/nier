$("ul.ul-h>li>a").on("click", function(){
	$(this).parent().siblings().removeClass("active");
	$(this).parent().addClass("active");	
})

$("div.share").hover(function(){
	$(this).find(".share-main").show();
},function(){
	$(this).find(".share-main").hide();
})