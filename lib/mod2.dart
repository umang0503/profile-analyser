class Following
{
String id3;


String img2;

Following({this.id3,this.img2});
factory Following.fromJson(Map<String,dynamic>json){
return Following(

id3: json['login'],
img2:json['avatar_url']



);

}
}