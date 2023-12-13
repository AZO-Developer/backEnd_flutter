<?php
include("../connect.php");
include("../function.php");
getAllData("all_popular_courses Order by students_count Desc limit 6 ");