// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:four_musti/views/video_screen/confirm_screen.dart';
// import 'package:four_musti/views/widgets/CameraScreen.dart';
// import 'package:image_picker/image_picker.dart';

// class AddVideoScreen extends StatelessWidget {
//   const AddVideoScreen({Key? key}) : super(key: key);

//   pickVideo(ImageSource src, BuildContext context) async {
//     final video = await ImagePicker().pickVideo(source: src);
//     if (video != null) {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => ConfirmScreen(
//             videoFile: File(video.path),
//             videoPath: video.path,
//           ),
//         ),
//       );
//     }
//   }

//   showOptionsDialog(BuildContext context) {
//     return showDialog(
//       context: context,
//       builder: (context) => SimpleDialog(
//         children: [
//           SimpleDialogOption(
//             onPressed: () => pickVideo(ImageSource.gallery, context),
//             child: Row(
//               children: const [
//                 Icon(Icons.image),
//                 Padding(
//                   padding: EdgeInsets.all(7.0),
//                   child: Text(
//                     'Gallery',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SimpleDialogOption(
//             onPressed: () => pickVideo(ImageSource.camera, context),
//             child: Row(
//               children: const [
//                 Icon(Icons.camera_alt),
//                 Padding(
//                   padding: EdgeInsets.all(7.0),
//                   child: Text(
//                     'Camera',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SimpleDialogOption(
//             onPressed: () => Navigator.of(context).pop(),
//             child: Row(
//               children: const [
//                 Icon(Icons.cancel),
//                 Padding(
//                   padding: EdgeInsets.all(7.0),
//                   child: Text(
//                     'Cancel',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Configuration createConfiguration() {
//   //   final flutterSticker = Sticker(
//   //       "example_sticker_logos_flutter", "Flutter", "assets/Flutter-logo.png");
//   //   final imglySticker = Sticker(
//   //       "example_sticker_logos_imgly", "img.ly", "assets/IgorSticker.png");

//   //   /// A completely custom category.
//   //   final logos = StickerCategory(
//   //       "example_sticker_category_logos", "Logos", "assets/Flutter-logo.png",
//   //       items: [flutterSticker, imglySticker]);

//   //   /// A predefined category.
//   //   final emoticons =
//   //       StickerCategory.existing("imgly_sticker_category_emoticons");

//   //   /// A customized predefined category.
//   //   final shapes =
//   //       StickerCategory.existing("imgly_sticker_category_shapes", items: [
//   //     Sticker.existing("imgly_sticker_shapes_badge_01"),
//   //     Sticker.existing("imgly_sticker_shapes_arrow_02")
//   //   ]);
//   //   var categories = <StickerCategory>[logos, emoticons, shapes];
//   //   final configuration = Configuration(
//   //       sticker:
//   //           StickerOptions(personalStickers: true, categories: categories));
//   //   return configuration;
//   // }

//   // void presentEditor() async {
//   //   final result = await VESDK.openEditor(Video('assets/Skater.mp4'),
//   //       configuration: createConfiguration());
//   //   // print(result?.toJson());
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //       body: ListView.builder(
//     //         itemBuilder: (context, index) {
//     //           return ListTile(
//     //             title: Text("Open video editor"),
//     //             subtitle: Text("Click to edit a sample video."),
//     //             onTap: presentEditor,
//     //           );
//     //         },
//     //         itemCount: 1,
//     //       ),
//     // );
//     return CameraScreen();
//     // return VideoEditorComponent(path: 'assets/Skater.mp4',);
//   }
// }
