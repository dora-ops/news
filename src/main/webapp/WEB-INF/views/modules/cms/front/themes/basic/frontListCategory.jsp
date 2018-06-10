<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>${category.name}</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="${category.description}" />
	<meta name="keywords" content="${category.keywords}" />
</head>
<body>

	<div class="container pb-15">
		<div class="row">
			<div class="span12">
        		<div class="clearfix pb-15" style=" position:relative;">
					<div class="pull-left classifyDIV pt-10">
	                    <a class="pull-left type-css nosel">${ category.name  }</a>
	                    <c:forEach items="${categoryList}" var="tpl">
							<a id="" class="pull-left type-css tags" href="${ctx}/list-${tpl.id}${urlSuffix}" title="${tpl.name }">${tpl.name }</a>
	                    </c:forEach>
					</div>
					<div style="position: absolute; right:0px; background:#06f;" class="pull-right t-20 classifySearch" >
					<form id="searchForm" action="${ctx}/search" method="post" class="search">
						<!-- 类型获取不到 -->
						<input type="hidden" id="cid" name="cid" value="${article.category.id}"/>
						<input type="text" name="q" value="${q}" class="search-input pull-left span4" id="search-input">
						<a class="search-btn-css pull-left search-btn" title="搜索" href="javascript:void(0);"></a>
					</form>
					</div>
				</div>
				
				<c:forEach items="${page.list}" var="article">
					<div class="label-div b-30 border-all pb-20 pt-5" style="position: relative; padding-left: 0;">
	
						<div class="pl-20" style="margin-left: 1px; margin-top: 3px;">
							<a class="fc1D6597" title="${ article.category.name }" href="${ctx}/list-${article.category.id}${urlSuffix}">${ article.category.name }</a>
						</div>
	
						<div class="news-list">
							<div class="clearfix pt-3">
								<div class="index-news-img spanm3 pull-left pt-5">
									<a href="${ article.url }" title="${ article.title }" target="_blank" rel="bookmark"> 
										<img class="lazyloadimg" alt="${ article.title }" src="${ article.image }" style="width: 200px; height: 122px;" />
									</a>
								</div>
								<div class="offset3 intro">
									<h1>
										<a title="${ article.title }" target="_blank" href="${ article.url }">${ article.title }</a>
									</h1>
	
									<div class="clearfix" style="height: 22px; margin-top: 0px;">
										<div class="pull-left myxx">
											<i class="m"><a href="${ctx}/list-${article.category.id}${urlSuffix}" >${ article.category.name }</a></i>
											<i class="m"><fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/></i>
										</div>
	
										<div class="pull-right">
											<a class="follow-btn pr-10 ie6png" href="javascript:void(0);" data-id="104417" data-type="news">${article.collect}人</a>
											<a class="read-btn ie6png" href="javascript:void(0);" title="${article.hits}次阅读">${article.hits}次</a>
										</div>
									</div>
									<p class="t-1" >${article.description}</p>
	
									<div class="clearfix">
										<a href="${ article.url }" title="浏览全文" target="_blank" rel="bookmark" class="read-all pull-right">浏览全文</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="pagination center pagination-large pt-20">
					<ul id="yw1" class="yiiPager">
					<li class="previous" >
					<a 
						<c:choose>
							<c:when test="${ page.pageNo-1 < 1}">href="javascript:;" onclick="return false;"</c:when>
							<c:otherwise>href="${ctx}/list-${category.id}${urlSuffix}?pageNo=${ page.pageNo-1 }""</c:otherwise>
						</c:choose>
					>
					《</a>
					</li>
					<c:forEach items="${ totalpage }" varStatus="status">
						<li 
							<c:choose>
								<c:when test="${ page.pageNo == (status.index+1) }">class="page selected"</c:when>
								<c:otherwise> class="page"</c:otherwise>
							</c:choose>
						>
							<a href="${ctx}/list-${category.id}${urlSuffix}?pageNo=${ status.index+1 }">${ status.index+1 }</a>
						</li>
					</c:forEach>
					<li class="next">
						<a 
							<c:choose>
								<c:when test="${ page.pageNo+1 > page.last}">href="javascript:;" onclick="return false;"</c:when>
								<c:otherwise>href="${ctx}/list-${category.id}${urlSuffix}?pageNo=${ page.pageNo+1 }""</c:otherwise>
							</c:choose>
						>
						》</a>
					</li>
					</ul>		    
				</div>
			</div>
			
			<!--右侧代码-->
			<div class="span4">

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
	var pageSize = 2;
	
	
	
	function page(pNum,pageSize){
		
	}
});
</script>

</body>
</html>