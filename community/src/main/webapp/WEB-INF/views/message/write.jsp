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
    	
    </script>
</head>
<body>
    
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">쪽지</h3>
    
                <div class="bbs">
                <form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data">
                    <table class="board_write">
                        <tbody>
                        <tr>
                            <th>번호</th>
                            <td>
                                
                            </td>
                        </tr>
                        <tr>
                            <th>받는사람</th>
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
                        	<th>보낸사람</th>
                        	<td>
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