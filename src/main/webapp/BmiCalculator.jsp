<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI Result</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	background-color: #ffffff;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	width: 400px; /* Increase container width for better layout */
	text-align: center;
}

.container h2 {
	margin-top: 0;
	color: #3498db;
}

.container p {
	margin: 10px 0;
	font-size: 18px;
}

.container img {
	margin-top: 20px;
	border-radius: 5px;
}

.container a {
	display: inline-block;
	margin-top: 20px;
	text-decoration: none;
	background-color: #3498db;
	color: #ffffff;
	padding: 10px 20px;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.container a:hover {
	background-color: #2980b9;
}
</style>
</head>
<body>
	<%
        double height = Double.parseDouble(request.getParameter("height"));
        double weight = Double.parseDouble(request.getParameter("weight"));
		
        double bmi = weight / ((height / 100) * (height / 100));
        bmi = Math.round(bmi * 100.0) / 100.0; // ปัดเศษทศนิยมให้เหลือแค่ 2 ตำแหน่ง

        String bmiCategory;
        String bmiImage; // สร้างตัวแปรสำหรับเก็บ URL รูปภาพ

        if (bmi < 18.5) {
            bmiCategory = "Underweight ผอม";
        } else if (bmi < 24.9) {
            bmiCategory = "Normal weight ปกติ";
        } else if (bmi < 29.9) {
            bmiCategory = "Overweight ท้วม";
        } else {
            bmiCategory = "Obese อ้วน"; 
        }
    %>

	<div class="container">
		<h2>BMI Result</h2>
		<p>
			Height: <%= height %> cm
		</p>
		<p>
			Weight: <%= weight %> kg
		</p>
		<p>
			BMI: <%= bmi %>
		</p>
		<p>
			Category: <%= bmiCategory %>
		</p>

		

		<a href="bmi.jsp">Calculate Again</a>
	</div>
</body>
</html>
