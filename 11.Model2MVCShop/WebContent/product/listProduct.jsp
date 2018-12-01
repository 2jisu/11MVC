<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
<%@ page import="java.util.*"  %>

<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="com.model2.mvc.common.*" %>
<%@ page import="com.model2.mvc.common.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	List<Product> list = (List<Product>)request.getAttribute("list");
	Page resultPage = (Page)request.getAttribute("resultPage");
	
	Search search=(Search)request.getAttribute("search");
	
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());

	String value = request.getParameter("menu"); %>--%>
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


<!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">   
   
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
	  body {
            padding-top : 50px;
        }
       
	#floatMenu {
		position: absolute;
		width: 100px;
		height: 400px;
		/* right: 200px; */
		right:10%;
		padding:0;
		margin:0;
		top: 229px;
		text-align:center;
		background-color: #FFFFFF;
		color: #000000;
		border:1px solid;
		font-size: 15px;
	}
	
	/* #innerMenu {
		position: absolute;
		width: 100px;
		height: 200px;
		left: 90%;
		padding:10;
		margin:10;
		top: 200px;
		text-align:center;
		background-color: #FA840E;
		color: #fff;
	}
	
	  #page_up {
		width: 31px;
		height: 31px;
		background: url(http://cfs.tistory.com/custom/blog/156/1560470/skin/images/up.png);
		cursor: hand;
		filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter …\'1 0 0 0 0, 0 1 0 0 0, 0 0 1 0 0, 0 0 0 1 0\'/></filter></svg>#grayscale");
		-webkit-filter: grayscale(0%);
		}
		
		#page_down {
		width: 31px;
		height: 31px;
		background: url(http://cfs.tistory.com/custom/blog/156/1560470/skin/images/down.png);
		cursor: hand;
		filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter …\'1 0 0 0 0, 0 1 0 0 0, 0 0 1 0 0, 0 0 0 1 0\'/></filter></svg>#grayscale");
		-webkit-filter: grayscale(0%);
		} */



</style>
    
<script type="text/javascript">

	var currentPage=1;
	
	
	$(window).scroll(function(){
		//currentPage++;

		$.ajax({
			
			url: "/product/json/listProduct",
			method: "POST",
			data: JSON.stringify({
				currentPage: currentPage+1 ,				
				searchCondition: $("#searchCondition").val(),
				searchKeyword: $("#searchKeyword").val(),
				searchFilter: $("#searchFilter").val()
				
			}),
			dataType: "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
			success : function(JSONData , status){
				//alert(JSONData)
				
				if ($(window).scrollTop() == $(document).height() - $(window).height()) {
					
			      	//console.log(++page);
			      	var list = JSONData["list"];
			      	currentPage++;
			      	
			      	list.forEach(function(item, index, array){
			      		
			      		$("#enters").append(" <div class='col-sm-6 col-md-3'> <br/> <div class='thumbnail' style='height:400px;'>  <br/> <img src='/images/uploadFiles/"+item['fileName']+"' style='height:200px;'>"+
					    		  "<div class='caption'> <h3>"+item['prodName']+"</h3> <p>"+item['prodDetail']+"</p> <br/> <p><button type='button' class='btn btn-primary'  data-param4 ="+item['prodNo']+" data-param5 = "+item['proTranCode']+">상세정보</button>"+
					    		  " </p> </div>   </div>  </div>");
			      	})	 
			      	
			      	$("button.btn.btn-primary").on("click", function(){
						var productNo = $(this).data("param4");
						var trancode = $(this).data("param5");
						
						if(${user==null or user.role=='user'}){
							if(trancode=='0'){
								self.location = "/product/getProduct?prodNo="+productNo+"&menu=${param.menu }"
							} else{
								productalert('이미 판매된 상품입니다.');
								//alert("이미 판매된 상품입니다.")
							}
						}
						
						if(${user.role=='admin' and param.menu ==  'search'}){	
							self.location = "/product/getProduct?prodNo="+productNo+"&menu=search"
						}
						
						
					});
					
					/* 	self.location = "/product/getProduct?prodNo="+productNo+"&menu=search"			 */
					
				    
				}
			}
			
		})
		
		
		
	});

	function fncGetList(currentPage){
		//document.getElementById("currentPage").value = currentPage;
		//document.detailForm.submit();
		$("#currentPage").val(currentPage);
		$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu }").submit();
	}
	
	/* function dialog(message, title){
		if(!title)
			title = "알림"
		if(!message)
			message = '이미 판매된 상품입니다.'
		$('<div></div>').html(message).dialog({
			title:title,
			autoOpen:false,
			buttons:{
				'ok':function(){
					$(this).dialog('close');
				}
			}
		});
	}
	 */
	 
	 function productalert(message){
		 //alert("dd")
			$('<div></div>').html(message).dialog({
				title:'알림',
				autoOpen:true,
				modal:true,
				resizable: false,
				buttons:{
					'ok':function(){
						$(this).dialog('close');
					}
				}
			});
		}
	 
	 
	$(function(){
		$("button.btn.btn-default").on("click", function(){
			fncGetList(1);			
		});
		
		$("td:nth-child(2)" ).on("click", function(){
			var productNo = $(this).data("param3");
			console.log(productNo)
			
			$.ajax( 
					{
						url : "/product/json/getProduct/"+productNo ,
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
														+"상품번호 : "+JSONData.prodNo+"<br/>"
														+"상품명 : "+JSONData.prodName+"<br/>"
														+"상세정보 : "+JSONData.prodDetail+"<br/>"
														+"제조일자 : "+JSONData.manuDate+"<br/>"
														+"가    격 : "+JSONData.price+"<br/>"
														+"등록일 : "+JSONData.regDate+"<br/>"
														+"</h3>";
							//Debug...									
							//alert(displayValue);
							$("h6").remove();
							$( "#"+productNo+"" ).html(displayValue);
						}
				});
				
			
		});
		
		$("td:nth-child(3)" ).on("click", function(){
			var productNo = $(this).data("param1");
			var trancode = $(this).data("param2");
			
			if(${user==null or user.role=='user'}){
				if(trancode=='0'){
					self.location = "/product/getProduct?prodNo="+productNo+"&menu=${param.menu }"
				} else{
					productalert('이미 판매된 상품입니다.');
					//alert("이미 판매된 상품입니다.")
				}
			}
			
			if(${user.role=='admin' and param.menu ==  'search'}){	
				self.location = "/product/getProduct?prodNo="+productNo+"&menu=search"
			}
			
			if(${user.role=='admin' and param.menu ==  'manage'}){
				if(trancode=='0'){
					self.location = "/product/updateProduct?prodNo="+productNo+"&menu=manage"
				} else {
					productalert('판매된 상품은 수정이 불가합니다.');
				}
			}
		});
		
		//$(".ct_list_pop td:nth-child(1)").css("color","red");
		$("td:nth-child(3)").css("color","red");
		$(".tran").css("color","blue");
		//$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
		$(".tran").on("click",function(){
			var productNo = $(this).data("param6");
			
			productalert('배송이 시작되었습니다.');
			self.location="/purchase/updateTranCodeByProd?prodNo="+productNo+"&tranCode=2";			
			
		});
		
		$("button.btn.btn-primary").on("click", function(){
			var productNo = $(this).data("param4");
			var trancode = $(this).data("param5");
			
			if(${user==null or user.role=='user'}){
				if(trancode=='0'){
					self.location = "/product/getProduct?prodNo="+productNo+"&menu=${param.menu }"
				} else{
					productalert('이미 판매된 상품입니다.');
					//alert("이미 판매된 상품입니다.")
				}
			}
			
			if(${user.role=='admin' and param.menu ==  'search'}){	
				self.location = "/product/getProduct?prodNo="+productNo+"&menu=search"
			}
			
			if(${user.role=='admin' and param.menu ==  'manage'}){
				if(trancode=='0'){
					self.location = "/product/updateProduct?prodNo="+productNo+"&menu=manage"
				} else {
					productalert('판매된 상품은 수정이 불가합니다.');
				}
			}
		
		
		/* 	self.location = "/product/getProduct?prodNo="+productNo+"&menu=search"			 */
		});
		
		
	
		
	<%-- 	<c:if test="${user==null or user.role=='user' }">
		<c:if test="${product.proTranCode=='0'}">
			<c:if test="${param.menu=='search' }" >
				 <td align="left" data-param1 = "${product.prodNo}" >
				${product.prodName}
				<a href="/product/getProduct?prodNo=${product.prodNo}&menu=search">${product.prodName}</a>
				</td>		
			</c:if>
		<c:if test="${product.proTranCode!='0' }">
			<td align="left">${product.prodName}</td>
		</c:if>
	</c:if>
	
	<c:if test="${user.role=='admin' }">
				
		<c:if test="${param.menu=='search' }" >
			<td align="left"><a href="/product/getProduct?prodNo=${product.prodNo}&menu=search">${product.prodName}</a></td>
		</c:if>
		
		<c:if test ="${param.menu == 'manage' }">
			<c:if test="${product.proTranCode=='0' }">
				<td align="left"><a href="/product/updateProduct.do?prodNo=${product.prodNo}&menu=manage">${product.prodName}</a></td>
			</c:if>
			<c:if test="${product.proTranCode!='0' }">
				<td align="left">${product.prodName}</td>
			</c:if>
		</c:if>
	</c:if>
		 --%>
		
	});
	
	$(document).ready(function() {
		 
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	 
		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
	 
	 		
			$("#floatMenu").stop().animate({
				"top" : newPosition
			}, 500);
	 
		}).scroll();
	 
	}); 

</script>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>${param.menu == 'search'? "상품 검색" : "상품 목록조회"}</h3>
	    </div>
		
		
		<div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
			    <div class="form-group">
				    <select class="form-control" name="searchFilter" >
					    <option value="0" ${ ! empty search.searchCondition && search.searchFilter ==0 ? "selected" : "" }>신상품 순</option>
						<option value="1" ${ ! empty search.searchCondition && search.searchFilter ==1 ? "selected" : "" }>가격 낮은 순</option>
						<option value="2" ${ ! empty search.searchCondition && search.searchFilter ==2 ? "selected" : "" }>가격 높은 순</option> 
					</select>
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${ ! empty search.searchCondition && search.searchCondition ==0 ? "selected" : "" }>상품번호</option>
						<option value="1" ${ ! empty search.searchCondition && search.searchCondition ==1 ? "selected" : "" }>상품명</option>
						<option value="2" ${ ! empty search.searchCondition && search.searchCondition ==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  onkeypress="if(event.keyCode=='13'){fncGetList('1')}" >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <br/> <br/> 
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		
		<c:if test="${param.menu == 'manage'}">
		<table class="table table-hover table-striped" >
		
		<thead>
			<tr>
				<th align="center">No</th>
				<th align="left">간략정보</th>
				<th align="left">상품명</th>
				<th align="left">가격</th>
				<th align="left">등록일</th>	
				<th align="left">현재상태</th>	
			</tr>
		</thead>
		
		<tbody>
		
			<c:set var="i" value="0"/>
			<c:forEach var = "product" items="${list }">
				<c:set var="i" value="${i+1 }"/>
				
				<tr>
				<td align="center" >${i}</td>
				
				<td align="left" data-param3 = "${product.prodNo}">
					<i class="glyphicon glyphicon-info-sign" id= "${product.prodNo}"></i>
			  		<input type="hidden" value="${product.prodNo}">
			  	</td>

				<td align="left" title="Click: 상품정보 확인" data-param1 = "${product.prodNo}"  data-param2 = "${product.proTranCode}" >
					${product.prodName}
				</td>		

				<td align="left">${product.price }</td>

				<td align="left">${product.regDate}</td>

				<td align="left">	
				<c:if test="${user==null or user.role=='user' }">
					${product.proTranCode=='0'? "판매중" : "재고없음" }
				</c:if>
				
				<c:if test="${user.role=='admin' }">
					<c:if test="${product.proTranCode=='0'}">
						판매중
					</c:if>
					<c:if test="${product.proTranCode=='1  ' and param.menu == 'manage' }">
						판매완료
						<span class="tran" data-param6 = "${product.prodNo}">배송하기</span>
						<%-- <a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo }&tranCode=2">배송하기</a> --%>
					</c:if>
					<c:if test="${product.proTranCode=='1  ' and param.menu == 'search' }">
						판매완료
					</c:if>
					<c:if test="${product.proTranCode=='2  '}">
						배송중
					</c:if>
					<c:if test="${product.proTranCode=='3  '}">
						배송완료
					</c:if>
				</c:if>
				</td>	
				
			</tr>
			</c:forEach>		
				
			</tbody>
		</table>
		<jsp:include page="../common/pageNavigator_new.jsp"/>
		</c:if>
		
		<c:if test="${param.menu == 'search'}">

		
		
			<div class="row" id="enters">
			
			<c:set var="i" value="0"/>
			<c:forEach var = "product" items="${list }">
			<c:set var="i" value="${i+1 }"/>
			
			  <div class="col-sm-6 col-md-3" >
			  <br/>
			    <div class="thumbnail" style="height:400px;">
			    <br/>
			      <img src="/images/uploadFiles/${product.fileName}" style="height:200px;" >
			      <div class="caption">
			        <h3>${product.prodName}</h3>
			        <p>${product.prodDetail}</p>
			        <br/>
			        <p><button type="button" class="btn btn-primary"  data-param4 = "${product.prodNo}" data-param5 = "${product.proTranCode}">상세정보</button> 
			        </p>
			      </div>
			    </div>
			  </div>
			  
					
			</c:forEach>
			</div>
		</c:if>
		
	</div>
<!-- 	
	<a href="header" id="top1" title="▲위로가기"><div id="page_up"></div></a>


	<a href="footer" id="bottom1" title="▼아래로가기"><div id="page_down"></div></a> -->
	
	 <div id="floatMenu">
		
	
		<div id="innerMenu">
		최근 본 상품<br/>
		<c:forEach var = "product" items="${cookieList }" end="4">
		<img src = "/images/uploadFiles/${product.fileName}" align="absmiddle" style="width: 50px;" style="height: 100px;"/><br/>
		${product.prodName }<br/>
		</c:forEach>
		</div>

	
	</div>
	
</body>
</html>

