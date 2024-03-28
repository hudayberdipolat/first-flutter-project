class Student {
  static String imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWUem1ykMgZrm7P2GNRhID1fnipTWf1kQ1dA&usqp=CAU";
  int id;
  String firstName;
  String surName;
  int grade;
  String status;

  // Constructor to initialize fields
  Student(this.id, this.firstName, this.surName, this.grade, this.status);

  // Named constructor withId
  Student.withId(this.id, this.firstName, this.surName, this.grade) : status = '';

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçdi";
    }else if(this.grade >40){
      message ="Tazeden synanyş";
    }else {
      message ="Geçip bilmediňiz";
    }
    this.status = message;
    return this.status;
  }
}