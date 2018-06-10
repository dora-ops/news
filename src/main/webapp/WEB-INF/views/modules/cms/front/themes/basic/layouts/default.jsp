<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/style/basic.css"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/style/biobox2.css" />    
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/style/index.css"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/style/comment.css"/>
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/style/zx_info.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/style/xm_write.css" />
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/style/cxzx_list.css"/>
	<script src="${ctxStatic}/jquery/jquery-1.8.3.js"></script>
	<title><sitemesh:title default="欢迎光临"/> - ${site.title} - Powered By Geek</title>
</head>
<body>
	<div class="navbar navbar-fixed-top" >
      <div class="navbar-inner">
        <div class="container">
          <c:choose>
   			<c:when test="${not empty site.logo}">
   				<img alt="${site.title}" src="${site.logo}" class="container" onclick="location='${ctx}/index-${site.id}${fns:getUrlSuffix()}'">
   			</c:when>
   			<c:otherwise><a class="brand" href="${ctx}/index-${site.id}${fns:getUrlSuffix()}">${site.title}</a></c:otherwise>
   		  </c:choose>
          <div class="nav-collapse">
            <ul id="main_nav" class="nav nav-pills">
             	<li class="${not empty isIndex && isIndex ? 'active' : ''}">
             		<a href="${ctx}/index-1${fns:getUrlSuffix()}"><span>${site.id eq '1'?'首　 页':'返回主站'}</span></a>
             	</li>
				<c:forEach items="${fnc:getMainNavList(site.id)}" var="category" varStatus="status">
					<c:if test="${category.id != '18'}">
	                    <c:set var="menuCategoryId" value=",${category.id},"/>
			    		<li class="${requestScope.category.id eq category.id||fn:indexOf(requestScope.category.parentIds,menuCategoryId) ge 1?'active':''}">
			    			<a href="${category.url}" target="${category.target}"><span>${category.name}</span></a>
			    		</li>
			    	</c:if>
		    	</c:forEach>
            </ul>
            <form class="navbar-form pull-right" action="${ctx}/search" method="post" style="margin: 0;display: flex;align-items: center;height: 40px;">
              	<input type="text" name="q" maxlength="20" style="width:95px;margin:0;" placeholder="全站搜索..." value="${q}">
            </form>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
	<div class="hr tp-div-nexthr" style="margin-top: 10;margin-bottom: 0;padding: 0;"></div>
	
	<div class="container">
		<div class="content">
			<sitemesh:body/>
		</div>

		<div class="container" style="margin:20px 0 10px;">
			<div class="hr"></div>
		</div>
		<footer>
			<div class="footer_nav"><a href="${ctx}/guestbook" target="_blank">公共留言</a> | <a href="${ctx}/search" target="_blank">全站搜索</a> | <a href="${ctx}/map-${site.id}${fns:getUrlSuffix()}" target="_blank">站点地图</a> | <a href="mailto:thinkgem@163.com">技术支持</a> | <a href="${pageContext.request.contextPath}${fns:getAdminPath()}" target="_blank">后台管理</a></div>
			<div class="pull-right">${fns:getDate('yyyy年MM月dd日 E')}</div><div class="copyright">${site.copyright}</div>
      	</footer>
    </div> <!-- /container -->
</body>
</html>