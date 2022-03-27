class RTMModel {
  String? userId;
  String? agoraToken;

  RTMModel({this.userId, this.agoraToken});

  RTMModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    agoraToken = json['agora_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['agora_token'] = agoraToken;
    return data;
  }
}
