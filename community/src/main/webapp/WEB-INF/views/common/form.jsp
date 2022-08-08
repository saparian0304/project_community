<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
	    <table class="board_write" style="width:100%;">
	        <colgroup>
	            <col width="*" />
	            <col width="100px" />
	        </colgroup>
	        <tbody>
	        <tr>
	            <td>
	                <textarea name="content" id="content" style="width:900px;" placeholder="로그인 후 작성해주세요"></textarea>
	            </td>
	            <td>
	                <div class="btnSet">
	                    <a href="javascript:goSave();"  style="  text-align: center;">저장</a>
	                </div>
	            </td>
	        </tr>
	        </tbody>
	    </table>
	</form>	
    


