import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:userapp/helpers/coordinatesServices.dart';
import 'package:userapp/helpers/sizer.dart';
import 'package:userapp/pages/QRcodepage/qrCode_view.dart';
import 'package:userapp/pages/homepage/home_controller.dart';
import 'package:userapp/pages/reserveseatpage/reserve_seat_api.dart';
import 'package:userapp/pages/reserveseatpage/reserve_seat_model.dart';

class ReserveSeatController extends GetxController {
  final box = GetStorage();
  RxBool loadingGettingdata = true.obs;
  RxString busID = ''.obs;
  RxString busImage = ''.obs;
  RxString busName = ''.obs;
  RxDouble pickupLatitude = 0.0.obs;
  RxDouble pickupLongitude = 0.0.obs;
  RxDouble dropOutLatitude = 0.0.obs;
  RxDouble dropOutLongitude = 0.0.obs;

  RxDouble plete = 0.0.obs;

  RxBool isLoadingTerminal = true.obs;
  RxBool isErrorTerminal = false.obs;
  RxBool isLoadingSeats = true.obs;
  RxBool isErrorSeats = false.obs;

  RxList<Terminals> terminalList = <Terminals>[].obs;
  RxList<Seats> seatsList = <Seats>[].obs;
  RxString pickup = 'PICK UP'.obs;
  RxString dropout = 'DROP OUT'.obs;
  RxString seatno = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getValues();
  }

  @override
  void onClose() {
    Get.find<HomeController>().functionStream();
    print("google map timer cancel");
  }

  getValues() async {
    busID.value = await Get.arguments['busID'];
    busImage.value = await Get.arguments['busImage'];
    busName.value = await Get.arguments['busName'];
    loadingGettingdata(false);
    await getTerminal();
    await getSeat();
  }

  Future<void> getTerminal() async {
    isLoadingTerminal(true);

    try {
      var result = await ReserveSeatApi.getTerminal();

      terminalList.assignAll(result);
      isLoadingTerminal(false);
    } catch (error) {
      isErrorTerminal(true);
      if (error == true) {}
    } finally {}
  }

  Future<void> getSeat() async {
    isLoadingSeats(true);

    try {
      var result = await ReserveSeatApi.getSeats(busid: busID.value);

      seatsList.assignAll(result);
      isLoadingSeats(false);
    } catch (error) {
      isErrorSeats(true);
      if (error == true) {}
    } finally {}
  }

  double functionGetFare(
      {required double deslat,
      required double deslong,
      required double orlat,
      required double orlong}) {
    var distance = Get.find<LocationService>().getDistance(
        desLat: deslat, desLng: deslong, orLat: orlat, orLng: orlong);
    var fare = distance * 3.60;
    return fare;
  }

  confirmationDialog(context) {
    var sizer = Sizer();
    Get.dialog(
      AlertDialog(
        content: Container(
          height: sizer.height(context: context, height: 30),
          width: sizer.width(context: context, width: 70),
          child: Container(
            child: Column(
              children: [
                Container(
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  height: sizer.height(context: context, height: 5),
                  width: sizer.width(context: context, width: 70),
                  child: Text("${box.read('fullname')}"),
                ),
                SizedBox(height: sizer.height(context: context, height: 2)),
                Container(
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  height: sizer.height(context: context, height: 5),
                  width: sizer.width(context: context, width: 70),
                  child: Text(
                    "${pickup.value} - ${dropout.value}",
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: sizer.height(context: context, height: 2)),
                Container(
                  color: Colors.grey[200],
                  alignment: Alignment.center,
                  height: sizer.height(context: context, height: 5),
                  width: sizer.width(context: context, width: 70),
                  child: Obx(() =>
                      Text("TOTAL FARE: P${plete.value.toStringAsFixed(2)}")),
                ),
                SizedBox(height: sizer.height(context: context, height: 2)),
                Container(
                  alignment: Alignment.center,
                  // height: sizer.height(context: Get.context, height: 5),
                  width: sizer.width(context: context, width: 70),
                  child: Text(
                    "PLEASE SEND YOUR PAYMENT TO THIS NUMBER 09123456789  THROUGH GCASH",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Get.back();
            },
          ),
          TextButton(
            child: Text('Confirm'),
            onPressed: () {
              Get.to(() => QrCodeView());
            },
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  // static void showMyToast(context, String message) {

  //   // final theme = Theme.of(context);
  //   showToast(
  //     message,
  //     context: context,
  //     // animation: StyledToastAnimation.scale,
  //     // reverseAnimation: StyledToastAnimation.fade,
  //     // position: StyledToastPosition(align: Alignment.bottomCenter, offset: 225),
  //     animDuration: Duration(seconds: 1),
  //     duration: Duration(seconds: 3),
  //     curve: Curves.elasticOut,
  //     reverseCurve: Curves.linear,
  //     backgroundColor: Colors.white,
  //     textStyle: TextStyle(
  //       color: Colors.white,
  //       fontSize: 12,
  //     ),
  //   );
  // }
}
