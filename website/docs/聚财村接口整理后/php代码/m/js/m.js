function showwin(tmp){
		document.getElementById("pop_window").style.display="block"
	}
function closewin(tmp){
		document.getElementById("pop_window").style.display="none"
	}
//��ȡquerystring
function getQueryStringByName(name){

     var result = location.search.match(new RegExp("[\?\&]" + name+ "=([^\&]+)","i"));

     if(result == null || result.length < 1){

         return "";

     }

     return result[1];

}
//����track_u
function settracktop(){
urltmp=window.location.href	
//�Ƽ��˺�
var trtmp=getQueryStringByName("tr")
//���˺�
var mytr=window.localStorage.getItem("mytr")

if(trtmp!=""){
bb=urltmp.split("tr=")
urltmp2=bb[0]
cc=bb[1].split("&")[0]
newurl=urltmp.replace("tr="+cc,"")
newurl=newurl.replace("?&","?")
//�µ�ַ�滻
	if(trtmp!=mytr){
req =new XMLHttpRequest();
     req.open("GET", "js/writesession.asp?track_u=" + trtmp, "false"); 
	 req.onreadystatechange = resavecode; 
	 req.send(null);
	 function resavecode(){
		 if (req.readyState == 4) { }
	}		
}
}else{
	newurl=urltmp
	}


if(mytr!=""&&mytr!=null){

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
}
//else{
//	window.location.href=newurl
// newurl=newurl.replace("?&","?")
// newurl=newurl.replace("&&","&")
//	 window.history.pushState({},0,newurl)
//	}

}