<?
/*--------------------------------
����:		PHP HTTP�ӿ� ���Ͷ���
�޸�����:	2013-05-08
˵��:		http://m.5c.com.cn/api/send/?username=�û���&password=����&mobile=�ֻ���&content=����&apikey=apikey
״̬:
	���ͳɹ�	success:msgid
	����ʧ��	error:msgid

ע�⣬��curl֧�֡�

����ֵ											˵��
success:msgid								�ύ�ɹ�������״̬���4.1
error:msgid								�ύʧ��
error:Missing username						�û���Ϊ��
error:Missing password						����Ϊ��
error:Missing apikey						APIKEYΪ��
error:Missing recipient					�ֻ�����Ϊ��
error:Missing message content				��������Ϊ��
error:Account is blocked					�ʺű�����
error:Unrecognized encoding				����δ��ʶ��
error:APIKEY or password error				APIKEY ���������
error:Unauthorized IP address				δ��Ȩ IP ��ַ
error:Account balance is insufficient		����
error:Black keywords is:������				���δ�
--------------------------------*/
$yzm= rand(0,9).rand(0,9).rand(0,9).rand(0,9);
$mobile=$_GET["phone"];
$u_table='yzm';
$regtime=date('Y-m-d H:i:s',time());
//$tmp=(explode(' ',$date));
//$regtime=$tmp[0];

if($mobile!=''){
	$con = mysql_connect("localhost","root","sanrenxing");
if (!$con){die('Could not connect: ' . mysql_error());}
mysql_select_db("jcc", $con);
mysql_query("set names 'utf8'");
 $rs=mysql_query("select * from $u_table where phone='$phone' ",$con);
  $myrow = mysql_fetch_row($rs);
 if(empty($myrow)){
 $sqlstr="INSERT INTO $u_table (phone,yzm,regtime) VALUES ('".$phone."','".$yzm."','".$regtime."') ";//д��
 //echo $sqlstr;
mysql_query($sqlstr);
 }else{
$sql="update $u_table set yzm='".$yzm."',regtime='".$regtime."' where phone='$phone'";
//echo $sql;
mysql_query($sql);	 
 }
	
	
$username = 'jucaitianxia';		//�û��˺�
$password = '94762623';	//����
$apikey = '3d0b632d15fb4f5480041d1d334f6525';	//����
//$mobile	 = '18908007121';	//���ֻ���
$content = '���Ķ�����֤����:'.$yzm;		//����
//��ʱ����
 $result = sendSMS($username,$password,$mobile,$content,$apikey);
//echo $result;
if(strripos($result,"success")>=0){
	$arr = array ('apicode'=>10000);
	echo urldecode(json_encode($arr));
	}else{
	$arr = array ('apicode'=>10002,'message'=>urlencode('����ʧ�ܣ�'));
	echo urldecode(json_encode($arr));	
		}
}else{
$arr = array ('apicode'=>10001,'message'=>urlencode('�绰�գ�'));
	echo urldecode(json_encode($arr));	
	}

function sendSMS($username,$password,$mobile,$content,$apikey)
{
	$url = 'http://m.5c.com.cn/api/send/?';
	$data = array
		(
		'username'=>$username,					//�û��˺�
		'password'=>$password,				//����
		'mobile'=>$mobile,					//����
		'content'=>$content,				//����
		'apikey'=>$apikey,				    //apikey
		);
	$result= curlSMS($url,$data);			//POST��ʽ�ύ
	return $result;
}

function curlSMS($url,$post_fields=array()){
        //$ch = curl_init();
		$ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,$url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);
		curl_setopt($ch, CURLOPT_TIMEOUT, 3600); //60�� 
        curl_setopt($ch, CURLOPT_HEADER,1);
        curl_setopt($ch, CURLOPT_REFERER,'http://bbs.cd360.com');
        curl_setopt($ch,CURLOPT_POST,1);
        curl_setopt($ch, CURLOPT_POSTFIELDS,$post_fields);
        $data = curl_exec($ch);
        curl_close($ch);
        $res = explode("\r\n\r\n",$data);
        return $res[2]; 
}

?>
