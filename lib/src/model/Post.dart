class Post{
  int _UserId;
  int? _Id;
  String _Title;
  String _Body;

  Post(this._UserId, this._Id, this._Title, this._Body);
  Post.noId(this._UserId, this._Title, this._Body);


  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      int.parse( json["userId"].toString()),
      int.parse( json["id"].toString()),
      json["title"].toString(),
      json["body"].toString(),
    );
  }
  Map toJson()=>{
    'userId': _UserId,
    'title': _Title,
    'body': _Body
  };

  int get userId => _UserId;
  int? get id => _Id;
  String get title => _Title;
  String get body => _Body;
}