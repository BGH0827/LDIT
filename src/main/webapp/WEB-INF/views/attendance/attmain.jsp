<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>근무현황 페이지</title>
<!-- fontawesome cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/ldit_header.css" /><!-- header css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/ldit_aside.css" /><!-- main css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/basic.css" /><!-- basic css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/attmain.css" /><!-- basic css -->
</head>
<body>
	<%@ include file="../ldit_header.jsp" %>
	<%@ include file="../ldit_aside.jsp" %>

	<section>
<!--  [[${brNo}]] -->
		<article id="article_a">			
			<h1><br>출퇴근 등록</h1>
			<div class="div_checkin">
				<div class="div_title">
					<p>Today's 근무시간</p>
				</div>
				<div class="div_time">
					<p id="working_time">00:00:00</p>
				</div>
				<div class="div_title">
					<p>Today's 출근시각</p>
				</div>
				<div class="div_time">
					<p id="checkin_time">00:00:00</p>
				</div>
				<div class="div_title">
					<p>Today's 퇴근시각</p>
				</div>
				<div class="div_time">
					<p id="checkout_time">00:00:00</p>
				</div>
				<div class="div_btn">
					 	<a href="javascript:fnCheckin()" class="btn_click" id="btn_check">출근</a>
				</div>
			</div>
			<div class="div_restin">
				<div class="div_title">
					<p>Today's 휴게시간</p>
				</div>
				<div class="div_time">
					<p id="rest_time">00:00:00</p>
				</div>
				<div class="div_title">
					<p>최근 휴식시작</p>
				</div>
				<div class="div_time">
					<p id="restin_time">00:00:00</p>
				</div>
				<div class="div_title">
					<p>최근 휴식종료</p>
				</div>
				<div class="div_time">
					<p id="restout_time">00:00:00</p>
				</div>
				<div class="div_btn">
					<a href="javascript:fnRestIn()" class="btn_click" id="btn_rest">휴식 시작</a>
				</div>
			</div>
			<div class="div_apply">
				<div class="div_title">
					<p>발생 연차</p>
				</div>
				<div class="div_time">
					<p id="calAplT">00개</p>
				</div>
				<div class="div_title">
					<p>사용 연차</p>
				</div>
				<div class="div_time">
					<p id="calAplU">00개</p>
				</div>
				<div class="div_title">
					<p>잔여 연차</p>
				</div>
				<div class="div_time">
					<p id="calApl">00개</p>
				</div>
				<div class="div_btn">
					<a href="javascript:fnApply()" class="btn_click" id="btn_apply">휴가/재택 신청</a>
				</div>
			</div>		
		</article>
<!--		<article id="article_b">
		
			<h1>차트</h1>
			
		</article>   -->
		<article id="article_c">
			<h1><br>휴가신청 상세내역<input type="checkbox" name="check_able1" value="onlyAble"></h1>
			<div>
				<div class="div_restin_title">
					<div class="div_restin_closer">
						<ul class="restin_ul_title">
							<li><a href="javascript:restin_showhide();" class="btn_i"><i class="fas fa-minus"></i></a></li>
							<li>휴가시작일자</li>
							<li>휴가종료일자</li>
							<li>신청일</li>
							<li>신청사유</li>
							<li>연차사용여부</li>
						</ul>
					</div>
			 	</div>
				<div class="div_restin_contents" id="div_restin_contents">
				</div>
				<div class="div_restin_paging" id="div_restin_paging">
					<ul></ul>
				</div>
			</div>
		</article>
		<article id="article_d">
			<h1><br>재택근무 상세내역</h1>
			<div>
				<div class="div_home_title">
					<div class="div_home_closer">
						<ul class="home_ul_title">
							<li><a href="javascript:home_showhide();" class="btn_i"><i class="fas fa-minus"></i></a></li>
							<li>재택시작일자</li>
							<li>재택종료일자</li>
							<li>신청일</li>
						</ul>
					</div>
			 	</div>
				<div class="div_home_contents" id="div_home_contents">
				</div>
				<div class="div_home_paging" id="div_home_paging">
					<ul></ul>
				</div>
			</div>		
		</article>
		<article id="article_e">
			<h1><br>근태조회 상세내역</h1>
			<div>
				<div class="div_wh_title">
					<div class="div_wh_closer">
						<ul class="wh_ul_title">
							<li><a href="javascript:wh_showhide();" class="btn_i"><i class="fas fa-minus"></i></a></li>
							<li>근무일자</li>
							<li>출근시간</li>
							<li>퇴근시간</li>
							<li>휴식시간</li>
							<li>추가근무</li>
							<li>총 근무시간</li>
						</ul>
					</div>
			 	</div>
				<div class="div_wh_contents" id="div_wh_contents">
					<!-- for문 -->
					<div><ul><li>신청기간</li><li>ㄴㅇㄹㄴㅇㄹㄴㅇ</li><li></li></ul></div>
					<div><ul><li>신청기간</li><li>ㄴㅇㄹㄴㅇㄹㄴㅇ</li><li></li></ul></div>
					<div><ul><li>신청기간</li><li>ㄴㅇㄹㄴㅇㄹㄴㅇ</li><li></li></ul></div>
					<div><ul><li>신청기간</li><li>ㄴㅇㄹㄴㅇㄹㄴㅇ</li><li></li></ul></div>
				</div>
			</div>

		</article>
	</section>


<script>
let ckInterval = "";
let attStartFormat = "";
let attEndFormat = "";
let restStartFormat = "";
let restEndFormat = "";
let attStart = "";
let calAplT = "";
let calAplU = "";
let elapsedWTime = "";
let elapsedRTime = "";
let brNo = "";

$(document).ready(function(){
	$.ajax({
		url : "attmaingetdata"
		, type : "post"
		, dataType: "json"
		, success: function(data) {
			
			console.log(data);
			attStartFormat = data.attStartFormat;
			attEndFormat = data.attEndFormat;
			restStartFormat = data.restStartFormat;
			restEndFormat = data.restEndFormat;
			attStart = data.attStart;
			calAplT = data.calAplT;
			calAplU = data.calAplU;
			brNo = data.brNo;
			elapsedWTime = data.elapsedWTime;
			elapsedRTime = data.elapsedRTime;
			
			$("#checkin_time").html(attStartFormat);
			$("#checkout_time").html(attEndFormat);
			$("#restin_time").html(restStartFormat);
			$("#restout_time").html(restEndFormat);
			
			$("#working_time").html(elapsedWTime);
			$("#rest_time").html(elapsedRTime);
			
			$("#calAplT").html(calAplT);
			$("#calAplU").html(calAplU);
			$("#calApl").html(calAplT-calAplU);
			
			if(!isNull(attStartFormat) && isNull(attEndFormat)){
				ckInterval = setInterval(countTime, 1000);
				$("#btn_check").attr('href', "javascript:fnCheckOut()");
				$("#btn_check").html("퇴근");
			}
			if(!isNull(attStartFormat) && !isNull(attEndFormat)){
				$("#btn_check").attr('href', "#");
				$("#btn_check").addClass('notable');
				$("#btn_check").html("출근");
			}
			if(!isNull(restStartFormat) && isNull(restEndFormat)){
				$("#btn_rest").attr('href', "javascript:fnRestOut()");
				$("#btn_rest").html("휴식 종료");
			}	
		}
		, error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData);}
	});
 	
});

// getPageRest(1);
//$("input[name=check_able1]").change(function() {
//    if($(this).is(":checked")) { 
//    	getPageRest(1);
//    } else {
//    	getPageRest(1);
//    }
//});

function isNull(obj) {
	return (typeof obj != "undefined" && obj != null && obj != "") ? false : true;
}

function countTime() {
	var nowDate = new Date();
	var str;
	console.log(nowDate);
	if(attStart.length<7){
		attStartFormat = attStartFormat.replaceAll(":", "");
		str = nowDate.getFullYear()+addZero(nowDate.getMonth(), 2)+addZero(nowDate.getDate(), 2)+attStartFormat;
	} else {
		str = attStart;
	}
	var by = str.substr(0,4);
	var bmm = str.substr(4,2)-1;
	var bd = str.substr(6,2);
	var bh = str.substr(8,2);
	var bm = str.substr(10,2);
	var bs = str.substr(12,2);
	var checkinDate = new Date(by, bmm, bd, bh, bm, bs);
	console.log(checkinDate);
	var gapTime = nowDate.getTime()-checkinDate.getTime();
	console.log(gapTime);
	var wh = Math.floor((gapTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	var wm = Math.floor((gapTime % (1000 * 60 * 60)) / (1000 * 60));
	var ws = Math.floor((gapTime % (1000 * 60)) / 1000);
	var totalWorkingTime = addZero(wh,2)+":"+addZero(wm,2)+":"+addZero(ws,2);
	$("#working_time").html("");
	$("#working_time").html(totalWorkingTime);	
}

function addZero(num, digits){
	var zero = '';
	num = num.toString();
	if (num.length < digits) {
		for (var i = 0; i < digits - num.length; i++)
	    zero += '0';
	  }
	return zero + num;
}

function getPageRest(page) {
	var keyValue = $("input[name=check_able1]:checked").val();
	console.log(keyValue);
	$.ajax({
		url : "getXAList"
		, data : {stfNo : "${loginUser.stfNo}"
					, currentPage : page 
					, keyValue : keyValue
					}
		, type : "get"
		, dataType: "json"
		, success: function(data) {
			console.log(data);
			var result = data.xiuxiApplyList;
			if(result.length==0){
				$("#div_restin_contents").html("");
				$("#div_restin_contents").html('<ul><li class="li_no_xaList">신청한 휴가 내역이 없습니다.</li></ul>');
			} else {
				<!--리스트불러오기-->
				var r = '';				
				$.each(result, function(i){
					r +='<div>';
					r +='<ul>';
					r +='<li>'+result[i].xaStart+'</li>';
					r +='<li>'+result[i].xaEnd+'</li>';					
					r +='<li>'+result[i].xaWhen+'</li>';
					r +='<li>'+result[i].xiuxi.xiuReason+'</li>';					
					if(result[i].xiuxi.xiuAplYesNo == 0){
					r +='<li>'+"N"+'</li>';		
					} else if(result[i].xiuxi.xiuAplYesNo == 1){
					r +='<li>'+"Y"+'</li>';		
					}
					r +='</ul>';
					r +='</div>';
				})
				$("#div_restin_contents").html("");
				$("#div_restin_contents").html(r);
				<!--페이징처리-->
				var p = '';
				for(var d=data.startPage; d<=data.endPage; d++){
					if(d==data.currentPage){
						p += '<li>'+'<a href="javascript:getPageRest('+d+')" name="a_current" class="a_current">'+d+'</a>'+'</li>';
					}else{
						p += '<li>'+'<a href="javascript:getPageRest('+d+')">'+d+'</a>'+'</li>';
					}
				}
				$("#div_restin_paging > ul").html("");
				$("#div_restin_paging > ul").html(p);
			} 
		}
		, error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData);}
	});
}

function fnCheckin(){
	$.ajax({
		url : "checkin"
		, data: {stfNo : "${loginUser.stfNo}"}
		, type : "post"
		, success: function(data) {
			console.log(data);
			
			if(!isNull(data)){
				attStart = "";
				attStartFormat = data;
				ckInterval = setInterval(countTime, 1000);
				$("#btn_check").attr('href', "javascript:fnCheckOut()");
				$("#btn_check").html("퇴근");
				$("#checkin_time").html(attStartFormat);
			} else {
				alert("출근 등록에 실패했습니다.");
			}
		}
		, error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData);}
	});
}

function fnCheckOut(){
	console.log("버튼눌림");
	$.ajax({
		url : "checkout"
		, data: {stfNo : "${loginUser.stfNo}"}
		, type : "post"
		, success: function(data) {
			console.log(data);
			if(!isNull(data)){
			$("#btn_check").attr('href', "#");
			$("#btn_check").addClass('notable');
			$("#btn_check").html("출근");
			$("#checkout_time").html(data);
			clearInterval(ckInterval);
			} else {
				alert("퇴근등록에 실패했습니다.");
				location.reload();
			}
		}
		, error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData);}
	});
}

function fnRestIn(){
	if(!isNull(attStartFormat) && isNull(attEndFormat)){
	$.ajax({
		url : "restin"
		, data: {stfNo : "${loginUser.stfNo}"}
		, type : "post"
		, dataType: "json"
		, success: function(data) {
			console.log(data);
			if(!isNull(data)){
			brNo = data.brNo;
			$("#btn_rest").attr('href', "javascript:fnRestOut()");
			$("#btn_rest").html("휴식 종료");
			$("#restin_time").html(data.brStart);
			$("#restout_time").html("00:00:00");
			} else {
				alert("휴식등록에 실패했습니다.");
			}
		}
		, error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData);}
	});
	} else{
		alert("출근 등록을 먼저 진행해주세요.");
	}
}

function fnRestOut(){
	if(!isNull(attStartFormat) && isNull(attEndFormat)){
	$.ajax({
		url : "restout"
		, data: {brNo : brNo}
		, type : "post"
		, dataType: "json"
		, success: function(data) {
			console.log(data);
			if(!isNull(data)){
			$("#btn_rest").attr('href', "javascript:fnRestIn()");
			$("#btn_rest").html("휴식 시작");
			restEndFormat = data.restEndFormat;
			elapsedRTime = data.elapsedRTime;
			$("#restout_time").html(restEndFormat);
			$("#rest_time").html(elapsedRTime);

			} else {
				alert("휴식종료에 실패했습니다.");
			}
		}
		, error : function(request, status, errorData){ 
			 alert("error code : " + request.status + "\n" 
					 + "message : " + request.responseText + "\n" 
					 + "error : " + errorData);}
	});
	} else {
		alert("이미 퇴근했습니다.");
	}
}

function restin_showhide(){
	var t_drc = $("#div_restin_contents");
	t_drc.toggle();
}

function home_showhide(){
	var t_drc = $("#div_home_contents");
	t_drc.toggle();
}


function wh_showhide(){
	var t_drc = $("#div_wh_contents");
	t_drc.toggle();
}



</script>
</body>
</html>