<%@page import="com.board.shopDao" %>
<%@page import="com.board.shopDto" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DCSC</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/NavFooter.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
	.con_btn {
	  display: inline;
	  background-color: #F0F6FA;
	  border: none;
	  cursor: pointer;
	  padding: 5px;
	  border-radius: 5px;
	}
	
	.con_btn i {
	  color: #3366cc;
	  font-size: 24px;
	}
	
	.con_btn i.bi-trash3-fill {
	  color: red;
	}
	
	
	.content-wrapper {
	  display: flex;
	  align-items: center;
	}
	
	.button-wrapper {
	  margin-left: auto;
	}
</style>
<%
   request.setCharacterEncoding("utf-8");
   String num = request.getParameter("num");
   // 함수 호출 
   shopDao dao = new shopDao();
   shopDto dto = dao.getOne(num);
%>

<script>
    function w3_open() {
        document.getElementById("main").style.marginLeft = "25%";
        document.getElementById("mySidebar").style.width = "25%";
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("openNav").style.display = 'none';
    }
    function w3_close() {
        document.getElementById("main").style.marginLeft = "0%";
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("openNav").style.display = "inline-block";
    }


</script>

<body>
        <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a href="main.jsp"><img src="images/dit.png" alt="" class="dit-img"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="free.jsp">자유게시판</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="studentBoard.jsp">학생게시판</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="shop.jsp">중고장터</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="announcement.jsp">공지사항</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link nav-job" href="job.jsp">|&nbsp; &nbsp; &nbsp; 채용공고 &nbsp; &nbsp; &nbsp;|</a>
                    </li>
                </ul>
               
                <ul class="navbar-nav mb-lg-1 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            정보
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="profile.jsp">프로필</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="logout.jsp">로그아웃</a></li>
                            <li><a class="dropdown-item" href="admin_pass.jsp">관리자메뉴</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <main class="container">
        <div class="p-lg-5">
            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative m-5">
                <div class="col p-4 d-flex flex-column position-static">
                    <br>
					<span class="content-wrapper">
					  <h5 class="fw-bold">작성자 | <%=dto.getname() %></h5>
					</span>
					<h3 class="mb-0"> <%= dto.gettitle() %> </h3>
                    <div class="text-end">
                        <span class="card-text fw-bold m-1"><%= dto.getpay() %>원</span>
                    </div>
                    <div class="mb-1 text-muted text-end"><%= dto.getupload_date() %></div>
                    <hr>
                    <div>
                        <h5>상품설명</h5>
                        <span>
                            <%= dto.getcontent() %>
                        </span>
                    </div>
                    <hr>
                    <div class="btn-group">
                        <button type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#contactModal">쪽지 보내기</button>
                    </div>
                    <br>
                </div>
                <div class="col-auto">
                    <img src="<%= dto.getimg() %>" style="width: 400px">
                </div>
            </div>
        </div>
    </main>
    
<!-- 쪽지 Modal -->
   <div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="contactModalLabel" aria-hidden="true">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title" id="contactModalLabel">쪽지 보내기</h5> <br>
                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                   <!-- Add your contact form here -->
                   <!-- Example: -->
                   <form action="notePro.jsp" method="get">
                       <div class="mb-3">
                           <label for="name" class="form-label">수신자 이름</label>
                           <input type="text" class="form-control" id="name" name="name" placeholder="수신자 이름을 입력하세요." required value="<%=dto.getname() %>">
                       </div>

                       <div class="mb-3">
                           <label for="message" class="form-label">내용</label>
                           <textarea class="form-control" id="content" name="content" rows="3"></textarea>
                       </div>
                       <button type="submit" class="btn btn-primary">전송</button>
                   </form>
               </div>
           </div>
       </div>
   </div>


    <hr>
        <footer class="py-3 my-4">
        <img src="images/dit.png" alt="" class="dit-img">
        <ul>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/kimsinyoung2" target="_blank"> <i class="bi bi-github"></i>
                    김신영</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/K1mHyoM1n" target="_blank"> <i class="bi bi-github"></i>
                    김효민</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/SeungJin051" target="_blank"> <i class="bi bi-github"></i>
                    임승진</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="https://github.com/wjsrudals411" target="_blank"> <i class="bi bi-github"></i>
                    전경민</a>
            </li>
        </ul>
        <br>
        <br>
        <br>
        <div class="footer-info">
            <p class="text-center text-muted">주소 | (47230) 부산광역시 부산진구 양지로 54
                TEL : 051-852-0011~3 FAX : 051-860-3270</p>
            <p class="text-center text-muted">&copy; 2023 DONG-EUI INSTITUTE OF TECHNOLOGY. ALL RIGHTS RESERVED.
            </p>
        </div>
    </footer>
</body>

</html>