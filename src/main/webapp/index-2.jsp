<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container">
		<h1>优惠券</h1>

		<table id="table" class="table table-hover table-bordered">

			<tr>
				<th>序号</th>
				<th>标题</th>
				<th>内容</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>数量</th>
				<th>领取</th>
			</tr>
		</table>
	</div>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

	<script type="text/javascript">
	
	    $(document).ready(function() {
		    loadCoupons()
		})

		function loadCoupons() {
			$.ajax({
				type : 'GET',

				url : 'http://localhost:8080/Coupon/coupons',

				async : true,

				success : function(array) {
					
					$.each(array, function(index, obj){
						
						$("#table").append("<tr><th>" + (index + 1) + 
								"</th><th>" + obj.title + 
								"</th><th>" + obj.desc + 
								"</th><th>" + obj.startTime + 
								"</th><th>" + obj.endTime + 
								"</th><th>" + obj.number + 
								"</th><th><button id='" + obj.id + "'type='button' class='btn btn-info' onclick='loadRecive(this)'>领取</button></th></tr>");
					});
				},

				error : function(msg) {
					alert(JSON.stringify(msg));
				}

			});
		}
	    
	    function loadRecive(btn){
	          $.ajax({
	                type : 'GET',

	                url : 'http://localhost:8080/Coupon/coupons/recive/' + btn.id,

	                async : true,

	                success : function(text) {
	                	alert(text);
	                },

	                error : function(msg) {
	                    alert(JSON.stringify(msg));
	                }

	            });
	    }
	</script>

</body>
</html>