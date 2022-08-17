package kr.co.pet.board.api;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.pet.board.BoardService;
import kr.co.pet.board.BoardVO;
import kr.co.pet.file.FileService;
import kr.co.pet.file.FileVO;
import kr.co.pet.hos.HosService;
import kr.co.pet.loc.LocService;
import kr.co.pet.loc.LocVO;
import kr.co.pet.reply.ReplyService;
@Controller
public class ApiController {
	
	public void apiTest2() throws IOException{
		for(int num = 0; num < 100; num++) {
		URL url1 = new URL("https://www.pettravel.kr/api/detailSeqArea.do?areaCode=AC01&contentNum=" + num);
//		URL url1 = new URL("https://www.pettravel.kr/api/listArea.do?areaCode=AC01&page=1&pageBlock=100");
		BufferedReader bf;
		
		bf = new BufferedReader(new InputStreamReader(url1.openStream(), "UTF-8"));
		
		String result1 = bf.readLine();
		//System.out.println("현규"+result1);
		
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonObject = (JsonArray)jsonParser.parse(result1);
		
		JsonArray jsonArr1 = new JsonArray();
		
		JsonObject rcp = (JsonObject)jsonObject.get(0);
		try {
			
		
		JsonObject row1 = (JsonObject)rcp.get("resultList");
//		System.out.println("------" + num +"번 가게------");
//			System.out.println("지역명 : " +  row1.get("areaName").getAsString());
//			System.out.println("부분 : " +  row1.get("partName").getAsString());
//			System.out.println("이름 : " +  row1.get("title").getAsString());
//			System.out.println("주소 : " +  row1.get("address").getAsString());
//			System.out.println("위도 : " +  row1.get("latitude").getAsString());
//			System.out.println("경도 : " +  row1.get("longitude").getAsString());
//			System.out.println("전화번호 : " +  row1.get("tel").getAsString());
//			System.out.println("홈페이지 : " +  row1.get("homePage").getAsString());
//			System.out.println("내용 : " +  row1.get("content").getAsString());
//			System.out.println("주차 : " +  row1.get("parkingLog").getAsString());
//			System.out.println("응급 : " +  row1.get("emergencyResponse").getAsString());
//			System.out.println("이미지 : " +  row1.get("image").getAsJsonArray());
			
			jsonArr1.add(row1);
			
			
			} catch (Exception e) {}
			
			ArrayList<JsonObject> arrayJson = new ArrayList<JsonObject>();
		
			for(int k = 0; k < jsonArr1.size(); k++) {
				JsonObject tempJson = jsonArr1.getAsJsonObject();
				arrayJson.add(tempJson);
			}
			
			JsonObject[] jsons = new JsonObject[arrayJson.size()];
			arrayJson.toArray(jsons);
			
			System.out.println(jsons);
		}		
	}
}

