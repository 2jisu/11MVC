<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- <%@ page import="com.model2.mvc.service.domain.*" %>

<% 
Purchase vo = (Purchase)request.getAttribute("vo");
%> --%>
    
<html lang="ko">
<head>
<title>구매상세조회</title>
<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<style>
 		body {
            padding-top : 50px;
        }
</style>
     
<script type="text/javascript">

	$(function(){
		$("button[name=확인]").on("click", function(){
			self.location = "/purchase/listPurchase"
			//history.go(-1);
		});
		
		$("button[name=수정]").on("click", function(){
			var tranNo = $(this).data("param");
			self.location = "/purchase/updatePurchase?tranNo="+tranNo
		});
	});


</script>

</head>



<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">구매상세조회</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.purchaseProd.prodName }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자아이디</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.buyer.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매방법</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.paymentOption == '1  ' ? "현금구매":"신용구매"}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자이름</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자연락처</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.receiverPhone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매자주소</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyAddr}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>구매요청사항</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyRequest}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>배송희망일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.divyDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>주문일</strong></div>
			<div class="col-xs-8 col-md-4">${purchase.orderDate}</div>
		</div>
		
		<hr/>
		
		
		<c:if test="${purchase.tranCode !='1  '}">
			
			<div class="row">
		  		<div class="col-md-12 text-center ">
		  			<button type="button" class="btn btn-primary" name="확인">확인</button>
		  		</div>
			</div>
		</c:if>
			
		<%--<% 	}else { %> --%>
		<c:if test="${purchase.tranCode=='1  '}">
		
			<div class="row">
		  		<div class="col-md-12 text-center ">
		  			<button type="button" class="btn btn-primary" name="확인">확인</button>
		  			<button type="button" class="btn btn-default" name="수정" data-param = "${purchase.tranNo}">수정</button>
		  		</div>
			</div>
		</c:if>
		
		
		<br/>
		
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>

