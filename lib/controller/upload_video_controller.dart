// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:four_musti/constants.dart';
// import 'package:four_musti/model/video.dart';
// import 'package:get/get.dart';
// import 'package:video_compress/video_compress.dart';

// class UploadVideoController extends GetxController {
//   _compressVideo(String videoPath) async {
//     final compressedVideo = await VideoCompress.compressVideo(
//       videoPath,
//       quality: VideoQuality.MediumQuality,
//     );
//     return compressedVideo!.file;
//   }

//   Future<String> _uploadVideoToStorage(String id, String videoPath) async {
//     Reference ref = firebaseStorage.ref().child('videos').child(id);

//     UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
//     TaskSnapshot snap = await uploadTask;
//     String downloadUrl = await snap.ref.getDownloadURL();
//     return downloadUrl;
//   }

//   _getThumbnail(String videoPath) async {
//     final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
//     return thumbnail;
//   }

//   Future<String> _uploadImageToStorage(String id, String videoPath) async {
//     Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
//     UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
//     TaskSnapshot snap = await uploadTask;
//     String downloadUrl = await snap.ref.getDownloadURL();
//     return downloadUrl;
//   }

//   // upload video
//   uploadVideo(String songName, String caption, String videoPath) async {
//     try {
//       String uid = firebaseAuth.currentUser!.uid;
//       DocumentSnapshot userDoc =
//           await firestore.collection('users').doc(uid).get();
//       // get id
//       var allDocs = await firestore.collection('videos').get();
//       int len = allDocs.docs.length;
//       String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
//       String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

//       Video video = Video(
//         username: (userDoc.data()! as Map<String, dynamic>)['name'],
//         uid: uid,
//         id: "Video $len",
//         likes: [],
//         commentCount: 0,
//         shareCount: 0,
//         songName: songName,
//         caption: caption,
//         videoUrl: videoUrl,
//         profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
//         thumbnail: thumbnail,

//         allow_comments: 'true',
//         allow_duet: '1',
//         created: Timestamp(10, 1000),
//         description: 'Lorem Ipsam is a dummy text....',
//         fb_id: 'SBUPikcifOR7lIiHQjySZbkcGlE3',
//         first_name: 'first_name',
//         last_name: 'last_name',
//         numberViews: 0,
//         privacy_type: 'privacy_type',
//         sound_id: 'null',
//         // thum: thumbnail,
//         verified: '0',
//         video_id: '0325vfHtLiayjlRLR0pJCdT0BL030FRFN4OFI2',
//         views: '64',
//       );

//       await firestore.collection('videos').doc('Video $len').set(
//             video.toJson(),
//           );
//       Get.back();
//     } catch (e) {
//       Get.snackbar(
//         'Error Uploading Video',
//         e.toString(),
//       );
//     }
//   }
// }
