package kr.co.pet.board;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.pet.board.api.ApiService;
import kr.co.pet.bookmark.BookmarkService;
import kr.co.pet.file.FileService;
import kr.co.pet.file.FileVO;
import kr.co.pet.hos.HosService;
import kr.co.pet.loc.LocService;
import kr.co.pet.loc.LocVO;
import kr.co.pet.member.MemberVO;
import kr.co.pet.recommend.RecommendService;
import kr.co.pet.reply.ReplyService;
import util.PageMaker;
@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@Autowired
	FileService fservice;
	
	@Autowired
	LocService lservice;
	
	@Autowired
	HosService hservice;
	
	@Autowired
	ApiService aservice;
	
	@Autowired
	ReplyService rService;
	
	@Autowired
	RecommendService recService;
	
	@Autowired
	BookmarkService bService;

	@GetMapping("/board/main.do")
	public String index(Model model, BoardVO vo) {
		model.addAttribute("data", service.index(vo));
		model.addAttribute("fdata", fservice.find(vo.getBoard_no()));
		return "board/main";
	}
	
	@GetMapping("/board/freeindex.do")
	public String freeindex(Model model, BoardVO vo) {
		model.addAttribute("data", service.freeindex(vo));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.indexTotal(vo));
		model.addAttribute("pageMaker", pageMaker);
		return "board/freeindex";
	}
	
	@GetMapping("/board/liveindex.do")
	public String liveindex(Model model, BoardVO vo) {
		vo.setPageRow(12);
		model.addAttribute("data", service.liveindex(vo));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.indexTotal(vo));
		model.addAttribute("pageMaker", pageMaker);
		return "board/liveindex";
	}

	@GetMapping("/board/centerindex.do")
	public String centerindex(Model model, BoardVO vo) {
		model.addAttribute("data", service.liveindex(vo));
		return "board/centerindex";
	}
	
	@GetMapping("/board/livewrite.do")
	public String livewrite() {
		return "board/livewrite";
	}
	
	@GetMapping("/board/freewrite.do")
	public String freewrite() {
		return "board/freewrite";
	}
	
	@GetMapping("/board/view.do")
	public String view(BoardVO vo, Model model, HttpSession sess) {
		BoardVO data = service.view(vo.getBoard_no());
		model.addAttribute("data", data);
		List fdata = fservice.find(vo.getBoard_no());
		model.addAttribute("fdata", fdata);
		LocVO ldata = lservice.view(vo.getBoard_no());
		model.addAttribute("ldata", ldata);
		
		model.addAttribute("recdata", recService.recommend(vo.getBoard_no(), 0, sess));
		model.addAttribute("bookdata", bService.bookmarked(vo, sess));
		//model.addAttribute("file", file);
		return "board/view";
	}
	
	@PostMapping(value = "/board/insert.do", consumes = "multipart/form-data")
	public String insert(BoardVO vo, FileVO fvo, LocVO lvo, Model model, @RequestParam MultipartFile filename,
			HttpServletRequest req) {
		//게시글 저장 board테이블
		//LocVO lvo = new LocVO();
		boolean in = service.insert(vo);
		String st =  vo.getContent();
		st.replaceAll("<p>", "");
		st.replaceAll("</p>", "");
		vo.setContent(st);
		service.update(vo);
		lvo.setBoard_no(vo.getBoard_no());
		lservice.insert(lvo);
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
				model.addAttribute("url", "index.do");
				
				return "common/alert";
				
			} else {
				service.delete(vo.getBoard_no());
				model.addAttribute("msg", "저장이 실패했습니다.");
				return "common/alert";
			}
		}
	
		//member_no 저장 로그인
//		HttpSession sess = req.getSession();
//		MemberVO mv = (MemberVO)sess.getAttribute("loginInfo");
//		vo.setMember_no(mv.getNo());
		
		if(in) {
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "index.do");
			
			//System.out.println("nickname: "+vo.getNickname());
			return "common/alert";
		}  else {
			model.addAttribute("msg", "저장이 실패했습니다.");
			return "common/alert";
		}
	}
	
	@GetMapping("/board/edit.do")
	public String edit(BoardVO vo, FileVO fvo, LocVO lvo, Model model) {
		BoardVO data = service.edit(vo.getBoard_no());
		model.addAttribute("data", data);
		
		FileVO fdata = fservice.edit(fvo.getBoard_no());
		model.addAttribute("fdata", fdata);
		
		LocVO ldata = lservice.edit(lvo.getBoard_no());
		model.addAttribute("ldata", ldata);
		return "board/edit";
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
	
	@GetMapping("/board/delete.do")
	public String delete(BoardVO vo, Model model) {
		if(service.delete(vo.getBoard_no())) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do");
			return "common/alert";
		}else {
			model.addAttribute("msg", "삭제실패");
			return "common/alert";
		}
	}
}
