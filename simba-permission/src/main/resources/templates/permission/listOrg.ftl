<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<title>系统首页</title>
		<#include "../adminlte.ftl"/>
		<#include "../iCheck.ftl"/>
		<script type="text/javascript" src="${base}/js/plugins/bootstrap-treeview.min.js"></script>
		<script type="text/javascript" src="${base}/js/common/checkbox.js"></script>
		<script type="text/javascript" src="${base}/js/util/treeviewutil.js"></script>
		<script type="text/javascript" src="${base}/js/permission/org.js"></script>
	</head>

	<body>
		<div>
			<!-- Content Wrapper. Contains page content -->
			<div class="">
				<section class="content">
					<div class="row">
						<div class="col-md-3">
							<div id="tree"></div>
							<!-- /.box -->
						</div>
						<!-- /.col -->
						<div class="col-md-9">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">机构管理</h3>
								</div>
								<!-- /.box-header -->
								<div class="box-body no-padding">
									<div class="mailbox-controls">
										<!-- Check all button -->
										<button type="button" class="btn btn-default btn-sm checkbox-toggle" onclick="Org.toAdd();"><i class="fa fa-plus"></i>
                新增</button>
										<button type="button" class="btn btn-default btn-sm" onclick="Org.batchDelete();"><i class="fa fa-remove"></i>删除</button>
										<div class="pull-right">
											<button type="button" class="btn btn-default btn-sm" onclick="Org.exportAllPermission();"><i class="fa fa-paper-plane"></i>导出所有权限SQL数据</button>
										</div>
									</div>
									<!-- /.pull-right -->
								</div>
								<input type="hidden" id="parentID" name="parentID" value="${parentID}" />
								<input type="hidden" id="parentName" name="parentName" value="${parentName}" />
								<div class="table-responsive">
									<table class="table table-hover table-striped table-bordered" id="table">
										<thead>
											<tr>
												<th><input type="checkbox" name="checkAll" id="checkAll">全选</th>
												<th>名称</th>
												<#list values as value>
													<th>${value}</th>
												</#list>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>
									<!-- /.table -->
								</div>
								<!-- /.mail-box-messages -->
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
		$(document).ready(function() {
			Org.initOrgList();
			Org.initOrgTree($("#parentID").val(), $("#parentName").val());
		});
	</script>

</html>