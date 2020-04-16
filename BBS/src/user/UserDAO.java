package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;			// �����ͺ��̽��� �����ϰ� ���ִ� ��ü
	private PreparedStatement pstmt;
	private ResultSet rs;				// ������ ���� �� �ִ� ��ü ����
	
	public UserDAO() {					// ������
		try {							// ����ó��
			String dbURL = "jdbc:mysql://localhost:3306/BBS";	// ��ǻ�Ϳ� ��ġ�� mysql������ �ǹ� BBS�� �����ͺ��̽��� �����ϰ� ����
			String dbID = "root";			// root������ �����ϰ� ����	
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");				// Driver�� mysql�� �����Ҽ� �ְ� �Ű�ä ��Ȱ���ϴ� ���̺귯��
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);	// Connection�� dbURL, dbID, dbPassword�� �̿��ؼ� �����ϰ� ��
			// �����̵Ǹ� conn ��ü �ȿ� ���ӵ� ������ ���Ե�			
		} catch (Exception e) {
			e.printStackTrace();		// �����߻��� ������ ���� ���
		}
		// ������ mysql�� ������ �ϰ� ���ִ� �κ�
		
	}
	
		public int login(String userID, String userPassword) {	// �α����� �õ��ϰ��ϴ� �Լ� ����, userID�� userPassword�� �޾Ƽ� ó���ϰ� ����
			String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
			// ������ �����ͺ��̽��� �Է��� ��ɾ sql �������� ����
			
			try {	// ����ó��
				pstmt = conn.prepareStatement(SQL);	// ������ SQL������ �����ͺ��̽��� �����ϴ� �������� �ν��Ͻ� ������
				pstmt.setString(1, userID);			// �Է¹��� userID ���,,,
				rs = pstmt.executeQuery();			// rs�� ������ ��� ���
				
				if (rs.next()) {				// ���̵� ������ ����
					if(rs.getString(1).equals(userPassword))	// ����� ���� userPassword��(rs.getString(1)) 
																// �޾Ƽ� ������ �õ��� userPassword�� ���ٸ�
						return 1;	// �α��� ����
					else
						return 0;	// ��й�ȣ ����ġ
				}
				return -1;			// ���̵� ����
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -2;	// �����ͺ��̽� ������ �ǹ�
		}
	}

