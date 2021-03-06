<app>

	<h1>Welcome to MSTU Chat! [without Firebase / just Riot]</h1>
	<a href="../withFirebase">See Firebase Version</a><br><br>

	<div class="chatLog" ref="chatLog">
		<!-- Messages go here: -->
		<message each={ msg in chatLog }></message>
	</div>

	<input type="text" ref="messageInput" onkeypress={ sendMsg } placeholder="Enter Message">
	<button type="button" onclick={ sendMsg }>SEND</button>

	<script>
		var that = this;

		// Demonstration Data
		this.chatLog = [
			//{ message: "안녕" }, { message: "Hola" }, { message: "Konnichiwa" }
		];
		
		messageRef.on('value', function(snapshot){
			var data = snapshot.val();
			
			that.chatLog = [];
			
			for (key in data)
	{
		that.chatLog.push(data[key]);
}			
			})

		sendMsg(e) {
			if (e.type == "keypress" && e.key !== "Enter") {
				e.preventUpdate = true; // Prevents riot from auto update.
				return false; // Short-circuits function (function exits here, does not continue.)
			}
			
			if(this.refs.messageInput.value !==""){
		
			var msg = {
				message: this.refs.messageInput.value
			};
			
			messageRef.push(msg);
			//this.chatLog.push(msg);

			this.clearInput();
		}
	}

		clearInput(e) {
			this.refs.messageInput.value = "";
			this.refs.messageInput.focus();
		}
	</script>

	<style>
		:scope {
			display: block;
			font-family: Helvetica;
			font-size: 1em;
		}
		.chatLog {
			border: 1px solid grey;
			padding: 1em;
			margin-bottom: 1em;
		}
		[ref="messageInput"], button {
			font-size: 1em;
			padding: 0.5em;
		}
		[ref="messageInput"] {
			width: 50%;
		}
	</style>
</app>
