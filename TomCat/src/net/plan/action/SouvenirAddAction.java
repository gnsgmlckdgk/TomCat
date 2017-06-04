package net.plan.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.plan.db.PlanDAO;
import net.plan.db.PlanSouvenirBean;

public class SouvenirAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("SouvenirAddAction execute()");
		
		
		
		//한글 처리
		request.setCharacterEncoding("utf-8");
		
		
		String realPath=request.getRealPath("/upload");
		
		int maxSize=5*1024*1024;

		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		String city_code=multi.getParameter("city_code");
		
		PlanSouvenirBean psb = new PlanSouvenirBean();
		psb.setCity_code(multi.getParameter("city_code"));
		psb.setImg(multi.getFilesystemName("img"));
		psb.setInfo(multi.getParameter("info"));
		psb.setName(multi.getParameter("name"));
		psb.setRanking(Integer.parseInt(multi.getParameter("ranking")));
		PlanDAO pdao = new PlanDAO();
		
		pdao.addSouvenir(psb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();		
		out.println("<script>");
		out.println("alert('기념품이 추가되었습니다.')");
		out.println("location.href='./SouvenirList.pl?city_code="+city_code+"'");
		out.println("</script>");
		out.close();
		
		return null;
	}

}
