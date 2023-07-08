import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/controllers/grid_view_controller.dart';
import 'package:warehouse_project/controllers/responsive_controller.dart';
import '../component/header.dart';
import '../component/my_container.dart';
import '../component/my_gridview.dart';
import '../responsive/responsive.dart';
import '../utility/colors.dart';
import 'information_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<HomeController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery
        .of(context)
        .size;
    return GetBuilder<ResponsiveController>(
        init: ResponsiveController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  primary: false,
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      if (controller.isDesktop)
                        Container(
                          height: 50,
                          child: const Header(),
                        ),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                ResponsiveLayout(
                                  mobileScaffold: GetBuilder<MyGridViewController>(
                                      init: MyGridViewController(),
                                      builder: (_controller) {
                                        return MyGridView(
                                          crossAxisCount:   _size.width < 650
                                              ? _controller.updateCrossAxisCount(2)
                                              : _controller.updateCrossAxisCount(4),
                                          childAspectRatio: _size.width < 650
                                              ? _controller.updateChildAspectRatio(1.3)
                                              : _controller.updateChildAspectRatio(1),
                                        );
                                      }),
                                  tabletScaffold:  MyGridView(),
                                  desktopScaffold: GetBuilder<MyGridViewController>(
                                      init: MyGridViewController(),
                                      builder: (_controller) {
                                        return MyGridView(
                                          childAspectRatio: _size.width < 1400
                                              ? _controller.updateChildAspectRatio(1.1)
                                              : _controller.updateChildAspectRatio(1.4),
                                        );
                                      }),
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                MyContainer(),
                                if (controller.isMobile)
                                  const SizedBox(height: defaultPadding),
                                if (controller.isMobile)
                                  const InformationCard(),
                                const SizedBox(height: defaultPadding),
                              ],
                            ),
                          ),

                          if (!controller.isMobile)
                            const SizedBox(width: defaultPadding),
                          if (!controller.isMobile)
                            const Expanded(
                              flex: 2,
                              child: InformationCard(),
                            ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
