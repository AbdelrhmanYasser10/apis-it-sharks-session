class CommentModel{

  late int id;
  late String name;
  late String email;
  late String body;

  CommentModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}