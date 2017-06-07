package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import net.Board1.db.BoardBean;
import net.QandA.db.QandABean;
import net.board.db.boardBean;
import net.plan.db.PlanNationCommentBean;
import net.plan.db.PlanRegionCommentBean;

/* 회원이 쓴 글 조회하는 클래스 */
public class MemberBoardDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;

	/* Connection Pool */
	private Connection getConnection() throws Exception {

		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mySQL");
		con = ds.getConnection();

		return con;
	}

	// Q&A 게시글 갯수 구하기
	public int getQandAcction(String nick) {
		int count = 0;
		try {
			// 1,2 디비연결 메서드 호출
			con = getConnection();
			// 3 sql 함수 count(*) 이용
			sql = "select count(*) from qanda where nick = ?";

			ps = con.prepareStatement(sql);
			ps.setString(1, nick);
			// 4 rs실행저장
			rs = ps.executeQuery();
			// 5 데이터있으면 count저장

			// select에서 검색한 첫번째 열에 값이 있는지 없는지 확인하는 작업
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		} // finally
		return count;		
	}
	
	// Q&A 게시글 리스트 가져오기
	public List<QandABean> getQandAList(int startRow, int pageSize, String nick) {
		// 배열(컬렉션)객체 생성- 여러개의 기억공간 사용+기억공간 추가해서 사용
				List<QandABean> QandAList = new ArrayList<QandABean>();
				try {
					// 1,2 디비연결 메서드 호출
					con = getConnection();
					// 3 sql gram의모든 데이터 가져오기(select*from gram)
					// num에 의한 내림차순 정렬(order by num)
					// 글 잘라 오기 limit(시작행-1, 개수) startrow을 기준으로 pageSize만큼 자른다!
					sql = "select *from qanda where nick = ? order by date desc limit ?, ? ";

					ps = con.prepareStatement(sql);
					ps.setString(1, nick);
					ps.setInt(2, startRow - 1);
					ps.setInt(3, pageSize);
					// 4 결과 rs에 저장
					rs = ps.executeQuery();

					while (rs.next()) {
						QandABean qb = new QandABean();
						
						System.out.println(rs.getInt("num"));

						
						qb.setNum(rs.getInt("num"));
						qb.setNick(rs.getString("nick"));
						qb.setSubject(rs.getString("subject"));
						qb.setContent(rs.getString("content"));
						qb.setImage1(rs.getString("image1"));
						qb.setRe_lev(rs.getInt("re_lev"));
						qb.setRe_seq(rs.getInt("re_seq"));
						qb.setRe_ref(rs.getInt("re_ref"));
						qb.setReadcount(rs.getInt("readcount"));
						qb.setDate(rs.getDate("date"));

						// boardList 한칸 저장
						QandAList.add(qb);			
					}

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try{
						if(rs!=null) rs.close();
						if(ps!=null) ps.close();
						if(con!=null) con.close();
					}catch(SQLException e) {
						e.printStackTrace();
					}
				} // finally
				return QandAList;
	}
	
	// 인생샷그램 게시글 갯수 구하기
	public int getGramCount(String nick) {
		int count = 0;
		try {
			// 1,2 디비연결 메서드 호출
			con = getConnection();
			// 3 sql 함수 count(*) 이용
			sql = "select count(*) from gram where nick = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nick);

			// 4 rs실행저장
			rs = ps.executeQuery();
			// 5 데이터있으면 count저장

			// select에서 검색한 첫번째 열에 값이 있는지 없는지 확인하는 작업
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		} // finally

		return count;
	}

	// 인생샷그램 게시글 리스트 가져오기
	public List<boardBean> getGramBoardList(int startRow, int pageSize, String nick) {

		List<boardBean> boardList = new ArrayList<boardBean>();

		try {
			// 1,2 디비연결 메서드 호출
			con = getConnection();

			sql = "select * from gram where nick = ? order by date desc limit ?,?";

			ps = con.prepareStatement(sql);
			ps.setString(1, nick);
			ps.setInt(2, startRow - 1);
			ps.setInt(3, pageSize);

			rs = ps.executeQuery();

			while (rs.next()) {
				boardBean bb = new boardBean();
				bb.setNum(rs.getInt("num"));
				bb.setNick(rs.getString("nick"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setImage1(rs.getString("image1"));
				bb.setDate(rs.getDate("date"));
				bb.setLove(rs.getInt("love"));

				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		} // finally

		return boardList;
	}

	// 함께해요 게시글 갯수 구하기
	public int getTogetherCount(String nick) {
		int count = 0;
		try {
			// 1,2 디비연결 메서드호출
			con = getConnection();
			// 3 sql 함수 count(*) 이용
			sql = "select count(*) from board where nick_name = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nick);
			// 4 rs 실행 저장
			rs = ps.executeQuery();
			// 5 rs 데이터 있으면 count 저장
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
		return count;
	}

	// 함께해요 게시글 리스트 가져오기
	public List<BoardBean> getTogetherBoardList(int startRow, int pageSize, String nick) {

		List<BoardBean> boardList = new ArrayList<BoardBean>();

		try {
			// 1,2 디비연결 메서드호출
			con = getConnection();
			// 3 sql 객체 생성
			// sql select * from board
			// 최글글위로 re_ref 그룹별내림차순 정렬 re_seq오름차순
			// re_ref desc,re_seq asc
			// 글잘라오기 limit 시작행-1,개수
			sql = "select * from board where nick_name = ? order by date desc limit ?,?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nick);
			ps.setInt(2, startRow - 1);// 시작행-1
			ps.setInt(3, pageSize);// 몇개글
			// 4 rs 실행 저장
			rs = ps.executeQuery();
			// 5 rs while 데이터 있으면
			// 자바빈 객체 생성 BoardBean bb
			// bb 멤버변수 <= rs열데이터 가져와서 저장
			// bb게시판 글 하나 => boardList 한칸 저장
			while (rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setNick_name(rs.getString("nick_name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setFile(rs.getString("file"));

				bb.setRe_ref(rs.getInt("re_ref"));

				bb.setReadcount(rs.getInt("readcount"));
				bb.setLocation(rs.getString("location"));

				// boardList 한칸 저장
				boardList.add(bb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException ex) {
				}
			}
		}
		return boardList;
	}

	// 국가 리뷰 갯수 구하기
	public int getNationCommentCount(String nick) {

		int count = 0;

		try {
			con = getConnection();

			sql = "select count(*) as count from nation_comment where nick = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nick);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return count;
	}

	// 국가 리뷰 리스트 가져오기
	public List<PlanNationCommentBean> getNationListComment(String nick, int startRow, int pageSize) {

		List<PlanNationCommentBean> list = new ArrayList<PlanNationCommentBean>();

		try {

			con = getConnection();

			sql = "select * from nation_comment where nick = ? order by date desc limit ?, ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nick);
			ps.setInt(2, startRow - 1);
			ps.setInt(3, pageSize);
			rs = ps.executeQuery();

			while (rs.next()) {
				PlanNationCommentBean pcb = new PlanNationCommentBean();
				pcb.setContent(rs.getString("content"));
				pcb.setDate(rs.getTimestamp("date"));
				pcb.setEval(rs.getInt("eval"));
				pcb.setNation(rs.getString("nation"));
				pcb.setNation_num(rs.getInt("nation_num"));
				pcb.setNick(rs.getString("nick"));
				pcb.setNum(rs.getInt("num"));

				list.add(pcb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	// 도시 리뷰 갯수 구하기
	public int getRegionCount(String nick) {

		int count = 0;

		try {
			con = getConnection();

			sql = "select count(*) as count from region_comment where nick = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nick);

			rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return count;
	}

	// 도시 리뷰 리스트 가져오기
	public List<PlanRegionCommentBean> getRegionListComment(String nick, int startRow, int pageSize) {

		List<PlanRegionCommentBean> list = new ArrayList<PlanRegionCommentBean>();

		try {

			con = getConnection();

			sql = "select * from region_comment where nick = ? order by date desc limit ?, ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, nick);
			ps.setInt(2, startRow - 1);
			ps.setInt(3, pageSize);
			rs = ps.executeQuery();

			while (rs.next()) {
				PlanRegionCommentBean prcb = new PlanRegionCommentBean();
				prcb.setContent(rs.getString("content"));
				prcb.setDate(rs.getTimestamp("date"));
				prcb.setEval(rs.getInt("eval"));
				prcb.setRegion(rs.getString("region"));
				prcb.setRegion_num(rs.getInt("region_num"));
				prcb.setNick(rs.getString("nick"));
				prcb.setNum(rs.getInt("num"));

				list.add(prcb);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}
}
