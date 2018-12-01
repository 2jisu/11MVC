<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%--<%@page import="com.model2.mvc.service.domain.Product"%>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%--<% Product vo = (Product)request.getAttribute("vo"); 

<% String value = request.getParameter("menu"); %>--%>

<html lang="ko">
<head>

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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
<script type="text/javascript">

	$(function(){
		$("button[name=Ȯ��]").on("click", function(){
			self.location = "/product/listProduct?menu=manage"
		});
		
		$("button[name=����]").on("click", function(){
			//history.go(-1);
			self.location="/product/listProduct?menu=search"
		});
		
		$("button[name=����]").on("click", function(){
			var productNo = $(this).data("param")
			self.location = "/purchase/addPurchase?prod_no="+productNo
		});
		
		
	});
	
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ����ȸ</h3>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ�̹���</strong></div>
			<div class="col-xs-8 col-md-4"><img src = "/images/uploadFiles/${product.fileName}" align="absmiddle"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${product.price} ��</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������������Ʈ</strong><br/>
	  			<div class="text-danger" style="font-size: 5px;" >���űݾ��� 1%</div>
	  		</div>
			<div class="col-xs-8 col-md-4">${product.productPoint} �� </div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		
		<hr/>
		
		
		<c:if test="${param.menu=='ok' }">
			
			<div class="row">
		  		<div class="col-md-12 text-center ">
		  			<button type="button" class="btn btn-primary" name="Ȯ��">Ȯ��</button>
		  		</div>
			</div>
		</c:if>
			
		<%--<% 	}else { %> --%>
		<c:if test="${ param.menu !='ok' and user!=null }">
		
			<div class="row">
		  		<div class="col-md-12 text-center ">
		  			<button type="button" class="btn btn-primary" name="����" data-param="${product.prodNo}">�����ϱ�</button>
		  			<button type="button" class="btn btn-default" name="����">����</button>
		  		</div>
			</div>
		</c:if>
		
		<c:if test="${user==null}">
			
			<div class="row">
		  		<div class="col-md-12 text-center ">
		  			<button type="button" class="btn btn-default" name="����">����</button>
		  		</div>
			</div>
		</c:if>

		
		<br/>
		
 	</div>

 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>