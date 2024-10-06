<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="./asset/1_landing/login.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Orbit&display=swap"
        rel="stylesheet">
</head>

<body>
<c:if test="${not empty requestScope.message}">
<script>
  alert("${requestScope.message}");
</script>
</c:if>
<div id="container" class="container">
  <!-- FORM SECTION -->
  <div class="row">
    <!-- SIGN UP -->
    <div class="col align-items-center flex-col sign-up">
      <h2>
        비밀번호를 잊으셨나요?
      </h2>
      <div class="form-wrapper align-items-center">
        <div class="form sign-up">
          <p>
            <button>
              관리자에게 연락하기
            </button>
            <b onclick="toggle()" class="pointer">
              로그인하기
            </b>
          </p>
        </div>
      </div>

    </div>
    <!-- END SIGN UP -->
    <!-- SIGN IN -->
    <div class="col align-items-center flex-col sign-in">
      <img src="./asset/1_landing/co-nect logo + text (1E74B1).svg" alt="메인로고입니다." width="250" height="150" />
      <!-- <h3 style="color: #255260;">어서오세요. 코난2조 입니다.</h3> -->
      <form method="post" action="${pageContext.request.contextPath}/landing?fn=MAIN">
      <div class="form-wrapper align-items-center">
        <div class="form sign-in">
          <div class="input-group">
            <i class='bx bxs-com-num'></i>
            <input type="number" placeholder="Company Number" name="comp_pk_num" required>
          </div>
          <div class="input-group">
            <i class='bx bxs-user'></i>
            <input type="number" placeholder="Username" name="user_pk_num" required>
          </div>
          <div class="input-group">
            <i class='bx bxs-lock-alt'></i>
            <input type="password" placeholder="Password" name="user_pw" required>
          </div>
          <button>
            Sign in
          </button>
      </form>
          <p>
            <b onclick="toggle()" class="pointer">
              Forgot Password
            </b>
          </p>
        </div>
      </div>
      <div class="form-wrapper">

      </div>
    </div>
    <!-- END SIGN IN -->
  </div>
  <!-- END FORM SECTION -->
  <!-- CONTENT SECTION -->
  <div class="row content-row">
    <!-- SIGN IN CONTENT -->
    <div class="col align-items-center flex-col">
      <div class="text sign-in">
        <h2>
          Welcome
        </h2>

      </div>
      <div class="img sign-in">

      </div>
    </div>
    <!-- END SIGN IN CONTENT -->
    <!-- SIGN UP CONTENT -->
    <div class="col align-items-center flex-col">
      <div class="img sign-up">

      </div>
      <div class="text sign-up">
        <h2>
          Contact
        </h2>

      </div>
    </div>
    <!-- END SIGN UP CONTENT -->
  </div>
  <!-- END CONTENT SECTION -->
</div>


<script src="./asset/1_landing/login.js"></script>

</body>

</html>