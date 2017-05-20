<!DOCTYPE html>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Testing websockets</title>
</head>

<body>
	<fieldset>
		
		<textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea><br />
		
		<input id="inputMessage" type="text" />
		<input type="submit" value="send" onclick="send()" />
		
	</fieldset>
</body>

<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://localhost:8080/TomCat/broadcasting');
	//var webSocket = new WebSocket('ws://localhost:8080/프로젝트명/broadcasting');
	var inputMessage = document.getElementById('inputMessage');

	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};

	//	OnClose는 웹 소켓이 끊겼을 때 동작하는 함수.(여기서는 미사용.)

	//	OnMessage는 클라이언트에서 서버 측으로 메시지를 보내면 호출되는 함수.
	function onMessage(event) {
		textarea.value += "Annonymous : " + event.data + "\n";
	}

	//	OnOpen은 서버 측에서 클라이언트와 웹 소켓 연결이 되었을 때 호출되는 함수.
	function onOpen(event) {
		textarea.value += "connected \n";
	}

	//	OnError는 웹 소켓이 에러가 나면 발생을 하는 함수.
	function onError(event) {
		alert("connecting error " + event.data);
	}
	
	function send() {
		textarea.value += "Me : " + inputMessage.value + "\n";
		webSocket.send(inputMessage.value);
		inputMessage.value = "";
	}
	
</script>
</html>