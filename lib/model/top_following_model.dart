class TopFollowingModel {
  String? uid;
  String? name;
  String? profilePic;

  TopFollowingModel({this.uid, this.name, this.profilePic});

  TopFollowingModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    profilePic = json['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['profilePic'] = profilePic;
    return data;
  }
}



/*
{
    "uid": "",
    "name": "",
    "profilePic": ""
}
*/