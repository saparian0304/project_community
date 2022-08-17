<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/includes/head.jsp" %>
<script>
    
    function goSave() {
		editor.getById['content'].exec('UPDATE_CONTENTS_FIELD',[]);
		frm.submit();
	}
	var editor;//전역변수로 다른 곳에도 쓰려고
	$(function() {
		editor = setEditor('content');
	})
</script>
    
        <div class="sub">
            <div class="size">
    
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="update.do">
                <input type="hidden" name="board_no" value="${data.board_no }">
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
						        주소1 : <input type = "text" name = "addr" value="${ldata.addr }"/>
						        주소2 : <input type = "text" name = "addr2" value="${ldata.addr2 }"/> 
						        위도 : <input type = "text" name = "gps_x" value="${ldata.gps_x }"/>
						        경도 : <input type = "text" name = "gps_y" value="${ldata.gps_y }"/> 
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="title" id="title" class="wid100" value="${data.title }"/>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="content" id="content">${data.content }</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <input type="file" name="filename_real" value="${fdata.filename_real}"/><!-- 데이터는 남아있는데 글자로는 안뜸 -->
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