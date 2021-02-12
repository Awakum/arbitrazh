<?php

$ref = '893774';
$api_key = '51a8f6b6b800c707f1532893fb58703a'; 

$url = 'http://m1-shop.ru/send_order/';
$data = [
	'ref' => $ref,
	'api_key' => $api_key,
	'phone' => $_POST['phone'],
	'name' => $_POST['name'],
	'ip' => $_SERVER['REMOTE_ADDR'],
	'product_id' => $_GET['pid'],
	'w' => $_GET['utm_source'],
];

$numItems = count($_GET);
$i = 0;
$params = '';
foreach ($_GET as $key => $value) {
	$params .= $key . '=' . $value;
	if(++$i !== $numItems) {
		$params .= '&';
	}
}

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

$return = curl_exec($process);

curl_close($process);

if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') {
	$url = "https://";   
} else {  
	$url = "http://";   
}

$url .= $_SERVER['HTTP_HOST'];  

header('Location: /call.php?' . $params);
exit();

?>
