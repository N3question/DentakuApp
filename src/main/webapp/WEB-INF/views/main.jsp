<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>
	<div class="container">
    	<h1 class="top-space">Calculator</h1>
		<a href="main"><i class="bi bi-arrow-clockwise"></i>Try Again</a>
		<div class="form">
			<form action="main" method="post" id="calculatorForm">
				<table>
					<tr>
						<%
						Integer result = (Integer) request.getAttribute("result");
						%>
						<%
						if (result == null) {
						%>
							<input type="text" name="expression" id="expression" class="input-top result-p" readonly>
							<input type="hidden" id="number1" name="number1">
					        <input type="hidden" id="operator" name="operator">
					        <input type="hidden" id="number2" name="number2">
				        <% } else {%>
				        	<input class="input-top result-p" value="<%= result %>" readonly>
				        <% } %>
					</tr>
				    <tr>
				    	<td><input type="button" value="7" class="input" onclick="appendValue('7')"></td>
		                <td><input type="button" value="8" class="input" onclick="appendValue('8')"></td>
		                <td><input type="button" value="9" class="input" onclick="appendValue('9')"></td>
		                <td><input type="button" value="/" class="operator input" name="div_btn" onclick="appendValue('/')"></td>
				    </tr>
				    <tr>
		                <td><input type="button" value="4" class="input" onclick="appendValue('4')"></td>
		                <td><input type="button" value="5" class="input" onclick="appendValue('5')"></td>
		                <td><input type="button" value="6" class="input" onclick="appendValue('6')"></td>
		                <td><input type="button" value="*" class="operator input" name="add_btn" onclick="appendValue('*')"></td>
		            </tr>
				    <tr>
		                <td><input type="button" value="1" class="input" onclick="appendValue('1')"></td>
		                <td><input type="button" value="2" class="input" onclick="appendValue('2')"></td>
		                <td><input type="button" value="3" class="input" onclick="appendValue('3')"></td>
		                <td><input type="button" value="-" class="operator input" onclick="appendValue('-')"></td>
		            </tr>
		            <tr>
		                <td><input type="button" value="0" class="input" onclick="appendValue('0')"></td>
		                <td><input type="reset" value="C" class="input"></td>
		                <td><input type="submit" value="=" class="equal input" onclick="separateAndSubmit()"></td>
		                <td><input type="button" value="+" class="operator input" onclick="appendValue('+')"></td>
		            </tr>
		        </table>
			</form>
		</div>
		<script>
		    function appendValue(value) {
		    	var expression = document.getElementById('expression').value += value;
		    }
		    
		    function separateAndSubmit() {
	            // 現在の式を取得
	            var expression = document.getElementById('expression').value;

	            // 演算子を基準にして分解
	            var parts = expression.split(/([-+*/])/);

	         	// 分解された値をそれぞれのinputフィールドに設定
	            document.getElementById('number1').value = parts[0] || '';
	            document.getElementById('operator').value = parts[1] || '';
	            document.getElementById('number2').value = parts[2] || '';

	            // フォームをサブミット
	            document.getElementById('calculatorForm').submit();
	        }
		</script>
	</div>
</body>
</html>