<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="kr.ac.jbnu.entity.model.*"
	import="kr.ac.jbnu.entity.dao.NoteDao" import="java.sql.Connection"
	import="java.sql.ResultSet" import="java.sql.Statement"
	import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ING</title>
</head>
<body>
<%
	NoteDao dao = new NoteDao();
	Note note1 = new Note("�����Ʈ 1", 3, "category1", "����1", "1������", "2������", "3������", "4������", "5������", "1��", "3��", "�� ������_____���� 1���̴�.");
	Note note2 = new Note("�����Ʈ 2", 3, "category1", "����2", "1������", "2������", "3������", "4������", "5������", "3��", "2��", "�� ������_____���� 3���̴�.");
	dao.saveNote(note1);
	dao.saveNote(note2);
	
	%>
	<!-- ���� ������ ���� �÷��� �׽�Ʈ �غ����� -->
	<jsp:include page="main.jsp" />

</body>
</html>
