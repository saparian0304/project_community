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

import kr.co.pet.board.BoardMapper;
import kr.co.pet.file.FileMapper;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class other {

	@Autowired
	private BoardMapper mapper;
	@Autowired
	private FileMapper fmapper;
	

	@Test
	public void apiTest2() throws IOException{
		//key = "f3a6ee22bb946cc136a1a276ccbc83c8c9b219bd54144869ec663b8d7dcfcbdd"
		//레시피 기본정보(result1)
		//http://211.237.50.150:7080/openapi/key/json/Grid_20150827000000000226_1/startNo/endNo
		
		//레시피 재료정보(result2)
		//http://211.237.50.150:7080/openapi/key/json/Grid_20150827000000000227_1/startNo/endNo?RECIPE_ID=354
		
		//레시피 과정정보(result3)
		//http://211.237.50.150:7080/openapi/key/json/Grid_20150827000000000228_1/startNo/endNo
		String key = "f3a6ee22bb946cc136a1a276ccbc83c8c9b219bd54144869ec663b8d7dcfcbdd";
		int startNo, endNo;
		startNo = 351;
		endNo = 360;
		
		URL url1 = new URL("http://211.237.50.150:7080/openapi/" + key + "/json/Grid_20150827000000000226_1/" + startNo + "/" + endNo);
		
		BufferedReader bf;
		
		bf = new BufferedReader(new InputStreamReader(url1.openStream(), "UTF-8"));
		
		String result1 = bf.readLine();
System.out.println("현규"+result1);
		
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObject = (JsonObject)jsonParser.parse(result1);
		
		JsonObject rcp = (JsonObject)jsonObject.get("Grid_20150827000000000226_1");
		JsonArray row1 = (JsonArray)rcp.get("row");
		
		for(int i = 0; i < row1.size(); i++) {
			
			System.out.println("------" + (i + 1) + "번 레시피------");
			System.out.println("제목 : " +  ((JsonObject)row1.get(i)).get("RECIPE_NM_KO").getAsString());
			System.out.println("소개 : " +  ((JsonObject)row1.get(i)).get("SUMRY").getAsString());
			System.out.println("대분류 : " +  ((JsonObject)row1.get(i)).get("NATION_NM").getAsString());
			System.out.println("중분류 : " +  ((JsonObject)row1.get(i)).get("TY_NM").getAsString());
			System.out.println("조리시간 : " +  ((JsonObject)row1.get(i)).get("COOKING_TIME").getAsString());
			System.out.println("인원수 : " +  ((JsonObject)row1.get(i)).get("QNT").getAsString());
			
			URL url2 = new URL("http://211.237.50.150:7080/openapi/" + key + "/json/Grid_20150827000000000227_1/1/1000?RECIPE_ID=" + (startNo + i));
			bf = new BufferedReader(new InputStreamReader(url2.openStream(), "UTF-8"));
			String result2 = bf.readLine();
			
			JsonObject jo2 = (JsonObject)jsonParser.parse(result2);
			JsonObject rcp2 = (JsonObject)jo2.get("Grid_20150827000000000227_1");
			JsonArray row2 = (JsonArray)rcp2.get("row");
			
			System.out.println("------재료------");
			for(int j = 0;j < row2.size() ;j++){
				System.out.print(j + "번 재료 : " + ((JsonObject)row2.get(j)).get("IRDNT_NM").getAsString());
				System.out.println(" / 수량 : " + ((JsonObject)row2.get(j)).get("IRDNT_CPCTY").getAsString());
			}
			
			URL url3 = new URL("http://211.237.50.150:7080/openapi/" + key + "/json/Grid_20150827000000000228_1/1/1000?RECIPE_ID=" + (startNo + i));
			bf = new BufferedReader(new InputStreamReader(url3.openStream(), "UTF-8"));
			String result3 = bf.readLine();
			
			JsonObject jo3 = (JsonObject)jsonParser.parse(result3);
			JsonObject rcp3 = (JsonObject)jo3.get("Grid_20150827000000000228_1");
			JsonArray row3 = (JsonArray)rcp3.get("row");
			
			System.out.println("------조리과정------");
			for(int j = 0;j < row3.size() ;j++){
				System.out.println(j + "번 과정 : " + ((JsonObject)row3.get(j)).get("COOKING_DC").getAsString());
				if (!((JsonObject)row3.get(j)).get("STRE_STEP_IMAGE_URL").getAsString().equals("")) {
					System.out.println("이미지url : " + ((JsonObject)row3.get(j)).get("STRE_STEP_IMAGE_URL").getAsString());
				}
				if (!((JsonObject)row3.get(j)).get("STEP_TIP").getAsString().equals("")) {
					System.out.println("팁 : " + ((JsonObject)row3.get(j)).get("STEP_TIP").getAsString());
				}
			}
		}
	}
	
	
	
}
