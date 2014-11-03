//获取querystring
function getQueryStringByName(name){

     var result = location.search.match(new RegExp("[\?\&]" + name+ "=([^\&]+)","i"));

     if(result == null || result.length < 1){

         return "";

     }

     return result[1];

}
//关于track_u
function settracktop(){

urltmp=window.location.href	
var trtmp=getQueryStringByName("tr")
var mytr=window.localStorage.getItem("mytr")

if(trtmp!=""){
bb=urltmp.split("tr=")
urltmp2=bb[0]
cc=bb[1].split("&")[0]
newurl=urltmp.replace("tr="+cc,"")
newurl=newurl.replace("?&","?")

	if(trtmp!=mytr){
req =new XMLHttpRequest();
     req.open("GET", "js/writesession.asp?track_u=" + trtmp, "false"); 
	 req.onreadystatechange = resavecode; 
	 req.send(null);
	 function resavecode(){
	}		
}
}else{
	newurl=urltmp
	}


if(mytr!=""){

if(newurl.indexOf("?") >= 0 )  
{  
newurl=newurl+'&tr='+mytr
 newurl=newurl.replace("?&","?")
 newurl=newurl.replace("&&","&")
  window.history.pushState({},0,newurl)
  
}  else{
 window.location.href=newurl+'?tr='+mytr	
newurl=newurl+'?tr='+mytr
 newurl=newurl.replace("?&","?")
 newurl=newurl.replace("&&","&")
 window.history.pushState({},0,newurl)
	}
}else{
	window.location.href=newurl
 newurl=newurl.replace("?&","?")
 newurl=newurl.replace("&&","&")
	 window.history.pushState({},0,newurl)
	}

}