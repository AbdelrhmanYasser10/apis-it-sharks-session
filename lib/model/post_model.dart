class PostModel{
  late int id;
  late String title;
  late String description;

  PostModel.fromJson(Map<String,dynamic>json){
    id = json['id'];
    title = json['title'];
    description = json['body'];
  }
}