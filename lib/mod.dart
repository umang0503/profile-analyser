class Follow
{
  String id2;


  String img;

  Follow({this.id2,this.img});
  factory Follow.fromJson(Map<String,dynamic>json){
    return Follow(

      id2: json['login'],
      img:json['avatar_url']



    );

  }
}