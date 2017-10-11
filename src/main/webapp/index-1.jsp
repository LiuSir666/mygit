<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src='<c:url value="/js/jquery.js"></c:url>'></script>
<!-- 

第三方的 js 框架，我们可以使用它很方便操作 js 功能
     $(selector).action()
     选择标签做操作
       selector 选择标签
        HTML
        . 根据 class 选择标签
        # 根据 id 选择标签

所有 jQuery 函数要写在 document ready 函数，在网页完全加载之后再进行操作

$(document).ready(function(){
 
   // 开始写 jQuery 代码...
 
    $("p").click(function(){
        // 点击 p 标签动作触发后执行的代码!!
    });
});

 -->
 
<script type="text/javascript">

$(document).ready(function() {
	
	$("#username").blur(function(){
		
		// username 标签失去焦点的时候执行的代码
		
		var username = $("#username").val(); // 获得 input 标签中 value 的值
		
		// alert(username);
		// 使用 ajax 把 username 发送到服务器，检测是否可用
		
		if (username == null || username == "") {
			
            $("#usernameValidResult").html("请输入用户名");
            $("#usernameValidResult").css("color", "red");
            
			return;
		}
		
		$.ajax({
			
			type:'GET',
			
			// 检查用户名是否存在
			url:'http://localhost:8080/Coupon/user/' + username + "/valid",
			
			async:true, // 异步操作，不影响用户的其它操作，
			
			// 如果是同步的话，在获得返回结果前，用户对网页的操作没有任何反应
			// 同步同一时间只能做一件事情，发送请求的时候不能做别的事情
			data:{
				
			}, // 传送给服务器的数据，json 格式组织，大量的数据可以放在这里
			
			success:function(data) { // data 是服务器返回的数据，变量名，随便起
				
				// alert(JSON.stringify(data));
			    $("#usernameValidResult").html(data ? "用户名已存在": "用户名可以使用");
			    $("#usernameValidResult").css("color", data ? "red" : "green");
			}, // 请求成功，处理服务器返回的数据
			
			error:function(msg) {
				
				alert(JSON.stringify(msg));
			}// 请求失败，执行的操作
		});
		
		
	});
})



</script>





</head>


<body>
	<h1>hello, world</h1>

	<form action='<c:url value="/register"></c:url>'>

		<div>
			<input type="text" id="username" name="username"><span id="usernameValidResult"></span>
		</div>
		
		<div>
			<input type="password" name="password">
		</div>
		
		<div>
			<input type="submit" value="注册">
		</div>
	</form>
</body>
</html>