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
<body>
    
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">게시판</h3>
    
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data">
                    <table class="board_write">
                        <tbody>
                        <tr>
                            <th>주소</th>
                            <td>
                                <%-- <jsp:include page="/WEB-INF/views/local.jsp"></jsp:include> --%>
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