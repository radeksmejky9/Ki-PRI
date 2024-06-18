<?php
$apiUrl = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd';

$ch = curl_init();

curl_setopt($ch, CURLOPT_URL, $apiUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0');

$data = curl_exec($ch);

if ($data === FALSE) {
    die('Nepodařilo se připojit k API.' . curl_error($ch));
}

curl_close($ch);

$cryptos = json_decode($data, true);
if ($cryptos === NULL) {
    die('Nepodařilo se dekódovat JSON.');
}



foreach ($cryptos as $crypto) {
    $xml = new SimpleXMLElement('<cryptocurrency/>');
    $xml->addChild('id', $crypto['id']);
    $xml->addChild('name', $crypto['name']);
    $xml->addChild('symbol', $crypto['symbol']);
    $xml->addChild('image', $crypto['image']);
    $currentPrice = $crypto['current_price'];
    if (strpos($currentPrice, 'E') !== false || strpos($currentPrice, 'e') !== false) {
        $currentPrice = sprintf('%f', $currentPrice);
    }
    $xml->addChild('price_usd', $currentPrice);
    $xml->asXML("data/{$crypto['symbol']}.xml");
}
