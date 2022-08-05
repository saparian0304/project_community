package kr.co.pet.board.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class ApiExplorer {
	
	public static void main(String[] args) throws IOException, ParseException {
		String serviceKey = "mxwsziEgD6Ebt98RV0iyVKhOPQ28stVgXeB2UCacKa1H6hwmv%2BHo3Gev9OJ%2FNLV2F2vQdHejsYuw2phxF6Ed3Q%3D%3D";
		//url을 만들기 위한 StringBuilder
		StringBuilder urlBuilder = new StringBuilder("https://www.pettravel.kr/api/listArea.do");
		//오픈 API요청규격에 맞는 파라미터 생성
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("page", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));// 페이지 번호
		urlBuilder.append("&" + URLEncoder.encode("pageBlock", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));// 한페이지 결과 수
		urlBuilder.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode("AC01", "UTF-8"));// 지역번호
		
		//URL 객체 생성
		URL url = new URL(urlBuilder.toString());
		System.out.println(urlBuilder.toString());
		//URL과 통신하기 위한 Connection객체 생성
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		
		//통신을 위한 메소드 set
		conn.setRequestMethod("GET");
		
		//통신을 위한 content-type SET
		conn.setRequestProperty("Content-type", "application/json");
		
		//통신 응답 코드 확인
		System.out.println("Response code : " + conn.getResponseCode());
		
		//전달받은 데이터를 BufferedReader객체로 저장
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		
		//저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		
		//객체 해제
		rd.close();
		conn.disconnect();

		//전달받은 데이터 확인
		System.out.println(sb.toString());
		
		
		
		// 문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성
		JSONParser parser = new JSONParser();
		
		//문자열을 JSON 형태로 JSONObject 객체에 저장
		JSONObject obj = (JSONObject)parser.parse(sb.toString());
		
		//필요한 리스트 데이터 부분만 가져와 JSONArray로 저장
		JSONArray dataArr = (JSONArray)obj.get("data");
		
//		//model에 담아준다
//		//JSP에서 data를 참조할 수 있고, jstl의 c:if태그를 사용해 리스트의 각 요소들을 참조하여 사용할 수 있게 된다. 

		
	}

}
