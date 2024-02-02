<?php
include '../connect.php';
include '../function.php';
$idcourse = filterRequest('idcourse');
$dept = getAllData('course_departments', "course_id=$idcourse", null, false);
// echo json_encode(array("data"=>$dept));
$video1=[];
for ($i = 0; $i < sizeof($dept); $i++) {
    
    // $video1["department_id={$dept[$i]['ID']}"]=
    // array_merge( array("dept"=>array("desc"=>$dept[$i],
    // "video"=> getAllData('videos_courses', "department_id={$dept[$i]['ID']}", null, false))));

    
    $video1[]=
    array_merge( array("desc_dept"=>$dept[$i],
    "video"=> getAllData('videos_courses', "department_id={$dept[$i]['ID']}", null, false)));
}
echo json_encode ($video1);

 