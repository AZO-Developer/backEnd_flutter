<?php
include '../connect.php';
include '../function.php';
$idcourse = filterRequest('idcourse');
$dept = getAllData('course_departments', "course_id=$idcourse", null, false);
echo json_encode(array("data"=>$dept));
 
for ($i = 0; $i < sizeof($dept); $i++) {
    for ($i = 0; $i < sizeof($dept); $i++) {
        
    }
    // echo 
    // $video = getAllData('videos_courses', "department_id={$dept[$i]['ID']}", null, false);
    // echo json_encode(array('++++'=>sizeof($video)));
    // if(sizeof($video)!=0)
    // echo json_encode(array("dept$i"=>$video));
}

