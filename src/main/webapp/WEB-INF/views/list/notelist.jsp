<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../static/nav.jsp"></jsp:include>
	
	<main id="main">

		<!-- ======= Breadcrumbs Section ======= -->
		<section class="breadcrumbs">
			<div class="container">

				<div class="d-flex justify-content-between align-items-center">
				<h2>오답노트</h2>
					<ol>
						<li><a href="main">Home</a></li>
						<li>오답노트</li>
					</ol>
				</div>
			</div>
		</section>
		<!-- End Breadcrumbs Section -->

		<!-- 각자 제작한 것 추가해주세요 -->
		<div class="container">
			<div>
				<div class="form-row float-left">
				</div>
				<div class="form-row float-right">
					<!-- Search form -->
					<form class="form-inline">
					<i class="fas fa-search" aria-hidden="true"></i>
					<img class="gadgets-img hidden-md-down" width=25px, height=25px src="${pageContext.request.contextPath}/resources/img/search.png">
					 <input
						class="form-control form-control-sm ml-3 w-75" type="text"
						placeholder="Search" aria-label="Search" onkeypress="JavaScript:press(this.form)">
					</form>
				</div>
			</div>
			<!-- table -->
			<div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col text-center ml-2 ">No.</th>
							<th scope="col text-center ml-6 ">제목</th>
							<th scope="col text-center ml-4 ">등록 날짜</th>
						</tr>
					</thead>
					<tbody>
					
	<%-- 				<%
						for(){{
							
						}
					%> --%>
					
						<tr>
							<th scope="row">1</th>
							<td><a href="http://www.naver.com"/>데이터 통신</a></td>
							<td>2020.11.28</td>
						</tr>
					</tbody>
				</table>
				<!-- <button class="btn btn-small" type="submit">추가</button> -->
				<input class ="btn btn-small" onclick="add_note();" type="button" value="추가"/>
				<button class="btn btn-small" type="submit">삭제</button>
			</div>
		</div>
		
		
	</main>
	
	<jsp:include page="../static/footer.jsp"></jsp:include>
	<a class="scrolltop" href="#"><span class="fa fa-angle-up"></span></a>
	
	<script> 
	function press(f){ 
		if(f.keyCode == 13){ 
			//javascript에서는 13이 enter키를 의미함 
			formname.submit(); 
			//formname에 사용자가 지정한 form의 name입력 
		} 
	}
	</script>
	
<!-- 	<input onclick="popup();" type="button" value="팝업"/>
	<script>
	
	function popup(){
		window.open("main", "a", "width=1000, height=1000, toolbar=1000,toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes,left=50,right=50")
	}
	
	</script> -->
	
	<script>
		function add_note(){
			
			Note note = new Note("고웹 1번", "5", "고웹", "이 문제의 정답은!?", "일번", "이번", "삼번", "사번", "오번", "3번", "2번", "3번이 답이다 똥멍청아.");
		}
	</script>

</body>
</html>