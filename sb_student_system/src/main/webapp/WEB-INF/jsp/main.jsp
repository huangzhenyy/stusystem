<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>layout 后台大布局 - Layui</title>
<link rel="stylesheet" href="bower_components/layui/dist/css/layui.css">
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">layui 后台布局</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">控制台</a></li>
				<li class="layui-nav-item"><a href="">商品管理</a></li>
				<li class="layui-nav-item"><a href="">用户</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img src="http://t.cn/RCzsdCq" class="layui-nav-img"> 贤心
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">退了</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class="" href="javascript:;">所有商品</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">列表一</a>
							</dd>
							<dd>
								<a href="javascript:;">列表二</a>
							</dd>
							<dd>
								<a href="javascript:;">列表三</a>
							</dd>
							<dd>
								<a href="">超链接</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="javascript:;">解决方案</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="javascript:;">列表一</a>
							</dd>
							<dd>
								<a href="javascript:;">列表二</a>
							</dd>
							<dd>
								<a href="">超链接</a>
							</dd>
						</dl></li>
					<li class="layui-nav-item"><a href="">云市场</a></li>
					<li class="layui-nav-item"><a href="">发布商品</a></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<div style="padding: 15px;">
				<table class="layui-hide" id="test" lay-filter="test"></table>

			</div>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© layui.com - 底部固定区域
		</div>
	</div>
	<!-- 按钮部分 -->
	<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
	<script src="bower_components/layui/dist/layui.js"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;

		});
	</script>
	<!-- 数据表格开始-->
	<script>
		layui.use([ 'table', 'form' ], function() {
			var table = layui.table;
			layui.$.post("department/findAll", function(data) {
				for (var i = 0; i < data.length; i++) {
					var option = new Option(data[i].name, data[i].name);
					layui.$("#yuanxi").append(option);

				}
				layui.form.render('select');
			})
			table.render({
				elem : '#test',
				url : 'student/list',
				toolbar : '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
				,
				defaultToolbar : [ 'filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
					title : '提示',
					layEvent : 'LAYTABLE_TIPS',
					icon : 'layui-icon-tips'
				} ],
				title : '用户数据表',
				cols : [ [ {
					type : 'checkbox',
					fixed : 'left'
				}, {
					field : 'id',
					title : 'ID',
					width : 80,
					fixed : 'left',
					unresize : true,
					sort : true
				}, {
					field : 'name',
					title : '姓名',
					width : 120
				
				}

				, {
					field : 'gernder',
					title : '性别',
					width : 80,
					
					sort : true
				}, {
					field : 'chengj',
					title : '综合成绩'
					
				}, {
					field : 'yuanxi',
					title : '院系',
					width : 200,
					sort : true
				}, {
					fixed : 'right',
					title : '操作',
					toolbar : '#barDemo',
					width : 150
				} ] ],
				page : true,
				parseData : function(res) { //res 即为原始返回的数据 
					return {
						"code" : 0, //解析接口状态 
						//"msg": res.message, //解析提示文本 
						"count" : res.total, //解析数据长度 
						"data" : res.records
					//解析数据列表 
					};
				},
				limits : [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ],//修改分页大小值
				limit : 2
			});

			//头工具栏事件
			table.on('toolbar(test)', function(obj) {
				var checkStatus = table.checkStatus(obj.config.id);
				switch (obj.event) {
				case 'getCheckData':
					var data = checkStatus.data;
					layer.alert(JSON.stringify(data));
					break;
				case 'getCheckLength':
					var data = checkStatus.data;
					layer.msg('选中了：' + data.length + ' 个');
					break;
				case 'isAll':
					layer.msg(checkStatus.isAll ? '全选' : '未全选');
					break;
				case 'addStudent':
					layer.open({
						type : 1,
						title : "添加学生信息",
						area : [ '50%', '50%' ],
						content : layui.$('#studentAdd'),
						success : function(layero, index) {
							layui.form.val("addStudent", {
								"name" : "",
								"gernder" : "",
								"chengj" : "",
								"yuanxi":-1

							});

						}
					});
					break;
				//自定义头工具栏右侧图标 - 提示
				case 'LAYTABLE_TIPS':
					layer.alert('这是工具栏右侧自定义的一个图标按钮');
					break;
				}
				;
				//监听提交
				layui.form.on('submit(addBtn)', function(data) {
					layui.$.post("student/addStudent", data.field,

					function(res) {
						layer.closeAll();
						if (res.code == 1) {
							table.reload('test', {
								url : 'student/list'

							});
						} else {
							
							layer.msg(res.msg, {
								icon : 1,
								time : 2000
							//2秒关闭（如果不配置，默认是3秒）
							}, function() {
								//do something
							});
						}
					})

					return false;
				});
			});

			//监听行工具事件
			table.on('tool(test)', function(obj) {
				var data = obj.data;
				//console.log(obj)

				if (obj.event === 'del') {

					layer.confirm('真的删除行么', function(index) {

						layui.$.post("student/delete", {
							id : data.id,
							page : 1
						}, function(data) {
							layer.close(index);
							if (data.code == 1) {
								layer.msg(data.msg, {
									icon : 1,
									time : 2000
								//2秒关闭（如果不配置，默认是3秒）
								}, function() {
									window.location.reload();
								});
							} else {
								layer.msg(data.msg, {
									icon : 1,
									time : 2000
								//2秒关闭（如果不配置，默认是3秒）
								}, function() {
									//do something
								});
							}
						});
					});
				} else if (obj.event === 'edit') {
					layer.prompt({
						formType : 2,
						value : data.email
					}, function(value, index) {
						obj.update({
							email : value
						});
						layer.close(index);
					});
				}
			});
		});
	</script>
	<!--数据表格结束  -->
	<!-- 新增按钮开始 -->
	<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
	<button class="layui-btn layui-btn-sm" lay-event="addStudent">添加学生信息</button>
  </div>
</script>
	<!-- 新增按钮结束 -->
	<!-- 打开新增表单开始 -->
	<div id="studentAdd" style="display: none;">
		<form class="layui-form" id="" lay-filter="addStudent" method="post" action="">
			<input type="hidden" name="id">

			<div class="layui-form-item">
				<label class="layui-form-label">姓名</label>
				<div class="layui-input-block">
					<input type="text" name="name" placeholder=" 请 输 入 " autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="text" name="gernder" placeholder=" 请 输 入 " autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">综合成绩</label>
				<div class="layui-input-block">
					<input type="text" name="chengj" placeholder=" 请 输 入 " autocomplete="off" class="layui-input" lay-verify="number">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">院系</label>
				<div class="layui-input-block">
					<select name="yuanxi" lay-filter="aihao" id="yuanxi">
						<option value="-1">--请选择--</option>

					</select>
				</div>
			</div>


			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="addBtn">添加学生</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
	<!-- 打开新增表单结束 -->
</body>
</html>
