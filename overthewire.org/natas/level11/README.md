Challenge page is <a href="http://www.overthewire.org/wargames/natas/natas11.shtml">HERE</a>.

<<CHALLENGE_CONTENT
Level 11

Username: natas11
URL:      http://natas11.natas.labs.overthewire.org

CHALLENGE_CONTENT

Password for this level (from last level)
	- username: natas11
	- password: SUIRtXqbB3tWzTOgTAX2t8UfMbYKrgp6

Comment by me:
	- This page set cookie as 'data=ClVLIh4ASCsCBE8lAxMacFMZV2hdVVotEhhUJQNVAmhSEV4sFxFeaAw%3D'

	where "ClVLIh4ASCs..." is 
		saved by: setcookie("data", base64_encode(xor_encrypt(json_encode($d))));
		loaded by: json_decode(xor_encrypt(base64_decode($_COOKIE["data"])), true);

	- Whereas 'xor_encrypt' is defined as follow
		function xor_encrypt($in) {
		    $key = '<censored>';
		    $text = $in;
		    $outText = '';

		    // Iterate through each character
		    for($i=0;$i<strlen($text);$i++) {
			    $outText .= $text[$i] ^ $key[$i % strlen($key)];
		    }

		    return $outText;
		}

	- initialy the cookie should store 
		array("showpassword"=>"no", "bgcolor"=>"#ffffff")

	- the initial cookie(after base64_decode) is just as KEY ^ JSON, whereas '^' means XOR operation
	- if we can produce JSON from initial data, we can reverse it back to get KEY
	- From theory that, (A ^ B) ^ B = A ^ (B ^ B) = A,
		We have (KEY^JSON) then if we can find JSON, we can do (KEY^JSON)^JSON = KEY
