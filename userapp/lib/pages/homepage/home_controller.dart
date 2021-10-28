import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:userapp/helpers/coordinatesServices.dart';
import 'package:userapp/pages/homepage/home_api.dart';
import 'package:userapp/pages/homepage/home_model.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  RxBool isLoadingGettingBus = true.obs;
  RxBool isErrorGettingBus = false.obs;
  RxBool isLoadingGettingHistory = true.obs;
  RxBool isErrorGettingHistory = false.obs;
  Timer? timer;

  TextEditingController destinationController = TextEditingController();
  RxBool showTextField = false.obs;
  RxList<Bus> busList = <Bus>[].obs;
  RxList<History> historyList = <History>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCustomerHistory();
    getBus();
    functionStream();
  }

  @override
  void onClose() {
    timer!.cancel();
    print("timer cancelled");
  }

  functionStream() {
    print("stream initialized");
    timer = Timer.periodic(Duration(seconds: 20), (timer) {
      getBusStream();
    });
  }

  Future<void> getBus() async {
    isLoadingGettingBus(true);

    try {
      var result =
          await HomeApi.getBus(destination: destinationController.text);

      busList.assignAll(result);
      isLoadingGettingBus(false);
    } catch (error) {
      isErrorGettingBus(true);
      if (error == true) {}
    } finally {}
  }

  Future<void> getCustomerHistory() async {
    isLoadingGettingHistory(true);

    try {
      var result = await HomeApi.getHistory(customerid: box.read('userid'));

      historyList.assignAll(result.reversed);
      // historyList.shuffle();
      isLoadingGettingHistory(false);
    } catch (error) {
      isErrorGettingHistory(true);
      if (error == true) {}
    } finally {}
  }

  Future<void> getBusStream() async {
    print("Currently Streaming for address");
    try {
      var result =
          await HomeApi.getBus(destination: destinationController.text);

      busList.assignAll(result);

      for (var i = 0; i < busList.length; i++) {
        busList[i].currentAddressLocation.value =
            await Get.find<LocationService>().getAddress(
                latitude: double.parse(busList[i].xLatitude),
                longitude: double.parse(busList[i].xLongitude));
      }
    } catch (error) {
      if (error == true) {}
    } finally {}
  }
}
