// 여행정보
	//변수 
var isOver1 = false;
var isOver2 = false;
	
	// 함수 goHide1()
function goHide1(){
	if(!isOver1 && !isOver2){
		$('.gnb_depth_2_1').stop().fadeOut('fast');
	}
}

// 고객센터
var isOver11 = false;
var isOver22 = false;

// 함수 goHide2()
function goHide2(){
	if(!isOver11 && !isOver22){
		$('.gnb_depth_2_2').stop().fadeOut('fast');
	}
}

//상품투어

var isOver111 = false; // 상품투어 마우스 아웃되어있는 상태
var isOver222 = false; // 프로그램소개등 2레벨 마우스 아웃 상태

// 함수 goHide3()
function goHide3(){
	if(!isOver111 && !isOver222){
	$('.gnb_depth_2_3').fadeOut('fast');
	}
}


// 티켓가이드
var isOver1111 = false; 
var isOver2222 = false;

// 함수 goHide4();
function goHide4(){
	if(!isOver1111 && !isOver2222){
		$('.gnb_depth_2_4').fadeOut('fast');
	}
}
 	


$(document).ready(function(){


	// top버튼(태블릿용)
   	$('.s_point').smoothScroll();

   	// top버튼(스마트폰용)
   	if($(document).scrollTop() < 50){
		$('.to_top').addClass('hide');
	}else{
		$('.to_top').removeClass('hide');
	}
	$(window).scroll(function(){
	if($(document).scrollTop() < 50){
		$('.to_top').addClass('hide');
	}else{
		$('.to_top').removeClass('hide');
	}
	});

});



$(document).ready(function(){
	// 여행정보(네비): gnb_depth_2_1
	$('.openAll1').mouseover(function(){
		if(parseInt( $('header').css('width') ) > 800){
		$('.gnb_depth_2_1').fadeIn('fast');
		isOver1 = true;
		}
	});
 	
 	// 탭키로 이동
	$('.openAll1').focus(function(){
		if(parseInt( $('header').css('width') ) > 800){
		$('.gnb_depth_2_1').fadeIn('fast');
		// 포커스와 블러는 isOver1 없어도 됨
		isOver1 = true;
		}
	});

	$('.openAll1').mouseout(function(){
		isOver1 = false;
		setTimeout("goHide1()",200 );
	});

		// 탭키로 이동 마지막 li의 a태그가 마지막
	$('.gnb_depth_2_1 li:last-child a').blur(function(){
		isOver1 = false;
		setTimeout("goHide1()",200 );
	});

 	// 2레벨
	$('.gnb_depth_2_1').mouseover(function(){
		 isOver2 = true;
	});
	$('.gnb_depth_2_1').mouseout(function(){
		 isOver2 = false;
		 // console.log(isOver2);
		 setTimeout("goHide1()",200 );
	});

	// 고객센터(네비) : gnb_depth_2_2
	$('.openAll2').mouseover(function(){
		if(parseInt( $('header').css('width') ) > 800){
			$('.gnb_depth_2_2').fadeIn('fast');
			isOver11 = true;
		}
	});
		// 탭키
	$('.openAll2').focus(function(){
		if(parseInt( $('header').css('width') ) > 800){
			$('.gnb_depth_2_2').fadeIn('fast');
			isOver11=true;
		}
	});

	$('.openAll2').mouseout(function(){
		isOver11 = false;
		setTimeout("goHide2()",200 );
	});
		// 탭키
	$('.gnb_depth_2_2 li:last-child a').blur(function(){
		isOver11 = false;
		setTimeout("goHide2()",200 );
	});
	
	
	$('.gnb_depth_2_2').mouseover(function(){
		 isOver22 = true;
	});
	$('.gnb_depth_2_2').mouseout(function(){
		 isOver22 = false;
		setTimeout("goHide2()",200 );
	});
	
 	// 상품투어
	$('.openAll3').mouseover(function(){
		if(parseInt( $('header').css('width') ) > 800){
		$('.gnb_depth_2_3').fadeIn('fast');
		isOver111 = true;
		}
	});

	$('.openAll3').focus(function(){
		if(parseInt( $('header').css('width') ) > 800){
		$('.gnb_depth_2_3').fadeIn('fast');
		isOver111 = true;
		}
	});

	$('.openAll3').mouseout(function(){
		isOver111 = false;
		setTimeout("goHide3()",200);
	});

	$('.gnb_depth_2_3 li:last-child a').blur(function(){
		isOver111 = false;
		setTimeout("goHide3()",200);
	});


	$('.gnb_depth_2_3').mouseover(function(){
		isOver222 = true;		
	});

	$('.gnb_depth_2_3').mouseout(function(){
		isOver222 = false;
		setTimeout("goHide3()",200);
	});

 	// 티켓가이드
	$('.openAll4').mouseover(function(){
		if(parseInt( $('header').css('width') ) > 800){
		$('.gnb_depth_2_4').fadeIn('fast');
		isOver1111=true;
		}
	});

		// 탭키 이동시
	$('.openAll4').focus(function(){
		if(parseInt( $('header').css('width') ) > 800){
			$('.gnb_depth_2_4').fadeIn('fast');
		isOver1111=true;
		}
	})

	$('.openAll4').mouseout(function(){
		// 변수 goHide4() 말고  이렇게도 가능
		// if(!isOver1111 && !isOver2222){
		// 	$('.gnb_depth_2_4').fadeout('fast');}
		isOver1111=false;
		setTimeout("goHide4()",200);
	});

	//  탭키 이동시 마지막 li의a를 벗어났을때!
	$('.gnb_depth_2_4 li:last-child a').blur(function(){
		isOver1111=false;
		setTimeout("goHide4()",200);
	});

	$('.gnb_depth_2_4').mouseover(function(){
		isOver2222=true;
	});

	$('.gnb_depth_2_4').mouseout(function(){
		isOver2222=false;
		setTimeout("goHide4()",200);
	});


	// 모바일 메뉴
	$('.openMOgnb').click(function(){
		$('header').addClass('on');
		$('header .header_cont').slideDown('fast');

			// 모바일에서 안될때 touch는 모바일쪽
		$('header .header_area .header_cont .closePop').show();
		$('body').bind('touchmove', function(e){
			e.preventDefault();
		});
	});

	$('header .header_cont .closePop').click(function(){
		$('header .header_cont').slideUp('fast');
		$('header').removeClass('on');

		// 모바일에서 안될때
		$('body').unbind('touchmove');
	});



});










$(document).ready(function(){
	// 모바일용 닫기 버튼으로 닫기 한 후 브라우저(윈도우)의 
	// 너비를 태블릿pc버전으로 확대시 gnd가 안보이는 경우

	// if(parseInt( $('header').css('width') ) > 800){}

	$(window).resize(function(){
		if(parseInt( $('header').css('width') ) > 800){
			$('.header_cont').show();
		}else{$('.header_cont').hide(); 
			  $('header').removeClass('on')};
	});





	// 프로그램_더보기/접기 기능
	$('.program_list li .btn_more a').click(function(){
		if($(this).parent().parent().find('.subtxt').css('display') == 'none'){
			$(this).parent().parent().find('.subtxt').css('display','inline');
			$(this).text('접기');
		}else{$(this).parent().parent().find('.subtxt').css('display','none');
			$(this).text('더보기');
		}
		
	});
});