<?php
include '../connect.php';
include '../function.php';
$idUser = filterRequest('idUSer');
$idCourse = filterRequest('idCourse');
try {
    insertData('enrollment_courses', array('id_course' => $idCourse, 'id_users' => $idUser));
} catch (Exception $ex) {
   echo json_encode(array('status' => 'faild', 'message' =>'check id of user and course '));
}
