<?php
include("../connect.php");
include("../function.php");
$userName=filterRequest('email'); 
$pass=filterRequest('pass');
getData("users","usersName=? AND pass=?",array($userName,$pass));
