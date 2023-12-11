<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h2>Hello World!</h2>
	<div>
		<label>Type your message and click to send: </label> <br>
		<textarea name="textArea1"  id="idTextArea1" cols="40" rows="5"></textarea>
		<br>
		<br>
	</div>
	
	<div id="resultDiv">
	 
	</div>
	
	<button type="button" onclick="onClickButton()">Send</button>
</body>
</html>

<script type="text/javascript">
	
	function onClickButton() {
	
		document.getElementById("resultDiv").innerHTML = "operating";
		openWebSocket();
		sendMyClientMessage();
	
	}

	function openWebSocket() {

		//this is the point that I am getting the error: 
		ws = new WebSocket("ws://localhost:8080/path/wsAddress");
		ws = new WebSocket("ws://localhost:8080/tahasozgen/wsAddress");
		
		ws.onmessage = function(event) {
			renderServerReturnedData(event.data);
		};
		ws.onerror = function(event) {
			$('#resultDiv').html(event);
		};

	}

	function sendMyClientMessage() {
		
		var myText = document.getElementById("idTextArea1").innerHTML;
		let randomnumber = Math.random();
		
		var message = JSON.stringify({
			'clientName' : 'Client-	' + randomnumber,
			'clientMessage' : myText
		});
		
		ws.onopen = () => ws.send(message);
		
		//ws.send(message);
		document.getElementById('idTextArea1').value = '';
	}
</script>