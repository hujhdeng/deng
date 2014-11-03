// JavaScript Document

//获取文章左侧的分类数据

function getPortalCate(){	
	if(getItem('sidePortalCate')&&getItem('sidePortalCateStr')&&getItem('getPortalCate_time')&&(getTimestamp()-getItem('getPortalCate_time'))<86400*7){
		var sidePortalCateStr=getItem('sidePortalCate');
		var portalCateStr=getItem('sidePortalCateStr');
		$("#portalCateList").append(portalCateStr);		
		$('#sidePortalCate').append(sidePortalCateStr);
		
	}else{
		$.jsonP({		
			url:serverURL+'/appapi.php?a=getPortalCate&callback=?',	
			success:function(data){
				//$('#af23_content').html(data.test)	
				var portalCateStr='';
				var sidePortalCateStr='';
				var jsondata=data['result'];
				
				for(var i=0;i<jsondata.length;i++){
					//portalCateStr+='<li class="divider">'+jsondata[i].catname+'</li>';
					
					portalCateStr+="<li onclick=\"setItem('portal_list_catid','"+jsondata[i].catid+"')\">";	
					portalCateStr+='<a href="#article_list_panel">'+jsondata[i].catname+'</a></li>';
				 				
				}		
				
				//侧边栏
				for(var i=0;i<jsondata.length;i++){
					//portalCateStr+='<li class="divider">'+jsondata[i].catname+'</li>';
					//sidePortalCateStr+="<li onclick=\"setItem('portal_list_catid','"+jsondata[i].catid+"')\">";	
					sidePortalCateStr+="<li onclick=\"navPortalListGet('"+jsondata[i].catid+"')\">";	
					sidePortalCateStr+='<a href="#article_list_panel">'+jsondata[i].catname+'</a></li>';			
				}	
				
				$('#sidePortalCate').append(sidePortalCateStr);
						
				$("#portalCateList").append(portalCateStr);
				
				//写入缓存
				setItem('sidePortalCate',sidePortalCateStr);
				setItem('portalCateList',portalCateStr);
				setItem('getPortalCate_time',getTimestamp());  //写入缓存的时候顺便写入缓存的时间
				
					
			}
		});				
		
	}
}

//帖子分类
function getThreadCate(){
	
	if(getItem('threadCateList')&&getItem('listForumCate')&&getItem('getThreadCate_time')&&(getTimestamp()-getItem('getThreadCate_time'))<86400*7){
		
		var sideStr=getItem('threadCateList');
		var str=getItem('listForumCate');
				
		$('#threadCateList').append(sideStr);
						
		$('#listForumCate').append(str);
		
	}else{
			$.jsonP({		
			url:serverURL+'/appapi.php?a=getThreadCate&callback=?',	
			//http://www.phonegap100.com/appapi.php?a=getThreadCate&callback=?
			success:function(data){				
				
				//alert(data['result'][0]['name']);
				//获取一级分类第一个的名称
				//console.log(data['result'][0]['name']+'111');
				//获取一级分类下的子分类的第一个分类名称
				//console.log(data['result'][0]['subcate'][0]['name']+'111');
				var jsondata=data['result'];
				var str='';
				for(var i=0;i<jsondata.length;i++){
					str+='<li class="divider">'+jsondata[i].name+'</li>';
					var subcatedata=jsondata[i]['subcate'];//获取二级分类						
					for(var j=0;j<subcatedata.length;j++){
						str+="<li onclick=\"setItem('forum_list_fid','"+subcatedata[j].fid+"')\">";
						str+='<a href="#forum_list_panel"><img class="forum_list_img" src="images/forum_new.gif" />'+subcatedata[j]['name']+'</a></li>';
												
					}
					
				}		
				//side 侧边栏分类
				var sideStr='';
				for(var i=0;i<jsondata.length;i++){
					sideStr+='<li class="divider">'+jsondata[i].name+'</li>';
					var subcatedata=jsondata[i]['subcate'];//获取二级分类						
					for(var j=0;j<subcatedata.length;j++){
						sideStr+="<li onclick=\"navThreadListGet('"+subcatedata[j].fid+"')\">";
						sideStr+='<a href="#forum_list_panel">'+subcatedata[j]['name']+'</a></li>';
																	
					}
				}	
				
				$('#threadCateList').append(sideStr);
						
				$('#listForumCate').append(str);
				
				//写入缓存
				setItem('threadCateList',sideStr);
				setItem('listForumCate',str);
				setItem('getThreadCate_time',getTimestamp());  //写入缓存的时候顺便写入缓存的时间
				
			}
		});		
			
	}	
		
}
function forum_list_load(){
			
	var fid=getItem('forum_list_fid');		
	if(getItem("threadList"+fid)&&getItem("threadList"+fid+'_time')&&(getTimestamp()-getItem("threadList"+fid+'_time'))<46400){
		$("#forum_list_panel_loading").hide();
		$("#threadList").append(getItem("threadList"+fid));
		$("#threadListButton").show();	
		
	}else{
		
		$("#forum_list_panel_loading").show();
		var page=1;	
		var threadList='';	
		$.jsonP({		
			url:serverURL+'/appapi.php?a=getThreadList&fid='+fid+'&page='+page+'&callback=?',	
			success:function(data){			
					
				var jsondata=data['result'];					
				//panel				
				for(var i=0;i<jsondata.length;i++){	
					threadList+="<li class='clearfix' onclick=\"setItem('thread_content_tid','"+jsondata[i].tid+"')\">";			
					
					threadList+='<a href="forum_content.html" data-refresh-ajax="true"><img src="'+serverURL+'/uc_server/avatar.php?uid='+jsondata[i].authorid+'&amp;size=small" /><p>'+jsondata[i].subject+'</p></a></li>';									
												
				}			
				$("#forum_list_panel_loading").hide();
				$("#threadList").append(threadList);	
				
				
				setItem("threadList"+fid,threadList);
				setItem("threadList"+fid+'_time',getTimestamp());
				
							
				if(jsondata.length==20){							
					$("#threadListButton").show();
				}else{
					$("#threadListButton").hide();
				}
			}
		});	
		
		
	}
	
	//alert(fid);
}
//帖子分类侧边栏
function navThreadListGet(list_fid){
	//alert(list_fid);
	var fid=list_fid;
	var page=1;
	var threadList=''
	setItem('forum_list_fid',list_fid);
	$.jsonP({		
		url:serverURL+'/appapi.php?a=getThreadList&fid='+fid+'&page='+page+'&callback=?',	
		success:function(data){			
				
			var jsondata=data['result'];					
			//panel				
			for(var i=0;i<jsondata.length;i++){	
			//ontouchstart="this.className='CSSName'"
			//ontouchend ="this.className='CSSName'"
				threadList+="<li class='clearfix'  onclick=\"setItem('thread_content_tid','"+jsondata[i].tid+"')\">";	
				//threadList+="<li class='clearfix' ontouchstart=\"this.className = 'active clearfix'\" ontouchend=\"this.className = 'clearfix'\" onclick=\"setItem('thread_content_tid','"+jsondata[i].tid+"')\">";
				threadList+='<a href="forum_content.html" data-refresh-ajax="true"><img src="images/user.gif" /><p>'+jsondata[i].subject+'</p></a></li>'									
			}			
			
			$("#threadList").html(threadList);
		}
	});	
	
}
//文章分类侧边栏
function navPortalListGet(catid){	
	var page=1;
	var portalList=''
	
	
	setItem('portal_list_catid',catid);	//用于加载更多
	//alert(fid);	
	
	//http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=2
	$.jsonP({		
		url:serverURL+'/appapi.php?a=getPortalList&catid='+catid+'&page='+page+'&callback=?',	
		success:function(data){			
				
			var jsondata=data['result'];					
			//panel				
			for(var i=0;i<jsondata.length;i++){	
				portalList+="<li class='clearfix' onclick=\"setItem('portal_content_aid','"+jsondata[i].aid+"')\">";					
				portalList+='<a href="portal_content.html" data-refresh-ajax="true"><img src="images/user.gif" /><p>'+jsondata[i].title+'</p></a></li>';								
			}	
				
			$("#articleList").html(portalList);
		}
	});		
	
}

function forum_list_uload(){	
	$("#threadList").text('');
	threadPage=2;  //清空更多
}



function portal_list_load(){
	var catid=getItem('portal_list_catid');	
	//alert(fid);
	var page=1;	
	var portalList='';
	//http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=2
	$.jsonP({		
		url:serverURL+'/appapi.php?a=getPortalList&catid='+catid+'&page='+page+'&callback=?',	
		success:function(data){			
				
			var jsondata=data['result'];					
			//panel				
			for(var i=0;i<jsondata.length;i++){	
				portalList+="<li class='clearfix' onclick=\"setItem('portal_content_aid','"+jsondata[i].aid+"')\">";					
				portalList+='<a href="portal_content.html" data-refresh-ajax="true"><img src="images/user.gif" /><p>'+jsondata[i].title+'</p></a></li>'									
			}	
			//alert(portalList);
			//alert(threadList);
			$("#article_list_panel_loading").hide(); //加载的图片
			
			//加载更多
			if(jsondata.length==20){							
				$("#portalListButton").show();
			}else{
				$("#portalListButton").hide();
			}
			
			$("#articleList").append(portalList);
		}
	});	
		
}

function portal_list_uload(){	
	$("#articleList").text('');
	portalPage='';
}
//threadlist加载更多
var threadPage=2;
function threadListmore(){
		var fid=getItem('forum_list_fid');				
		var threadList='';
		$.jsonP({		
			url:serverURL+'/appapi.php?a=getThreadList&fid='+fid+'&page='+threadPage+'&callback=?',	
			success:function(data){			
					
				var jsondata=data['result'];					
				//panel				
				for(var i=0;i<jsondata.length;i++){	
					threadList+="<li class='clearfix' onclick=\"setItem('thread_content_tid','"+jsondata[i].tid+"')\">";	
									
					threadList+='<a href="forum_content.html" data-refresh-ajax="true"><img src="'+serverURL+'/uc_server/avatar.php?uid='+jsondata[i].authorid+'&amp;size=small" /><p>'+jsondata[i].subject+threadPage+'</p></a></li>';
					
					
					
														
				}		
				if(jsondata.length==20){							
					$("#threadListButton").show();
				}else{
					$("#threadListButton").hide();
				}	
				
				$("#threadList").append(threadList);
				threadPage++;	
			}
		});	

}
var portalPage=2;
function portalListmore(){
	var catid=getItem('portal_list_catid');		
	
	var portalList='';
	//http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=2
	$.jsonP({		
		url:serverURL+'/appapi.php?a=getPortalList&catid='+catid+'&page='+portalPage+'&callback=?',	
		success:function(data){			
				
			var jsondata=data['result'];					
			//panel				
			for(var i=0;i<jsondata.length;i++){	
				portalList+="<li class='clearfix' onclick=\"setItem('portal_content_aid','"+jsondata[i].aid+"')\">";					
				portalList+='<a href="portal_content.html" data-refresh-ajax="true"><img src="images/user.gif" /><p>'+jsondata[i].title+'</p></a></li>';									
			}	
			if(jsondata.length==20){							
				$("#portalListButton").show();
			}else{
				$("#portalListButton").hide();
			}		
			
			$("#articleList").append(portalList);
			portalPage++;
		}
	});	

}


