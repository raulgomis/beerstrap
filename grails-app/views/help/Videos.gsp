<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<parameter name="menu_Help" value="active" />
<!-- 2. flowplayer -->
<script src="http://releases.flowplayer.org/5.1.1/flowplayer.min.js"></script>

<!-- 3. skin -->
<link rel="stylesheet" type="text/css"
	href="http://releases.flowplayer.org/5.1.1/skin/minimalist.css" />
</head>
<body>

	<g:render template="top" model="['selected':'videos']" />

	<div id="tutorial">
		<table class="table table-striped">
			<thead>
				<tr>
					<th style="width: 300px"></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>

					<td>
						<div class="flowplayer">
							<video
								src="https://www.youtube.com/watch?feature=player_embedded&v=kUBCUUBQUcU#"></video>
						</div>
						<p>
							Download: <a
								href="https://www.youtube.com/watch?feature=player_embedded&v=kUBCUUBQUcU#">MP4</a>
							| <a href="#">WMV</a>
						</p>
						<p>
							<span class="muted">Pulsa en la esquina superior derecha
								para ver el video a pantalla completa</span>
						</p>
					</td>

					<td>

						<h2>
							<span class="label label-success">New</span> Tutorial 1: Title
						</h2>

						<p>
							<strong>Description</strong>
						</p>

					</td>
				</tr>


			</tbody>

		</table>


	</div>


</body>
</html>
