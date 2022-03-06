class UserModel {
  String? name;
  String? profilePhoto;
  String? email;
  String? uid;
  String? country;
  String? mobileNo;
  String? gender;
  String? createdAt;
  String? lastActive;
  String? about;
  String? dob;
  String? platform;
  int? totalFollowers;
  int? profileOneStarCount;
  int? profileTwoStarCount;
  int? profileThreeStarCount;
  int? profileFourStarCount;
  int? profileFiveStarCount;
  int? totalVideo;
  int? totalViews;
  int? amountInWallet;
  int? flames;
  int? diamonds;

  UserModel(
      {this.name,
      this.profilePhoto,
      this.email,
      this.uid,
      this.country,
      this.mobileNo,
      this.gender,
      this.createdAt,
      this.lastActive,
      this.about,
      this.dob,
      this.platform,
      this.totalFollowers,
      this.profileOneStarCount,
      this.profileTwoStarCount,
      this.profileThreeStarCount,
      this.profileFourStarCount,
      this.profileFiveStarCount,
      this.totalVideo,
      this.totalViews,
      this.amountInWallet,
      this.flames,
      this.diamonds});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePhoto = json['profilePhoto'];
    email = json['email'];
    uid = json['uid'];
    country = json['country'];
    mobileNo = json['mobileNo'];
    gender = json['gender'];
    createdAt = json['createdAt'];
    lastActive = json['lastActive'];
    about = json['about'];
    about = json['dob'];
    platform = json['platform'];
    totalFollowers = json['totalFollowers'];
    profileOneStarCount = json['profileOneStarCount'];
    profileTwoStarCount = json['profileTwoStarCount'];
    profileThreeStarCount = json['profileThreeStarCount'];
    profileFourStarCount = json['profileFourStarCount'];
    profileFiveStarCount = json['profileFiveStarCount'];
    totalVideo = json['totalVideo'];
    totalViews = json['totalViews'];
    amountInWallet = json['amountInWallet'];
    flames = json['flames'];
    diamonds = json['diamonds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profilePhoto'] = profilePhoto;
    data['email'] = email;
    data['uid'] = uid;
    data['country'] = country;
    data['mobileNo'] = mobileNo;
    data['gender'] = gender;
    data['createdAt'] = createdAt;
    data['lastActive'] = lastActive;
    data['about'] = about;
    data['dob'] = dob;
    data['platform'] = platform;
    data['totalFollowers'] = totalFollowers;
    data['profileOneStarCount'] = profileOneStarCount;
    data['profileTwoStarCount'] = profileTwoStarCount;
    data['profileThreeStarCount'] = profileThreeStarCount;
    data['profileFourStarCount'] = profileFourStarCount;
    data['profileFiveStarCount'] = profileFiveStarCount;
    data['totalVideo'] = totalVideo;
    data['totalViews'] = totalViews;
    data['amountInWallet'] = amountInWallet;
    data['flames'] = flames;
    data['diamonds'] = diamonds;
    return data;
  }
}
