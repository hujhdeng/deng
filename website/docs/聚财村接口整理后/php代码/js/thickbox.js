// JavaScript Document
/*
 * Thickbox 3 - One Box To Rule Them All.
 * By Cody Lindley (http://www.codylindley.com)
 * Copyright (c) 2007 cody lindley
 * Licensed under the MIT License: http://www.opensource.org/licenses/mit-license.php
*/

var tb_pathToImage = "image/loadingAnimation.gif";
$(document).ready(function()
{
	tb_init('a.thickbox, area.thickbox, input.thickbox');
	imgLoader=new Image();
	imgLoader.src=tb_pathToImage
}
);
function tb_init(b)
{
$(b).click(function()
{
	var t=this.title||this.name||null;
	var a=this.href||this.alt;
	var g=this.rel||false;
	
	tb_show(t,a,g);
	this.blur();
	return false
}
)
}
function tb_show(d,f,g)
{
	try
	{
		if(typeof document.body.style.maxHeight==="undefined")
		{
			$("body","html").css(
			{
				height:"100%",width:"100%"
			}
			);
			$("html").css("overflow","hidden");
			if(document.getElementById("TB_HideSelect")===null)
			{
				$("body").append("<iframe id='TB_HideSelect'></iframe><div id='TB_overlay'></div><div id='TB_window'></div>");
				$("#TB_overlay").click(tb_remove)
				//$("#ttt").click(tb_remove2)
			}
		}
		else
		{
			if(document.getElementById("TB_overlay")===null)
			{
				$("body").append("<div id='TB_overlay'></div><div id='TB_window'></div>");
				$("#TB_overlay").click(tb_remove)
				//$("#ttt").click(tb_remove2)
			}
		}
		if(tb_detectMacXFF())
		{
			$("#TB_overlay").addClass("TB_overlayMacFFBGHack")
		}
		else
		{
			$("#TB_overlay").addClass("TB_overlayBG")
		}
		if(d===null)
		{
			d=""
		}
		$("body").append("<div id='TB_load'><img src='"+imgLoader.src+"' /></div>");
		$('#TB_load').show();
		var h;
		if(f.indexOf("?")!==-1)
		{
			h=f.substr(0,f.indexOf("?"))
		}
		else
		{
			h=f
		}
		var i=/\.jpg$|\.jpeg$|\.png$|\.gif$|\.bmp$/;
		var j=h.toLowerCase().match(i);
		if(j=='.jpg'||j=='.jpeg'||j=='.png'||j=='.gif'||j=='.bmp')
		{
			TB_PrevCaption="";
			TB_PrevURL="";
			TB_PrevHTML="";
			TB_NextCaption="";
			TB_NextURL="";
			TB_NextHTML="";
			TB_imageCount="";
			TB_FoundURL=false;
			if(g)
			{
				TB_TempArray=$("a[@rel="+g+"]").get();
				for(TB_Counter=0;((TB_Counter<TB_TempArray.length)&&(TB_NextHTML===""));TB_Counter++)
				{
					var k=TB_TempArray[TB_Counter].href.toLowerCase().match(i);
					if(!(TB_TempArray[TB_Counter].href==f))
					{
						if(TB_FoundURL)
						{
							TB_NextCaption=TB_TempArray[TB_Counter].title;
							TB_NextURL=TB_TempArray[TB_Counter].href;
							TB_NextHTML="<span id='TB_next'>&nbsp;&nbsp;<a href='#'>下一张 &gt;</a></span>"
						}
						else
						{
							TB_PrevCaption=TB_TempArray[TB_Counter].title;
							TB_PrevURL=TB_TempArray[TB_Counter].href;
							TB_PrevHTML="<span id='TB_prev'>&nbsp;&nbsp;<a href='#'>&lt; 上一张</a></span>"
						}
					}
					else
					{
						TB_FoundURL=true;
						TB_imageCount=""+(TB_Counter+1)+"/"+(TB_TempArray.length)+""
					}
				}
			}
			imgPreloader=new Image();
			imgPreloader.onload=function()
			{
				imgPreloader.onload=null;
				var a=tb_getPageSize();
				var x=a[0]-150;
				var y=a[1]-150;
				var b=imgPreloader.width;
				var c=imgPreloader.height;
				
				if(b>x)
				{
					c=c*(x/b);
					b=x;
					if(c>y)
					{
						b=b*(y/c);
						c=y
					}
				}
				else if(c>y)
				{
					b=b*(y/c);
					c=y;
					if(b>x)
					{
						c=c*(x/b);
						b=x
					}
				}
				TB_WIDTH=b+30;
				TB_HEIGHT=c+60;
				$("#TB_window").append("<a href='javascript:void(0);' id='TB_nextImage' title='点击查看下一幅图片'><img id='TB_Image' src='"+f+"' width='"+b+"' height='"+c+"'/></a>"+"<div id='TB_caption' style='line-height:1.5; color:#666'>"+d+"<div id='TB_secondLine' style='line-height:1.5; color:#666'>"+TB_imageCount+TB_PrevHTML+TB_NextHTML+"</div></div><div id='TB_closeWindow'><a href='#' id='TB_closeWindowButton' title='Close'>关闭3</a></div>");
				//<img src='/images/close.gif' width='100' height='14' alt='关闭'/>
				$("#TB_closeWindowButton").click(tb_remove);
				if(!(TB_PrevHTML===""))
				{
function goPrev()
{
	if($(document).unbind("click",goPrev))
	{
		$(document).unbind("click",goPrev)
	}
	$("#TB_window").remove();
	$("body").append("<div id='TB_window'></div>");
	tb_show(TB_PrevCaption,TB_PrevURL,g);
	return false
}
$("#TB_prev").click(goPrev)
}
if(!(TB_NextHTML===""))
{
function goNext()
{
	$("#TB_window").remove();
	$("body").append("<div id='TB_window'></div>");
	tb_show(TB_NextCaption,TB_NextURL,g);
	return false
}
$("#TB_next").click(goNext)
//liuda{
$("#TB_nextImage").click(goNext);
//liuda}
}
document.onkeydown=function(e)
{
if(e==null)
{
	keycode=event.keyCode
}
else
{
	keycode=e.which
}
if(keycode==27)
{
	
	tb_remove()
}
else if(keycode==190)
{
	if(!(TB_NextHTML==""))
	{
		document.onkeydown="";
		goNext()
	}
}
else if(keycode==188)
{
	if(!(TB_PrevHTML==""))
	{
		document.onkeydown="";
		goPrev()
	}
}
};
tb_position();
$("#TB_load").remove();
$("#TB_ImageOff").click(tb_remove);
$("#TB_window").css(
{
display:"block"
}
)
};
imgPreloader.src=f
}
else
{
var l=f.replace(/^[^\?]+\??/,'');
var m=tb_parseQuery(l);
TB_WIDTH=(m['width']*1)+30||630;
TB_HEIGHT=(m['height']*1)+40||440;
ajaxContentW=TB_WIDTH-30;
ajaxContentH=TB_HEIGHT-45;
if(f.indexOf('TB_iframe')!=-1)
{
urlNoQuery=f.split('TB_');
$("#TB_iframeContent").remove();
if(m['modal']!="true")
{
	var myDate = new Date();
  monthtmp=myDate.getMonth()
	if(myDate.getMonth()<10){
		monthtmp="0"+monthtmp
		}
  datetmp=myDate.getDate()
	if(myDate.getDate()<10){
		datetmp="0"+datetmp
		}		
var nd=""+myDate.getFullYear()+monthtmp+datetmp; 
if(getCookie2("lei")=="4"){
	$("#TB_window").append("<div id='TB_title'><div id='TB_ajaxWindowTitle'>"+d+"</div><div id='TB_closeAjaxWindow'><a href='#' id='TB_closeWindowButton' title='Close'>关闭</a></div></div><div style='width:448px;height:300px;'><div  class='Middle_bx_m'style='width:448px;height:300px;padding-top:40px;color:#666;'><form  action='adm_info11c.asp' method='post' name='myform' id='myform'><div  class='add_txt1'><span style='width:100px;text-align:right;padding:5px;'>消费者姓名：</span><input name='add_name' type='text' id='add_name' /></div><div  class='add_txt1'><span style='width:100px;text-align:right;padding:5px;'>手机号：</span><input type='text' name='add_tel' id='add_tel' /></div><div  class='add_txt1'><span style='width:100px;text-align:right;padding:5px;'>产品名称：</span>    <input type='text' name='add_cp' id='add_cp' /></div><div  class='add_txt1'><span style='width:100px;text-align:right;padding:5px;'>消费金额：</span><input type='text' name='add_money' id='add_money' />元</div><div  class='add_txt1'><span style='width:100px;text-align:right;padding:5px;'>消费时间：</span><input type='text' name='add_time' id='add_time' value='"+nd+"'/></div><div  class='add_txt1'><span style='width:100px;text-align:right;padding:5px;'>备注：</span><textarea name='add_note' id='add_note' cols='30' rows='3'></textarea></div><div  class='add_txt1'><div id='ttt2'  style='background-image:url(images/adm/adm_addok.jpg); width:99px; height:33px; margin-left:200px; cursor:pointer;' onclick='tst()'></div></div></form></div></div><iframe frameborder='0' hspace='0' src='"+urlNoQuery[0]+"' id='TB_iframeContent' name='TB_iframeContent"+Math.round(Math.random()*1000)+"' onload='tb_showIframe()' style='width:1px;height:1px;' ></iframe>")
	}else{
		if(getCookie2("lei")=="1"){
			urltmp="adm_info11.asp"
			}else if(getCookie2("lei")=="2"){
			urltmp="adm_info11a.asp"
			}else if(getCookie2("lei")=="3"){
			urltmp="adm_info11b.asp"
			}	
$("#TB_window").append("<div id='TB_title'><div id='TB_ajaxWindowTitle'>"+d+"</div><div id='TB_closeAjaxWindow'><a href='#' id='TB_closeWindowButton' title='Close'>关闭</a></div></div><div style='width:448px;height:300px;'><div  class='Middle_bx_m' style='width:448px;height:300px;padding-top:40px;color:#666;'><form method='post' name='myform' id='myform' action='"+urltmp+"'><div  class='add_txt1'><div class='add_txt_tt'>产品名称：</div><input name='cp' type='text' id='cp' value='' /></div><div  class='add_txt1'><div class='add_txt_tt'>推广收入系数：</div><input type='text' name='xs' id='xs' /></div><div  class='add_txt1'><div class='add_txt_tt'>产品介绍：</div><textarea name='note' id='note' cols='30' rows='5'></textarea></div><div  class='add_txt1'></div><div  class='add_txt1'><div id='ttt'  style='background-image:url(images/adm/adm_addok.jpg); width:99px; height:33px; margin-left:100px; margin-top:20px; cursor:pointer;' onclick='tst()'></div></div><input name='act' type='hidden' value='bxlog2' /></form></div></div><iframe frameborder='0' hspace='0' src='"+urlNoQuery[0]+"' id='TB_iframeContent' name='TB_iframeContent"+Math.round(Math.random()*1000)+"' onload='tb_showIframe()' style='width:1px;height:1px;' ></iframe>")
}
}
else
{
$("#TB_overlay").unbind();
$("#TB_window").append("<iframe frameborder='0' hspace='0' src='"+urlNoQuery[0]+"' id='TB_iframeContent' name='TB_iframeContent"+Math.round(Math.random()*1000)+"' onload='tb_showIframe()' style='width:"+(ajaxContentW+29)+"px;height:"+(ajaxContentH+17)+"px;'> </iframe>")
}
}
else
{
if($("#TB_window").css("display")!="block")
{
if(m['modal']!="true")
{
	$("#TB_window").append("<div id='TB_title'><div id='TB_ajaxWindowTitle'>"+d+"</div><div id='TB_closeAjaxWindow'><a href='#' id='TB_closeWindowButton'>关闭2</a></div></div><div id='TB_ajaxContent' style='width:"+ajaxContentW+"px;height:"+ajaxContentH+"px'></div>")
}
else
{
	$("#TB_overlay").unbind();
	$("#TB_window").append("<div id='TB_ajaxContent' class='TB_modal' style='width:"+ajaxContentW+"px;height:"+ajaxContentH+"px;'></div>")
}
}
else
{
$("#TB_ajaxContent")[0].style.width=ajaxContentW+"px";
$("#TB_ajaxContent")[0].style.height=ajaxContentH+"px";
$("#TB_ajaxContent")[0].scrollTop=0;
$("#TB_ajaxWindowTitle").shtml(d)
}
}
$("#TB_closeWindowButton").click(tb_remove);
$("#ttt").click(tb_remove3);
$("#ttt2").click(tb_remove3);

if(f.indexOf('TB_inline')!=-1)
{
$("#TB_ajaxContent").append($('#'+m['inlineId']).children());
$("#TB_window").unload(function()
{
	//alert("ok1")
	$('#'+m['inlineId']).append($("#TB_ajaxContent").children())
}
);
tb_position();
$("#TB_load").remove();
$("#TB_window").css(
{
	display:"block"
}
)
}
else if(f.indexOf('TB_iframe')!=-1)
{
tb_position();
if($.browser.safari)
{
	$("#TB_load").remove();
	$("#TB_window").css(
	{
		display:"block"
	}
	)
}
}
else
{
$("#TB_ajaxContent").load(f+="&random="+(new Date().getTime()),function()
{
	tb_position();
	$("#TB_load").remove();
	tb_init("#TB_ajaxContent a.thickbox");
	$("#TB_window").css(
	{
		display:"block"
	}
	)
}
)
}
}
if(!m['modal'])
{
document.onkeyup=function(e)
{
if(e==null)
{
	keycode=event.keyCode
}
else
{
	keycode=e.which
}
if(keycode==27)
{
	tb_remove()
}
}
}
}
catch(e)
{
}
}
function tb_showIframe()
{
	$("#TB_load").remove();
	$("#TB_window").css(
	{
		display:"block"
	}
	)
}
function tb_remove()
{
	//alert ("222")
	$("#TB_imageOff").unbind("click");
	$("#TB_closeWindowButton").unbind("click");
	$("#TB_window").fadeOut("fast",function()
	{
		$('#TB_window,#TB_overlay,#TB_HideSelect').trigger("unload").unbind().remove()
	}
	);
	$("#TB_load").remove();
	if(typeof document.body.style.maxHeight=="undefined")
	{
		$("body","html").css(
		{
			height:"auto",width:"auto"
		}
		);
		$("html").css("overflow","")
	}
	document.onkeydown="";
	document.onkeyup="";
	return false
}
function tb_position()
{
	$("#TB_window").css(
	{
		marginLeft:'-'+parseInt((TB_WIDTH/2),10)+'px',width:TB_WIDTH+'px'
	}
	);
	if(!(jQuery.browser.msie&&jQuery.browser.version<7))
	{
		$("#TB_window").css(
		{
			marginTop:'-'+parseInt((TB_HEIGHT/2),10)+'px'
		}
		)
	}
}
function tb_parseQuery(a)
{
	var b=
	{
	};
	if(!a)
	{
		return b
	}
	var c=a.split(/[;&]/);
	for(var i=0;i<c.length;i++)
	{
		var d=c[i].split('=');
		if(!d||d.length!=2)
		{
			continue
		}
		var e=unescape(d[0]);
		var f=unescape(d[1]);
		f=f.replace(/\+/g,' ');
		b[e]=f
	}
	return b
}
function tb_getPageSize()
{
	var a=document.documentElement;
	var w=window.innerWidth||self.innerWidth||(a&&a.clientWidth)||document.body.clientWidth;
	var h=window.innerHeight||self.innerHeight||(a&&a.clientHeight)||document.body.clientHeight;
	arrayPageSize=[w,h];
	return arrayPageSize
}
function tb_detectMacXFF()
{
	var a=navigator.userAgent.toLowerCase();
	if(a.indexOf('mac')!=-1&&a.indexOf('firefox')!=-1)
	{
		return true
	}
}

function SetCookie(name,value)//两个参数，一个是cookie的名子，一个是值
{
    var Days = 2; //此 cookie 将被保存 30 天
    var exp  = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
function getCookie2(name)//取cookies函数        
{
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
     if(arr != null) return unescape(arr[2]); return null;

}
function tst(){
	//alert ("oooook")
}
function tb_remove3(){
 
	if(getCookie2("lei")=="4"){
		if(document.getElementById("add_name").value==""){
			alert("请输入完整信息")
			SetCookie("admaddact","")
		}else if(isNaN(document.getElementById("add_money").value)!=false||document.getElementById("add_money").value=="" ){
			alert("消费金额请输数字")
			SetCookie("admaddact","")
		}else if(document.getElementById("add_tel").value=="" ){
			alert("请输入手机号")
			SetCookie("admaddact","")
		}else{
	SetCookie("add_name",document.getElementById("add_name").value)	
	SetCookie("add_tel",document.getElementById("add_tel").value)
	SetCookie("add_cp",document.getElementById("add_cp").value)	
	SetCookie("add_money",document.getElementById("add_money").value)
	SetCookie("add_time",document.getElementById("add_time").value)
	SetCookie("add_note",document.getElementById("add_note").value)
	SetCookie("admaddact","add2")
	var form = document.getElementById("myform"); 
	form.submit();	
		}
	}else{
		if(document.getElementById("cp").value==""){
			alert("请输入完整信息")
			SetCookie("admaddact","")
		}else if(isNaN(document.getElementById("xs").value)!=false){
			alert("系数请输数字")
			SetCookie("admaddact","")
		}else{
	SetCookie("cp",document.getElementById("cp").value)
	SetCookie("xs",document.getElementById("xs").value)
	SetCookie("addnote",document.getElementById("note").value)
	SetCookie("admaddact","add")
	var form = document.getElementById("myform"); 
	form.submit();
		}
	}

	//tb_remove()
}