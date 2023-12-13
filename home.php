<?php
include("connect.php");
include("function.php");
$dataOffers =  getAllData("offers", null, null, false);
$datacategory =  getAllData("category", null, null, false);
// SELECT * FROM courses ORDER BY students_count DESC LIMIT 6
$popular_course = getAllData("all_popular_courses", null, null, false);
$popular_menotrs = getAllData("popular_mentors", null, null, false);

echo json_encode(
    array(
        "status" => "success",
        "Home_data" => array(
            "offers" => $dataOffers,
            "cateogry" => $datacategory,
            "popular_course" => $popular_course,
            "popular_menotrs" => $popular_menotrs,
        )
    )
);
/*
 *  http://10.0.2.2/myproject/upload/category/       
 *  http://10.0.2.2/myproject/upload/courses/       
 *  http://10.0.2.2/myproject/upload/courses/    
*/   
