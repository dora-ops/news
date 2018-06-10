<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<link href="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.min.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/jquery-validation/1.11.1/jquery.validate.method.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/jquery.lazyload.mini.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/function.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/zx_info.js" type="text/javascript"></script>
<style type="text/css">.reply{border:1px solid #ddd;background:#fefefe;margin:10px;}</style>

<div id="comment_div" class="t-10 label-div border-all pr-20 pt-50 pl-20">
	<!-- 评论箱  -->
	<div class="comment">
		<div class="comment_box_comment" id="comment-box">
			<div class="post-div">
			
			
				<form action="${ctx}/comment" id="form_comment" method="post" class="form-horizontal" name="form_comment">
					<input type="hidden" name="category.id" value="${comment.category.id}"/>
					<input type="hidden" name="contentId" value="${comment.contentId}"/>
					<input type="hidden" name="title" value="${comment.title}"/>
					<input type="hidden" name="replyId"/>
					<input type="hidden" name="name" value="匿名"/>
					
					<div class="user-img">
						<a title="游客" href="javascript:;"> <img alt="游客"
							src="${ctxStatic}/images/uuuser.jpg">
						</a>
					</div>

					<div class="weiboComments">

						<div class="com-textarea ie6png">
							<textarea
								onblur="if(this.value==''){this.value='有什么感想？你也来说说吧！';$(this).next().val('有什么感想？你也来说说吧！')};textCounter($(this), $(this).parents('form').find('#remLen'),140)"
								onfocus="if(this.value=='有什么感想？你也来说说吧！'){this.value=''};"
								onmousemove="textCounter($(this), $(this).parents('form').find('#remLen'),140)"
								onkeyup="textCounter($(this), $(this).parents('form').find('#remLen'),140);"
								onkeydown="textCounter($(this), $(this).parents('form').find('#remLen'),140);"
								id="data_content" name="content" style="_width: 98%;">有什么感想？你也来说说吧！</textarea>
							<input type="hidden" value="有什么感想？你也来说说吧！" id="data_content2">
							<input type="hidden" value="comment" id="class" name="class">
							<span class="head-msg">还可以输入<span id="remLen">140</span>字
							</span> <span
								style="color: #000; position: absolute; left: 0; top: -35px; height: 22px; line-height: 20px; font-family: '微软雅黑'; font-size: 14px;">讨论区：</span>
						</div>

						<div class="post-toolbar" style="margin-top: 10px;">
							<span class="mid" >验证码:</span><sys:validateCode name="validateCode" />
							<a href="javascript:void(0);" data-url=""
								class="post-button-dis add_comment_submit ie6png">评&nbsp;论</a>
							<div class="alert alert-error messageBox" style="display:none">输入有误，请先更正。</div>
							<!-- loadding -->
						</div>
						
					</div>
				</form>
			</div>
			
			<div class="comments-info clearfix">
				<div class="comments-tab left">
					<a href="javascript:void(0);"><span class="rows_count">${page.list.size()}</span>条评论</a>
				</div>
			</div>
			
			<ul class="comments-list clearfix">
			
				<c:forEach items="${page.list}" var="comment">
					
					<li class="cleaarfix p1">
						<div class="left post-img">
							<a target="_blank" href="javascript:;" title="${comment.name}">
								<img src="${ctxStatic}/images/hhead.jpg" alt="${comment.name}">
							</a>
						</div>
						<div class="post-info">
							<div style="line-height: 16px; margin-bottom: 9px;">
								<a class="fs14 r-10" target="_blank" href="javascript:;" title="${comment.name}">${comment.name}</a>
								<span class="fc999"><fmt:formatDate value="${comment.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							</div>
							<div class="fc666 b-5">${comment.content}</div>
							<div>
								<a href="javascript:comment('${comment.id}')" data-id="${comment.id}"
									class="comment_reply_comment" title="回复">回复</a>
							</div>
							<!-- reply_box -->
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

<div class="pagination">${page}</div>

<script type="text/javascript">
	$(function($) {
		$('.add_comment_submit').live('click', function() {
			var $form = $(this).parents('form');
			var formData = $form.serializeArray();  
		     $.ajax({  
		         url: $form.attr("action"),  
		         type: "post",  
		         data: formData,  
		         dataType: "json",  
		         success: function (data)  
		         {  
	        		if(data.IsSuccess)
	        		{
	        			$('.validateCode').attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+new Date().getTime());
	        			$form.find('#data_content').val('');
	        			$form.find('#remLen').html('140');
	        			$form.find('#validateCode').val('');
	        		}
	        		$('.validateCode').attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+new Date().getTime());
        			$form.find('#data_content').val('');
        			$form.find('#remLen').html('140');
        			$form.find('#validateCode').val('');
	        		//alert(data.Message);
	        		window.location.reload()
		         }  
		     });  
		});
	});
</script>