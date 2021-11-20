<?php 
error_reporting(E_COMPILE_ERROR | E_ERROR | E_CORE_ERROR);

require_once('roots.php');
// require ($root_path . 'include/inc_environment_global.php');
require 'conn.php';
// require ($root_path . 'include/inc_date_format_functions.php');
$conn=$conn = new mysqli($HostName, $HostUser, $HostPass, $DatabaseName);

$dob = $_REQUEST["dob"];

if(!$encoder) $encoder=$_COOKIE[$local_user.$sid];

$limit = $_REQUEST['limit'];
$start = $_REQUEST['start'];
$formStatus = $_REQUEST['formStatus'];
$searchParam = $_REQUEST['searchParam'];

$startDate=$_REQUEST['startDate'];
$endDate=$_REQUEST['endDate'];

$username= ($_REQUEST['username']) ? ($_REQUEST['username']) :$_POST['username'];
$password= ($_REQUEST['password']) ? ($_REQUEST['password']) :$_POST['password'];
$userGroup= ($_REQUEST['userGroup']) ? ($_REQUEST['userGroup']) :$_POST['userGroup'];
$task = ($_REQUEST['task']) ? ($_REQUEST['task']) : $_POST['task'];

switch ($task) {
    case "getDOB":
        getDOB();
        break;
    case "getAge":
        getAge($dob);
        break;
    case "login":
        login($username,$password,$userGroup);
        break;
    case "registerDefaulter":
        registerDefaulter();
        break;
    case "updateDefaulter":
        updateDefaulter();
        break;
    case "getDefaulter":
        getDefaulter();
        break;
    case "getDefaulterList":
        getDefaulterList();
        break;
    case "getCounties":
        getCounties();
        break;
    case "registerchw":
        registerchw();
        break;
    default:
        echo "{failure:true}";
        break;
}//end switch

function registerchw(){
    global $conn;
    $debug=false;

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
        
    $names=$_POST["names"];
    $phone=new DateTime($_POST["phone"]);
    $facility=new DateTime($_POST["facility"]);
    $county=$_POST["county"];
    $subcounty=$_POST["subcounty"];
    $mflcode=$_POST["mflcode"];
    $venue=$_POST["venue"];
    $gathering=$_POST["gathering"];
    $menreached=$_POST["menreached"];
    $womenreached=$_POST["womenreached"];
    $disabledreached=$_POST["disabledreached"];
    $dateRegistered=$_POST["dateRegistered"];
    $inputDate=date('Y-m-d H:i:s');

    $sql="INSERT INTO `mpower`.`health_workers` (
        `Names`,`Phone`,`Facility`,`County`,`Sub-County`,`MFLCode`,`Venue`,
        `Gathering`,`MenReached`,`WomenReached`,`DisabledReached`,`InputDate`
      )
      VALUES
        ('$names','$phone','$facility','$county','$subcounty','$mflcode',
            '$venue','$gathering','$menreached','$womenreached','$disabledreached',
            ,'$inputDate')";

    if($debug) echo $sql;

    if( $conn->query($sql)){
        $_SESSION['sess_login_chvName']= $names;
        
        echo json_encode("Success");
    }else{
        echo json_encode("Error");
    }   
    $conn->close();    
}

function getCounties(){
    global $conn;
    $debug=false;

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
        
    $sql="select * from counties order by ID ASC";
    if($debug) echo $sql;

    $request=$conn->query($sql);
    if($request->num_rows>0){
        while($row[]=$request->Fetch_Assoc()){
            $item=$row;
            $json=json_encode($item,JSON_NUMERIC_CHECK);
        }
    }else{
        echo "No Data Found";
    }
    echo $json;
    $conn->close();

}

function updateDefaulter(){
    global $conn;
    $debug=false;

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
        
    $contacted=$_POST["contacted"];
    $dcontacted=new DateTime($_POST["dateContacted"]);
    $dateContacted=$dcontacted->format('Y-m-d');
    $reasonNotContacted=$_POST["reasonNotContacted"];
    $isDefaulter=$_POST["isDefaulter"];
    $serviceLocation=$_POST["serviceLocation"];
    $servDate=new DateTime($_POST["serviceDate"]);
    $serviceDate=$servDate->format('Y-m-d');
    $chvName=$_POST["chvName"];
    $referTo=$_POST["referTo"];

    $json = file_get_contents('php://input');
    // Decoding the received JSON.
    $obj = json_decode($json,true);
    // Populate ID from JSON $obj array and store into $ID variable.
    $id = $_POST['ID'];

    $sql="UPDATE  `mpower`.`defaulters`
        SET `contacted` = '$contacted', `reasonNotContacted` = '$reasonNotContacted',
    `isDefaulter` = '$isDefaulter', `serviceLocation` = '$serviceLocation',`serviceDate` = '$serviceDate',
    `referTo` = '$referTo', `dateContacted` = '$dateContacted' where ID='$id'";

    if($debug) echo $sql;

    if( $conn->query($sql)){
        echo json_encode("Success");
    }else{
        echo json_encode("Error");
    }   
    $conn->close();    
}

function getDefaulter(){
    global $conn;
    $debug=false;

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

     // Getting the received ID in JSON Format into $json variable.
    $json = file_get_contents('php://input');
    
    // Decoding the received JSON.
    $obj = json_decode($json,true);
    
    // Populate ID from JSON $obj array and store into $ID variable.
    $id = $obj['ID'];

    $sql="select * from defaulters where id='$id'";
    if($debug) echo $sql;

    $request=$conn->query($sql);
    if($request->num_rows>0){
        while($row[]=$request->fetch_assoc()){
            $item=$row;
            $json=json_encode($item,JSON_NUMERIC_CHECK);
        }
    }else{
        echo "No Data Found";
    }
    echo $json;
    $conn->close();
}


function getDefaulterList(){
    global $conn;
    $debug=false;

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
        
    $sql="select * from defaulters order by ID desc";
    if($debug) echo $sql;

    $request=$conn->query($sql);
    if($request->num_rows>0){
        while($row[]=$request->Fetch_Assoc()){
            $item=$row;
            $json=json_encode($item,JSON_NUMERIC_CHECK);
        }
    }else{
        echo "No Data Found";
    }
    echo $json;
    $conn->close();

}

function registerDefaulter(){
    global $conn;
    $debug=false;

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
        
    $names=$_POST["names"];
    $dateBirth=new DateTime($_POST["dob"]);
    $dob=$dateBirth->format('Y-m-d');
    $sex=$_POST["sex"];
    $serviceDefaulted=$_POST["serviceDefaulted"];
    $village=$_POST["village"];
    $guardian=$_POST["guardian"];
    $contacts=$_POST["contact s"];
    $chvName=$_POST["chvName"];
    $dateRegistered=$_POST["dateRegistered"];
    $dateRegistered=date('Y-m-d H:i:s');

    $sql="INSERT INTO `mpower`.`defaulters` (
        `names`,`dob`,`sex`,`serviceDefaulted`,`village`,`guardian`,`contacts`,`chvName`,`dateRegistered`)
      VALUES
        ('$names','$dob','$sex','$serviceDefaulted','$village','$guardian',
            '$contacts','$chvName','$dateRegistered')";

    if($debug) echo $sql;

    if( $conn->query($sql)){
        $_SESSION['sess_login_chvName']= $chvName;
        
        echo json_encode("Success");
    }else{
        echo json_encode("Error");
    }   
    $conn->close();    
}

function login($username,$password,$userGroup){
    global $conn;
    $debug=false;

    $pass=md5($password);
    $sql="SELECT * FROM users where `username`='$username' and password='$pass' and userGroup='$userGroup'";
    if($debug) echo $sql;

    $request=$conn->query($sql);
    $row=$request->fetch_row();
    if($row[0]<>''){
        $_SESSION['sess_login_userid']=$row['username'];
        $_SESSION['sess_login_username']=$row['username'];
        
       // echo '{success:true,"username":"'.$row['username'].'","userGroup":"'.$row['userGroup'].'"}';
      echo json_encode("Success");

   }else{
        echo json_encode("Error");
    }
    $conn->close(); 
}

function getUserGroups(){
    global $db;
    $debug=false;

    $sql="SELECT ID,`group` FROM user_groups";
   
    echo "[";
    $request=$db->Execute($sql);
    $total=$request->RecordCount();
    $counter=0;
    while($row=$request->FetchRow()){
        echo '{"ID":"' .  $row['ID'] . '","Group":"' . $row['group'] . '"}';

        $counter++;
        if ($counter <> $total) {
            echo ",";
        }
    }
    echo ']';
}


function dateDiff($dformat, $endDate, $beginDate) {
    $split_endDate = explode(" ",$endDate );
    $split_beginDate = explode(" ",$beginDate );

    $date_parts1 = explode($dformat, $split_beginDate[0]);
    $date_parts2 = explode($dformat, $split_endDate[0]);

    $start_date = gregoriantojd($date_parts1[1], $date_parts1[2], $date_parts1[0]);

    $end_date = gregoriantojd($date_parts2[1], $date_parts2[2], $date_parts2[0]);

    return $days = $end_date - $start_date;
}

//end of function

function yearcalculate($days) {
    $year = floor($days / 365);
    $monthday = $days % 365;
    $month = round($monthday / 30);

    if ($year == 0) {
        if ($month == 1) {
            $str = $month;
        } else if ($month == 0) {
            $str = "No experience";
        } else {
            $str = $month;
        }
    } //end of main if statement
    else {
        if ($year == 1) {

            if ($month == 1) {
                $str = $year . ",".$month;
            } else if ($month == 0) {
                $str = $year;
            } else {
                $str = $year . ",".$month;
            }
        } //end of year=1 if statement
        else {
            if ($month == 1) {
                $str = $year . ",".$month;
            } else if ($month == 0) {
                $str = $year ;
            } else {
                $str = $year . ",".$month;
            }
        }
    } //end of main else statement
    return $str;
}

function getDOB() {
    $dte = date('Y-m-d');
    if($_REQUEST['dateVal']=='age'){
        $age = $_REQUEST["params"];
    }

    if($_REQUEST['dateVal']=='months'){
        $mnts = $_REQUEST["params"];
    }

    if (!isset($age) || empty($age)) {
        $age = 0;
    }
    if (!isset($mnts) || empty($mnts)) {
        $mnts = 0;
    }

    $date = new DateTime($dte);
    date_sub($date, new DateInterval("P" . $age . "Y" . $mnts . "M"));
    $newdate = $date->format("Y-m-d");

    echo '{"dob":"'.$newdate.'"}';
}


function getAge($dob) {
    $dte =date('Y-m-d');
    if($dob==''){
        $dob = $_GET["dob"];
    }
    

     $date = new DateTime($dob);
    $sdob=$date->format("Y-m-d");


    $days = dateDiff("-", $dte, $sdob);
    return $res = yearcalculate($days);
}

?>
