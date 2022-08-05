var wnum = 0;
var wwslidingAuto = null;
// $(document).ready(function(){
function play_w(directw){
	if(directw == 'right'){
		wnum++;
		if(wnum>2){wnum=0;}
	}else if(directw == 'left'){
		wnum--;
		if(wnum<0){wnum=2;}
	}	// *****
	// $('.rollingbtn .seq a').each(function(index){
	else{
		wnum = directw;
	}

	$('.rollingbtn').find('li.seq a').each(function(){
		$('.rollingbtn li.seq a img').attr('src',$('.rollingbtn li.seq a img').attr('src').replace('on.png','off.png'));
	});
	$('.rollingbtn li.butt'+wnum+' a img').attr('src',$(".rollingbtn li.butt"+wnum+" a img").attr('src').replace('_off.png','_on.png'));

	// console.log(wnum);
	if(wnum==0){
		$('.viewImgList li.imglist1').animate({	'opacity':0	},1000);
		$('.viewImgList li.imglist2').animate({	'opacity':0	},1000);
		$('.viewImgList li.imglist0').animate({ 'opacity':1	},1000);
	}else if(wnum==1){	
		$('.viewImgList li.imglist0').animate({ 'opacity':0 },1000);
		$('.viewImgList li.imglist2').animate({	'opacity':0	},1000);
		$('.viewImgList li.imglist1').animate({ 'opacity':1 },1000);
	}else if (wnum==2){
		$('.viewImgList li.imglist0').animate({ 'opacity':0 },1000);
		$('.viewImgList li.imglist1').animate({ 'opacity':0	},1000);
		$('.viewImgList li.imglist2').animate({	'opacity':1 },1000);
	}
			// 자바스크립트 setTimeout, 
	if(wwslidingAuto){
		// console.log(wwslidingAuto);
		clearTimeout(wwslidingAuto);}
	wwslidingAuto=setTimeout("play_w('right')",6000);
}   // play_w('directw')

	var wwslidingAuto = setTimeout("play_w('right')",6000);


// setTimeout()을 사용한 경우 주석 제이쿼리에서는...
// }); // $(document).ready(function(){}




$(document).ready(function(){

	// 멈춤버튼
	$('.rollstop a').click(function(){
		$(this).parent().hide();
		$('.rollplay').css('display','inline-block');
		if(wwslidingAuto){clearTimeout(wwslidingAuto);}
	});
	// 재생버튼
	$('.rollplay a').click(function(){
		$(this).parent().hide();
		$('.rollstop').css('display','inline-block');
		play_w('right');
	});

	// 페이지 롤버튼
	$('.rollingbtn .seq a').each(function(index){
		$(this).click(function(){
			$('.rollplay').hide();
			$('.rollstop').css('display','inline-block');


			// ********
			if(wwslidingAuto){
				clearTimeout(wwslidingAuto);
			}
			play_w(index);
		});
	});
});