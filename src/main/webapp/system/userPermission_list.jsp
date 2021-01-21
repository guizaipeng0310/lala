<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'moduleList.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">

		</style>
		<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
		<link href="css/mainFrame.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/userPermission_list.js"></script>
		<script type="text/javascript">
			
		</script>
	</head>
	<body class="mainbody">
	<s:bean name="com.hrms.action.PermissionAction" id="pa"></s:bean>
		<div>
			<table class="main" cellSpacing=0 cellPadding=0>
				<tr class="hdtr">
					<td class="hdtd1">
						<span class="hdsp1"></span>
					</td>
					<td>
					<span class="hdsp2"></span><span class="hdsp3">用户权限</span><span class="hdsp4"></span>
					</td>
					<td class="hdtd2"></td>
				</tr>
				<tr>
					<td class="bdtd1"></td>
					<td class="bdtd2" valign="top">
						<div>
							<form action="userPermission_list" method="post">
								<div class="listTop">
									<div class="listNavigate">
										当前用户：${userName }   所属角色：
										<s:iterator value="#request.userRoles">
			        						${roleName}
			        						<a href="rolePermission_list?roleId=${roleId}">查看权限</a>
			        					</s:iterator>
										 
										<input type="button" onclick="userPermission_updateAll(${userId})" value="保存"/>
									</div>
								</div>
								<div align="center">
									<table class="contentTb" id="tableId">
										<tr>
											<th class="contentTh" style="width: 50px;" scope=col>
												<input type="checkbox" name="chkSelectAll"
													onclick="checkAll(this)" />
											</th>
											<th class="contentTh" scope=col>
												模块Id
											</th>
											<th class="contentTh" scope=col>
												模块
											</th>
												
											<s:iterator value="actions">
												<th class="contentTh" scope=col>
													${action}
												</th>
											</s:iterator>
											<th class="contentTh" scope=col>
													操作
											</th>
										</tr>
										<s:iterator value="modules">
											<tr>
												<td class="contentTd" style="width: 50px">
													<input type="checkbox" name="chkModule${moduleId}" value="${moduleId}"
														onclick="check(this,'${moduleName}')" />
												</td>
												<td class="contentTd">
													<s:property value="moduleId" />
												</td>
												<td class="contentTd">
													<s:property value="moduleName" />
												</td>
												
												<s:iterator value="actions" >
												
												<td class="contentTd">
												<s:set name="checked" value="#pa.userPermission_checked(userId,moduleId,actionId)"/>
												<s:if test="checked">
													<input type="checkbox" checked name="${moduleName}" value="${actionId}" onclick="cancel(this,'chkModule${moduleId}')"/> 
												</s:if>
												<s:else>
													<input type="checkbox" name="${moduleName}" value="${actionId}" onclick="cancel(this,'chkModule${moduleId}')"/>
												</s:else>	
												</td>	
												</s:iterator>
												<td class="contentTdAction">
													<a onclick="userPermission_update(${userId},${moduleId},'${moduleName}');"><img src="images/edit.gif" border=0> </a>
												</td>
											</tr>
										</s:iterator>
									</table>
									<div class="pagediv">
									</div>
								</div>
							</form>
						</div>
					</td>
					<td class="bdtd3"></td>
				</tr>
				<tr class="fttr">
					<td class="fttd1"></td>
					<td class="fttd2"></td>
					<td class="fttd3"></td>
				</tr>
			</table>
		</div>
	</body>
</html>
