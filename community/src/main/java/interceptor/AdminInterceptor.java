package interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.pet.admin.AdminMemberVO;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler)
			throws Exception {
		
		HttpSession sess = req.getSession();
		AdminMemberVO adminInfo = (AdminMemberVO)sess.getAttribute("adminInfo");
		System.out.println(adminInfo);
		if (adminInfo == null) {
			res.setContentType("text/html;charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('로그인 후 사용가능합니다.');");
			out.println("location.href='/pet/admin/login.do';");
			out.println("</script>");
			out.flush();
			return false;
		}
		else return true;
		
	}
}
