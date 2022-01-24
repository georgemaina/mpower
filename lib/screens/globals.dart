library MyApp.globals;

bool isLoggedIn = false;
String loggedUser="";
String facility="";
String mflcode="";

// String url="http://51.140.3.12:8082/mpower/data/getDataFunctions.php?task=";
// String url="http://192.168.1.108:8888/mpower/data/getDataFunctions.php?task=";
String url="http://192.168.100.107:8888/mpower/data/getDataFunctions.php?task=";
// String url="https://40.71.71.47/mpower/data/getDataFunctions.php?task=";
// String url="http://197.232.14.151:8089/mpower/data/getDataFunctions.php?task=";


//Screening Variables
String firstname="";
String lastname="";
String dob="";
String sex="";
String pregnant="";
String phone="";
String nationalid="";
String opdno="";
String alcohol="";
String tobacco="";
String diet="";
String exercise="";
String hypertensive="";
String bp_treatment="";
String diabetic="";
String diabetes_treatment="";
String systolic="";
String diastolic="";
String systolic2="";
String diastolic2="";
String test_bs="";
String last_meal="";
String bs_results="";
String bs_reason="";
String weight="";
String height="";
String voucher_no="";
String refer_to="";

//Awarenes and Education
//******Diabetes******
// var diabetes=[];
String diabetes="";
String hypertension="";
String anaemia="";
String epilepsy="";
String retinophathy="";

//******Cancer variables***
String bc1="";
String bc2="";
String bc3="";
String bc4="";
String totalMaleCancer="";
String totalFemaleCancer="";
String totalDisabledCancer="";

//******Diabetes variables***
String dbt1="";
String dbt2="";
String dbt3="";
String dbt4="";
String dbt5="";
String dbt6="";
String dbt7="";
String dbt8="";
String dbt9="";
String dbt10="";
String totalMaleDiabetes="";
String totalFemaleDiabetes="";
String totalDisabledDiabetes="";
String meetingID="";

//******Hypertension variables***
String bp1="";
String bp2="";
String bp3="";
String bp4="";
String bp5="";
String bp6="";
String bp7="";
String bp8="";
String bp9="";
String bp10="";
String totalMaleHypertension="";
String totalFemaleHypertension="";
String totalDisabledHypertension="";

//******Epilepsy variables***
String epy1="";
String epy2="";
String epy3="";
String epy4="";
String totalMaleEpilepsy="";
String totalFemaleEpilepsy="";
String totalDisabledEpilepsy="";

//******Diabetes Retinipathy variables***
String dr1="";
String dr2="";
String dr3="";
String dr4="";
String dr5="";
String totalMaleRetinopathy="";
String totalFemaleRetinopathy="";
String totalDisabledRetinopathy="";

//******Anaemia variables***
String sca1="";
String sca2="";
String sca3="";
String sca4="";
String sca5="";
String totalMaleAnaemia="";
String totalFemaleAnaemia="";
String totalDisabledAnaemia="";


///*************Awareness Objects********///
var diabetesObj={
 "dbt1":"Understanding diabetes",
 "dbt2":"Risk factors for diabetes",
 "dbt3":"Signs and symptoms of diabetes",
 "dbt4":"Prevention of diabetes",
 "dbt5":"Healthy diet",
 "dbt6":"Physical activity",
 "dbt7":"How to manage diabetes",
 "dbt8":"Complications of diabetes",
 "dbt9":"Procedure for blood glucose testing",
 "dbt10":"Myths and Misconceptions of diabetes",
};

var hypertensionObj={
 "bp1":"Understanding hypertension",
 "bp2":"Risk factors for hypertension",
 "bp3":"Signs and symptoms of hypertension",
 "bp4":"Understanding BP readings",
 "bp5":"Controlling high blood pressure",
 "bp6":"Healthy diet",
 "bp7":"Physical activity",
 "bp8":"Treatment of high blood pressure",
 "bp9":"Complications of high blood pressure",
 "bp10":"Side effects of blood pressure medication",
};