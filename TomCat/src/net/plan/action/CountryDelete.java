package net.plan.action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.images.db.ImagesDAO;
import net.plan.db.PlanCountryBean;
import net.plan.db.PlanDAO;

public class CountryDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("CountryDelete execute()");
		
		request.setCharacterEncoding("utf-8");
		
		String pageNum = request.getParameter("pageNum");
		String country_code = request.getParameter("country_code");
		
		// 실제 경로의 폴더 삭제
		deleteAllFiles(request.getSession().getServletContext().getRealPath("/images/plan/nation/"+country_code));
		
		// DB의 국가 이미지 정보 삭제
		ImagesDAO idao = new ImagesDAO();
		idao.deleteCountryImages(country_code);
		
		// DB의 국가 삭제
		PlanDAO pdao = new PlanDAO();
		int check =  pdao.deleteCountry(country_code);
		
		if(check==1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제되었습니다');");
			out.println("location.href='./CountryList.pl?pageNum="+pageNum+"'");
			out.println("</script>");
			out.close();
			return null;
		}
		
		return null;
	}

	// 폴더내의 모든 파일 삭제후 폴더 삭제
	public static void deleteAllFiles(String path){ 
		
		File file = new File(path);
		File[] inFile = file.listFiles();	// 폴더 내 파일을 가져온다
		
		if(inFile.length > 0) {
			
			for(int i = 0; i < inFile.length; i++) {
				
				if(inFile[i].isFile()) {
					inFile[i].delete();
				}else {
					deleteAllFiles(inFile[i].getPath());
				}
				inFile[i].delete();
			}
			file.delete();	// 디렉토리 삭제
		}
	}

}
