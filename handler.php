<?php
define('API_KEY', '11285cb0c12b26cca24814fe5a7922e6');
define('REF_ID', '109727');
define('URL', 'http://m1-shop.ru/send_order/');

$data = [
	'ref' => REF_ID,
	'api_key' => API_KEY,
	'phone' => $_POST['phone'],
	'name' => $_POST['name'],
	'ip' => $_SERVER['REMOTE_ADDR'],
	'product_id' => $_POST['pid'],
	'w' => $_GET['utm_source'],
	's' => $_POST['subid'],
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
// curl_setopt($process, CURLOPT_HEADER, 0);
// curl_setopt($process, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0)");
// curl_setopt($process, CURLOPT_RETURNTRANSFER, 1);
// curl_setopt($process, CURLOPT_FOLLOWLOCATION, 0);
// curl_setopt($process, CURLOPT_TIMEOUT, 20);
// curl_setopt($process, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($process, CURLOPT_POST, true);
curl_setopt($process, CURLOPT_POSTFIELDS, $data);
curl_setopt($process, CURLOPT_URL, URL);

$return = curl_exec($process);

curl_close($process);
// header('Location: ' . pathinfo($_SERVER['PHP_SELF'], PATHINFO_DIRNAME) . '/call.php?' . $params);
header('Location: /call.php?' . $params);
exit();

?>
