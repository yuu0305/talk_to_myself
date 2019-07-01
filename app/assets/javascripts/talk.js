$(function(){
  $('ul.child').hide();
  $('#menu li').hover(function(){
      $("ul:not(:animated)", this).slideDown(100);
  }, function(){
      $("ul.child",this).slideUp(100);
  });
});



// not(:animatedは要検索
// マウスを載せたり降ろしたりを素早く繰り返してみると、その回数繰り返したぶんだけ、表示したり非表示になったりが後を追うようになんどもなんどもくり返してしまう。

