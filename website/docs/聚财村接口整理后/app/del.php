<?php

        $ch = curl_init();

        // 2. 设置请求选项, 包括具体的url
        curl_setopt($ch, CURLOPT_URL, "http://app.cd360.com/jccapp/get_joinsdanlist2.php?page=1&id=43");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);

        // 3. 执行一个cURL会话并且获取相关回复
        $response = curl_exec($ch);
      echo $response;
        // 4. 释放cURL句柄,关闭一个cURL会话
        curl_close($ch);	
  
   ?>