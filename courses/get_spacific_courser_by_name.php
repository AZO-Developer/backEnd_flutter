<?php
include("../connect.php");
include("../function.php");
$courses_name=filterRequest("courses_name");    
$query="SELECT * from spacific_course where  course_name='$courses_name'";
$courses_name=getSpacificData($query);