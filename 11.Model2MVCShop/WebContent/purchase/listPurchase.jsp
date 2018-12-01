<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%@ page import="java.util.*"  %>

<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.*" %>
<%@ page import="com.model2.mvc.common.util.*" %>     

<%
	List<Purchase> list = (List<Purchase>)request.getAttribute("list");
	Page resultPage = (Page)request.getAttribute("resultPage");
	
	Search search = (Search)request.getAttribute("search");
	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%> --%>
<!DOCTYPE html>

<html lang="ko">
<head>

<meta charset="EUC-KR">

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip ��� CSS-->
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">   
   

<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<style>
	  body {
            padding-top : 50px;
        }
        
</style>

<script type="text/javascript">

	function fncGetList(currentPage){
		$("#currentPage").val(currentPage);
		$("form").attr("method","POST").attr("action","/purchase/listPurchase").submit();
	}
	
	$(function(){
		
		$("td:nth-child(2)" ).on("click", function(){
			var tranNo = $(this).data("param1");
			console.log(tranNo);
			self.location = "/purchase/getPurchase?tranNo="+tranNo;
		});
		
		$("td:nth-child(8)" ).on("click", function(){
			var tranNo = $(this).data("param5");
			var file=$(this).data("param6");
			console.log(tranNo)
			console.log(file)
			
			$.ajax( 
					{
						url : "/purchase/json/getPurchase/"+tranNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

							//Debug...
							//alert(status);
							//Debug...
							//alert("JSONData : \n"+JSONData);
							
							var displayValue = "<h6>"
								+"��ǰ��: "+JSONData.purchaseProd.prodName+"<br/>"
								+"�����ھ��̵�: "+JSONData.buyer.userId+"<br/>"
								+"�������̸�: "+JSONData.receiverName+"<br/>"
								+"�������ּ�: "+JSONData.divyAddr+"<br/>"
								+"�����ڿ�û����: "+JSONData.divyRequest+"<br/>"
								+"��������: "+JSONData.divyDate+"<br/>"
								+"�ֹ���: "+JSONData.orderDate+"</h3>"
		
							//alert(displayValue);
							$("h6").remove();
							$( "#"+tranNo+"" ).html(displayValue);
						}
				});
				
			
		});
		
		$("td:nth-child(3)" ).on("click", function(){
			var buyerId = $(this).data("param2");
			self.location = "/user/getUser?userId="+buyerId
		});	
		
		$("td:nth-child(7)" ).on("click", function(){
			var prodNo = $(this).data("param3");
			var trancode = $(this).data("param4");
			
			//if(trancode == '2  '){
			self.location = "/purchase/updateTranCode?prodNo="+prodNo+"&tranCode=3"
			//}
		});	
		
		$("td:nth-child(2)").css("color","red");
		$(".ct_list_pop td:nth-child(5)").css("color","red");
		$(".ct_list_pop td:nth-child(13)").css("color","red");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	
	});

</script>
</head>


<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>���Ÿ����ȸ</h3>
	    </div>
	    
	    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		</div>
		

		<table class="table table-hover table-striped" >
		
		<thead>
			<tr>
				<th align="center">No</th>
				<th align="left">��ǰ��</th>
				<th align="left">ȸ��ID</th>
				<th align="left">ȸ����</th>
				<th align="left">��ȭ��ȣ</th>	
				<th align="left">�����Ȳ</th>	
				<th align="left">��������</th>	
				<th align="left">��������</th>	
			</tr>
		</thead>
		
		<tbody>
		
			<c:set var="i" value="0"/>
			<c:forEach var = "purchase" items="${list }">
				<c:set var="i" value="${i+1 }"/>
				
				<tr>
				<td align="center" >${i}</td>
				
				<%-- <td align="left" data-param5="${purchase.tranNo}" data-param6="${purchase.purchaseProd.fileName}">
				<c:if test="${purchase.purchaseProd.fileName != null }">
					<img src = "/images/uploadFiles/${purchase.purchaseProd.fileName}" width="80" height="80"  align="absmiddle">
				</c:if>
				<c:if test="${purchase.purchaseProd.fileName == null}">
					<img src="http://placehold.it/80X80" />
				</c:if>
				</td> --%>
				
				<td align="left"  title="Click: �������� Ȯ��"  data-param1 = "${purchase.tranNo}" >${purchase.purchaseProd.prodName}</td>

				<td align="left" data-param2 = "${purchase.buyer.userId}">
					<%-- <a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a> --%>
					${purchase.buyer.userId}
				</td>

				<td align="left">${purchase.receiverName}</td>

				<td align="left">${purchase.receiverPhone}</td>

				<td align="left">
				<c:if test="${purchase.tranCode=='1  '}">
					����	���ſϷ� ���� �Դϴ�.
				</c:if>
				<c:if test="${purchase.tranCode=='2  '}">
					����	����� ���� �Դϴ�.
				</c:if>
				<c:if test="${purchase.tranCode=='3  '}">
					����	��ۿϷ� ���� �Դϴ�.
				</c:if>
				</td>

				<td align="left" data-param3 = "${purchase.purchaseProd.prodNo}" data-param4 = "${purchase.tranCode}">
				  <c:if test="${purchase.tranCode=='2  '}"> 
					 <%--<a href="/purchase/updateTranCode?prodNo=${purchase.purchaseProd.prodNo}&tranCode=3">���ǵ���</a> --%>
					���ǵ���
				  </c:if> 
				</td>
				
				<td align="left" data-param5="${purchase.tranNo}" data-param6="${purchase.purchaseProd.fileName}">
					<i class="glyphicon glyphicon-info-sign" id= "${purchase.tranNo}"></i>
			  		<input type="hidden" value="${purchase.tranNo}">
			  	</td>
					
			</tr>
			</c:forEach>		
				
			</tbody>
		</table>
		<jsp:include page="../common/pageNavigator_new.jsp"/>


</body>
</html>