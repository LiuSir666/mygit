<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
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

	<!-- bootstrap 中所有的内容都要放在 container 中 -->
	<div class="container">
		<h1>优惠券列表</h1>

		<!-- 鼠标悬停，带边框的表格 -->
		<table class="table table-hover table-bordered">
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




	<div class="modal fade" id="receiveResultModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">领取结果</h4>
				</div>
				<div class="modal-body">
					<p id="receiveResult"></p>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">登录</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="recipient-name" class="control-label">用户名:</label>
							<input type="text" class="form-control" id="loginUsername">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">密码:</label>
                            <input type="password" class="form-control" id="loginPassword">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="loadLogin()">登录</button>
				</div>
			</div>
		</div>
	</div>




	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

	<!-- js 代码的 script 标签可以写在网页的任意地方，也可以像 css 一样单独放在文件中 -->
	<!-- 通常放在 header 或者网页的最底部，看不同公司的编码规范了 -->

	<script type="text/javascript">
	   
	$(document).ready(function(){
		
		// 在网页加载完毕后，使用 ajax 获取数据，刷新首页的局部内容
		loadCoupons();
	})
	
	// function 就是 js 中定义方法的标志，和 java 差不多
	// loadCoupons 是方法名，
	// () 中写方法的参数，只不过参数不用设置类型，只要名称即可
	// {} 中就是方法体
	// 方法的调用和 java 一样，通过 方法名(参数); 调用
	function loadCoupons() {
		// 创建 loadCoupons 方法使用 ajax 获取优惠券列表
		
		$.ajax({
			type:'GET',
			
			url:'http://localhost:8080/Coupon/coupons',
			
			async:true,
			
			success:function(data){

				// 遍历 data，在循环中执行 function
				// index：索引; obj 数组中的每一个元素
                $.each(data, function(index, obj){
                	$(".table").append("<tr><td>" + (index + 1) + 
                			"</td><td>" + obj.title + 
                			"</td><td>" + obj.desc + 
                			"</td><td>" + obj.startTime + 
                			"</td><td>" + obj.endTime + 
                			"</td><td>" + obj.number + 
                			"</td><td><button type='button' class='btn btn-info btn-xs' onclick='loadReceive(" + obj.id + ")'>领取</button></td></tr>");
                });
			},
			
			error:function(msg){
				
				alert(JSON.stringify(msg));
			}
		});
	}
	   
	
	// 领取指定 id 的优惠券
	function loadReceive(couponId) {
		
	      $.ajax({
	            type:'POST',
	            
	            url:'http://localhost:8080/Coupon/coupons/receive',
	            
	            async:true,
	            
	            // 说明提交给服务器的数据是 json 格式
	            contentType:'application/json',
	            
	            // JSON.stringify() 把 js 对象转换为 json 字符串
	             // 先创建字典对象，把字典对象转换为 json 字符串
	            data: JSON.stringify({"couponId":couponId}), 
	            
	            dataType:'json',
	            
	            success:function(data){

	            	if (data.errorCode == -1000) {
	            		
	            		$("#loginModal").modal({});
	            	}else {
	            		
	                    // 设置提示信息
	                    $("#receiveResult").html(data.message);
	                    
	                    // 弹出窗口
	                    $("#receiveResultModal").modal({});
	            	}
	            },
	            
	            error:function(msg){
	                
	                alert(JSON.stringify(msg));
	            }
	        });
	}
	
	
	function loadLogin(){
		
	      $.ajax({
	            type:'POST',
	            
	            url:'http://localhost:8080/Coupon/user/login',
	            
	            async:true,
	            
	            contentType:'application/json;charset=utf-8',
	            
	            data:JSON.stringify({
	            	"username" : $("#loginUsername").val(),
	                "password" : $("#loginPassword").val(),
	            }),
	            
	            dataType:'json',
	            
	            success:function(data){
	            	if (data.errorCode == 0) {
	            		
	            		$('#loginModal').modal('hide');
	            	}else {
	            		
	            		$("#exampleModalLabel").html(data.message);
	            	}
	            },
	            
	            error:function(msg){
	                
	                alert(JSON.stringify(msg));
	            }
	        });
	}
	
	
	
	
	
	
	</script>

</body>
</html>