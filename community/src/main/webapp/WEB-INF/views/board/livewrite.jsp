<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/head.jsp" %>
    <script>
    	function goSave() {
    		editor.getById['content'].exec('UPDATE_CONTENTS_FIELD',[]);
    		frm.submit();
		};
		
    	var editor;//전역변수로 다른 곳에도 쓰려고
    	$(function() {
			editor = setEditor('content');
		});
    </script>
<body>
    
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">게시판</h3>
    
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data">
                    <table class="board_write">
                        <tbody>
                        <tr>
                            <th>말머리</th>
                            <td>
                                <!-- <form id="aaa"> -->
	                                <%-- 1.식당, 2. 관광지, 3. 병원 --%>
	                                <input type="radio" class="radio_value" name="horse_hair" value="1">식당
									<input type="radio" class="radio_value" name="horse_hair" value="2">관광지
									<input type="radio" class="radio_value" name="horse_hair" value="3">병원
                            	<!-- </form> -->
                            </td>
                        </tr>
                        <tr>
                            <th>주소</th>
                            <td>
                                <%-- 주소1(구군), 주소2(입력한 상세주소), 위도, 경도 --%>
						        위도 : <input type = "text" name = "addr" />
						        경도 : <input type = "text" name = "addr2" /> 
						        위도 : <input type = "text" name = "gps_x" />
						        경도 : <input type = "text" name = "gps_y" /> 
                            </td>
                        </tr>
                        
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" id="title" class="wid100" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea style="width: 90%" name="content" id="content"></textarea>
                            </td>
                        </tr>
                        <tr>
                        	<th>첨부파일</th>
                        	<td>
                        		<input type="file" name="filename">
                        	</td>
                        </tr>
                        
                        </tbody>
                    </table>
	                    <div class="btnSet"  style="text-align:right;">
	                        <a class="btn" href="javascript:goSave();">저장 </a>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
        
</body>
</html>