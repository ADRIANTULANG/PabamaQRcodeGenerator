import 'package:flutter/material.dart';
import 'package:userapp/helpers/coordinatesServices.dart';
import 'package:userapp/helpers/storage_service.dart';
import 'package:userapp/routes/route_pages.dart';
import 'package:get/get.dart';
import 'routes/route_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

// a4:c5:24:0b:6e:f7:a5:5f:54:05:8e:65:ac:cd:54:2b:c5:34:fc:12
// 69:08:12:65:29:06:95:d9:48:2b:81:46:a7:d3:e6:e5:db:5b:0f:4d:31:57:04:e8:d7:3d:42:ca:66:a8:c6:b4
//AIzaSyApNrjdrLrffhaymvAByczvZ7mFWSU5XQ4

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put(StorageService());
  Get.put(LocationService());
  Get.find<LocationService>().initializedFunction();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.redAccent,
      debugShowCheckedModeBanner: false,
      title: 'Pabama App',
      initialRoute: SplashScreen,
      getPages: AppPages.pages,
      locale: const Locale('en', 'US'),
      defaultTransition: Transition.cupertino,
    );
  }
}
