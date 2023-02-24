import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:video_calling_app/Controller/HomeController.dart';
import 'package:video_calling_app/view/constant/ConstantsWidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink.shade50,
        body:
          Stack(
            children: [
              GridView.builder(
                itemCount: controller.list.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 32.h),
                itemBuilder: (contest, index) {
                  return Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: InkWell(
                      onTap: () {
                        // rewardAds();
                        // setState(() {
                        //   isloading = true;
                        // });
                        // Timer(Duration(seconds: 9), () {
                        //   setState(() {
                        //     isloading = false;
                        //   });
                        //   home_providerf!.Datapickkk = Modeldata2(
                        //     Name2: home_providerf!.i1[index].Name2,
                        //     Image2: home_providerf!.i1[index].Image2,
                        //     video: home_providerf!.i1[index].video,
                        //   );
                        //   Navigator.pushNamed(context, 'play');
                        // });
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 30.h,
                            width: 48.w,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    "${controller.list[index].image}",
                                    fit: BoxFit.fill,
                                    height: 35.h,
                                    width: 48.w,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5.sp),
                                      child: Stack(
                                        children: [
                                          Opacity(
                                            opacity: 0.4,
                                            child: Container(
                                              height: 4.5.h,
                                              width: 21.w,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(7.0.sp),
                                                child: Container(
                                                  height: 1.5.h,
                                                  width: 1.5.h,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.greenAccent
                                                          .shade700),
                                                ),
                                              ),
                                              Text(
                                                "Active",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 5.0.sp),
                                                  child: Text(
                                                    "${controller.list[index].name}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(2.0.sp),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 3.h,
                                                    width: 3.h,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(35),
                                                      child: Image.asset(
                                                          "assets/image/indianFlag.jpg",fit: BoxFit.fill),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 1.h,
                                                  ),
                                                  Container(
                                                    height: 3.5.h,
                                                    width: 8.h,
                                                    decoration: BoxDecoration(
                                                      color:
                                                      const Color(0xFFFF576F),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      "⭐ Lv5",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(3.sp),
                                          child: Container(
                                            height: 6.h,
                                            width: 6.h,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFFF576F),
                                              borderRadius: BorderRadius.circular(50),
                                              // /shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.call,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),

    );
  }
}
