<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- 
data API2.0 활용 샘플
 -->
<meta charset="UTF-8">
<title>브이월드 행정구역</title>
</head>
<link rel="stylesheet" href="http://openlayers.org/en/latest/css/ol.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<body>
	<!-- 브이월드 행정구역도를 이용한 셀렉트 박스 구현... 공간정보를 기반으로 하고 있어서 국가공간정보포털보다 느림 -->
	<form id="nsdiSearchForm" action="#" class="form_data" onsubmit="return false;search();">

		<select id="sido_code">
			<option>선택</option>
		</select>
		<select id="sigoon_code">
			<option>선택</option>
		</select>
		<select id="dong_code">
			<option>선택</option>
		</select>
		<select id="lee_code">
			<option>선택</option>
		</select>
	</form>
<script>
$.support.cors = true;
	
	$(function(){
		$.ajax({
			type: "get",
			url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIDO_INFO",
			async: false,
			dataType: 'jsonp',
			success: function(data) {
				let html = "<option>선택</option>";

				data.response.result.featureCollection.features.forEach(function(f){
					console.log(f.properties)
					let 행정구역코드 = f.properties.ctprvn_cd;
					let 행정구역명 = f.properties.ctp_kor_nm;
					
					html +='<option value="\${행정구역코드}">\${행정구역명}"\${행정구역코드}"</option>'
					
				})
				
	            $('#sido_code').html(html);
				
			},
			error: function(xhr, stat, err) {}
		});
		
		
		$(document).on("change","#sido_code",function(){
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
				data : {attrfilter : 'sig_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택</option>";

					data.response.result.featureCollection.features.forEach(function(f){
						console.log(f.properties)
						let 행정구역코드 = f.properties.sig_cd;
						let 행정구역명 = f.properties.sig_kor_nm;
						
						html +='<option value="\${행정구역코드}">\${행정구역명}"\${행정구역코드}"</option>'
						
					})
		            $('#sigoon_code').html(html);
					
				},
				error: function(xhr, stat, err) {}
			});
		});
		
		$(document).on("change","#sigoon_code",function(){ 
			
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
				data : {attrfilter : 'emd_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택</option>";

					data.response.result.featureCollection.features.forEach(function(f){
						console.log(f.properties)
						let 행정구역코드 = f.properties.emd_cd;
						let 행정구역명 = f.properties.emd_kor_nm;
						html +='<option value="\${행정구역코드}">\${행정구역명}"\${행정구역코드}"</option>'
						
					})
		            $('#dong_code').html(html);
					
				},
				error: function(xhr, stat, err) {}
			});

		});

		// 읍면 코드로 검색
		$(document).on("change","#dong_code",function(){ 
			
			let thisVal = $(this).val();		

			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADRI_INFO",
				data : {attrfilter : 'li_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					let html = "<option>선택</option>";

					data.response.result.featureCollection.features.forEach(function(f){
						console.log(f.properties)
						let 행정구역코드 = f.properties.li_cd;
						let 행정구역명 = f.properties.li_kor_nm;
						html +='<option value="\${행정구역코드}">\${행정구역명}"\${행정구역코드}"</option>'
						
					})
		            $('#lee_code').html(html);
					
				},
				error: function(xhr, stat, err) {}
			});

		});
	})
</script>
</body>

</html>