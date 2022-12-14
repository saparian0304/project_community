package kr.co.pet.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.pet.board.api.ApiVO;
import kr.co.pet.center.CenterVO;
import kr.co.pet.file.FileVO;
import kr.co.pet.hos.HosMapper;
import kr.co.pet.hos.HosVO;
import kr.co.pet.loc.LocMapper;
import kr.co.pet.loc.LocVO;
import kr.co.pet.member.MemberVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class apiTest {
	
	@Autowired
	private BoardMapper mapper;
	@Autowired
	private LocMapper lmapper;
	@Autowired
	private HosMapper hmapper;
	
	@Test
	public void apiTest2() throws IOException{
		for(int num = 0; num < 10; num++) {
		URL url1 = new URL("https://www.pettravel.kr/api/detailSeqArea.do?areaCode=AC02&contentNum=" + num);
//		URL url1 = new URL("https://www.pettravel.kr/api/listArea.do?areaCode=AC01&page=1&pageBlock=100");
		BufferedReader bf;
		
		bf = new BufferedReader(new InputStreamReader(url1.openStream(), "UTF-8"));
		
		String result1 = bf.readLine();
		//System.out.println("현규"+result1);
		
		JsonParser jsonParser = new JsonParser();
		JsonArray jsonObject = (JsonArray)jsonParser.parse(result1);
		
		JsonObject rcp = (JsonObject)jsonObject.get(0);
		
		ApiVO avo = new ApiVO();
		CenterVO cvo = new CenterVO();
		FileVO fvo = new FileVO();
		HosVO hvo = new HosVO();
		LocVO lvo = new LocVO();
		BoardVO vo = new BoardVO();
		MemberVO mvo = new MemberVO();
		
		
		
		try {
			
			JsonObject row1 = (JsonObject)rcp.get("resultList");
			System.out.println("------" + num +"번 가게------");
			vo.setBoard_name(row1.get("partName").getAsString());
			lvo.setAddr(row1.get("areaName").getAsString());
			vo.setTitle(row1.get("title").getAsString());
			lvo.setAddr2(row1.get("address").getAsString());
			vo.setTel(row1.get("tel").getAsString());
			//vo.setLink(row1.get("image").getAsString());
			vo.setContent(row1.get("content").getAsString());
			hvo.setPark(row1.get("parkingFlag").getAsBoolean());
			hvo.setHurry(row1.get("emergencyFlag").getAsBoolean());
			lvo.setGps_x(row1.get("latitude").getAsString());
			lvo.setGps_y(row1.get("longitude").getAsString());
			//vo.setImage(vo.getImageList()[num]);
			
//			JsonObject row2 = (JsonObject)row1.get("imageList");
//			vo.setImage(row2.get("image").getAsString());
			
			
			
			mapper.insertSelectKey(vo);
			
			lvo.setBoard_no(vo.getBoard_no());
			hvo.setBoard_no(vo.getBoard_no());
			
			lmapper.insert(lvo);
			hmapper.insert(hvo);
			
		
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
			
			
			
		} catch (Exception e) {}
			
		}
			
	}		
	
	
	
}
