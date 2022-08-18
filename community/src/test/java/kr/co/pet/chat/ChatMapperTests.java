package kr.co.pet.chat;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ChatMapperTests {

	
	@Autowired
	private ChatMapper mapper;
	private ChatService service;
	
	@Test
	public void entryTest() {
		Map<String, String> mapReceive = new HashMap();
		mapReceive.put("type", "1");
		int readCnt = 1;
		log.info(Integer.valueOf(mapReceive.get("type")) == 1  && readCnt>0);
	}
	
	
}
