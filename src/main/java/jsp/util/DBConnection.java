package jsp.util;
 
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
 
// Ŀ�ؼ��� ������ Ŭ���� - JNDI
public class DBConnection 
{
	// ��� �����ϰ������ ���⿡ ���̵�� ��� �ٲ㼭 �����ϼ���
	String dburl = "jdbc:mysql://211.33.126.173:3306/ing?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "���̵�";
	String password = "���";
    
    public String getDataUrl() {
    	return this.dburl;
    }
    
    public String getUser() {
    	return this.user;
    }
    
    public String getPassword() {
    	return this.password;
    }
}