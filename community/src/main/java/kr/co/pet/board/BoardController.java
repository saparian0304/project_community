package kr.co.pet.board;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import kr.co.pet.board.api.ApiService;
import kr.co.pet.bookmark.BookmarkService;
import kr.co.pet.center.CenterService;
import kr.co.pet.center.CenterVO;
import kr.co.pet.file.FileService;
import kr.co.pet.file.FileVO;
import kr.co.pet.hos.HosService;
import kr.co.pet.loc.LocService;
import kr.co.pet.loc.LocVO;
import kr.co.pet.member.MemberService;
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
	CenterService cservice;
	
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
	
	@Autowired
	MemberService mService;
	
	@GetMapping("/main.do")
	public String index(Model model, BoardVO vo, HttpSession sess) {
		// main.do 방문수 count 
		if(sess.getAttribute("Nonmembers") == null && sess.getAttribute("loginInfo") == null) {
			model.addAttribute("visit", mService.visitNonmUpdate());
			sess.setAttribute("Nonmembers", 1);
		}
		// 차단한 사람 글 안보이게 로그인했을때! 로그인 멤버no 파라미터  
		MemberVO loginInfo = (MemberVO)sess.getAttribute("loginInfo");		
		if(loginInfo !=null) {
			vo.setLoginNO(loginInfo.getMember_no());
		}
				
		vo.setMain("main");
		vo.setHorse_hair("2");
		vo.setPageRow(5);
		model.addAttribute("ldata", service.liveindex(vo));
		
		//좋아요순
		vo.setHorse_hair("4");//잡담
		model.addAttribute("tdata", service.freeindex(vo));
		vo.setHorse_hair("5");// 정보공유
		model.addAttribute("ddata", service.freeindex(vo));
		
		//최신순
		vo.setMain(null);
		vo.setSort("regdate");
		vo.setOrder("desc");
		vo.setHorse_hair("6");//여행후기
		model.addAttribute("sdata", service.freeindex(vo));
		
		vo.setHorse_hair("7");//고민상담
		model.addAttribute("wdata", service.freeindex(vo));
		
		
		return "board/main";
	}
	
	@GetMapping("/freeindex.do")
	public String freeindex(Model model, BoardVO vo, HttpSession sess) {
		// 차단한 사람 글 안보이게 로그인했을때! 로그인 멤버no 파라미터  
		MemberVO loginInfo = (MemberVO)sess.getAttribute("loginInfo");		
		if(loginInfo !=null) {
			vo.setLoginNO(loginInfo.getMember_no()); // 현재 로그인한 멤버
		}
		if (vo.getSort() == null || "".equals(vo.getSort())) {
			vo.setSort("regdate");
			vo.setOrder("desc");
		}
		vo.setPageRow(12);
		model.addAttribute("data", service.freeindex(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.indexTotal(vo));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("stype", vo.getStype());
		model.addAttribute("sword", vo.getSword());
		System.out.println("////free" + pageMaker.getStartPage() );
		return "board/freeindex";
	}
	
	@GetMapping("/liveindex.do")
	public String liveindex(Model model, BoardVO vo, HttpSession sess) {
		// 차단한 사람 글 안보이게 로그인했을때! 로그인 멤버no 파라미터  
		MemberVO loginInfo = (MemberVO)sess.getAttribute("loginInfo");		
		if(loginInfo !=null) {
			vo.setLoginNO(loginInfo.getMember_no());
		}
		
		if (vo.getSort() == null || "".equals(vo.getSort())) {
			vo.setSort("regdate");
			vo.setOrder("desc");
		}
		
		vo.setPageRow(12);
		model.addAttribute("data", service.liveindex(vo));
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.indexTotal(vo));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("stype", vo.getStype());
		model.addAttribute("sword", vo.getSword());
		
		System.out.println("////" + pageMaker.getStartPage());
		return "board/liveindex";
	}

	@GetMapping("/centerindex.do")
	public String centerindex(Model model, BoardVO vo, HttpSession sess) {
		// 차단한 사람 글 안보이게 로그인했을때! 로그인 멤버no 파라미터  
		MemberVO loginInfo = (MemberVO)sess.getAttribute("loginInfo");		
		if(loginInfo !=null) {
			vo.setLoginNO(loginInfo.getMember_no());
		}
		if (vo.getSort() == null || "".equals(vo.getSort())) {
			vo.setSort("regdate");
			vo.setOrder("desc");
		}
		
		vo.setPageRow(12);
		
		model.addAttribute("data", service.centerindex(vo));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(vo);
		pageMaker.setTotalCount(service.indexTotal(vo));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("stype", vo.getStype());
		model.addAttribute("sword", vo.getSword());
		
		return "board/centerindex";
	}
	
	@GetMapping("/admin/livewrite.do")
	public String livewrite(BoardVO vo, MemberVO mvo) {
		vo.setMember_no(mvo.getMember_no());
		if(vo.getMember_no() == 0) {
			mvo.setMember_id("관리자");
		}
		return "board/livewrite";
	}
	
	@GetMapping("/freewrite.do")
	public String freewrite() {
		return "board/freewrite";
	}
	
	@GetMapping("/admin/centerwrite.do")
	public String centerwrite() {
		return "board/centerwrite";
	}
	
	@GetMapping("/freeview.do")
	public String freeview(BoardVO vo, Model model, HttpSession sess) {
		BoardVO data = service.view(vo.getBoard_no());
		model.addAttribute("data", data);
		List fdata = fservice.find(vo.getBoard_no());
		model.addAttribute("fdata", fdata);
		
		model.addAttribute("recdata", recService.recommend(vo.getBoard_no(), 0, sess));
		model.addAttribute("bookdata", bService.bookmarked(vo, sess));
		return "board/freeview";
	}
	@GetMapping("/liveview.do")
	public String liveview(BoardVO vo, Model model, HttpSession sess) {
		BoardVO data = service.view(vo.getBoard_no());
		model.addAttribute("data", data);
		List fdata = fservice.find(vo.getBoard_no());
		model.addAttribute("fdata", fdata);
		LocVO ldata = lservice.view(vo.getBoard_no());
		model.addAttribute("ldata", ldata);
		
		model.addAttribute("recdata", recService.recommend(vo.getBoard_no(), 0, sess));
		model.addAttribute("bookdata", bService.bookmarked(vo, sess));
		return "board/liveview";
	}
	
	@GetMapping("/centerview.do")
	public String centerview(BoardVO vo, Model model, HttpSession sess) {
		BoardVO data = service.view(vo.getBoard_no());
		model.addAttribute("data", data);
		List fdata = fservice.find(vo.getBoard_no());
		model.addAttribute("fdata", fdata);
		
		model.addAttribute("recdata", recService.recommend(vo.getBoard_no(), 0, sess));
		model.addAttribute("bookdata", bService.bookmarked(vo, sess));
		return "board/centerview";
	}
	
	@PostMapping(value = "/admin/liveinsert.do", consumes = "multipart/form-data")
	public String liveinsert(BoardVO vo, FileVO fvo, LocVO lvo, Model model, @RequestParam MultipartFile filename,
			HttpServletRequest req, HttpSession sess) {
		//게시글 저장 board테이블
		//LocVO lvo = new LocVO();
		vo.setBoard_name("live");
		//member_no가 필요없어졌음
//		MemberVO mno =(MemberVO)(sess.getAttribute("loginInfo"));
//		vo.setMember_no(mno.getMember_no());
		
//		vo.setMember_no(((MemberVO)sess.getAttribute("loginInfo")).getMember_no());
		
		boolean in = service.insert(vo);
		String st =  vo.getContent();
		st.replaceAll("<p>", "");
		st.replaceAll("</p>", "");
		vo.setContent(st);
		service.update(vo);
		lvo.setBoard_no(vo.getBoard_no());
		lservice.insert(lvo);
		vo.setBoard_name("live");
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
			fvo.setBoard_no(vo.getBoard_no());
			fvo.setFilename_org(org);
			fvo.setFilename_real(real);
			if(fservice.insert(fvo)){
				model.addAttribute("msg", "정상적으로 저장되었습니다.");
				model.addAttribute("url", "/pet/liveview.do?board_no="+vo.getBoard_no());
				
				return "common/alert";
				
			} else {
				service.delete(vo.getBoard_no());
				model.addAttribute("msg", "저장이 실패했습니다.");
				return "common/alert";
			}
		}
	
		if(in) {
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/pet/liveindex.do");
			
			return "common/alert";
		}  else {
			model.addAttribute("msg", "저장이 실패했습니다.");
			return "common/alert";
		}
	}
	@PostMapping(value = "/freeinsert.do", consumes = "multipart/form-data")
	public String freeinsert(BoardVO vo, FileVO fvo, LocVO lvo, Model model, @RequestParam MultipartFile filename,
			HttpServletRequest req, HttpSession sess) {
		//게시글 저장 board테이블
		//LocVO lvo = new LocVO();
		vo.setBoard_name("free");
		MemberVO member = (MemberVO)sess.getAttribute("loginInfo");
		vo.setMember_no(member.getMember_no());
		boolean in = service.insert(vo);
		String st =  vo.getContent();
		st.replaceAll("<p>", "");
		st.replaceAll("</p>", "");
		vo.setContent(st);
		service.update(vo);
		lvo.setBoard_no(vo.getBoard_no());
		fvo.setBoard_no(vo.getBoard_no());
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
			if(fservice.insert(fvo)){
				model.addAttribute("msg", "정상적으로 저장되었습니다.");
				model.addAttribute("url", "freeview.do?board_no="+vo.getBoard_no());
				return "common/alert";
				
			} else {
				service.delete(vo.getBoard_no());
				model.addAttribute("msg", "저장이 실패했습니다.");
				return "common/alert";
			}
		}
		
		//member_no 저장 로그인
		HttpSession sess2 = req.getSession();
		MemberVO mv = (MemberVO)sess2.getAttribute("loginInfo");
		vo.setMember_no(mv.getMember_no());
		
		if(in) {
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "freeindex.do");
			
			return "common/alert";
		}  else {
			model.addAttribute("msg", "저장이 실패했습니다.");
			return "common/alert";
		}
	}

	@PostMapping(value = "/admin/centerinsert.do", consumes = "multipart/form-data")
	public String centerinsert(BoardVO vo, FileVO fvo, LocVO lvo, CenterVO cvo,Model model, @RequestParam MultipartFile filename,
			HttpServletRequest req, HttpSession sess, HttpServlet hs) {
		//게시글 저장 board테이블
		//LocVO lvo = new LocVO();
		vo.setBoard_name("center");
		//member_no 저장 로그인
//		HttpSession sess2 = req.getSession();
//		MemberVO mv = (MemberVO)sess2.getAttribute("loginInfo");
//		
//		
//		vo.setMember_no(mv.getMember_no());

		boolean in = service.insert(vo);
		String st =  vo.getContent();
		st.replaceAll("<p>", "");
		st.replaceAll("</p>", "");
		vo.setContent(st);
		service.update(vo);
		
		lvo.setBoard_no(vo.getBoard_no());
		fvo.setBoard_no(vo.getBoard_no());
		cvo.setBoard_no(vo.getBoard_no());
		lservice.insert(lvo);
		cservice.insert(cvo);
		
		
		
		
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
			if(fservice.insert(fvo)){
				model.addAttribute("msg", "정상적으로 저장되었습니다.");
				model.addAttribute("url", "centerview.do?board_no="+vo.getBoard_no());
				return "common/alert";
				
			} else {
				service.delete(vo.getBoard_no());
				model.addAttribute("msg", "저장이 실패했습니다.");
				return "common/alert";
			}
		}
		
		if(in) {
			model.addAttribute("msg", "정상적으로 저장되었습니다.");
			model.addAttribute("url", "/pet/centerindex.do");
			
			return "common/alert";
		}  else {
			model.addAttribute("msg", "저장이 실패했습니다.");
			return "common/alert";
		}
	}
	
	@GetMapping("/admin/liveedit.do")
	public String liveedit(BoardVO vo, FileVO fvo, LocVO lvo, Model model) {
		BoardVO data = service.edit(vo.getBoard_no());
		model.addAttribute("data", data);
		
		FileVO fdata = fservice.edit(fvo.getBoard_no());
		model.addAttribute("fdata", fdata);
		
		LocVO ldata = lservice.edit(lvo.getBoard_no());
		model.addAttribute("ldata", ldata);
		return "board/liveedit";
	}
	
	@GetMapping("/freeedit.do")
	public String freeedit(BoardVO vo, FileVO fvo, LocVO lvo, Model model) {
		BoardVO data = service.edit(vo.getBoard_no());
		model.addAttribute("data", data);
		
		FileVO fdata = fservice.edit(fvo.getBoard_no());
		model.addAttribute("fdata", fdata);
		
		LocVO ldata = lservice.edit(lvo.getBoard_no());
		model.addAttribute("ldata", ldata);
		return "board/freeedit";
	}
	
	@GetMapping("/admin/centeredit.do")
	public String centeredit(BoardVO vo, FileVO fvo, LocVO lvo, Model model) {
		BoardVO data = service.edit(vo.getBoard_no());
		model.addAttribute("data", data);
		
		FileVO fdata = fservice.edit(fvo.getBoard_no());
		model.addAttribute("fdata", fdata);
		
		LocVO ldata = lservice.edit(lvo.getBoard_no());
		model.addAttribute("ldata", ldata);
		return "board/centeredit";
	}
	
	@PostMapping("/admin/liveupdate.do")
	public String liveupdate(BoardVO vo, Model model) {
		if(service.update(vo)) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "/pet/liveview.do?board_no="+vo.getBoard_no());
			return "common/alert";
		}else {
			model.addAttribute("msg", "수정실패");
			return "common/alert";
		}
	}
	
	@PostMapping("/freeupdate.do")
	public String freeupdate(BoardVO vo, Model model) {
		if(service.update(vo)) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "freeview.do?board_no="+vo.getBoard_no());
			return "common/alert";
		}else {
			model.addAttribute("msg", "수정실패");
			return "common/alert";
		}
	}
	
	@PostMapping("/admin/centerupdate.do")
	public String update(BoardVO vo, Model model) {
		if(service.update(vo)) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "/pet/centerview.do?board_no="+vo.getBoard_no());
			return "common/alert";
		}else {
			model.addAttribute("msg", "수정실패");
			return "common/alert";
		}
	}
	
	@GetMapping("/admin/livedelete.do")
	public String livedelete(BoardVO vo, Model model) {
		if(service.delete(vo.getBoard_no())) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "liveindex.do");
			return "common/alert";
		}else {
			model.addAttribute("msg", "삭제실패");
			return "common/alert";
		}
	}
	@GetMapping("/freedelete.do")
	public String freedelete(BoardVO vo, Model model) {
		if(service.delete(vo.getBoard_no())) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "freeindex.do");
			return "common/alert";
		}else {
			model.addAttribute("msg", "삭제실패");
			return "common/alert";
		}
	}
	@GetMapping("/centerdelete.do")
	public String delete(BoardVO vo, Model model) {
		if(service.delete(vo.getBoard_no())) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "centerindex.do");
			return "common/alert";
		}else {
			model.addAttribute("msg", "삭제실패");
			return "common/alert";
		}
	}
	
}
