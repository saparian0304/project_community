<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.*"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String saveDirectory = application.getRealPath("/upload/");//실제 파일이 저장된 경로
String saveFilename = request.getParameter("sName");//실제 서버에 저장된 파일명
String originalFilename = request.getParameter("oName");//사용자가 첨부한 원본파일명

try{
	//파일을 찾아 입력하는 스트림 생성
	File file = new File(saveDirectory, saveFilename);//경로와 서버의파일명으로 File객체로 생성
	InputStream inStream = new FileInputStream(file);//입력스트림객체를 생성
	
	//한글 파일명 깨짐 방지
	String client = request.getHeader("User-Agent");//사용자의 브라우저 정보
	if(client.indexOf("WOW64") == -1){//WOW64문자열이 포함안된경우 -> IE제외 브라우저
		originalFilename = new String(originalFilename.getBytes("UTF-8"),
				"ISO-8859-1");
	}
	else{//포함된경우 -> IE
		originalFilename = new String(originalFilename.getBytes("KSC5601"),
				"ISO-8859-1");
	}
	//파일 다운로드용 응답 헤더 설정(브라우저 헤더정보 저장)
	response.reset();
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
	response.setHeader("Content-Length", ""+ file.length() );
	
	//출력 스트림 초기화
	out.clear();
	
	//response내장 객체로부터 새로운 출력 스트림 생성
	OutputStream outStream = response.getOutputStream();
	
	//출력 스트림에 파일 내용 출력
	byte b[] = new byte[(int)file.length()];
	int readBuffer = 0;
	while( (readBuffer = inStream.read(b)) > 0 ){
		outStream.write(b, 0, readBuffer);
	}
	//입/출력 스트림 닫음
	inStream.close();
	outStream.close();
}
catch(FileNotFoundException e){
	System.out.println("파일을 찾을 수 없습니다.");
}
catch(Exception e){
	System.out.println("예외가 발생하였습니다.");
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>