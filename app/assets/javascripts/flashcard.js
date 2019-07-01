$(function(){
    $(".answer").hide();
    //.answer-markがクリックされたら
	$('.answer-mark').click(function(){
		//クリックされた.answer-markに隣接する要素が開いたり閉じたりする。
        // $(this).next('.answer').slideToggle(200);でもOK
        $(this).next('.answer').fadeToggle();
        console.log(this)
	});
});