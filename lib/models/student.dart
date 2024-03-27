class Student{
   int? id;
   String? firstName;
   String? surName;
   String? grade;
   String? status;
   Student(String firstName,String surName,String grade){
     this.firstName =firstName;
     this.surName=surName;
     this.grade=grade;
   }
   Student.withId(int id,String firstName,String surName,String grade){
     this.id =id;
     this.firstName =firstName;
     this.surName=surName;
     this.grade=grade;
   }
}

