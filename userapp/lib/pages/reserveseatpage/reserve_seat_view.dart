import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/helpers/sizer.dart';
import 'package:userapp/pages/reserveseatpage/reserve_seat_controller.dart';
import 'package:userapp/pages/reserveseatpage/reserve_seat_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReserveSeatView extends GetView<ReserveSeatController> {
  const ReserveSeatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReserveSeatController());
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
        height: sizer.height(context: context, height: 100),
        width: sizer.width(context: context, width: 100),
        child: Column(
          children: [
            Obx(
              () => controller.loadingGettingdata.value == true
                  ? Container()
                  : Obx(
                      () => Container(
                        alignment: Alignment.center,
                        height: sizer.height(context: context, height: 35),
                        // width: sizer.width(context: context, width: 25),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.all(Radius.circular(10)),
                          // color: Colors.white
                          image: DecorationImage(
                            image: NetworkImage('${controller.busImage.value}'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(height: sizer.height(context: context, height: 2)),
            Obx(() => controller.isLoadingTerminal.value == true
                ? Container()
                : Container(
                    width: sizer.width(context: context, width: 80),
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: DropdownButton(
                      alignment: Alignment.centerRight,
                      hint: Container(
                          // color: Colors.red,
                          width: sizer.width(context: context, width: 60),
                          alignment: Alignment.center,
                          child: Obx(() => Text('${controller.pickup.value}'))),
                      underline: SizedBox(),
                      icon: SizedBox.shrink(),
                      items: controller.terminalList.map((Terminals data) {
                        return new DropdownMenuItem<String>(
                          value: data.terminalId,
                          child: new Text(data.terminalName),
                        );
                      }).toList(),
                      onChanged: (val) {
                        for (var i = 0;
                            i < controller.terminalList.length;
                            i++) {
                          if (controller.terminalList[i].terminalId == val) {
                            controller.pickupLatitude.value = double.parse(
                                controller.terminalList[i].xLatitude);
                            controller.pickupLongitude.value = double.parse(
                                controller.terminalList[i].xLongitude);
                            controller.pickup.value =
                                controller.terminalList[i].terminalName;
                          }
                        }
                        if (controller.pickupLatitude.value == 0.0 ||
                            controller.pickupLongitude.value == 0.0 ||
                            controller.dropOutLatitude.value == 0.0 ||
                            controller.dropOutLongitude.value == 0.0) {
                        } else {
                          controller.plete.value = controller.functionGetFare(
                              deslat: controller.dropOutLatitude.value,
                              deslong: controller.dropOutLongitude.value,
                              orlat: controller.pickupLatitude.value,
                              orlong: controller.pickupLongitude.value);
                        }
                      },
                    ),
                  )),
            SizedBox(height: sizer.height(context: context, height: 2)),
            Obx(() => controller.isLoadingTerminal.value == true
                ? Container()
                : Container(
                    width: sizer.width(context: context, width: 80),
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: DropdownButton(
                      alignment: Alignment.centerRight,
                      hint: Container(
                          // color: Colors.red,
                          width: sizer.width(context: context, width: 60),
                          alignment: Alignment.center,
                          child:
                              Obx(() => Text('${controller.dropout.value}'))),
                      underline: SizedBox(),
                      icon: SizedBox.shrink(),
                      items: controller.terminalList.map((Terminals data) {
                        return new DropdownMenuItem<String>(
                          value: data.terminalId,
                          child: new Text(data.terminalName),
                        );
                      }).toList(),
                      onChanged: (val) {
                        // controller.dropout.value = val.toString();
                        // controller.dropOutLatitude.value = controller.
                        for (var i = 0;
                            i < controller.terminalList.length;
                            i++) {
                          if (controller.terminalList[i].terminalId == val) {
                            controller.dropOutLatitude.value = double.parse(
                                controller.terminalList[i].xLatitude);
                            controller.dropOutLongitude.value = double.parse(
                                controller.terminalList[i].xLongitude);
                            controller.dropout.value =
                                controller.terminalList[i].terminalName;
                          }
                        }
                        if (controller.pickupLatitude.value == 0.0 ||
                            controller.pickupLongitude.value == 0.0 ||
                            controller.dropOutLatitude.value == 0.0 ||
                            controller.dropOutLongitude.value == 0.0) {
                        } else {
                          controller.plete.value = controller.functionGetFare(
                              deslat: controller.dropOutLatitude.value,
                              deslong: controller.dropOutLongitude.value,
                              orlat: controller.pickupLatitude.value,
                              orlong: controller.pickupLongitude.value);
                        }
                      },
                    ),
                  )),
            SizedBox(height: sizer.height(context: context, height: 2)),
            Obx(() => controller.isLoadingSeats.value == true
                ? Container()
                : Container(
                    width: sizer.width(context: context, width: 80),
                    color: Colors.grey[300],
                    alignment: Alignment.center,
                    child: DropdownButton(
                      alignment: Alignment.centerRight,
                      hint: Container(
                          // color: Colors.red,
                          width: sizer.width(context: context, width: 60),
                          alignment: Alignment.center,
                          child: Obx(() =>
                              Text('SEAT NO: ${controller.seatno.value}'))),
                      underline: SizedBox(),
                      icon: SizedBox.shrink(),
                      items: controller.seatsList.map((Seats data) {
                        return new DropdownMenuItem<String>(
                          value: data.seatNumber,
                          child: new Text("SEAT NO: ${data.seatNumber}"),
                        );
                      }).toList(),
                      onChanged: (val) {
                        controller.seatno.value = val.toString();
                      },
                    ),
                  )),
            SizedBox(height: sizer.height(context: context, height: 2)),
            Container(
              alignment: Alignment.center,
              height: sizer.height(context: context, height: 5),
              width: sizer.width(context: context, width: 80),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Obx(() => Text(
                  "TOTAL FARE: P${controller.plete.value.toStringAsFixed(2)}")),
            ),
            SizedBox(height: sizer.height(context: context, height: 2)),
            Container(
              height: sizer.height(context: context, height: 5),
              width: sizer.width(context: context, width: 80),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black87,
                  primary: Colors.redAccent,
                  // minimumSize: Size(h * 0.20, w * 0.10),
                  // padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                onPressed: () {
                  if (controller.pickupLatitude.value == 0.0 ||
                      controller.pickupLongitude.value == 0.0 ||
                      controller.dropOutLatitude.value == 0.0 ||
                      controller.dropOutLongitude.value == 0.0) {
                    Fluttertoast.showToast(
                        msg:
                            "Please provide seat no, pick up and drop out location",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else if (controller.seatno.value == '') {
                    Fluttertoast.showToast(
                        msg: "Please provide seat no.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    controller.confirmationDialog(context);
                  }
                },
                child: Text('RESEREVE SEAT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
