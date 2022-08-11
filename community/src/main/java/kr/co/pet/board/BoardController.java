package kr.co.pet.board;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.pet.board.api.ApiInsert;
import kr.co.pet.file.FileService;
import kr.co.pet.file.FileVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@Autowired
	FileService fservice;
	
	@Autowired
	ApiInsert api;
	
	@GetMapping("/board/index.do")
	public String index(Model model, BoardVO vo) throws IOException, ParseException {
		model.addAttribute("data", service.index(vo));
		return "/board/index";
	}
	
	@GetMapping("/board/write.do")
	public String write() {
		return "/board/write";
	}
	
	@GetMapping("/board/view.do")
	public String view(BoardVO vo, FileVO fvo, Model model) {
		BoardVO data = service.view(vo.getBoard_no());
		model.addAttribute("data", data);
		FileVO fdata = fservice.view(fvo.getBoard_no());
		model.addAttribute("fdata", fdata);

		//model.addAttribute("file", file);
		return "/board/view";
	}
	
	@PostMapping(value = "/board/insert.do", consumes = "multipart/form-data")
	public String insert(BoardVO vo, FileVO fvo, Model model, @RequestParam MultipartFile filename,
			HttpServletRequest req) {
		//게시글 저장 board테이블
		boolean in = service.insert(vo);
		//첨부파일 처리file테이블
		if(!filename.isEmpty()) {
			//파일명 구하기
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf(".")); //확장자
			String real = new Date().getTime()+ext;
			
			//파일저장req.getRealPath("/upload/")
			String path = req.getSession().getServletContext().getRealPath("/upload/");
			try {
				filename.transferTo(new File(path+real));
			} catch (Exception e) {}
			fvo.setFilename_org(org);
			fvo.setFilename_real(real);
			fvo.setBoard_no(vo.getBoard_no());
			if(fservice.insert(fvo)){
				model.addAttribute("msg", "정상적으로 저장되었습니다.");
				model.addAttribute("url", "/pet/board/index.do");
				return "common/alert";
			} else {
				service.delete(vo.getBoard_no());
				model.addAttribute("msg", "저장이 실패했습니다.");
				return "common/alert";
			}
		}
	
		//member_no 저장
//		HttpSession sess = req.getSession();
//		MemberVO mv = (MemberVO)sess.getAttribute("loginInfo");
//		vo.setMember_no(mv.getNo());
		
		if(in) {
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/board/index.do");
			return "common/alert";
		}  else {
			model.addAttribute("msg", "저장이 실패했습니다.");
			return "common/alert";
		}
	}
	
	@GetMapping("/board/edit.do")
	public String edit(BoardVO vo, Model model) {
		BoardVO data = service.edit(vo.getBoard_no());
		model.addAttribute("data", data);
		return "/board/edit";
	}
	
	@PostMapping("/board/update.do")
	public String update(BoardVO vo, Model model) {
		if(service.update(vo)) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?board_no="+vo.getBoard_no());
			return "common/alert";
		}else {
			model.addAttribute("msg", "수정실패");
			return "common/alert";
		}
	}
	
	@GetMapping("/board/local.do")
	public String local() {
		return "/board/local";
	}
	
	
	
	
	
	
}