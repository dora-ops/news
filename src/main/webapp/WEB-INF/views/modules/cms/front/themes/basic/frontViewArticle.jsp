<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<title>${article.title}-${category.name}</title>
<meta name="decorator" content="cms_default_${site.theme}" />
<meta name="description"
	content="${article.description} ${category.description}" />
<meta name="keywords" content="${article.keywords} ${category.keywords}" />

</head>
<body>
	<div class="container pb-15">
		<div class="row">
			<div class="span12">
				<div class="label-div b-30 border-all pt-5 t-20" style="position: relative; padding-left: 0;">
					<div class="mmdh pull-left"">
						<cms:frontCurrentPosition category="${category}" />
					</div>
					<div class="mmclear"></div>
					<div style="margin-top: 14px;" class="clearfix pb-12 pl-25 pr-25">
						<h1 class="pull-left r-10">${article.title}</h1>
						<div class="pull-left pt-5 none-768" style="_margin-top: -33px; _margin-left: -10px;">
							<span class="like-plug-gz clearfix pull-left r-15"> 
							<a title="感兴趣，关注一下吧" href="javascript:void(0);"
								class="like-btn pull-right ie6png">关注本文</a> 
								<span class="count pull-left t-5 d-none"></span>
							</span>
						</div>
					</div>
					<div style="margin-top: 4px;" class="clearfix pl-25 pr-25">
						<div class="pull-left">
							<span class="r-15 pull-left"><span class="fc999 l-5"><fmt:formatDate value="${article.updateDate}" pattern="yyyy/MM/dd"/></span></span>
							<span class="r-15 pull-left"><span class="fc999 l-5">发布者：${article.user.name}</span></span>
							<span class="fc999 l-20 pull-left">点击数： <span data-obj="News" data-oid="104437" id="obj_hits" class="fc999">${article.hits}</span>
							</span>
						</div>
					</div>

					<div class="view-main t-20 pl-25 pr-25">
						<table style="width: 100%;" class="fc333 border-all">
							<tbody>
								<tr>
									<td style="padding: 5px 12px; width: 25px; font-size: 22px; text-align: center; background: #E8E8E8; line-height: 30px; color: #999">导读</td>
									<td style="padding: 10px 10px 12px; line-height: 24px;">${article.description}</td>
								</tr>
							</tbody>
						</table>
						<div class="view-content" style="margin-top: 18px;">
							${article.articleData.content}
						</div>
					</div>
				</div>


				<!--讨论区-->
				<div class="row">
					<div id="comment" class="hide span10">正在加载评论...</div>
				</div>
				<!--讨论区结束-->
			</div>

			<!--右侧代码-->
			<div class="span4">

				<div class="t-20 mygz">
					<dl>
						<dd>
							<p class="t">关注</p>
							<p>${article.collect}</p>
						</dd>
						<dd class="border">
							<p class="t">分享</p>
							<p>0</p>
						</dd>
						<dd>
							<p class="t">讨论</p>
							<p>2</p>
						</dd>
						<div class="mmclear"></div>
					</dl>
				</div>

				<div class="label-div t-20 border-all">
					<div class="l-15">
						<h3 class="label-title border-b b-15 small clearfix" 
							style="padding-bottom: 14px;">栏目列表</h3>
					</div>
					<div class="label-main tody-hot l-15">
						<ol>
							<cms:frontCategoryList categoryList="${categoryList}" />
						</ol>
					</div>
				</div>

				<div class="label-div t-20 border-all">
					<div class="l-15">
						<h3 class="label-title border-b b-15 small clearfix"
							style="padding-bottom: 14px;">相关文章</h3>
					</div>
					<div class="label-main tody-hot l-15">
						<ol>
							<c:forEach items="${relationList }" var="relation">
								<li><a href="${ctx}/view-${relation[0]}-${relation[1]}${urlSuffix}">${fns:abbr(relation[2],36)}</a></li>
							</c:forEach>
						</ol>
					</div>
				</div>

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
		$(function() {
			if ("${category.allowComment}" == "1"
					&& "${article.articleData.allowComment}" == "1") {
				$("#comment").show();
				page(1);
			}
		});
		function page(n, s) {
			$.post("${ctx}/tocomment", {
				theme : '${site.theme}',
				'category.id' : '${category.id}',
				contentId : '${article.id}',
				title : '${article.title}',
				pageNo : n,
				pageSize : s,
				date : new Date().getTime()
			}, function(data) {
				$("#comment").html(data);
			});
		}
	</script>

</body>
</html>