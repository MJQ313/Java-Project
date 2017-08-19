<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Login Form</title>
  
  
  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Open+Sans:600'>

      <link rel="stylesheet" href="css/style_log.css">

  
</head>

<body>

  <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
				<form method="post" action="validate.jsp" name="frm">
					<label for="user" class="label">Username</label>
					<input id="user" name="username" type="text" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" name="password" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					<input id="check" type="checkbox" class="check" checked>
					<label for="check"><span class="icon"></span> Keep me Signed in</label>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign In" >
				</div>
			</form>	
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href="forget.html">Forgot Password?</a>
				</div>
			</div>
			<div class="sign-up-htm">
			<form method="post" action="processdata.jsp" name="frm">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input name="uname" id="user" type="text" class="input">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input name="upass" id="pass" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					<label for="pass" class="label">Repeat Password</label>
					<input name="upass" id="pass" type="password" class="input" data-type="password">
				</div>
				<div class="group">
					<label for="emailid" class="label">Email Address</label>
					<input name="uemail" id="emailid" type="text" class="input">
				</div>
				<div class="group">
					<label for="gender" class="label">Gender</label>
					<input type="radio" name="ugender" value="Male">Male</input>
                    <input type="radio" name="ugender" value="Female">Female</input>
				</div>
				<div class="group">
					<label for="dob" class="label">D O B</label>
					<input name="udob" id="dob" type="text" class="input">
				</div>
				
				<div class="group">
					<label for="mobno" class="label">Mobile Number</label>
					<input name="uphone" id="mobno" type="text" class="input">
				</div>
				<div class="group">
					<label for="country" class="label">Country</label>
					<input name="uloc" id="country" type="text" class="input">
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign Up">
				</div>
			</form>	
				<hr/>
				
				<div>
					<label for="tab-1">Already Member?</a>
				</div>
			</div>
		</div>
	</div>
</div>
  
  
</body>
</html>
