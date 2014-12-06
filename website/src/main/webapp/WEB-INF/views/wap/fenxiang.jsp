<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="../include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<title>聚财村</title>
<%@include file="../include/commonVar.jsp"%>
<style type="text/css">
<!--
body {
	width:100%;
	background-color: #e5e5e5;
	margin: 0;
	padding: 0;
}
ul, ol, dl { 
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 
	padding-right: 15px;
	padding-left: 15px; /* 向块内的元素侧边（而不是块元素自身）添加填充可避免使用任何方框模型数学。此外，也可将具有侧边填充的嵌套块用作替代方法。 */
}
a img { /* 此选择器将删除某些浏览器中显示在图像周围的默认蓝色边框（当该图像包含在链接中时） */
	border: none;
}
/* ~~ 站点链接的样式必须保持此顺序，包括用于创建悬停效果的选择器组在内。 ~~ */
a:link {
	color: #42413C;
	text-decoration: underline; /* 除非将链接设置成极为独特的外观样式，否则最好提供下划线，以便可从视觉上快速识别 */
}
a:visited {
	color: #6E6C64;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* 此组选择器将为键盘导航者提供与鼠标使用者相同的悬停体验。 */
	text-decoration: none;
}
/* ~~ 此固定宽度容器包含所有其它块 ~~ */
.container {
	width: 100%;
	/*background-color: #e5e5e5;*/
	margin: 0 auto; /* 侧边的自动值与宽度结合使用，可以将布局居中对齐 */
}

.sidebar1 {
	float: right;
	width: 180px;
	background-color: #EADCAE;
	padding-bottom: 10px;
}
.content {
	padding: 10px 0;
	width: 100%;
	float: right;
}

/* ~~ 此分组的选择器为 .content 区域中的列表提供了空间 ~~ */
.content ul, .content ol {
	padding: 0 15px 15px 40px; /* 此填充反映上述标题和段落规则中的右填充。填充放置于下方可用于间隔列表中其它元素，置于左侧可用于创建缩进。您可以根据需要进行调整。 */
}

/* ~~ 导航列表样式（如果选择使用预先创建的 Spry 等弹出菜单，则可以删除此样式） ~~ */
ul.nav {
	list-style: none; /* 这将删除列表标记 */
	border-top: 1px solid #666; /* 这将为链接创建上边框 – 使用下边框将所有其它项放置在 LI 中 */
	margin-bottom: 15px; /* 这将在下面内容的导航之间创建间距 */
}
ul.nav li {
	border-bottom: 1px solid #666; /* 这将创建按钮间隔 */
}
ul.nav a, ul.nav a:visited { /* 对这些选择器进行分组可确保链接即使在访问之后也能保持其按钮外观 */
	padding: 5px 5px 5px 15px;
	display: block; /* 这将为链接赋予块属性，使其填满包含它的整个 LI。这样，整个区域都可以响应鼠标单击操作。 */
	width: 160px;  /*此宽度使整个按钮在 IE6 中可单击。如果您不需要支持 IE6，可以删除它。请用侧栏容器的宽度减去此链接的填充来计算正确的宽度。 */
	text-decoration: none;
	background-color: #C6D580;
}
ul.nav a:hover, ul.nav a:active, ul.nav a:focus { /* 这将更改鼠标和键盘导航的背景和文本颜色 */
	background-color: #ADB96E;
	color: #FFF;
}

/* ~~ 脚注 ~~ */
footer {
	padding: 10px 0;
	background-color: #CCC49F;
	position: relative;/* 这可以使 IE6 hasLayout 以正确方式进行清除 */
	clear: both; /* 此清除属性强制 .container 了解列的结束位置以及包含列的位置 */
}

/*HTML 5 支持 - 将新 HTML 5 标签设置为 display:block，以使浏览器知道如何正确呈现标签。 */
header, section, footer, aside, article, figure {
	display: block;
}
header{ text-align:center; color:#FFF;background-color: #2a9ae4; padding-top:0.5em; padding-bottom:0.5em; font-family:微软雅黑; font-size:22px;}
section{ width:96%;  margin:auto;overflow: auto; padding-top:0.5em; background-color:#fff;   }
.mtitle{ width:36%; color:#666666; float:left; font-size:0.9em;  padding-top:0.3em;}
.mtxt{  color:#9c9c9c; float:left; font-size:0.9em; width:60%; line-height:1.5em;word-break:break-all;  }
.mkuang{ width:90%; float:left; padding-left:1.5em; color:#323232; clear:both; margin-bottom:1.2em;  }
body{ 
     width:100%;
	 /*background-image:url(bk.jpg);
     background-size:100%;*/}
-->
</style><!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]--></head>

<body >

<div class="container">
  <header>
   <div style=" font-size:0.8em">${u.uName}在聚财村的个人名片</div>
  </header>
 <div style="width:100%;"><a href="${domain}/down"><img  src="${pageContext.request.contextPath}/images/p20.jpg" width="100%"></a></div> 
 <div style="width:100%; height:0.2em; clear:both;"></div>   
    <section>
    <div style="width:23%;float:left; padding-top:0.5em; padding-left:0.5em; overflow:auto;"><img style="border-radius:5%;" src="${pageContext.request.contextPath}/file/${u.avatar}" width="90%"  ></div>
    
    <div style="width:65%;height:90px;float:left; padding-left:1em; ">
    <div style="font-size:1.1em;  padding-left:0.4em;font-family:微软雅黑;">${u.u_name}&nbsp;<img  src="${pageContext.request.contextPath}/images/011.png" style="height:1em; margin-top:0.4em;"></div>
    <div style="padding:0.5em; color:#7e7e7e; font-size:0.8em;" ><img  src="${pageContext.request.contextPath}/images/012.png" style="height:1em;">&nbsp;${u.area} 靠谱指数：${u.kpno}</div>
    <div style="padding-left:0.5em; color:#7e7e7e;font-size:0.8em;">${u.company}</div>
    </div>
    
  <div style="width:100%; height:0px; clear:both;"></div> 

  <div style=" width:90%; margin:auto; overflow: hidden; ">
  <div style=" width:50%; margin:auto;" onClick="guanzhu('${u.id}')"><img  src="${pageContext.request.contextPath}/images/an_gz.jpg" style="width:100%;"></div>



  </div>  
<div style="width:100%;height:1em;clear:both;"></div>
 
    </section>
 <div style="width:100%; height:0.4em; clear:both;"></div>    
    <section>
      <div style="text-align:center; font-size:1.2em;font-family:微软雅黑; color:#353535; margin-top:-0.2em; padding-bottom:0.3em;">基本信息</div>
      
    </section>
 <div style="width:100%; height:0.2em; clear:both;"></div>      
    <section>
  <div style="width:100%; height:0.2em; clear:both;"></div>     
         <div class="mkuang" >
         <div class="mtitle">公司地址</div><div class="mtxt">${u.address}</div>
         </div>
         <div class="mkuang" >
         <div class="mtitle">联系方式</div><div class="mtxt">${u.phone}</div>
         </div>   
          <div class="mkuang" >     
         <div class="mtitle">性别</div><div class="mtxt">${u.sex}</div>
         </div>  
          <div class="mkuang" >     
         <div class="mtitle">年龄</div><div class="mtxt">${u.old}</div>
         </div>           
          <div class="mkuang" >     
         <div class="mtitle">地区</div><div class="mtxt">${u.area}</div>
         </div>           
 
    </section>
     <div style="width:100%; height:0.5em; clear:both;"></div>    
        <section>
      <div style="text-align:center; font-size:1.2em;font-family:微软雅黑; color:#353535; margin-top:-0.2em; padding-bottom:0.3em;">业务信息</div>
      
    </section>
 <div style="width:100%; height:0.2em; clear:both;"></div>      
    <section>
    <div style="width:100%; height:0.2em; clear:both;"></div> 
         <div class="mkuang" >
         <div class="mtitle">业务特色</div><div class="mtxt">${u.keyword}</div>
         </div>
         <div class="mkuang" >
         <div class="mtitle">所属行业</div><div class="mtxt">${u.industy}</div>
         </div>   
          <div class="mkuang" >     
         <div class="mtitle">业务种类</div><div class="mtxt">${u.business}</div>
         </div>  
          <div class="mkuang" >     
         <div class="mtitle">甩单数量</div><div class="mtxt">${u.danCount}</div>
         </div>           
          <div class="mkuang" >     
         <div class="mtitle">从业年限</div><div class="mtxt">${u.year}</div>
         </div>           
      <div class="mkuang" >     
         <div class="mtitle">详情介绍</div><div class="mtxt">${u.cont}</div>
      </div>
    </section>
     <div style="width:100%; height:0.5em; clear:both;"></div>    
       
  <!-- end .container --></div>
</body>
</html>
<script type="text/javascript">
function guanzhu(str){
	window.location.href=apiPath+'/wap/wx/log?uid='+str;
	}
	
window.imgUrl = '${u.avatar}';
var lineLink =  apiPath+'/wap/wx/fx?uid=${u.id}';
var descContent = "我成为第${user_joinnum}位注册的贷款从业者，赶快来关注我吧";
</script>
<%@include file="../include/wxfxInclude.jsp"%>
