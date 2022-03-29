import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String? uid;
  String? id;
  List? likes;
  int? commentCount;
  int? shareCount;
  String? songName;
  String? caption;
  String? videoUrl;
  String? thumbnail;
  String? profilePhoto;

  String? allow_comments;
  String? allow_duet;
  Timestamp? created;
  String? description;
  String? fb_id;
  String? first_name;
  // String? id;
  String? last_name;
  int? numberViews;
  String? privacy_type;
  // String? profile_pic;
  String? sound_id;
  // String? thum;
  String? username;
  String? verified;
  String? video_id;
  // String? video_url;
  String? views;

  Video({
    this.username,
    this.uid,
    this.id,
    this.likes,
    this.commentCount,
    this.shareCount,
    this.songName,
    this.caption,
    this.videoUrl,
    this.profilePhoto,
    this.thumbnail,
    this.allow_comments,
    this.allow_duet,
    this.created,
    this.description,
    this.fb_id,
    this.first_name,
    this.last_name,
    this.numberViews,
    this.privacy_type,
    this.sound_id,
    // this.thum,
    this.verified,
    this.video_id,
    this.views,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "profilePhoto": profilePhoto,
        "id": id,
        "likes": likes,
        "commentCount": commentCount,
        "shareCount": shareCount,
        "songName": songName,
        "caption": caption,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,

        'allow_comments': allow_comments,
        'allow_duet': allow_duet,
        'created': created,
        'description': description,
        'fb_id': fb_id,
        'first_name': first_name,
        'last_name': last_name,
        'numberViews': numberViews,
        'privacy_type': privacy_type,
        'sound_id': sound_id,
        // 'thum': thum,
        'verified': verified,
        'video_id': video_id,
        'views': views,
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Video(
      username: snapshot['username'],
      uid: snapshot['fb_id'],
      id: snapshot['id'],
      likes: snapshot['video_like_dislike'],
      commentCount: 10, //snapshot['numberViews'],
      shareCount: 24, //snapshot['numberViews'],
      songName: snapshot['first_name'],
      caption: snapshot['last_name'],
      videoUrl:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', //snapshot['video_url'],
      // videoUrl: snapshot['video_url'],
      profilePhoto: snapshot['profile_pic'],
      thumbnail: snapshot['thum'],

      allow_comments: snapshot['allow_comments'],
      allow_duet: snapshot['allow_duet'],
      created: snapshot['created'],
      description: snapshot['description'],
      fb_id: snapshot['fb_id'],
      first_name: snapshot['first_name'],
      last_name: snapshot['last_name'],
      numberViews: snapshot['numberViews'],
      privacy_type: snapshot['privacy_type'],
      sound_id: snapshot['sound_id'],
      // thum: snapshot['thum'],
      verified: snapshot['verified'],
      video_id: snapshot['video_id'],
      views: snapshot['views'],
    );
  }
}
