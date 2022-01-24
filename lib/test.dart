void main() {
  List<int> myList = [1, 2, 3, 4, 5, 6, 7];
  List<String> daysOfTheWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  // myList.forEach((n) =>print(n));
  daysOfTheWeek.forEach((day){
    if(day[1]=="u") print(day);
  });

  print(daysOfTheWeek.join(''));

  List<String> convertedInts=myList.map((n)=>n.toString()).toList();
  print(convertedInts);

  int squareNums(int i){
    return i*i;
  }

  List<int> squaredInts=myList.map(squareNums).toList();
  print(squaredInts);

  List<int> filteredInts=squaredInts.where((element) => element>10).toList();
  print(filteredInts);

  int sum=myList.reduce((value, element) => value + element);
  print(sum);

  int foldSum=myList.fold(10000, (previousValue, element) => previousValue * element);
  print(foldSum);
}
