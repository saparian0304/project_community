

// 게시판명 변화에 따른 말머리 옵션 변경
function change_hair(e) {
	var live = ['식당', '관광지', '병원'];
	var free = ['잡담', '여행후기', '추천', '고민'];
	var center = ['보호센터'];
	var index = 0;
	var add_hair = '<option value="">말머리</option>';
	var add = [];
	if(e == 'live') {
		add = live;
		index = 1;
	} else if (e== 'free') {
		add = free;
		index = 3;
	} else if (e == 'center') {
		add = center;
		index = 7;
	}
	
	for (var i=0; i<add.length; i++) {
		add_hair +=	"<option value='"+index+"'>" + add[i] + "</option>";
		index++;
	}
	$('#horse_hair').html(add_hair);
}

