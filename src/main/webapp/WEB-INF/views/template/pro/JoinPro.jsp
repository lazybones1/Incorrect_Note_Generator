<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="kr.ac.jbnu.member.model.*"%>

<%-- �ڹٺ� Ŭ���� import --%>
<%@ page import="kr.ac.jbnu.member.model.MemberBean"%>
<%-- DAO import --%>
<%@ page import="kr.ac.jbnu.member.model.MemberDAO"%>

<html>
<head>
<title>ȸ������ ó�� JSP</title>

<!-- css ���� �и� -->
<link href='../../css/join_style.css' rel='stylesheet' style='text/css' />

</head>
<body>
	<%-- JoinForm.jsp���� �Է��� ������ �Ѱ� �޾� ó���Ѵ�. --%>
	<% 
        // �ѱ� ������ �����ϱ� ���� ���ڵ� ó��
        request.setCharacterEncoding("euc-kr"); 

    String id = request.getParameter("id");
    String password  = request.getParameter("password");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String birthyy = request.getParameter("birthyy");
    String birthmm = request.getParameter("birthmm");
    String birthdd = request.getParameter("birthdd");
    String mail1 = request.getParameter("mail1");
    String mail2 = request.getParameter("mail2");       
    String phone = request.getParameter("phone");         
    String address = request.getParameter("address"); 

        MemberDAO dao = MemberDAO.getInstance();
    MemberBean mem = new MemberBean(id, password, name, gender, birthyy, birthmm, birthdd, mail1, mail2, phone, address);
        // ȸ�������� ����ִ� memberBean�� dao�� insertMember() �޼���� �ѱ��.
        // insertMember()�� ȸ�� ������ JSP_MEMBER ���̺� �����Ѵ�.
        dao.join(mem);
    %>

	<div id="wrap">
		<br> <br> <b><font size="5" color="gray">ȸ������ ������
				Ȯ���ϼ���.</font></b> <br> <br> <font color="blue"><%=name %></font>�� ������
		���ϵ帳�ϴ�. <br> <br>

		<%-- �ڹٺ󿡼� �Էµ� ���� �����Ѵ�. --%>
		<table>
			<tr>
				<td id="title">���̵�</td>
				<td><%=id %></td>
			</tr>

			<tr>
				<td id="title">��й�ȣ</td>
				<td><%=password %></td>
			</tr>

			<tr>
				<td id="title">�̸�</td>
				<td><%=name %></td>
			</tr>

			<tr>
				<td id="title">����</td>
				<td><%=gender%></td>
			</tr>

			<tr>
				<td id="title">����</td>
				<td><%=birthyy %>�� <%=birthmm %>�� <%=birthdd %>��</td>
			</tr>

			<tr>
				<td id="title">�̸���</td>
				<td><%=mail1 %>@<%=mail2 %></td>
			</tr>

			<tr>
				<td id="title">�޴���ȭ</td>
				<td><%=phone %></td>
			</tr>
			<tr>
				<td id="title">�ּ�</td>
				<td><%=address %></td>
			</tr>
		</table>

		<br> <input type="button" value="Ȯ��"
			onclick="location='${pageContext.request.contextPath}/main'" />
	</div>
</body>
</html>