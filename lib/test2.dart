
void main(){

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

print(diabetesObj);

List<String> diabetes=diabetesObj.values.map((e) => e.toString()).toList();
print(diabetes);
}