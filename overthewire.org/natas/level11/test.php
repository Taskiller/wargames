<?php

function xor_encrypt($in) {
    $key = 'qw8J';
    $text = $in;
    $outText = '';

    // Iterate through each character
    for($i=0;$i<strlen($text);$i++) {
    $outText .= $text[$i] ^ $key[$i % strlen($key)];
    }

    return $outText;
}

function xor_decrypt($in,$out) {
	$outText = '';
	for($i=0;$i<strlen($in);$i++) {
    	$outText .= $in[$i] ^ $out[$i];
    }
    return $outText;
}

//from bgcolor='#ffffff'
$output = 'ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxFeaAw=';
$out = base64_decode($output);
$data = array( "showpassword"=>"no", "bgcolor"=>"#ffffff");
$json = json_encode($data);
echo 'decode(COOKIE)= json ^ key ='.$out."\n";
echo 'json='.$json."\n";
echo 'json ^ (json ^ key) = key = '.xor_decrypt($json,$out)."\n";

$data = array( "showpassword"=>"yes", "bgcolor"=>"#ffffff");
$cookie = base64_encode(xor_encrypt(json_encode($data)));
echo 'Cookie = '.$cookie."\n";

