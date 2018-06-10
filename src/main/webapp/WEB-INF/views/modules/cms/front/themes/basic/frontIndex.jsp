<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/modules/cms/front/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>首页</title>
	<meta name="decorator" content="cms_default_${site.theme}"/>
	<meta name="description" content="JeeSite ${site.description}" />
	<meta name="keywords" content="JeeSite ${site.keywords}" />
</head>
<body>
	<div class="row home-index">
		 <div class="span13">
		 	<div class="span8">
		 		<div class="label-div t-20 border-all">
		 			<div class="l-15">
                        <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">
                            <a href="${ctx}/list-2${urlSuffix}" title="国内焦点" class="pull-left r-10">国内焦点</a>
                            <a href="${ctx}/list-2${urlSuffix}" title="更多" class="more-add ie6png pull-right">&nbsp;</a>
                        </h3>
                    </div>
                    <div class="label-main">
                    	<div class="news-slides b-15 l-15">
                    		<div class="slides-list slides-banner">
                   				<c:forEach items="${fnc:getArticleList(site.id, 2, 2, 'posid:1')}" var="article">
	                    			<div class="slides-css" style="display:block;">
	                                    <a target="_blank" href="${article.url}" title="${ article.title }" rel="bookmark">
	                                        <img alt="${ article.title }" src="${ article.image }" style="width: 587px;height: 397px;"/>
	                                    </a>
	                                </div>
                   				</c:forEach>
                                <!--轮播图的小按钮-->
                                <div class="slides-icon slides-banner-point">
                                    <a href="javascript:void(0);" class="icon-css-on ie6png">&nbsp;</a>
                                    <a href="javascript:void(0);" class="icon-css ie6png">&nbsp;</a>
                                </div>
                                <!--轮播图的小按钮结束-->
                    		</div>
                   			<c:forEach items="${fnc:getArticleList(site.id, 2, 2, 'posid:1')}" var="article">
	                            <div class="slides-title slides-banner-title" style="display:block">
	                                <div class="intro">
	                                    <h1 class="t-15">
	                                    	<a href="${article.url}" title="${article.title}" rel="bookmark" target="_blank" style="color:${article.color}">${fns:abbr(article.title,50)}</a>
	                                    </h1>
	                                </div>
	                                <div class="clearfix t-10 related-news"
	                                     style="height:45px; overflow:hidden; position:relative;">
	                                    <a class="pr-5 fc333 ie6png" href="${article.url}" rel="bookmark"  target="_blank">${ article.keywords }</a>
	                                    <a class="pr-5 fc333 ie6png" href="${article.url}" rel="bookmark"  target="_blank">${ article.description }</a>
	                                </div>
	                            </div>
                   			</c:forEach>
                    	</div>
                    	
                        <!--图文解说开始-->
                        <div class="hr l-15 t-15 b-20"></div>
                    	
                 		<c:forEach items="${fnc:getArticleList(site.id, 2, 6, '')}" var="article">
	                        <div class="news-list b-30 clearfix">
	                            <div class="spanm3 pull-left" style="padding-top:7px;">
	                                <a href="${article.url}" rel="bookmark" title="${ article.title }" style="display: block;"
	                                   target="_blank">
	                                    <img src="${ article.image }" style="width: 220px; height: 134px;"/>
	                                </a>
	                            </div>
	                            <div class="offsetindex3 intro">
	                                <h1><a href="${article.url}" title="${ article.title }" rel="bookmark" target="_blank" style="color:${article.color}">${ article.title }</a>
	                                </h1>
	                                <p class="t-5 fc666" style=" margin-bottom:0px;">${ article.description }</p>
	                                <div class="myxm">
	                                	<span class="two">
	                                		<a href="javascript:;">${article.category.name}</a>
	                                	</span> <fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/>
	                                </div>
	                                <div class="clearfix">
	                                    <a class="follow-btn pr-10 ie6png news-follow-btn" href="javascript:void(0);" data-id="104423" data-type="news">${fnc:getCommentCount(article.id)}人</a>
	                                    <a class="read-btn ie6png" href="javascript:void(0);" title="${article.hits}次阅读">${article.hits}次</a>
	                                </div>
	                            </div>
	                        </div>
                 		</c:forEach>
                    	
                    </div>
		 		</div>
		 	</div>
		 	
            <div class="span5">
                <div class="label-div t-20 border-all">
		 			<!--栏目展示-->
					<div class="l-15 mmtop">
						<h3 class="label-title border-b small clearfix"
							style="padding-bottom: 14px; margin-bottom: 14px;">
							<a href="${ctx}/list-6${urlSuffix}" title="国际快讯" class="pull-left r-10">国际快讯</a>
							<a href="${ctx}/list-6${urlSuffix}" title="更多" 	class="more-add ie6png pull-right">&nbsp;</a>
						</h3>
					</div>
	                
	                <div class="label-main">
                 		<c:forEach items="${fnc:getArticleList(site.id, 6, 7, '')}" var="article">
			                <div class="topic-list b-45">
			                    <div class="clearfix">
			                        <div class="span1 pull-left">
			                            <a href="${article.url}" rel="bookmark" title="${ article.title }" target="_blank">
			                                <img class="lazyloadimg" alt="${ article.title }" src="${article.image}"/>
			                            </a>
			                        </div>
			                        <div class="offset1 intro">
			                            <h1><a href="${article.url}" title="${ article.title }" rel="bookmark" target="_blank" style="color:${article.color}">${ article.title }</a></h1>
			                        </div>
			                    </div>
			                    <div class="intro l-20">
			                        <p class="t-15 fc666 mmbuttom">${ article.description }</p>
			                        <div class="clearfix">
			                            <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="${fnc:getCommentCount(article.id)}人关注">${fnc:getCommentCount(article.id)}人</a>
			                            <a class="read-btn ie6png" href="javascript:void(0);" title="${article.hits}次浏览">${article.hits}次</a>
			                        </div>
			                    </div>
			                 </div>
		                 </c:forEach>
	                </div>
				</div>
		 	</div>
		 	
            <div class="span13">
                <div class="label-div t-30 border-all">
		            <div class="l-15">
                        <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">
                            <a href="${ctx}/list-9${urlSuffix}" title="体育娱乐" class="pull-left r-10">体育娱乐</a>
                            <a href="${ctx}/list-9${urlSuffix}" title="更多" class="more-add ie6png pull-right">&nbsp;</a>
                        </h3>
                    </div>
                   
                   <div class="label-main clearfix" style="padding-left: 16px;">
                       <div class="clearfix">
		               		<c:forEach items="${fnc:getArticleList(site.id, 9, 12, '')}" var="article" varStatus="status">
			                            <div class="video-list b-30 pull-left <c:if test="${ (status.index+1)%4 != 0 }">pr-20</c:if>">
			                                <div class="clearfix">
			                                    <div class="video-img">
			                                        <a href="${article.url}" title="${ article.title }" target="_blank" rel="bookmark">
			                                            <img class="lazyloadimg" src="${ article.image }" alt="${ article.title }" style="width: 232px; height: 141px;"/>
			                                        </a>
			                                    </div>
			                                </div>
			                                <div style="margin-top: 8px;">
			                                    <h1><a href="${article.url}" title="${ article.title }" rel="bookmark" target="_blank" style="color:${article.color}">${ article.title }</a>
			                                    </h1>
			                                </div>
			                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">
			                                    ${ article.description }</p>
			                                <div class="myxm">
			                                	<span class="two"><a href="javascript:;">${article.category.name} _ ${ status.index }</a></span> 
			                                	<fmt:formatDate value="${article.updateDate}" pattern="yyyy.MM.dd"/>
			                                </div>
			                                <div class="clearfix t-10">
			                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);"
			                                       title="${fnc:getCommentCount(article.id)}人评论">${fnc:getCommentCount(article.id)}人</a>
			                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="${article.hits}次浏览">${article.hits}次</a>
			                                </div>
			                            </div>
		                    	</c:forEach>
                        </div>
                    </div>
            	</div>
            </div>
		 </div>
		 
        <div class="span3">
        	<div class="label-div t-20 border-all">
                <div class="l-15"><h3 style="padding-bottom: 14px;" class="label-title border-b b-20 small clearfix">
                    关注我</h3></div>
                <div class="l-15 t-20"><img src="${ctxStatic}/images/wx.png"></div>
                <p style="margin-bottom: 0;" class="l-15 t-5 fc999">扫描微信，向我捐助</p>
            </div>
            
            <div class="label-div t-30 border-all">
                <div class="l-15">
                    <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">最新发表</h3></div>
                <div class="label-main tody-hot l-15">
                    <ul>
                    	<c:forEach items="${fnc:getArticleList(site.id, '2,6,9', 20, '')}" var="article">
	                        <li><a href="${article.url}" style="color:${article.color}">${ fns:abbr(article.title, 23) }</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            
            <div class="label-div t-30 border-all">
                <div class="l-15">
                    <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">最新回复</h3></div>
                <div class="label-main tody-hot l-15">
                    <ul>
                        <c:forEach items="${fnc:getComments(site.id, 20)}" var="comment">
	                        <li><a href="${fnc:getArticle(comment.contentId).url}" >${ fns:abbr(comment.title, 23) }</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            
        </div>
	</div>

<script type="text/javascript">
	$(function () {
	    var Interval_control = '';
	    var current_index = 0;
	    $(".slides-banner .slides-css").hide();
	    $(".slides-banner .slides-css:first").show();
	    $(".slides-banner-title").hide();
	    $(".slides-banner-title:first").show();
	
	    show_pic = function (index) {
	        $(".slides-css").each(function (i) {
	            $(this).hide();
	            if (i == index) {
	                $(this).show();
	            }
	        });
	    };
	
	    show_content = function (index) {
	        $(".slides-banner-title").each(function (i) {
	            $(this).hide();
	            if (i == index) {
	                $(this).show();
	            }
	        });
	    };
	
	    show_point = function (index) {
	        $(".slides-banner-point a").each(function (i) {
	            if ($(this).hasClass("icon-css-on")) {
	                $(this).removeClass("icon-css-on");
	                $(this).addClass("icon-css");
	            }
	            if (i == index) {
	                if ($(this).hasClass("icon-css")) {
	
	                    $(this).removeClass("icon-css");
	                }
	                $(this).addClass("icon-css-on");
	            }
	        });
	
	    };
	
	    slides = function () {
	        $(".slides-icon a").each(function (index) {
	            $(this).click(function () {
	                current_index = index;
	                show_point(index);
	                show_content(current_index);
	                show_pic(current_index);
	            });
	        });
	    };
	    slides();
	
	    Interval_control = setInterval(
	        function () {
	            show_point(current_index);
	            show_content(current_index);
	            show_pic(current_index);
	
	            if (current_index == ($(".slides-banner .slides-css a").length - 1)) {
	                current_index = -1;
	            }
	
	            current_index++;
	        }
	        ,
	        3000
	    );//设置自动切换函数
	
	    //当触发mouseenter事件时，取消正在执行的自动切换方法，触发mouseouter事件时重新设置自动切换
	    $(".slides-banner .slides-css,.slides-banner-title").mouseenter(function () {
	        clearInterval(Interval_control);//停止自动切换
	    }).mouseleave(function () {
	        Interval_control = setInterval(
	            function () {
	                show_point(current_index);
	                show_content(current_index);
	                show_pic(current_index);
	
	                if (current_index == ($(".slides-banner .slides-css a").length - 1)) {
	                    current_index = -1;
	                }
	
	                current_index++;
	            }
	            ,
	            3000
	        );//设置自动切换函数
	
	    });
	});
</script>
</body>
</html>