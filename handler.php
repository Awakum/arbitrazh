<?php

$ref = '893774'; // id вебмастера
$key = '51a8f6b6b800c707f1532893fb58703a'; // ключ api вебмастера
$prod_id = '8113'; // id товара

$url = 'http://m1-shop.ru/send_order/';
$data = [
	'ref' => $ref,
	'api_key' => $key,
	'product_id' => $prod_id,
	'phone' => $_POST['phone'],
	'name' => $_POST['name'],
	'ip' => $_SERVER['REMOTE_ADDR'],
	'w' => $_GET['utm_source'],
	/* 's' => 'test_s', */
	/* 't' => 'test_t', */
	/* 'p' => 'test_p', */
	/* 'm' => 'test_m' */
];

$numItems = count($_GET);
$i = 0;
$uri = '';
foreach ($_GET as $key => $value) {
	$uri .= $key . '=' . $value; 
	if(++$i !== $numItems) {
		$uri .= '&';
	}
}
/* var_dump($_GET); */
/* echo $uri; */
/* return false; */

$process = curl_init();
curl_setopt($process, CURLOPT_HEADER, 0);
curl_setopt($process, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0)");
curl_setopt($process, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($process, CURLOPT_FOLLOWLOCATION, 0);
curl_setopt($process, CURLOPT_TIMEOUT, 20);
curl_setopt($process, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($process, CURLOPT_POST, true);
curl_setopt($process, CURLOPT_POSTFIELDS, $data);
curl_setopt($process, CURLOPT_URL, $url);

echo $return = curl_exec($process);

curl_close($process);

if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on')   
         $url = "https://";   
    else  
         $url = "http://";   

$url .= $_SERVER['HTTP_HOST'];  

header('Location: ' . $url . '/call.php?' . $uri);
exit;

?>
