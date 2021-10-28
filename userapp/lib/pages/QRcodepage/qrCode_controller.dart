import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:get_storage/get_storage.dart';
import 'package:userapp/pages/QRcodepage/qrCode_api.dart';
import 'package:userapp/pages/homepage/home_controller.dart';
import 'package:userapp/pages/reserveseatpage/reserve_seat_controller.dart';

class QRcontroller extends GetxController {
  GlobalKey asdasd = GlobalKey();
  final box = GetStorage();
  Uint8List? imageFile;
  RxString transactionID = ''.obs;
  RxBool isLoadingGettingData = true.obs;
  ScreenshotController screenshotController = ScreenshotController();
  @override
  void onInit() {
    getQRcodeValue();
    super.onInit();
  }

  @override
  void onClose() {}

  takeScreenshot() {
    screenshotController.capture().then((Uint8List? image) async {
      imageFile = await image;
      print(imageFile.toString());
      if (image != null) {
        final result = await ImageGallerySaver.saveImage(await imageFile!,
            quality: 60,
            name:
                "Screenshot ${DateTime.now().microsecondsSinceEpoch.toString()}");
        print(result);
      }
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> getQRcodeValue() async {
    isLoadingGettingData(true);
    try {
      var result = await QRcodeApi.addTransaction(
        pickup: Get.find<ReserveSeatController>().pickup.value,
        dropout: Get.find<ReserveSeatController>().dropout.value,
        customername: box.read('fullname'),
        customerid: box.read('userid'),
        busid: Get.find<ReserveSeatController>().busID.value,
        busname: Get.find<ReserveSeatController>().busName.value,
        fare: Get.find<ReserveSeatController>().plete.value.toString(),
        seatno: Get.find<ReserveSeatController>().seatno.value.toString(),
      );
      transactionID.value = result;
      Get.find<HomeController>().getCustomerHistory();
      updateSeatToReserve();
      isLoadingGettingData(false);
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  Future<void> updateSeatToReserve() async {
    try {
      await QRcodeApi.updateSeat(
        pickup: Get.find<ReserveSeatController>().pickup.value,
        busid: Get.find<ReserveSeatController>().busID.value,
        seatno: Get.find<ReserveSeatController>().seatno.value.toString(),
      );
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  // Future<void> getBus() async {
  //   isLoadingGettingBus(true);

  //   try {
  //     var result =
  //         await HomeApi.getBus(destination: destinationController.text);

  //     busList.assignAll(result);
  //     isLoadingGettingBus(false);
  //   } catch (error) {
  //     isErrorGettingBus(true);
  //     if (error == true) {}
  //   } finally {}
  // }

}
