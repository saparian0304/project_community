var wnum=0;
	var wwslidingAuto=null;
	function play_w(directw) {	
			if(directw=="right"){
				wnum++;
				if(wnum>2)wnum=0;
			}else if(directw=="left"){
				wnum--;
				if(wnum<0)wnum=2;
			}else {
				wnum = directw;
			}
			
			$(".rollingbtn").find('li.seq a').each(function(){
				$(".rollingbtn li.seq a img").attr('src',$(".rollingbtn li.seq a img").attr('src').replace('_on.png','_off.png'));
			});
			$(".rollingbtn li.butt"+wnum+ " a img").attr('src',$(".rollingbtn li.butt"+wnum+ " a img").attr('src').replace('_off.png','_on.png'));

				if(wnum==0) {
				$(".viewImgList li.imglist1").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist2").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist0").animate({'opacity' : 1 },1000);
			}else if (wnum==1){
				$(".viewImgList li.imglist0").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist2").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist1").animate({'opacity' : 1 },1000);
			}else if (wnum==2){
				$(".viewImgList li.imglist0").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist1").animate({'opacity' : 0 },1000);
				$(".viewImgList li.imglist2").animate({'opacity' : 1 },1000);
			}

			if(wwslidingAuto)clearTimeout(wwslidingAuto);
			wwslidingAuto=setTimeout("play_w('right')",6000);
	}
	var wwslidingAuto=setTimeout("play_w('right')",6000);


  // play_w('directw')





// $(document).ready(function(){
// 	$('.rollingbtn seq a').click(function(){

// 	});
// });