<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="format-detection" content="telephone=no, address=no, email=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>게시판 등록</title>
    <link rel="stylesheet" href="/pet/css/reset.css"/>
    <link rel="stylesheet" href="/pet/css/contents.css"/>
    <script src="/pet/smarteditor/js/HuskyEZCreator.js"></script>
    <script src="/pet/js/function.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
</head>
<body>
    
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">게시판</h3>
    
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