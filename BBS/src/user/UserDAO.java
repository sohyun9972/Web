package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;			// 데이터베이스에 접근하게 해주는 객체
	private PreparedStatement pstmt;
	private ResultSet rs;				// 정보를 담을 수 있는 객체 생성
	
	public UserDAO() {					// 생성자
		try {							// 예외처리
			String dbURL = "jdbc:mysql://localhost:3306/BBS";	// 컴퓨터에 설치된 mysql서버를 의미 BBS란 데이터베이스에 접속하게 해줌
			String dbID = "root";			// root계정에 접속하게 해줌	
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");				// Driver는 mysql에 접속할수 있게 매게채 역활을하는 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	// Connection을 dbURL, dbID, dbPassword를 이용해서 접속하게 함
			// 접속이되면 conn 객체 안에 접속된 정보가 담기게됨			
		} catch (Exception e) {
			e.printStackTrace();		// 오류발생시 오류가 뭔지 출력
		}
		// 실제로 mysql에 접속을 하게 해주는 부분
		
	}
	
		public int login(String userID, String userPassword) {	// 로그인을 시도하게하는 함수 생성, userID와 userPassword를 받아서 처리하게 해줌
			String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
			// 실제로 데이터베이스에 입력할 명령어를 sql 문장으로 생성
			
			try {	// 예외처리
				pstmt = conn.prepareStatement(SQL);	// 정해진 SQL문장을 데이터베이스에 삽입하는 형식으로 인스턴스 가져옴
				pstmt.setString(1, userID);			// 입력받은 userID 담기,,,
				rs = pstmt.executeQuery();			// rs에 실행한 결과 담기
				
				if (rs.next()) {				// 아이디가 있으면 실행
					if(rs.getString(1).equals(userPassword))	// 결과로 나온 userPassword를(rs.getString(1)) 
																// 받아서 접속을 시도한 userPassword와 같다면
						return 1;	// 로그인 성공
					else
						return 0;	// 비밀번호 불일치
				}
				return -1;			// 아이디가 없음
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -2;	// 데이터베이스 오류를 의미
		}
	}

