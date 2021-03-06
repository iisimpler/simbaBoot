<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<title>系统首页</title>
		<#include "../adminlte.ftl"/>
		<script type="text/javascript" src="${base}/js/buss/buss.js"></script>
	</head>

	<body>
		<div>
			<!-- Content Wrapper. Contains page content -->
			<div class="">
				<section class="content">
					<div class="row">

						<!-- /.col -->
						<div class="col-md-12">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">修改业务</h3>
								</div>
								<form role="form" onsubmit="return Buss.checkForm();" id="form" action="${base}/buss/update">
									<div class="box-body">
										<div class="form-group">
											<label for="name">名称</label>
											<input type="text" class="form-control" id="name" name="name" placeholder="请输入名称" value="${buss.name}" readonly="true">
										</div>
										<div class="form-group">
											<label for="description">描述</label>
											<input type="text" class="form-control" id="description" name="description" placeholder="请输入描述" value="${buss.description}">
										</div>
										<div class="form-group">
											<label for="script">脚本</label>
											<textarea class="form-control" rows="20" placeholder="请输入脚本" id="script" name="script">${buss.script}</textarea>
										</div>
										<div class="form-group">
											<div style="color: red;">(内置参数params,为Map&lt;String, String[]&gt; params = request.getParameterMap();)</div>
										</div>
									</div>
									<!-- /.box-body -->

									<div class="box-footer">
										<button type="submit" class="btn btn-success">提交</button>
										<button type="button" class="btn" onclick="Buss.toList();">取消</button>
									</div>
								</form>

							</div>
						</div>
						<!-- /. box -->
					</div>
					<!-- /.col -->
			</div>
			<!-- /.row -->
			</section>
			<!-- /.content -->

		</div>
		<!-- /.content-wrapper -->
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		</div>
		<!-- ./wrapper -->

	</body>
	<script type="text/javascript">
		$(document).ready(function() {});
	</script>

</html>