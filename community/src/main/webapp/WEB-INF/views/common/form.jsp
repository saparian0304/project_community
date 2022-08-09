<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 
<script>
function goSave(){
<c:if test="${!empty loginInfo}"> 
	if (confirm('댓글을 수정하시겠습니까?')){
	$.ajax({			
			url : "/pet/reply/replyEdit.do",
			data : {
				board_no : ${data.board_no},
				content : $("#content").val(),
				member_no : ${loginInfo.member_no}
			},
			success : function(res) {
				if (res.trim() == "1") {
					alert('정상적으로 댓글이 수정되었습니다.');
					$("#content").val('');
					getComment(1);
				}
			}
		});
	}
</c:if>
}
</script>
   
    
    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
	    <table class="board_write" style="width:100%;">
	        <colgroup>
	            <col width="*" />
	            <col width="100px" />
	        </colgroup>
	        <tbody>
	        <tr>
	            <td>
	                <textarea name="content" id="content" style="width:900px;"> ${vo.content}</textarea>
	            </td>
	            <td>
	                <div class="btnSet">
	                    <a href="javascript:goSave();"  style="  text-align: center;">수정</a>
	                </div>
	            </td>
	        </tr>
	        </tbody>
	    </table>
	</form>	
    


