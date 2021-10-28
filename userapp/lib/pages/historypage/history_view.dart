import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/helpers/sizer.dart';
import 'package:userapp/pages/homepage/home_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Obx(
          () => ListView.builder(
            itemCount: Get.find<HomeController>().historyList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                // color: index.isEven ? Colors.red : Colors.blue,
                height: sizer.height(context: context, height: 22),
                width: sizer.width(context: context, width: 100),
                child: Column(
                  children: [
                    SizedBox(
                      height: sizer.height(context: context, height: 2),
                    ),
                    // child: Text(
                    //       "TRANSACTION ID: ${Get.find<HomeController>().historyList[index].transactionId}"),
                    Container(
                      // color: Colors.yellow,
                      height: sizer.height(context: context, height: 18),
                      width: sizer.width(context: context, width: 100),
                      child: Row(
                        children: [
                          Container(
                            color: Colors.grey[300],
                            height: sizer.height(context: context, height: 18),
                            width: sizer.width(context: context, width: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      sizer.height(context: context, height: 1),
                                ),
                                Text(
                                  "TRANSACTION ID: ${Get.find<HomeController>().historyList[index].transactionId}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: sizer.font(
                                          context: context, fontsize: 12)),
                                ),
                                Text(
                                  "${Get.find<HomeController>().historyList[index].busname.toUpperCase()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: sizer.font(
                                          context: context, fontsize: 12)),
                                ),
                                SizedBox(
                                  height: sizer.height(
                                      context: context, height: 0.5),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${Get.find<HomeController>().historyList[index].pickup} - ${Get.find<HomeController>().historyList[index].dropout}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: sizer.font(
                                            context: context, fontsize: 8)),
                                  ),
                                ),
                                SizedBox(
                                  height: sizer.height(
                                      context: context, height: 0.5),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "P ${double.parse(Get.find<HomeController>().historyList[index].fare).toStringAsFixed(2).toString()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: sizer.font(
                                            context: context, fontsize: 10)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: QrImage(
                                data:
                                    '${Get.find<HomeController>().historyList[index].transactionId}',
                                version: QrVersions.auto,
                                size: 200,
                                gapless: false,
                              ),
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ).paddingAll(15),
        ),
      ),
    );
  }
}
