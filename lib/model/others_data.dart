class OthersData {
  String? othersProfilePic;
  String? username;
  List<String>? tags;
  String? likes;
  String? totalComments;
  String? totalShare;
  String? videoUrl;

  OthersData({
    this.othersProfilePic,
    this.username,
    this.tags,
    this.likes,
    this.totalComments,
    this.totalShare,
    this.videoUrl,
  });

  OthersData.fromJson(Map<String, dynamic> json) {
    othersProfilePic = json['othersProfilePic'];
    username = json['username'];
    tags = json['tags'].cast<String>();
    likes = json['likes'];
    totalComments = json['totalComments'];
    totalShare = json['totalShare'];
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['othersProfilePic'] = othersProfilePic;
    data['username'] = username;
    data['tags'] = tags;
    data['likes'] = likes;
    data['totalComments'] = totalComments;
    data['totalShare'] = totalShare;
    data['videoUrl'] = videoUrl;
    return data;
  }
}
