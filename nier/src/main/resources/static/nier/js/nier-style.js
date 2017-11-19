$("ul.ul-h>li>a").on("click", function(){
	$(this).parent().siblings().removeClass("active");
	$(this).parent().addClass("active");	
})