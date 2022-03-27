import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:four_musti/utils/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/initial_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  // ObjectBox objectbox = await ObjectBox.create();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '4musti',
      initialRoute: "DEFAULT",
      initialBinding: InstanceBinding(),
      builder: EasyLoading.init(),
      getPages: Routes,
    );
  }
}

// import 'package:rwa_deep_ar/rwa_deep_ar.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late CameraDeepArController cameraDeepArController;
//   int currentPage = 0;
//   final vp = PageController(viewportFraction: .24);
//   Effects currentEffect = Effects.none;
//   Filters currentFilter = Filters.none;
//   Masks currentMask = Masks.none;
//   bool isRecording = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Stack(
//           children: [
//             CameraDeepAr(
//                 onCameraReady: (isReady) {
//                   print("Camera status $isReady");
//                 },
//                 onImageCaptured: (path) {
//                   print("Image Taken $path");
//                 },
//                 onVideoRecorded: (path) {
//                   print("Video Recorded @ $path");
//                 },
//                 //Enter the App key generate from Deep AR
//                 androidLicenceKey:
//                     "71262e192af989c805a424e93fdd0920ed7f798f73f1998cec677d3c7e0a87134b9357ef3ac935aa",
//                 // iosLicenceKey:
//                 //     "53618212114fc16bbd7499c0c04c2ca11a4eed188dc20ed62a7f7eec02b41cb34d638e72945a6bf6",
//                 cameraDeepArCallback: (c) async {
//                   cameraDeepArController = c;
//                   setState(() {});
//                 }),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
//                 //height: 250,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: List.generate(Masks.values.length, (p) {
//                           bool active = currentPage == p;
//                           return GestureDetector(
//                             onTap: () {
//                               currentPage = p;
//                               cameraDeepArController.changeMask(p);
//                               setState(() {});
//                             },
//                             child: Container(
//                                 margin: EdgeInsets.all(5),
//                                 width: active ? 40 : 30,
//                                 height: active ? 50 : 40,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     color: active ? Colors.green : Colors.white,
//                                     shape: BoxShape.circle),
//                                 child: Text(
//                                   "$p",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: active ? 16 : 14,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w800),
//                                 )),
//                           );
//                         }),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
