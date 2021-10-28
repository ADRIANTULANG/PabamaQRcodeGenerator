import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/helpers/sizer.dart';
import 'package:userapp/helpers/storage_service.dart';
import 'package:userapp/pages/googlemapspage/googlemap_view.dart';
import 'package:userapp/pages/historypage/history_view.dart';
import 'package:userapp/pages/homepage/home_controller.dart';
import 'package:userapp/pages/loginpage/login_view.dart';
import 'package:userapp/pages/reserveseatpage/reserve_seat_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: sizer.height(context: context, height: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://tse4.mm.bing.net/th?id=OIP.BiJ1riVRqb4-617P8PSNHgHaKP&pid=Api&P=0&w=300&h=300'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Text(
                      controller.box.read('fullname'),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: sizer.font(context: context, fontsize: 20)),
                    ),
                    Text(controller.box.read('contactnumber')),
                  ],
                ),
              ),
            ),
            SizedBox(height: sizer.height(context: context, height: 2)),
            Container(
              height: sizer.height(context: context, height: 5),
              // width: sizer.width(context: context, width: 40),
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
                  // Get.find<StorageService>().removeData();
                  Get.to(() => HistoryPage());
                  // controller.login();
                },
                child: Text('History'),
              ),
            ),
            SizedBox(height: sizer.height(context: context, height: 2)),
            Container(
              height: sizer.height(context: context, height: 5),
              // width: sizer.width(context: context, width: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black87,
                  primary: Colors.redAccent,
                  // minimumSize: Size(sizer.height(context: context, height: 20),
                  //     sizer.width(context: context, width: 10)),
                  // padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                onPressed: () {
                  Get.find<StorageService>().removeData();
                  Get.offAll(() => LoginView());
                  // controller.login();
                },
                child: Text('Log out'),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: sizer.height(context: context, height: 100),
          width: sizer.width(context: context, width: 100),
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: sizer.height(context: context, height: 2)),
              // Container(
              //   alignment: Alignment.center,
              //   // color: Colors.green,
              //   child: Row(
              //     // crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     // crossAxisAlignment: CrossAxisAlignment.stretch,
              //     children: [
              //       Container(
              //         height: sizer.height(context: context, height: 5),
              //         width: sizer.width(context: context, width: 40),
              //         child: ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //             onPrimary: Colors.black87,
              //             primary: Colors.redAccent,
              //             // minimumSize: Size(h * 0.20, w * 0.10),
              //             // padding: EdgeInsets.symmetric(horizontal: 16),
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(15)),
              //             ),
              //           ),
              //           onPressed: () {},
              //           child: Text('Pick Up Point'),
              //         ),
              //       ),
              //       Container(
              //         height: sizer.height(context: context, height: 5),
              //         width: sizer.width(context: context, width: 40),
              //         child: ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //             onPrimary: Colors.black87,
              //             primary: Colors.redAccent,
              //             // minimumSize: Size(h * 0.20, w * 0.10),
              //             // padding: EdgeInsets.symmetric(horizontal: 16),
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(15)),
              //             ),
              //           ),
              //           onPressed: () {},
              //           child: Text('Drop Out Point'),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: sizer.height(context: context, height: 2)),
              Obx(
                () => Container(
                  height: sizer.height(context: context, height: 5),
                  width: sizer.width(context: context, width: 86),
                  child: controller.showTextField.value == false
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black87,
                            primary: Colors.redAccent,
                            // minimumSize: Size(h * 0.20, w * 0.10),
                            // padding: EdgeInsets.symmetric(horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          onPressed: () {
                            controller.showTextField.value = true;
                          },
                          child: Icon(Icons.search_rounded),
                        )
                      : Row(
                          children: [
                            Container(
                              height:
                                  sizer.height(context: context, height: 10),
                              width: sizer.width(context: context, width: 65),
                              alignment: Alignment.center,
                              child: TextField(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                cursorColor: Theme.of(context).indicatorColor,
                                controller: controller.destinationController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                // onEditingComplete: () => _node.nextFocus(),
                                decoration: InputDecoration(
                                  // prefixText: '+63',
                                  labelText: 'Search Destination',
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  prefixStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.only(
                                    left: 10.0,
                                    top: 5.0,
                                    right: 5.0,
                                    bottom: 5.0,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: Theme.of(context).indicatorColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                height:
                                    sizer.height(context: context, height: 10),
                                width: sizer.width(context: context, width: 20),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: Colors.black87,
                                    primary: Colors.redAccent,
                                    // minimumSize: Size(h * 0.20, w * 0.10),
                                    // padding: EdgeInsets.symmetric(horizontal: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                  onPressed: () {
                                    controller.getBus();
                                    controller.showTextField.value = false;
                                  },
                                  child: Icon(Icons.done),
                                ))
                          ],
                        ),
                ),
              ),
              SizedBox(height: sizer.height(context: context, height: 2)),
              Obx(
                () => Expanded(
                    // height: sizer.height(context: context, height: 20),

                    child: controller.isLoadingGettingBus.value == false
                        ? Obx(
                            () => ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              itemCount: controller.busList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: sizer.height(
                                              context: context, height: 2)),
                                      Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          height: sizer.height(
                                              context: context, height: 20),
                                          width: sizer.width(
                                              context: context, width: 86),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: sizer.width(
                                                    context: context, width: 5),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height: sizer.height(
                                                    context: context,
                                                    height: 15),
                                                width: sizer.width(
                                                    context: context,
                                                    width: 25),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  // color: Colors.white
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        '${controller.busList[index].busImage}'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: sizer.width(
                                                    context: context, width: 3),
                                              ),
                                              Container(
                                                  alignment: Alignment.center,
                                                  height: sizer.height(
                                                      context: context,
                                                      height: 15),
                                                  width: sizer.width(
                                                      context: context,
                                                      width: 37),
                                                  child: Column(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            "${controller.busList[index].busName}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: sizer.font(
                                                                    context:
                                                                        context,
                                                                    fontsize:
                                                                        15)),
                                                          )),
                                                      SizedBox(
                                                        height: sizer.height(
                                                            context: context,
                                                            height: 0.5),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          controller.timer!
                                                              .cancel();
                                                          Get.to(
                                                              () =>
                                                                  ReserveSeatView(),
                                                              arguments: {
                                                                'busID': controller
                                                                    .busList[
                                                                        index]
                                                                    .busId,
                                                                'busImage':
                                                                    controller
                                                                        .busList[
                                                                            index]
                                                                        .busImage,
                                                                'busName':
                                                                    controller
                                                                        .busList[
                                                                            index]
                                                                        .busName,
                                                              });
                                                        },
                                                        child: Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              "Clink for bus info.",
                                                              style: TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline),
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        height: sizer.height(
                                                            context: context,
                                                            height: 0.5),
                                                      ),
                                                      Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            "${controller.busList[index].origin} - ${controller.busList[index].destination}",
                                                            style: TextStyle(),
                                                          )),
                                                      SizedBox(
                                                        height: sizer.height(
                                                            context: context,
                                                            height: 0.5),
                                                      ),
                                                      Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Obx(
                                                            () => Text(
                                                              "${controller.busList[index].currentAddressLocation.value}",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: sizer.font(
                                                                      context:
                                                                          context,
                                                                      fontsize:
                                                                          10)),
                                                            ),
                                                          )),
                                                    ],
                                                  )),
                                              SizedBox(
                                                width: sizer.width(
                                                    context: context, width: 2),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller.timer!.cancel();
                                                  Get.to(() => GoogleMapView(),
                                                      arguments: {
                                                        "latitude": double
                                                            .parse(controller
                                                                .busList[index]
                                                                .xLatitude),
                                                        "longitude": double
                                                            .parse(controller
                                                                .busList[index]
                                                                .xLongitude),
                                                        "busID": controller
                                                            .busList[index]
                                                            .busId
                                                            .toString()
                                                      });
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: sizer.height(
                                                      context: context,
                                                      height: 15),
                                                  width: sizer.width(
                                                      context: context,
                                                      width: 10),
                                                  // color: Colors.red,
                                                  child: Icon(
                                                    Icons.add_location_rounded,
                                                    size: 45,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator())),
              )
            ],
          ),
        ),
      ),
    );
  }
}
