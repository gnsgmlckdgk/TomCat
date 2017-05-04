package net.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

/* memberManager.jsp 에 회원정보를 출력하기위해 회원정보를 가져오는 클래스 */
public class MemberManager implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// MemberDAO 객체 생성
		MemberDAO mdao = new MemberDAO();
		
		/* 회원 리스트 가져오기 */
		// 전체 회원의 수 구하기
		int count = mdao.getCountMember();
		
		// 현제 페이지 번호 구하기
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum = "1";
		}
		int currentPageNum = Integer.parseInt(pageNum);
		
		// 한 페이지에 출력할 게시글의 갯수 설정
		int pageSize = 10;
		
		// 시작 행 구하기
		int startRow = (currentPageNum - 1) * pageSize + 1;
		
		// 회원 리스트 가져오기
		List<MemberBean> memberList = null;
		if(count != 0) {
			memberList = mdao.getMemberList(startRow, pageSize);
		}
		
		request.setAttribute("memberList", memberList);
		
		
		/* 페이징 처리하기 */
		// 필요한 페이지 수 구하기
		
		
		// 시작 페이지 구하기
		
		
		// 끝 페이지 구하기
		
		
		
		// 이동정보
		ActionForward forward = new ActionForward();
		forward.setPath("./member/memberManager.jsp?pageNum="+pageNum);
		forward.setRedirect(false);
		
		return forward;
	}
}
