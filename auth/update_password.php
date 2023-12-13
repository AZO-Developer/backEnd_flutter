<?php
include("../connect.php");
include("../function.php");
$usersName=filterRequest('usersName'); 
$pass=filterRequest('pass');
$data = array(  
    "pass" => $pass, 
);
$status=updateData("users",$data,"usersName='$usersName'");
if($status>0)
getData("users","usersName='$usersName'");