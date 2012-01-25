<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="layout" content="main" />
		<title>Upload an image</title>
	</head>
	<body>
		<div class="nav">
			<span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
			<span class="menuButton"><g:link class="list" action="list">Person List</g:link></span>
			<span class="menuButton"><g:link class="create" action="create">New Person</g:link></span>
		</div>
		<div class="body">
			<h1>Please Select an Image</h1>
			<fieldset>
				<legend>Image Upload</legend>
				<g:form action="upload_image" method="post" enctype="multipart/form-data">

					<p>
						For: <g:link controller="person" action="show" id="${personInstance?.id}">${personInstance?.encodeAsHTML()}</g:link>
					</p>

					<input type="hidden" name="id" value="${personInstance?.id}" />
					<label for="image">Image (64K)</label>
					<input type="file" name="image" id="image" />
					<div style="font-size:0.8em; margin: 1.0em;">
						For best results, your avatar should have a width-to-height ratio of 4:5.
						For example, if your image is 80 pixels wide, it should be 100 pixels high.
					</div>
					<input type="submit" class="buttons" value="Upload" />
				</g:form>
			</fieldset>
		</div>
	</body>
</html>
