<?php
include("../connect.php");
include("../function.php");

$id = filterRequest('id');
$full_name = filterRequest('full_name');
$nick_name = filterRequest('nick_name');
$birthday_date = filterRequest('birthday_date');
$email = filterRequest('email');
$phone = filterRequest('phone');
$gender = filterRequest('gender');
if (empty($gender)) {
    $gender = 0;
}
 
$data = array(
    "id" => $id,
    "full_name" => $full_name,
    "nick_name" => $nick_name,
    "birthday_date" => $birthday_date,
    "email" => $email,
    "phone" => $phone,
    "gender" => $gender,
); 
updateData("users", $data, "ID=$id"); 
