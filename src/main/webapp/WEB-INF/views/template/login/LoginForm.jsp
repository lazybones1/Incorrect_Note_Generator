<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <%
        // ���ڵ� ó��
        request.setCharacterEncoding("euc-kr"); 
    %>
    <title>�α��� ȭ��</title>
    
    <link
   href="${pageContext.request.contextPath}/resources/img/favicon.png"
   rel="icon">
   
   <link
   href="${pageContext.request.contextPath}/resources/img/apple-touch-icon.png"
   rel="apple-touch-icon">
    
    <!-- css ���� �и� -->
    <link href='../../css/join_style.css' rel='stylesheet' style='text/css'/>
    
    <script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("���̵� �Է��ϼ���");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("��й�ȣ�� �Է��ϼ���");    
                inputForm.password.focus();
                return false;
            }
        }
    
        // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
        function goJoinForm() {
            location.href="/template/login/JoinForm";
        }
    </script>
 
</head>
<body>
<jsp:include page="../../static/nav.jsp"></jsp:include>
    <div id="wrap">
        <form name="loginInfo" method="post" action="/pro/LoginPro" 
                onsubmit="return checkValue()">
        
            <!-- �̹��� �߰� -->
            <img src="${pageContext.request.contextPath}/resources/img/logo.png">
            <br><br>
            
            <table>
                <tr>
                    <td bgcolor="skyblue">���̵�</td>
                    <td><input type="text" name="id" maxlength="50"></td>
                </tr>
                <tr>
                    <td bgcolor="skyblue">��й�ȣ</td>
                    <td><input type="password" name="password" maxlength="50"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="�α���"/>
            <input type="button" value="ȸ������" onclick="location='${pageContext.request.contextPath}/template/login/JoinForm'"/>
        </form>
        
        <% 
            // ���̵�, ��й�ȣ�� Ʋ����� ȭ�鿡 �޽��� ǥ��
            // LoginPro.jsp���� �α��� ó�� ����� ���� �޽����� ������.
            String msg=request.getParameter("msg");
            
            if(msg!=null && msg.equals("0")) 
            {
                out.println("<br>");
                out.println("<font color='red' size='5'>��й�ȣ�� Ȯ���� �ּ���.</font>");
            }
            else if(msg!=null && msg.equals("-1"))
            {    
                out.println("<br>");
                out.println("<font color='red' size='5'>���̵� Ȯ���� �ּ���.</font>");
            }
        %>    
    </div>
    <jsp:include page="../../static/footer.jsp"></jsp:include>
</body>
</html>