package kr.ac.jbnu.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Date;
import javax.naming.NamingException;
import jsp.util.DBConnection;
import java.sql.DriverManager;

/* Data Access Object
 * ���̺� �� �Ѱ��� DAO�� �ۼ��Ѵ�.
 *
 * JSP_MEMBER ���̺�� ������ DAO��
 * ȸ�� �����͸� ó���ϴ� Ŭ�����̴�.
 */
public class MemberDAO {
	private static MemberDAO instance;
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;

	public static MemberDAO getInstance() throws ClassNotFoundException {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}

	// String -> Date�� �����ϴ� �޼���
	// ���ڿ��ε� ��������� Date�� �����ϱ� ���� �ʿ�
	// java.util.DateŬ�����δ� ����Ŭ�� Date���İ� ������ �� ����.
	// Oracle�� date���İ� �����Ǵ� java�� Date�� java.sql.Date Ŭ�����̴�.
	public Date stringToDate(MemberBean member) {
		String year = member.getBirthyy();
		String month = member.getBirthmm();
		String day = member.getBirthdd();

		Date birthday = Date.valueOf(year + "-" + month + "-" + day);

		return birthday;

	} // end stringToDate()

	// ȸ�������� JSP_MEMBER ���̺� �����ϴ� �޼���
	public void insertMember(MemberBean member) throws SQLException {

		try {
			// Ŀ�ؼ��� �����´�.
			DBConnection dbc = new DBConnection();
			conn = DriverManager.getConnection(dbc.getDataUrl(), dbc.getUser(), dbc.getPassword());

			// �ڵ� Ŀ���� false�� �Ѵ�.
			conn.setAutoCommit(false);

			// ���� �����Ѵ�.
			// �������� ��� �ڵ����� ���õǰ� �ϱ� ���� sysdate�� ���
			StringBuffer sql = new StringBuffer();
			sql.append("insert into user values");
			sql.append("(?, ?, ?, ?, ?, ?, ?, ?, sysdate)");
			stringToDate(member);
			/*
			 * StringBuffer�� ��� ���� �������� toString()�޼��带 �̿��ؾ� �Ѵ�.
			 */
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setDate(5, stringToDate(member));
			pstmt.setString(6, member.getMail1() + "@" + member.getMail2());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());

			// ���� ����
			pstmt.executeUpdate();
			// �Ϸ�� Ŀ��
			conn.commit();

		} catch (SQLException sqle) {
			// ������ �ѹ�
			conn.rollback();

			throw new RuntimeException(sqle.getMessage());
		} finally {
			// Connection, PreparedStatement�� �ݴ´�.
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		} // end try~catch
	} // end insertMember()

	public int join(MemberBean member) {
		
		String SQL;
		try {
			DBConnection dbc = new DBConnection();
			conn = DriverManager.getConnection(dbc.getDataUrl(), dbc.getUser(), dbc.getPassword());
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			SQL = "INSERT INTO USER VALUES (?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, member.getId());

			pstmt.setString(2, member.getPassword());

			pstmt.setString(3, member.getGender());
			
			pstmt.setString(4, member.getBirthyy());
			
			pstmt.setString(5, member.getBirthmm());
			
			pstmt.setString(6, member.getBirthdd());

			pstmt.setString(7, member.getMail1());

			pstmt.setString(8, member.getMail2());
			
			pstmt.setString(9, member.getPhone());
			
			pstmt.setString(10, member.getAddress());

			return pstmt.executeUpdate();

			

		} catch (SQLException | ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return -1;

	}

	// �α��ν� ���̵�, ��й�ȣ üũ �޼���
	// ���̵�, ��й�ȣ�� ���ڷ� �޴´�.
	public int loginCheck(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbPW = ""; // db���� ���� ��й�ȣ�� ���� ����
		int x = -1;

		try {
			// ���� - ���� �Էµ� ���̵�� DB���� ��й�ȣ�� ��ȸ�Ѵ�.
			StringBuffer query = new StringBuffer();
			query.append("SELECT password FROM user WHERE id=" + id);

			DBConnection dbc = new DBConnection();
			conn = DriverManager.getConnection(dbc.getDataUrl(), dbc.getUser(), dbc.getPassword());
			pstmt = conn.prepareStatement(query.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) // �Է��� ���̵� �ش��ϴ� ��� �������
			{
				dbPW = rs.getString("password"); // ����� ������ �ִ´�.

				if (dbPW.equals(pw))
					x = 1; // �Ѱܹ��� ����� ������ ��� ��. ������ ��������
				else
					x = 0; // DB�� ��й�ȣ�� �Է¹��� ��й�ȣ �ٸ�, ��������

			} else {
				x = -1; // �ش� ���̵� ���� ���
			}

			return x;

		} catch (Exception sqle) {
			throw new RuntimeException(sqle.getMessage());
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
				if (conn != null) {
					conn.close();
					conn = null;
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		}
	} // end loginCheck()
	


}
