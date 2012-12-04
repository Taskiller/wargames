<?php
function hex2bin($data){ 
	$len = strlen($data);
	$newdata = '';
	for($i=0;$i<$len;$i+=2){
		$newdata .= pack("C",hexdec(substr($data,$i,2)));
	}
	return $newdata;
}

echo base64_decode(strrev(hex2bin('3d3d516343746d4d6d6c315669563362')));

?>