<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
    
<%-- �ڹٺ� Ŭ���� import --%>      
<%@ page import="jsp.member.model.MemberBean" %>  
<%-- DAO import --%>   
<%@ page import="jsp.member.model.MemberDAO" %> 
 
<html>
<head>
    <title>ȸ������ ó�� JSP</title>
    
    <!-- css ���� �и� -->
    <link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
    
</head>
<body>
    <%-- JoinForm.jsp���� �Է��� ������ �Ѱ� �޾� ó���Ѵ�. --%>
    <% 
        // �ѱ� ������ �����ϱ� ���� ���ڵ� ó��
        request.setCharacterEncoding("euc-kr"); 
    %>
    
    <%-- �ڹٺ� ���� �׼��±� ��� --%>
    <jsp:useBean id="member" class="jsp.member.model.MemberBean" />
    <jsp:setProperty property="*" name="member"/>    
    
    <%
        MemberDAO dao = MemberDAO.getInstance();
    
        // ȸ�������� ����ִ� memberBean�� dao�� insertMember() �޼���� �ѱ��.
        // insertMember()�� ȸ�� ������ JSP_MEMBER ���̺� �����Ѵ�.
        dao.join(member);
    %>
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">ȸ������ ������ Ȯ���ϼ���.</font></b>
        <br><br>
        <font color="blue"><%=member.getName() %></font>�� ������ ���ϵ帳�ϴ�.
        <br><br>
        
        <%-- �ڹٺ󿡼� �Էµ� ���� �����Ѵ�. --%>
        <table>
            <tr>
                <td id="title">���̵�</td>
                <td><%=member.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title">��й�ȣ</td>
                <td><%=member.getPassword() %></td>
            </tr>
                    
            <tr>
                <td id="title">�̸�</td>
                <td><%=member.getName() %></td>
            </tr>
                    
            <tr>
                <td id="title">����</td>
                <td><%=member.getGender()%></td>
            </tr>
                    
            <tr>
                <td id="title">����</td>
                <td>
                    <%=member.getBirthyy() %>�� 
                    <%=member.getBirthmm() %>�� 
                    <%=member.getBirthdd() %>��
                </td>
            </tr>
                    
            <tr>
                <td id="title">�̸���</td>
                <td>
                    <%=member.getMail1() %>@<%=member.getMail2() %>
                </td>
            </tr>
                    
            <tr>
                <td id="title">�޴���ȭ</td>
                <td><%=member.getPhone() %></td>
            </tr>
            <tr>
                <td id="title">�ּ�</td>
                <td>
                    <%=member.getAddress() %>
                </td>
            </tr>
        </table>
        
        <br>
        <input type="button" value="Ȯ��" onclick="location='${pageContext.request.contextPath}/main'"/>
    </div>
</body>
</html>