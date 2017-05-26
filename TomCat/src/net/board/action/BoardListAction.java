package net.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;
import net.board.db.boardBean;

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardListAction execute()");

		request.setCharacterEncoding("utf-8");		
		
		BoardDAO bdao = new BoardDAO();
				
		int count = bdao.getBoardcount();//게시한 글이 몇개인지 세어주는 메소드
		int pageSize = 10;//한 페이지당 글 10개씩 게시

		//pageNum을 처음 선언해주는곳, 페이지번호이지만 String 값으로 처음생성
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {//pageNum 이 없으면
			pageNum = "1";//무조건 1페이지
		}
		int currentPage = Integer.parseInt(pageNum);//현재페이지는 pageNum을 int형으로 바꾼것
		int startrow = (currentPage - 1) * pageSize + 1;
		 // 시작 줄 	=	(3-1)			* 10 +1 =21 줄부터시작!
		int endRow=currentPage*pageSize;
		//  끝줄 = 	3*10 =30줄까지!
		
		List boardList=null;//list를 사용하여 list.jsp에 넘겨줄 값들 setAtrribute에 담기
		//게시한글이 한개라도 있을경우에는 하기의 getBoardList를 통해 게시판에 글들을 게시해줌
		if(count!=0){
			boardList=bdao.getBoardList(startrow, pageSize);
		}
		//상기의 getBoardList에서 받아온값들을 setAttribute 에 담아서 list.jsp로 보내줌
		request.setAttribute("bl", boardList);
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startrow", startrow);
		request.setAttribute("endRow", endRow);		
		
				
			
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);//false일 경우 forward형식으로 이동
		forward.setPath("./instagram/list.jsp");
		return forward;
	}

}
