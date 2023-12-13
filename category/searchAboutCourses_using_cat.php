<?php
include("../connect.php");
include("../function.php");
$cat_name = filterRequest("category_name");  
  
getSpacificData("SELECT courses.*,
category.cat_name_en,category.cat_name_ar
 FROM courses INNER JOIN category ON category.cat_ID = courses.cat_ID WHERE category.cat_name_en=\"$cat_name\";",);
 