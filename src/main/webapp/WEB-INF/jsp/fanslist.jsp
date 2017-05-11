<%@page import="java.text.SimpleDateFormat"%>
<%@page import="microservice.online.entity.TbFans"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="head.inc.jsp"%>
<%
	List<TbFans> tbFans = (List<TbFans>)request.getAttribute("fans");
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
%>
<!-- main-content -->
<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<script type="text/javascript">
			try {
				ace.settings.check('breadcrumbs', 'fixed')
			} catch (e) {
			}
		</script>

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
			<li class="active">粉丝管理</li>
			<li class="active">粉丝列表</li>
		</ul>
		<!-- .breadcrumb -->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon"> <input type="text"
					placeholder="Search ..." class="nav-search-input"
					id="nav-search-input" autocomplete="off" /> <i
					class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div>
		<!-- #nav-search -->
	</div>

	<div class="page-content">
		<div class="page-header">
			<h1>
				粉丝列表 <small> <i class="icon-double-angle-right"></i> 查看
				</small>
			</h1>
		</div>
		
			<div class="col-xs-12">
				<div class="space-4"></div>
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label class="col-sm-1 control-label" for="form-field-1"> 粉丝名称 </label>
						<div class="col-sm-3 input-group">
							<input type="text" id="form-field-1" placeholder="粉丝名称关键词" class="form-control" />
						</div>
						
						<label class="col-sm-1 control-label" for="form-field-1"> 关注时间 </label>
						<div class="col-sm-3 input-group">
							<input class="form-control date-picker" id="id-date-picker-1" type="text" value="<%=format2.format(new Date()) %>" data-date-format="yyyy-mm-dd" />
							<span class="input-group-addon">
								<i class="icon-calendar bigger-110"></i>
							</span>
						</div>
						
						<div class="col-sm-3 input-group">
							<button class="btn btn-info" type="button">
								<i class="icon-ok bigger-110"></i>
								查询
							</button>
							
							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="reset">
								<i class="icon-undo bigger-110"></i>
								重置
							</button>
						</div>
					</div>
					
					<div class="form-group">
						
					</div>
					<div class="space-4"></div>
				</form>
			</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="table-header">全部粉丝（包括已关注和取消关注）</div>

				<div class="table-responsive">
					<table id="sample-table-2"
						class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></th>
								<th>粉丝名称</th>
								<th>粉丝ID</th>
								<th>所在城市</th>
								<th>所在国家</th>
								<th class="hidden-480">粉丝性别</th>

								<th><i class="icon-time bigger-110 hidden-480"></i> 关注时间</th>
								<th class="hidden-480">关注状态</th>
								<th class="hidden-480">分组</th>
								<th>备注</th>
								<th>操作</th>
							</tr>
						</thead>

						<tbody>
							<%
								for(TbFans fans : tbFans) {
							%>
							<tr>
								<td class="center"><label> <input type="checkbox"
										class="ace" /> <span class="lbl"></span>
								</label></td>

								<td><a href="#"><%=fans.getNickname() %></a></td>
								<td><%=fans.getOpenid() %></td>
								<td class="hidden-480"><%=fans.getCity() %></td>
								<td><%=fans.getCountry() %></td>
								<% if(fans.getSex()==0) { %>
								<td>未知</td>
								<%} else if(fans.getSex()==1) {%>
								<td>男性</td>
								<%} else if(fans.getSex()==2) { %>
								<td>女性</td>
								<%} %>

								<td><%=format.format(new Date(Long.valueOf(fans.getSubscribeTime()))) %></td>
								<%if(fans.getSubscribe()==0) { %>
								<td>未关注</td>
								<%} else { %>
								<td>已关注</td>
								<%} %>
								<%if(fans.getGroupid()==0) { %>
								<td>未分组</td>
								<%} else { %>
								<td>...</td>
								<%} %>
								<td class="hidden-480"><span
									class="label label-sm label-warning"><%=fans.getRemark() %></span></td>

								<td>
									<div
										class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#"> <i
											class="icon-zoom-in bigger-130"></i>
										</a> <a class="green" href="#"> <i
											class="icon-pencil bigger-130"></i>
										</a> <a class="red" href="#"> <i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle"
												data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul
												class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li><a href="#" class="tooltip-info" data-rel="tooltip"
													title="View"> <span class="blue"> <i
															class="icon-zoom-in bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-success"
													data-rel="tooltip" title="Edit"> <span class="green">
															<i class="icon-edit bigger-120"></i>
													</span>
												</a></li>

												<li><a href="#" class="tooltip-error"
													data-rel="tooltip" title="Delete"> <span class="red">
															<i class="icon-trash bigger-120"></i>
													</span>
												</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
							<%} %>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- <div class="modal-footer no-margin-top">

			<ul class="pagination pull-right no-margin">
				<li class="prev "><a href="#"> <i
						class="icon-double-angle-left"></i>
				</a></li>

				<li class="active"><a href="#">1</a></li>

				<li><a href="#">2</a></li>

				<li><a href="#">3</a></li>
				
				<li><a href="#">4</a></li>
				
				<li><a href="#">5</a></li>
								
				<li><a href="#">6</a></li>
				
				<li><a href="#">...</a></li>
				
				<li><a href="#">16</a></li>
				
				<li class="next disabled"><a href="#"> <i
						class="icon-double-angle-right"></i>
				</a></li>
			</ul>
		</div> -->
		<%@include file="page.inc.jsp"%>
		<!-- PAGE CONTENT ENDS -->
	</div>
	<!-- /.page-content -->
</div>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<script src="assets/js/jquery.dataTables.min.js"></script>
		<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
		<script src="assets/js/date-time/daterangepicker.min.js"></script>
		<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="assets/js/date-time/bootstrap-timepicker.min.js"></script>
		<script src="assets/js/date-time/moment.min.js"></script>

<script type="text/javascript">
				
				jQuery(function($) {
					
					$('table th input:checkbox').on('click' , function(){
						var that = this;
						$(this).closest('table').find('tr > td:first-child input:checkbox')
						.each(function(){
							this.checked = that.checked;
							$(this).closest('tr').toggleClass('selected');
						});
							
					});
					
					$('#id-disable-check').on('click', function() {
						var inp = $('#form-input-readonly').get(0);
						if(inp.hasAttribute('disabled')) {
							inp.setAttribute('readonly' , 'true');
							inp.removeAttribute('disabled');
							inp.value="This text field is readonly!";
						}
						else {
							inp.setAttribute('disabled' , 'disabled');
							inp.removeAttribute('readonly');
							inp.value="This text field is disabled!";
						}
					});
					
					//dynamically change allowed formats by changing before_change callback function
					$('#id-file-format').removeAttr('checked').on('change', function() {
						var before_change
						var btn_choose
						var no_icon
						if(this.checked) {
							btn_choose = "Drop images here or click to choose";
							no_icon = "icon-picture";
							before_change = function(files, dropped) {
								var allowed_files = [];
								for(var i = 0 ; i < files.length; i++) {
									var file = files[i];
									if(typeof file === "string") {
										//IE8 and browsers that don't support File Object
										if(! (/\.(jpe?g|png|gif|bmp)$/i).test(file) ) return false;
									}
									else {
										var type = $.trim(file.type);
										if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif|bmp)$/i).test(type) )
												|| ( type.length == 0 && ! (/\.(jpe?g|png|gif|bmp)$/i).test(file.name) )//for android's default browser which gives an empty string for file.type
											) continue;//not an image so don't keep this file
									}
									
									allowed_files.push(file);
								}
								if(allowed_files.length == 0) return false;
				
								return allowed_files;
							}
						}
						else {
							btn_choose = "Drop files here or click to choose";
							no_icon = "icon-cloud-upload";
							before_change = function(files, dropped) {
								return files;
							}
						}
						var file_input = $('#id-input-file-3');
						file_input.ace_file_input('update_settings', {'before_change':before_change, 'btn_choose': btn_choose, 'no_icon':no_icon})
						file_input.ace_file_input('reset_input');
					});
				
				
				
				
					
					$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
						$(this).prev().focus();
					});
					$('input[name=date-range-picker]').daterangepicker().prev().on(ace.click_event, function(){
						$(this).next().focus();
					});
					
					$('#timepicker1').timepicker({
						minuteStep: 1,
						showSeconds: true,
						showMeridian: false
					}).next().on(ace.click_event, function(){
						$(this).prev().focus();
					});
				});
		</script>
<!-- /.main-content -->
<%@include file="foot.inc.jsp"%>
