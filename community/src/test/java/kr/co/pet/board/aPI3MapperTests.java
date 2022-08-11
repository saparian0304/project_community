package kr.co.pet.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.pet.board.BoardVO;
import kr.co.pet.board.api.ApiVO;
import kr.co.pet.center.CenterVO;
import kr.co.pet.file.FileVO;
import kr.co.pet.hos.HosVO;
import kr.co.pet.loc.LocVO;
import kr.co.pet.member.MemberVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class aPI3MapperTests {

	@Test
	public void apiTest2() throws IOException{
		for(int num = 0; num < 500; num++) {
		URL url1 = new URL("https://www.pettravel.kr/api/detailSeqArea.do?areaCode=AC02&contentNum=" + num);
//		URL url1 = new URL("https://www.pettravel.kr/api/listArea.do?areaCode=AC01&page=1&pageBlock=100");
		BufferedReader bf;
		
		bf = new BufferedReader(new InputStreamReader(url1.openStream(), "UTF-8"));
		
		String result1 = bf.readLine();
		//System.out.println("현규"+result1);
		
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonObject = (JsonArray)jsonParser.parse(result1);
		
		JsonObject rcp = (JsonObject)jsonObject.get(0);
		try {
			
		
		JsonObject row1 = (JsonObject)rcp.get("resultList");
			System.out.println("지역명 : " +  row1.get("areaName").getAsString());
			System.out.println("부분 : " +  row1.get("partName").getAsString());
			System.out.println("이름 : " +  row1.get("title").getAsString());
			System.out.println("주소 : " +  row1.get("address").getAsString());
			System.out.println("위도 : " +  row1.get("latitude").getAsString());
			System.out.println("경도 : " +  row1.get("longitude").getAsString());
			System.out.println("전화번호 : " +  row1.get("tel").getAsString());
			System.out.println("홈페이지 : " +  row1.get("homePage").getAsString());
			System.out.println("내용 : " +  row1.get("content").getAsString());
			System.out.println("주차 : " +  row1.get("parkingLog").getAsString());
			System.out.println("응급 : " +  row1.get("emergencyResponse").getAsString());
			System.out.println("이미지 : " +  row1.get("imageList").getAsJsonArray());
			System.out.println("------" + num +"번 가게------");
			
			ApiVO avo = new ApiVO();
			CenterVO cvo = new CenterVO();
			FileVO fvo = new FileVO();
			HosVO hvo = new HosVO();
			LocVO lvo = new LocVO();
			BoardVO bvo = new BoardVO();
			MemberVO mvo = new MemberVO();
			
			bvo.setBoard_no(444);
			bvo.setTitle("사사사");
			lvo.setAddr("대림동");
			hvo.setRoom(true);
			mvo.setName("사샤");
			fvo.setFilename_org("iligal");
			avo.setAdress("대림2동");
			cvo.setPark(false);
			
		} catch (Exception e) {}
			
//			JsonArray img = (JsonArray)jsonParser.parse(result1);
//			JsonObject rcp1 = (JsonObject)jsonObject.get(0);
//			JsonObject row2 = (JsonObject)rcp1.get("resultList");
		}
			
//			JsonArray row2 = (JsonArray)rcp.get("imageList");
//			for(int i = 0; i < row2.size(); i++) {
//				System.out.println(rcp.get("image"));
//			}
	}		
	
	
	
}
