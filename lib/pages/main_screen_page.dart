import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/controllers/home_controller.dart';
import 'package:warehouse_project/controllers/responsive_controller.dart';
import '../component/my_draw.dart';
import '../responsive/responsive.dart';
import '../utility/colors.dart';
import '../utility/my_text_style.dart';
import 'home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static String get id => "main_screen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeController>().fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResponsiveController>(
      builder: (controller) {
        final screenWidth = MediaQuery.of(context).size.width;
        controller.determineLayout(screenWidth);
        return Scaffold(
          appBar: controller.isMobile || controller.isTablet
              ? AppBar(
            title: Text(
              "Home Page",
              style: MyTextStyle.textW600White20,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              const Expanded(
                flex: 3,
                child: SizedBox(
                  width: 90,
                ),
              ),
              Center(
                child: Container(
                  width: 600.w,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(defaultPadding / 1.5),
                    color: secondaryColor,
                  ),
                  child: const Center(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: defaultPadding,
              ),
            ],
          )
              : null,
          body: Row(
            children: [
              if (controller.isDesktop)
                const Expanded(flex: 1, child: MyDrawer()),
              Expanded(

                flex: 5,
                child: ResponsiveLayout(
                  mobileScaffold: HomePage(),
                  // Replace with your mobile layout widget
                  tabletScaffold: HomePage(),
                  // Replace with your tablet layout widget
                  desktopScaffold: HomePage(),
                  // Replace with your desktop layout widget
                ),
              ),
            ],
          ),
          drawer: controller.isMobile || controller.isTablet
              ? const MyDrawer()
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
