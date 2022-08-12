package kr.co.pet.board.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class ApiInsert {

	@Autowired
	ApiMapper mapper;
	public Map apiInsert2() throws IOException, ParseException{
		//key = "f3a6ee22bb946cc136a1a276ccbc83c8c9b219bd54144869ec663b8d7dcfcbdd"
		//레시피 기본정보(result1)
		//http://211.237.50.150:7080/openapi/key/json/Grid_20150827000000000226_1/startNo/endNo
		//인증키
		String key = "mxwsziEgD6Ebt98RV0iyVKhOPQ28stVgXeB2UCacKa1H6hwmv%2BHo3Gev9OJ%2FNLV2F2vQdHejsYuw2phxF6Ed3Q%3D%3D";
		
		//요청 파라미터(api제공자 형식에 따라 다름)
		int Page, perPage;
		Page = 1;
		perPage = 5;
		//요청 url
		URL url = new URL("https://www.pettravel.kr/api/listArea.do?" + "serviceKey="+ key + "&returnType=JSON&" + "page=" +Page + "&pageBlock=" + perPage + "&areaCode=" + "AC01");
//		
		//url로 요청 보낸 결과 string으로 받기
//		BufferedReader bf;
//		
//		bf = new BufferedReader(new InputStreamReader(url1.openStream(), "UTF-8"));
//		
//		String result1 = bf.readLine();
//		
//		//요청하여 스트링으로 받은 결과를 jsonobject로 파싱 후 적절히 활용...
//		JsonParser jsonParser = new JsonParser();
//		JsonObject jsonObject = (JsonObject)jsonParser.parse(result1);
//		
//		JsonObject rcp = (JsonObject)jsonObject.get("Grid_20150827000000000226_1");
//		JsonArray 
//		//JsonArray row1 = (JsonArray)rcp.get("row");
		
		
		//URL과 통신하기 위한 Connection객체 생성
		HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		
		//통신을 위한 메소드 set
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		
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
		log.info(line);
		//객체 해제
		rd.close();
		conn.disconnect();
		
		// 문자열 형태의 JSON을 파싱하기 위한 JSONParser 객체 생성
		JSONParser parser = new JSONParser();
		
		//문자열을 JSON 형태로 JSONObject 객체에 저장
		//JSONObject obj = (JSONObject)parser.parse(sb.toString());
		
		//필요한 리스트 데이터 부분만 가져와 JSONArray로 저장
		//JSONArray dataArr = (JSONArray)obj.get("data");
		
		Map map = new HashMap();
		//for(int i = 0; i < dataArr.size(); i++) {
			
//			map.put("areaName", ((JsonObject)dataArr.get(i)).get("areaName").getAsInt());
//			map.put("partName", ((JsonObject)dataArr.get(i)).get("partName").getAsString());
//			map.put("title", ((JsonObject)dataArr.get(i)).get("title").getAsString());
//		
		//}
		return map;
	}
}
