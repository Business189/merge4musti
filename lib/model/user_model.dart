import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? fbId;
  String? username;
  String? verified;
  String? firstName;
  String? lastName;
  String? gender;
  String? bio;
  String? dob;
  String? profilePic;
  int? block;
  String? version;
  String? device;
  String? signupType;
  String? token;
  String? bearerToken;
  Timestamp? created;
  String? email;
  String? displayName;
  bool? isLogin;
  int? totalLikes;
  int? totalFlames;
  int? totalDiamonds;
  int? totalVideos;
  String? uniqueYouId;
  int? totalFollowers;
  int? totalFollowings;
  int? amountInWallet;
  String? country;
  String? mobileNo;
  Timestamp? lastActive;
  int? level;

  UserModel(
      {this.id,
      this.fbId,
      this.username,
      this.verified,
      this.firstName,
      this.lastName,
      this.gender,
      this.bio,
      this.dob,
      this.profilePic,
      this.block,
      this.version,
      this.device,
      this.signupType,
      this.token,
      this.bearerToken,
      this.created,
      this.email,
      this.displayName,
      this.isLogin,
      this.totalLikes,
      this.totalFlames,
      this.totalDiamonds,
      this.totalVideos,
      this.uniqueYouId,
      this.totalFollowers,
      this.totalFollowings,
      this.amountInWallet,
      this.country,
      this.mobileNo,
      this.lastActive,
      this.level});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fbId = json['fb_id'];
    username = json['username'];
    verified = json['verified'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    bio = json['bio'];
    dob = json['dob'];
    profilePic = json['profile_pic'];
    block = json['block'];
    version = json['version'];
    device = json['device'];
    signupType = json['signup_type'];
    token = json['token'];
    bearerToken = json['bearer_token'];
    created = json['created'];
    email = json['email'];
    displayName = json['displayName'];
    isLogin = json['isLogin'];
    totalLikes = json['total_likes'];
    totalFlames = json['totalFlames'];
    totalDiamonds = json['totalDiamonds'];
    totalVideos = json['total_videos'];
    uniqueYouId = json['uniqueYouId'];
    totalFollowers = json['totalFollowers'];
    totalFollowings = json['totalFollowings'];
    amountInWallet = json['amountInWallet'];
    country = json['country'];
    mobileNo = json['mobileNo'];
    lastActive = json['lastActive'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fb_id'] = fbId;
    data['username'] = username;
    data['verified'] = verified;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['bio'] = bio;
    data['dob'] = dob;
    data['profile_pic'] = profilePic;
    data['block'] = block;
    data['version'] = version;
    data['device'] = device;
    data['signup_type'] = signupType;
    data['token'] = token;
    data['bearer_token'] = bearerToken;
    data['created'] = created;
    data['email'] = email;
    data['displayName'] = displayName;
    data['isLogin'] = isLogin;
    data['total_likes'] = totalLikes;
    data['totalFlames'] = totalFlames;
    data['totalDiamonds'] = totalDiamonds;
    data['total_videos'] = totalVideos;
    data['uniqueYouId'] = uniqueYouId;
    data['totalFollowers'] = totalFollowers;
    data['totalFollowings'] = totalFollowings;
    data['amountInWallet'] = amountInWallet;
    data['country'] = country;
    data['mobileNo'] = mobileNo;
    data['lastActive'] = lastActive;
    data['level'] = level;
    return data;
  }
}
