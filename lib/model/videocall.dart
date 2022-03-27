import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants.dart';

class VideoCall {
  String? docID;
  String? callerID;
  String? callerName;
  String? callerProfilePhoto;
  String? receiverID;
  String? receiverName;
  String? receiverProfilePhoto;
  String? channelName;
  String? channelToken;
  Timestamp? callAttemptAt;
  Timestamp? callEndAt;
  int? duration; // in seconds

  VideoCall({
    this.docID,
    this.callerID,
    this.callerName,
    this.callerProfilePhoto,
    this.receiverID,
    this.receiverName,
    this.receiverProfilePhoto,
    this.channelName,
    this.channelToken,
    this.callAttemptAt,
    this.callEndAt,
    this.duration, // in seconds
  });

  VideoCall.fromJson(Map<String, dynamic> json) {
    docID = json['docID'] ?? "";
    callerID = json['callerID'] ?? "";
    callerName = json['callerName'] ?? "";
    callerProfilePhoto = json['callerProfilePhoto'] ?? "";
    receiverID = json['receiverID'] ?? "";
    receiverName = json['receiverName'] ?? "";
    receiverProfilePhoto = json['receiverProfilePhoto'] ?? "";
    channelName = json['channelName'] ?? "";
    channelToken = json['channelToken'] ?? "";
    callAttemptAt = json['callAttemptAt'] ?? Timestamp.fromDate(constDate);
    callEndAt = json['callEndAt'] ?? Timestamp.fromDate(constDate);
    duration = json['duration'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['docID'] = docID ?? "";
    data['callerID'] = callerID ?? "";
    data['callerName'] = callerName ?? "";
    data['callerProfilePhoto'] = callerProfilePhoto ?? "";
    data['receiverID'] = receiverID ?? "";
    data['receiverName'] = receiverName ?? "";
    data['receiverProfilePhoto'] = receiverProfilePhoto ?? "";
    data['channelName'] = channelName ?? "";
    data['channelToken'] = channelToken ?? "";
    data['callAttemptAt'] = callAttemptAt ?? Timestamp.fromDate(constDate);
    data['callEndAt'] = callEndAt ?? Timestamp.fromDate(constDate);
    data['duration'] = duration ?? 0;
    return data;
  }
}
