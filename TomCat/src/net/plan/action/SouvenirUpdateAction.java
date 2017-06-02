package net.plan.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.plan.db.PlanDAO;
import net.plan.db.PlanSouvenirBean;

public class SouvenirUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("SouvenirUpdateAction execute()");
		
		//한글처리
		request.setCharacterEncoding("utf-8");
		
		String realPath = request.getRealPath("/upload");
		int maxSize=5*1024*1024;	//5MB

		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		PlanDAO pdao = new PlanDAO();
		PlanSouvenirBean psb = new PlanSouvenirBean();
		
		String city_code=multi.getParameter("city_code");
		psb.setNum(Integer.parseInt(multi.getParameter("num")));		
		psb.setInfo(multi.getParameter("info"));
		psb.setName(multi.getParameter("name"));
		psb.setRanking(Integer.parseInt(multi.getParameter("ranking")));
		String img=multi.getFilesystemName("img");
		psb.setImg(img);
			
		if(img!=null){
			psb.setImg(multi.getFilesystemName("img"));	
			}
		
		else{
			psb.setImg(multi.getParameter("img2"));	
		}
		
		pdao.updateSouvenir(psb);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();		
		out.println("<script>");
		out.println("alert('수정되었습니다.')");
		out.println("location.href='./SouvenirList.pl?city_code="+city_code+"'");
		out.println("</script>");
		out.close(); 
		

		return null;
	}

}
