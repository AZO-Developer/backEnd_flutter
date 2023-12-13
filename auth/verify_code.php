<?php
include("../connect.php");
include("../function.php");
$userVefiyCode=filterRequest('userVefiyCode'); 
$id=filterRequest('id'); 
getData("users","ID=$id AND userVefiyCode=$userVefiyCode");  