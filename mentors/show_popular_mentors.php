<?php
include("../connect.php");
include("../function.php");
$popular_menotrs = getAllData("popular_mentors Order by rating_count Desc limit 6 ");
