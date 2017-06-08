package net.plan.action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.images.db.ImagesDAO;
import net.plan.db.PlanCityBean;
import net.plan.db.PlanDAO;

public class CityDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("CityDelete execute()");
		
		request.setCharacterEncoding("utf-8");
		
		String pageNum = request.getParameter("pageNum");
		String city_code = request.getParameter("city_code");
		
		PlanDAO pdao = new PlanDAO();
		PlanCityBean pcb = pdao.getCityContent(city_code);
		
		ImagesDAO idao = new ImagesDAO();
		String imgPath = idao.getCityImgPath(city_code);
		idao.deleteCityImages(city_code);
		
		// DB의 도시 이미지 정보 삭제
		File file = new File(request.getSession().getServletContext().getRealPath("/images/plan/nation/"+imgPath));	// 이미지 위치 정보
		if(file.exists()) {
			file.delete();
		}
		
		String country_code = pdao.getCountryCode(city_code);	// 국가 코드
		String en_name = pdao.getCityEnName(city_code);			// 도시 영어이름
		File file2 = new File(request.getSession().getServletContext().getRealPath("/images/plan/nation/"+country_code+"/"+en_name));
		System.out.println("file2 경로 : "+file2);

		if(file2.exists()) {	
			// 내부 파일들 삭제
			File[] inFile = file2.listFiles();
			for(int i=0; i<inFile.length; i++) {
				inFile[i].delete();
			}
			file2.delete();	// 디렉토리 삭제
		}
		
		// 도시정보 삭제
		int check =  pdao.deleteCity(city_code);

		if(check==1){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제되었습니다');");
			out.println("location.href='./CityList.pl?pageNum="+pageNum+"'");
			out.println("</script>");
			out.close();
			return null;
		}
		return null;
	}

}
