package kr.co.pet.chat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatMapper {

	//List<LinkedHashMap> friendList(int vo);
	//Integer listInfo(LinkedHashMap map);
	
	
	List<LinkedHashMap> list(int i_no);
	int insertChat(Map map);
	int creatChannel(Map membersInfo);
	Integer getChannel(Map membersInfo);
	int joinChannel(Map joinInfo);
	List<LinkedHashMap> chatHistory(Map channelInfo);
	
	List<LinkedHashMap> openChatList();
	List<LinkedHashMap> myOpenChatlist(int member_no);
	Integer isJoined(Map memberInfo);
	Map<String, String> channelInfo(int channel_no);
	
	int creatOpenChat(Map openChatInfo);
	int exitOpenChat(Map memberInfo);
	int kick(Map kickMemberInfo);
	
	int getMemberCnt(Map channelInfo);
	int closeChannel(Map channelInfo);
	int masterUpdate(int channel_no);
}
