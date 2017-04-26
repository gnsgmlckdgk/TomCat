package net.member.action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDAO;


// 이름과 연락처를 이용해 아이디를 찾는 클래스
public class MemberIdFinderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("utf-8");
		
		// 파라미터 값 가져오기
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		
		// DB객체 생성
		MemberDAO mdao = new MemberDAO();
		List<String> idList = mdao.getLostMemberId(name, tel);
		
		// 이동정보
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(idList.size()==0) {	// 찾는 아이다가 없는 경우
			out.print("<script>");
			out.print("alert('찾으시는 아이디가 없습니다.');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
		}else {	// 찾는 아이디가 있는 경우
			out.print("<script>");
			out.print("location.href='아이디 정보리스트 출력하는 페이지로 이동';");
			out.print("</script>");
			out.close();
		}
		
		return null;
	}
	
}
