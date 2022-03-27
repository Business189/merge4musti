class RTCModel {
  String? channelName;
  String? agoraToken;

  RTCModel({this.channelName, this.agoraToken});

  RTCModel.fromJson(Map<String, dynamic> json) {
    channelName = json['channel_name'];
    agoraToken = json['agora_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['channelName'] = channelName;
    data['agoraRtcToken'] = agoraToken;
    return data;
  }
}
