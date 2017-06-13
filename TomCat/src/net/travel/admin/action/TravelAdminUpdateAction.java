package net.travel.admin.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.prism.Image;

import net.images.db.ImagesBean;
import net.images.db.ImagesDAO;
import net.plan.db.PlanDAO;
import net.travel.admin.db.TravelBean;

public class TravelAdminUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 파라미터 값 가져오기
		String realPath = request.getSession().getServletContext().getRealPath("./images/plan/nation/");
		int maxSize = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String pageNum = request.getParameter("pageNum");
		String sort = request.getParameter("sort");
		
		String travel_id_str = multi.getParameter("travel_id");
		int travel_id = Integer.parseInt(travel_id_str);
		
		String type = multi.getParameter("type");
		String country_code = multi.getParameter("country_code");
		String city_code = multi.getParameter("city_code");
		String name = multi.getParameter("name");
		String address = multi.getParameter("address");
		String info = multi.getParameter("info");
		
		String lat_str = multi.getParameter("lat");
		String lng_str = multi.getParameter("lng");
		float lat = Float.parseFloat(lat_str);
		float lng = Float.parseFloat(lng_str);
		
		TravelBean tb = new TravelBean();
		tb.setAddress(address);
		tb.setCity_code(city_code);
		tb.setCountry_code(country_code);
		tb.setInfo(info);
		tb.setLatitude(lat);
		tb.setLongitude(lng);
		tb.setName(name);
		tb.setTravel_id(travel_id);
		tb.setType(type);
		
		PlanDAO pdao = new PlanDAO();

		/* 이미지 처리 */
		String file = multi.getFilesystemName("file");
		
		if(file==null) {
			System.out.println("변경된 이미지 없음");
		}else {
			// 기존의 이미지 경로 구하기(기존 것 삭제)
			ImagesDAO idao = new ImagesDAO();
			String beforeImgPath = idao.getTravelImgPath(travel_id);
			
			if(beforeImgPath.equals("")) {	// 디비에 기존의 이미지 정보가 없으면
				System.out.println("기존의 이미지 정보가 없음");
			}else {
				beforeImgPath = realPath + beforeImgPath;
				File beforeFile = new File(beforeImgPath);
				System.out.println("기존 이미지 경로 확인: " + beforeFile.getPath());
				if(beforeFile.exists()) {
					beforeFile.delete();	// 기존 이미지 삭제
				}
			}
				
			// 바뀐 이미지 경로 구하기(새로운 경로에 이미지 이동)
			String en_name = pdao.getCityEnName(city_code);	// 영어 도시이름
			System.out.println("city_code: " + city_code);
			String fileType = file.substring(file.lastIndexOf("."), file.length());	// 파일 확장자 명
			String newImgPath = realPath + country_code + "\\" + en_name + "\\" + travel_id + fileType;	// 새로운 이미지 경로
			
			System.out.println("새 경로: " + newImgPath);
			
			File newFile = new File(newImgPath);	// 이동할 경로
			File curFile = new File(realPath + file);	// 새로운 이미지 현재 저장되어 있는 경로

			// 디렉토리 있는지 확인
			File dir = new File(realPath + country_code +"\\"+en_name);
			if(!dir.exists()) {	// 폴더가 안만들어져 있으면
				dir.mkdirs();	// 폴더 생성
			}
			// 이미지 이동
			if(curFile.exists()) {
				curFile.renameTo(newFile);	// 생성되 있는 이미지 새로운 경로에 이동, 이미지 이름도 변경
			}
				
			// 이미지 DB 수정
			String path = country_code + "\\" + en_name + "\\" + travel_id + fileType;	// 디비에 수정할 경로
			ImagesBean ib = new ImagesBean();
			ib.setCity_code(city_code);
			ib.setCountry_code(country_code);
			ib.setFile(path);
			ib.setInfo(name + " 이미지");
			ib.setName(name);
			ib.setTravel_id(travel_id);
			ib.setType(type);
			
			String checkPath = idao.getTravelImgPath(travel_id);
			if(checkPath.equals("")) {	// 디비에 기존의 이미지가 없으면
				idao.insertImage(ib);
			}else {	// 디비에 기존의 이미지가 있으면
				idao.updateTravelFile(ib);
			}
		}
		
		/* 관광지 DB 수정 */
		pdao.updateTravel(tb);
		
		// 이동정보 반환
		ActionForward forward = new ActionForward();
		forward.setPath("./TravelAdminList.td");
		forward.setRedirect(true);
		
		return forward;
	}
	
}
