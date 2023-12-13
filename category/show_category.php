<?php
include("../connect.php");
include("../function.php");
$datacategory =  getAllData("category", null, null, false);
if ($datacategory != null)
    echo json_encode(array("status" => "success", "category" => $datacategory));
else
    echo json_encode(array("status" => "failure"));
