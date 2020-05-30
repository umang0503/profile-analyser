class Repo
{
  String id;

  int fork;
  String created;
  int stars;
  Repo({this.created,this.fork,this.id,this.stars});
  factory Repo.fromJson(Map<String,dynamic>json){
    return Repo(

        id: json['name'],
        stars: json['stargazers_count'],
        fork:json['forks'],
        created: json['created_at'],


    );

  }
}