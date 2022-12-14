<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/header.jsp" %>

<style type="text/css">
	  h2 {
	  	font-size: 20px;
	  	font-weight: bold;
	  	text-align: center;
	  	background-color: #a9cac1;
	  }
	.tit_page{
		background-color: transparent;
		text-align: left;
	}
      .swiper { 
        width: 100%;
        height:100%;
        border-radius: 10px;
      	border: 3px solid #a9cac1;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 80%;
        object-fit: cover;
        transition: opacity;
        margin-bottom: 10px;
      }
      
      .maindiv {
      	border-radius: 10px;
      	border: 3px solid #a9cac1;
      	width: 49%;
      	margin-bottom: 20px;
      }
      .maintb{
      	border: 1px solid #a9cac1;
      	border-collapse: collapse;
      	height: 300px;
      	margin-bottom: 10px;
      }
	  .maintb th,td{
	  	border: 1px solid #a9cac1;
	  	font-size: 16px;
	  }

</style>

	<ul class="skipnavi">
        <li><a href="#container">본문내용</a></li>
    </ul>
	<div id="wrap">

		<!-- 컨텐츠 영역 -->
		<div id="container">
			<!-- 위치(페이지 제목)영역 -->
			<div class="location_area customer">
				<div class="box_inner">
					<h2 class="tit_page">
						<span>반려동물 커뮤니티</span>
					</h2>
				</div>
			</div>
			<!-- 공지사항 목록영역 -->
			<div class="bodytext_area box_inner" style="width: 70%">

				<!-- 스와이퍼 -->
				<div class="swiper mySwiper"  style="margin-bottom: 20px">
					<h2>< 관광지 TOP 5 ></h2>
					<div class="swiper-wrapper">
						<c:forEach var="vo" items="${ldata.list}" varStatus="status">
						
						<div class="swiper-slide">
							<a style="font-size: 16px;" href="liveview.do?board_no=${vo.board_no }">
							<img src="${vo.filename_real}">
							${status.index +1}. ${vo.title }
							</a>
						</div>
							
						</c:forEach>
					</div>

					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-scrollbar"></div>
				</div>
				<div class="line">
				<div class="maindiv" style=" float: left;">
				<h2> < 잡담 ></h2>
					<table class="maintb">
					<colgroup>
						<col width="60%"/>
						<col width="40%"/>
					</colgroup>
						<tr>
							<th>제목</th>
							<th>작성자</th>
						</tr>
						<c:forEach var="vo" items="${tdata.list }" varStatus="status">
						<tr>
							<td><a href="freeview.do?board_no=${vo.board_no }">${vo.title }</a></td>
							<td>${vo.nickname }</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<div class="maindiv" style="float: right;">
					<h2>< 정보공유 ></h2>
					<table class="maintb">
					<colgroup>
						<col width="60%"/>
						<col width="40%"/>
					</colgroup>
						<tr>
							<th>제목</th>
							<th>작성자</th>
						</tr>
						<c:forEach var="vo" items="${ddata.list }" varStatus="status">
						<tr>
							<td><a href="freeview.do?board_no=${vo.board_no }">${vo.title }</a></td>
							<td>${vo.nickname }</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				
				<div class="maindiv" style="float: left;">
				<h2>< 여행후기 ></h2>
					<table class="maintb">
					<colgroup>
						<col width="60%"/>
						<col width="40%"/>
					</colgroup>
						<tr>
							<th>제목</th>
							<th>작성자</th>
						</tr>
						<c:forEach var="vo" items="${sdata.list }" varStatus="status">
						<tr>
							<td><a href="freeview.do?board_no=${vo.board_no }">${vo.title }</a></td>
							<td>${vo.nickname }</td>
						</tr>
						</c:forEach>
					</table>
				</div>
				
				<div class="maindiv" style="float: right;">
					<h2>< 고민상담 ></h2>
					<table class="maintb">
					<colgroup>
						<col width="60%"/>
						<col width="40%"/>
					</colgroup>
						<tr>
							<th>제목</th>
							<th>작성자</th>
						</tr>
						<c:forEach var="vo" items="${wdata.list }" varStatus="status">
						<tr>
							<td><a href="freeview.do?board_no=${vo.board_no }">${vo.title }</a></td>
							<td>${vo.nickname }</td>
						</tr>
						</c:forEach>
					</table>
				</div>
			</div>


				<!-- Swiper JS -->
				<script
					src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

				<!-- Initialize Swiper -->
				<script>
			      var swiper = new Swiper(".mySwiper", {
			    	slidesPerView: 4,
			        centeredSlides: true,
			        spaceBetween: 30,
			        observer: true,
			        observeParents: true,
			        loop : true,
			    	scrollbar: {
			          el: ".swiper-scrollbar",
			          hide: true,
			          clickable: true,
			        },
			        navigation: {
			          nextEl: ".swiper-button-next",
			          prevEl: ".swiper-button-prev",
			        },
			      });
			    </script>
			    
			</div>
		</div>
	</div>
</body>

</html>