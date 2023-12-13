<?php
define("MB", 1048576);

function filterRequest($requestname)
{
    return  htmlspecialchars_decode(strip_tags($_POST[$requestname]));
}

function getAllData($table, $where = null, $values = null, $json = true)
{
    try {
        global $con;
        $data = array();

        if ($where == null) {
            $qurey = "SELECT  * FROM $table ";
        } else {
            $qurey = "SELECT  * FROM $table WHERE   $where ";
        }
        $stmt = $con->prepare($qurey);
        $stmt->execute($values);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $count  = $stmt->rowCount();
        if ($json == true) {
            if ($count > 0) {
                echo json_encode(array("status" => "success", "data" => $data));
            } else {
                echo json_encode(array("status" => "failure"));
            }
            return $count;
        } else {
            if ($count > 0) {
                return $data;
            } else {
                return  json_encode(array("status" => "failure"));
            }
        }
    } catch (Exception $ex) {
        return   json_encode(array("status" => "failure", "error" => $ex));
    }
}
function getSpacificData($qurey, $value = null,  $json = true)
{
    try {
        global $con;
        $data = array();

        $stmt = $con->prepare($qurey);
        if ($value == null)
            $stmt->execute();
        else 
        $stmt->execute($value);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $count  = $stmt->rowCount();
        if ($json == true) {
            if ($count > 0) {
                echo json_encode(array("status" => "success", "data" => $data));
            } else {
                echo json_encode(array("status" => "failure"));
            }
            return $count;
        } else {
            if ($count > 0) {
                return $data;
            } else {
                return  json_encode(array("status" => "failure"));
            }
        }
    } catch (Exception $ex) {
        return   json_encode(array("status" => "failure", "error" => $ex));
    }
}
function getMaxData($table, $order_by, $limit, $json = true)

{
    global $con;
    $data = array();


    // $qurey = "SELECT  * FROM $table WHERE   $where ";
    $qurey = "SELECT * FROM $table ORDER BY $order_by DESC LIMIT $limit";

    $stmt = $con->prepare($qurey);
    $stmt->execute();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success", "data" => $data));
        } else {
            echo json_encode(array("status" => "failure"));
        }
        return $count;
    } else {
        if ($count > 0) {
            return $data;
        } else {
            return  json_encode(array("status" => "failure"));
        }
    }
}
function sendGCM($title, $message, $topic, $pageid, $pagename)
{


    $url = 'https://fcm.googleapis.com/fcm/send';

    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'content_available' => true,

        'notification' => array(
            "body" =>  $message,
            "title" =>  $title,
            "click_action" => "FLUTTER_NOTIFICATION_CLICK",
            "sound" => "default"

        ),
        'data' => array(
            "pageid" => $pageid,
            "pagename" => $pagename
        )

    );


    $fields = json_encode($fields);
    $headers = array(
        'Authorization: key=' . "AAAAMWo60lc:APA91bFt5CXvw4PM0hEnhsPiJ3hmRo3Rc3RJTPPBTTNaTK2TgS_Fel9YhFQbxw_z5bACDE9wpt3LvD2fjyyLvPi4OKHyRW_D4MauRNgrkEPFY0uAb1nUscXVmiHpG91BIbg-6WOkJlK_",
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);
    return $result;
    curl_close($ch);
}
function getData($table, $where = null, $values = null, $json = true)
{
    try {
        global $con;
        $data = array();
        $stmt = $con->prepare("SELECT  * FROM $table WHERE  $where ");
        $stmt->execute($values);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        $count  = $stmt->rowCount();
        if ($json == true) {
            if ($count > 0) {
                echo json_encode(array("status" => "success", "data" => $data));
            } else {
                echo json_encode(array("status" => "failure"));
            }
        } else {
            return $count;
        }
    } catch (Exception $ex) {
        echo json_encode(array("status" => "error", "message" => $ex));
    }
}

function insertData($table, $data, $json = true)
{
    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";

    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}


function updateData($table, $data, $where, $json = true)
{
    try {
        global $con;
        $cols = array();
        $vals = array();

        foreach ($data as $key => $val) {
            $vals[] = "$val";
            $cols[] = "`$key` =  ? ";
        }
        $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

        $stmt = $con->prepare($sql);
        $stmt->execute($vals);
        $count = $stmt->rowCount();
        if ($json == true) {
            if ($count > 0) {
                echo json_encode(array("status" => "success"));
            } else {
                echo json_encode(array("status" => "failure"));
            }
        }
        return $count;
    } catch (Exception $ex) {
        echo json_encode(array("status" => "error", "message" => $ex));
        return 0;
    }
}

function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => "success"));
        } else {
            echo json_encode(array("status" => "failure"));
        }
    }
    return $count;
}

function imageUpload($imageRequest)
{
    global $msgError;
    $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
    $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
    $imagesize  = $_FILES[$imageRequest]['size'];
    $allowExt   = array("jpg", "png", "gif", "mp3", "pdf");
    $strToArray = explode(".", $imagename);
    $ext        = end($strToArray);
    $ext        = strtolower($ext);

    if (!empty($imagename) && !in_array($ext, $allowExt)) {
        $msgError = "EXT";
    }
    if ($imagesize > 2 * MB) {
        $msgError = "size";
    }
    if (empty($msgError)) {
        move_uploaded_file($imagetmp,  "../upload/" . $imagename);
        return $imagename;
    } else {
        return "fail";
    }
}



function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {
        unlink($dir . "/" . $imagename);
    }
}

function  printFailure($message = 'failure')
{
    echo       json_encode(array('status' => $message));
}
function  printSucces($message = 'success')
{
    echo       json_encode(array('status' => $message));
}
function result($count)
{
    if ($count > 0) {
        printSucces();
    } else {
        printFailure();
    }
}
function sendEmail($to, $title, $body)
{

    $header = 'From:zasmaa017@gmail.com' . "\r\n" .
        'Reply-To:zasmaa017@gmail.com' . "\r\n" .
        'X-Mailer: PHP/' . phpversion();

    // $header = "from: ahmed122727727@gmail.com" . "\n" . "CC: ahmed122727727@gmail.com";
    $result =   mail($to, $title, $body, $header);

    if ($result) {
        // echo
        // json_encode(array('status' => 'Email sent successfully.'));
    } else {
        // echo
        // json_encode(array('status' => 'faild  sent Email .'));
    }
}
function insertNotify($title, $body, $usersID, $topic, $pageid, $pagename)
{
    global $con;
    $stmt = $con->prepare("INSERT INTO `notification`(   `notificationTitle`, `notificationBody`, `notificationUserID`) VALUES (  ?,?,?)");
    $stmt->execute(array($title, $body, $usersID));
    sendGCM($title, $body, $topic, $pageid, $pagename);
    return  $stmt->rowCount();
}
