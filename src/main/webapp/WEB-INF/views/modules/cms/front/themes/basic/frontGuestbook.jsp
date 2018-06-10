<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>留言板</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="JeeSite ${site.description}" />
	<meta name="keywords" content="JeeSite ${site.keywords}" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/style/xm_write.css"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/style/zx_info.css" />
	<link href="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.min.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.method.min.js" type="text/javascript"></script>
</head>
<body>
	
    <div class="container pb-15">
		<div class="row">
			<div class="span12">
				<div class="label-div b-30 border-all pt-5 t-20" style="position: relative; padding-left: 0;">
					<div class="txmd">    
						<h4 class="mmh4">留言板</h4>
     					<h6 class="mmh6">留下您的宝贵意见和建议</h6>
     					<div  class="basic"></div>
     					<form:form id="inputForm" action="${ctx}/guestbook" method="post" class="form-horizontal">
							<div class="control-group">
				                <label class="control-label" for="inputName">姓名</label>
				                <div class="controls">
				                    <input id="inputName" type="text" name="name" value=""
				                           class="input-xlarge placeholder on" maxlength="11" rel="input-text"  >
				                </div>
				                <div class="mmclear"></div>
				            </div>
							<div class="control-group">
								<label class="control-label" for="inputEmail">E-mail</label>
								<div class="controls">
								    <input id="inputEmail" type="text" value="" name="email" maxlength="50" 
								           class="input-xlarge placeholder on" rel="input-email" >
								</div>
								<div class="mmclear"></div>
							</div>
				            <div class="control-group">
				                <label class="control-label" for="inputPhone">电话</label>
				                <div class="controls">
				                    <input type="text" id="inputPhone" value="" maxlength="30" rel="input-phone" name="phone" 
				                           class="input-xlarge placeholder on" >
				                </div>
				                <div class="mmclear"></div>
				            </div>
				            <div class="control-group">
				                <label class="control-label" for="inputWorkunit">单位</label>
				                <div class="controls">
				                    <input type="text" id="inputWorkunit" value="" maxlength="64" rel="input-phone" name="workunit" 
				                           class="input-xlarge placeholder on" >
				                </div>
				                <div class="mmclear"></div>
				            </div>
							<div class="control-group">
								<label class="control-label" for="inputType">留言分类</label>
								<div class="controls">
									<select name="type" class="input-xlarge placeholder on" id="inputType">
										<option value="-1">请选择</option>
										<c:forEach items="${fns:getDictList('cms_guestbook')}" var="type">
											<option value="${type.value}">${type.label}</option>
										</c:forEach>
									</select>
								</div>
				                <div class="mmclear"></div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputContent">留言内容:</label>
								<div class="controls">
									<textarea id="inputContent" name="content" rows="4" maxlength="200" class="input-xlarge placeholder on" style="width:400px;"></textarea>
								</div>
				                <div class="mmclear"></div>
							</div>
							<div class="control-group">
								<label class="control-label" for="validateCode">验证码</label>
								<div class="controls">
									<sys:validateCode name="validateCode" />
								</div>
				                <div class="mmclear"></div>
							</div>
							<div class="basic" style="border-top:1px solid #ccc; text-align:center; margin-left:15px; padding:10px 0px 5px 0px;">
						      <img onclick="javascript:;" type="image" src="${ctxStatic}/images/blutbottom.jpg" value="" style="width:81px; height:46px;" id="submitBtn"/>
						    </div>
						</form:form>
						
     					<div class="comment_box_comment" id="comment-box">
							<div class="comments-info clearfix">
								<div class="comments-tab left">
									<a href="javascript:void(0);"><span class="rows_count">${page.list.size()}</span>条留言</a>
								</div>
							</div>
							<ul class="comments-list clearfix">
								<c:forEach items="${page.list}" var="guestbook">
									<li class="cleaarfix p1">
										<div class="left post-img">
											<a target="_blank" href="javascript:;" title="${comment.name}">
												<img src="${ctxStatic}/images/hhead.jpg" alt="${comment.name}">
											</a>
										</div>
										<div class="post-info">
											<div style="line-height: 16px; margin-bottom: 9px;">
												<span class="fs14 r-10" >${guestbook.name}</span>
												<span class="fc999"><fmt:formatDate value="${guestbook.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
											</div>
											<div class="fc666 b-5">${guestbook.content}</div>
											<c:if test=" ${ not empty guestbook.reUser.name ? true : false}">
												<div style="line-height: 16px; margin-bottom: 9px;">
													<span class="fs14 r-10" >回复人：${guestbook.reUser.name}</span>
													<span class="fc999"><fmt:formatDate value="${guestbook.reDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
												</div>
												<div class="fc666 b-5">回复内容：${guestbook.reContent}</div>
											</c:if>
										</div>
										<div class="clear"></div>
									</li>
								</c:forEach>
								<c:if test="${fn:length(page.list) eq 0}">
									<li>暂时还没有人评论！</li>
								</c:if>
							</ul>
     					</div>
					</div>
				</div>
    		</div>
    		
			<!--右侧代码-->
			<div class="span4">
				<div class="label-div t-20 border-all">
					<div class="l-15">
						<h3 class="label-title border-b b-15 small clearfix"
							style="padding-bottom: 14px;">推荐阅读</h3>
					</div>
					<div class="label-main tody-hot l-15">
						<ol>
							<cms:frontArticleHitsTop category="${category}" />
						</ol>
					</div>
				</div>
			</div>
    	</div>
    </div>
	
	<script type="text/javascript">
		$(function(){
			$("#submitBtn").click(function(e){
				var $form = $("#inputForm");
				var formData = $form.serializeArray(); 
				$.ajax({  
			         url: $form.attr("action"),  
			         type: "post",  
			         data: formData,  
			         dataType: "json",  
			         success: function (data)  
			         {  
		        		alert(data.Message);
		        		if(data.IsSuccess)
		        		{
		        			clear();
		        			location.reload();
		        		}
			         }  
			     });
			});
			
			function clear()
			{
				$("#inputName").val("");
				$("#inputEmail").val("");
				$("#inputPhone").val("");
				$("#inputWorkunit").val("");
				$("#inputType").val("-1");
				$("#inputContent").val("");
				$("#validateCode").val("");
			}
		});
	</script>
</body>
</html>