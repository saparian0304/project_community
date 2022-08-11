package kr.co.pet.board.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.pet.board.BoardMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ApiRealInsert {
	@Autowired
	BoardMapper mapper;
	public void ApiInsert() throws IOException{
		String key = "mxwsziEgD6Ebt98RV0iyVKhOPQ28stVgXeB2UCacKa1H6hwmv%2BHo3Gev9OJ%2FNLV2F2vQdHejsYuw2phxF6Ed3Q%3D%3D";
		int startNo, endNo;
		startNo = 1;
		endNo = 10;
		
		URL url = new URL("https://www.pettravel.kr/api/listArea.do?serviceKey=" + key +"&returnType=JSON&page=" + startNo + "&pageBlock=" + endNo + "&areaCode=AC01");
		
		String serviceKey = "mxwsziEgD6Ebt98RV0iyVKhOPQ28stVgXeB2UCacKa1H6hwmv%2BHo3Gev9OJ%2FNLV2F2vQdHejsYuw2phxF6Ed3Q%3D%3D";
		//url을 만들기 위한 StringBuilder
		StringBuilder urlBuilder = new StringBuilder("https://www.pettravel.kr/api/listArea.do");
		//오픈 API요청규격에 맞는 파라미터 생성
		urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("returnType", "UTF-8") + "=" + URLEncoder.encode("JSON", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("page", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));// 페이지 번호
		urlBuilder.append("&" + URLEncoder.encode("pageBlock", "UTF-8") + "=" + URLEncoder.encode("10", "UTF-8"));// 한페이지 결과 수
		urlBuilder.append("&" + URLEncoder.encode("areaCode", "UTF-8") + "=" + URLEncoder.encode("AC01", "UTF-8"));// 지역번호
		
		
		//url로 요청 보낸 결과 string으로 받기
		BufferedReader bf;
		
		bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
		
		String result1 = bf.readLine();
		
		//요청하여 스트링으로 받은 결과를 jsonobject로 파싱 후 적절히 활용...
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonObject = (JsonArray)(jsonParser.parse(result1));
		
		JsonObject rcp = (JsonObject)jsonObject.get(0);
		JsonArray row1 = (JsonArray)rcp.get("resultList");
		//이미지리스트를 array에 담고 object로 또 담아서 받아와야 함

		
		for(int i = 0; i < row1.size(); i++) {
			Map map = new HashMap();
			
			map.put("areaName", ((JsonObject)row1.get(i)).get("areaName").getAsString());
			map.put("partName", ((JsonObject)row1.get(i)).get("partName").getAsString());
			map.put("title", ((JsonObject)row1.get(i)).get("title").getAsString());
			map.put("adress", ((JsonObject)row1.get(i)).get("adress").getAsString());
			map.put("latitude", ((JsonObject)row1.get(i)).get("latitude").getAsString());//위도
			map.put("longitude", ((JsonObject)row1.get(i)).get("longitude").getAsString());//경도
			map.put("tel", ((JsonObject)row1.get(i)).get("tel").getAsString());
			//이미지 추가해야 함
		}
	}
}
