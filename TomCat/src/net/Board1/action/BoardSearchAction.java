package net.Board1.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.spi.orbutil.fsm.Action;
import com.sun.corba.se.spi.orbutil.fsm.FSM;
import com.sun.corba.se.spi.orbutil.fsm.Input;

import net.board.db.BoardDAO;
import net.reply.action.ActionForward;



public class BoardSearchAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
System.out.println("BoardSearchAction execute()");
		
		request.setCharacterEncoding("utf-8");
		String search=request.getParameter("search");
		
		BoardDAO bdao=new BoardDAO();
		int count=bdao.getBoardcount();
		int pageSize = 5;// 한 페이지당 글 5개씩 게시
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {// pageNum 이 없으면
			pageNum = "1";// 무조건 1페이지
		}
		
		int currentPage = Integer.parseInt(pageNum);// 현재페이지는 pageNum을 int형으로


		int startrow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = ((currentPage - 1) / pageSize) * pageSize + 1;
		int endPage = startPage + pageSize - 1;

		
		// =======================List 내용 뿌려주는 부분=================
		List BoardList1 = null;// list를 사용하여 list.jsp에 넘겨줄 값들 setAtrribute에 담기
		// 게시한글이 한개라도 있을경우에는 하기의 getBoardList를 통해 게시판에 글들을 게시해줌
		if (count != 0) {
			BoardList1 = bdao.getBoardList(startrow, pageSize);
		}

		// 상기의 getBoardList에서 받아온값들을 setAttribute 에 담아서 list.jsp로 보내줌
		request.setAttribute("ql", BoardList1);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("search", search);

		


		ActionForward forward = new ActionForward();
		forward.setRedirect(false);// false일 경우 forward형식으로 이동
		forward.setPath("./Board/list1search.jsp");
		return forward;		
	}

	@Override
	public void doIt(FSM arg0, Input arg1) {
		// TODO Auto-generated method stub
		
	}

}
