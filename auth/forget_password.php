<?php
include("../connect.php");
include("../function.php");
// $email=filterRequest('email'); 
// $phone=filterRequest('email'); 
$verifyCode=filterRequest('verifyCode'); 
// if(!empty($phone)){

// }else if (!empty($email)){

// }
getData("users","userVefiyCode=$verifyCode");

 