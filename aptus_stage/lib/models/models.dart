

class Quizz {
  final String title ;
  final String description;


  Quizz({
    required this.title,
    required this.description
  });

 static Quizz fromJson(Map<String,dynamic> json){
    return  Quizz(title: json['title'], description: json['description']);
  }

  

  
}
