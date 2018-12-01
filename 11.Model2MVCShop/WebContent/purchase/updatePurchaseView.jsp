<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- <%@ page import="com.model2.mvc.service.domain.*" %>

<% 
Purchase purchase = (Purchase)request.getAttribute("purchase");
%> --%>
<!DOCTYPE>

<html lang="ko">
<head>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>�������� ����</title>

<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>


<style>
 		body {
            padding-top : 50px;
        }
</style>

<script type="text/javascript">

	/* function fncUpdatePurchase() {
		var tranNo = $(this).data("param");
		console.log(tranNo); 
		$("form").attr("method","POST").attr("action","/purchase/updatePurchase?tranNo="+tranNo).submit();
	} */
	
	$(function() {
	    $( "#divyDate" ).datepicker({
	    	dateFormat: 'yy-mm-dd'
	    });
	});

	
	$(function(){
		$("button[name=���]").on("click", function(){
			history.go(-1);
		});	
	});
	
	$(function(){
		$("button[name=����]").on("click", function(){
			//fncUpdatePurchase();
			var tranNo = $(this).data("param");
			console.log(tranNo); 
			$("form").attr("method","POST").attr("action","/purchase/updatePurchase?tranNo="+tranNo).submit();
		});
	});
	
</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">������������</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="buyerId" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="buyerId" name="buyerId" value="${purchase.buyer.userId}" readonly>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		    
		    	<select 	name="paymentOption" class="form-control">
				<c:if test="${purchase.paymentOption=='1  ' }">
					<option value="1  " selected="selected">���ݱ���</option>
					<option value="2  ">�ſ뱸��</option>
				</c:if>
				<c:if test="${purchase.paymentOption=='2  ' }">
					<option value="1  ">���ݱ���</option>
					<option value="2  " selected="selected">�ſ뱸��</option>
				</c:if>
			</select>
		    	
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName"  value="${purchase.receiverName}" >
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr}" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}" >
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" readonly="readonly" value="${purchase.divyDate }">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" data-param = "${purchase.tranNo}" name="����" >�� &nbsp;��</button>
		      <button type="button" class="btn btn-primary" name="���" >�� &nbsp;��</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>

