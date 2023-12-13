<?php
include("../connect.php");
include("../function.php"); 

$userName = filterRequest('usersName');
$password = filterRequest('pass'); 
$verfiyCode = rand(10000, 99999);
$stmt = $con->prepare('SELECT * FROM users WHERE usersName=? ');
$stmt->execute(array(
    $userName 
));
$count = $stmt->rowCount();
if ($count > 0) {
    printFailure("user  excite");
} else {
    $data = array(

        "usersName" => $userName,
        "pass" => $password, 
        "userVefiyCode" => $verfiyCode, 
    );

    // sendEmail($email, 'Verify Code Ecommerce ', "Verfiy Code $verfiyCode");
    insertData('users', $data,false);
    $id= $con->lastInsertId();
    echo json_encode(array('status'=> 'success',"data"=>array(
        "id"=> $id,
        "usersName" => $userName,
        "pass" => $password, 
    )));
}
