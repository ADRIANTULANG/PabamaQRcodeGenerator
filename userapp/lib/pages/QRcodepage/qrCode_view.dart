import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/helpers/sizer.dart';
import 'package:userapp/pages/QRcodepage/qrCode_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:userapp/pages/reserveseatpage/reserve_seat_controller.dart';
import 'package:screenshot/screenshot.dart';

class QrCodeView extends GetView<QRcontroller> {
  const QrCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(QRcontroller());
    var sizer = Sizer();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        // backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        title: Container(
          //
          height: sizer.height(context: context, height: 8),
          alignment: Alignment.centerLeft,
          child: Container(
            width: sizer.width(context: context, width: 12),
            decoration: BoxDecoration(
              // color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/images/splashscreen.jpeg'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          height: sizer.height(context: context, height: 100),
          width: sizer.width(context: context, width: 100),
          child: Column(
            children: [
              SizedBox(height: sizer.height(context: context, height: 10)),
              Screenshot(
                controller: controller.screenshotController,
                child: Container(
                  alignment: Alignment.center,
                  height: sizer.height(context: context, height: 50),
                  width: sizer.width(context: context, width: 80),
                  decoration: BoxDecoration(
                      // color: Colors.grey[500],
                      border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  )),
                  child: Column(
                    children: [
                      SizedBox(
                          height: sizer.height(context: context, height: 3)),
                      Container(
                        child: Text(
                          controller.box.read(
                            'fullname',
                          ),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  sizer.font(context: context, fontsize: 20)),
                        ),
                      ),
                      SizedBox(
                          height: sizer.height(context: context, height: 1)),
                      Container(
                        child: Obx(
                          () => Text(
                            '${Get.find<ReserveSeatController>().pickup.value} - ${Get.find<ReserveSeatController>().dropout.value}',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize:
                                    sizer.font(context: context, fontsize: 10)),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: sizer.height(context: context, height: 5)),
                      Obx(
                        () => controller.isLoadingGettingData.value == true
                            ? Container()
                            : Obx(
                                () => QrImage(
                                  data: '${controller.transactionID.value}',
                                  version: QrVersions.auto,
                                  size: 300,
                                  gapless: false,
                                ),
                              ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: sizer.height(context: context, height: 3)),
              Container(
                alignment: Alignment.center,
                // height: sizer.height(context: Get.context, height: 5),
                width: sizer.width(context: context, width: 70),
                child: Text(
                  "Present your QR code upon boarding the bus.This will serve as your ticket.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: sizer.height(context: context, height: 1)),
              Container(
                alignment: Alignment.center,
                // height: sizer.height(context: Get.context, height: 5),
                width: sizer.width(context: context, width: 70),
                child: Text(
                  "Present also your GCash receipt or text confirmation upon boarding the bus.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: sizer.height(context: context, height: 5)),
              Container(
                alignment: Alignment.center,
                // height: sizer.height(context: Get.context, height: 5),
                width: sizer.width(context: context, width: 70),
                child: Text(
                  "Please take a screenshot of your QR code",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
    );
  }
}
