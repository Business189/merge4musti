import 'package:flutter/material.dart';
import 'package:four_musti/views/account_details/account_details.dart';
import 'package:four_musti/views/indexedPage/create.dart';
import 'package:four_musti/views/login/login.dart';
import 'package:four_musti/views/onboarding/onboarding_page.dart';
import 'package:four_musti/views/splashScreen/splash_screen.dart';
import 'package:get/get.dart';

void main() {
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
      theme: ThemeData(),
      // home: const SplashScreen(),
      // home: const Onboarding(),
      // home: const Login(),
      // home: AccountDetails(),
      home: Home(),
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
