import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/component/product_ownership_container.dart';
import 'package:warehouse_project/controllers/grid_view_controller.dart';
import 'package:warehouse_project/controllers/responsive_controller.dart';
import 'package:warehouse_project/model/product_model.dart';
import 'package:warehouse_project/services/log_service.dart';
import '../component/header.dart';
import '../component/product_list_container.dart';
import '../component/my_gridview.dart';
import '../controllers/home_controller.dart';
import '../responsive/responsive.dart';
import '../responsive/size_config.dart';
import '../utility/colors.dart';
import '../utility/my_text_style.dart';
import '../views/item_of_home.dart';
import 'user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                                  mobileScaffold: GetBuilder<
                                      MyGridViewController>(
                                      init: MyGridViewController(),
                                      builder: (_controller) {
                                        return MyGridView(
                                          crossAxisCount: size.width < 650
                                              ? _controller.crossAxisCount = 2
                                              : _controller.crossAxisCount = 4,
                                          childAspectRatio: size.width < 650
                                              ? _controller.childAspectRatio = 1.3
                                              : _controller.childAspectRatio = 1
                                        );
                                      }),
                                  tabletScaffold: MyGridView(),
                                  desktopScaffold: GetBuilder<
                                      MyGridViewController>(
                                      init: MyGridViewController(),
                                      builder: (_controller) {
                                        return MyGridView(
                                          childAspectRatio: size.width < 1400
                                              ? _controller.childAspectRatio = 1.1
                                              :_controller.childAspectRatio = 1.4,
                                          crossAxisCount: _controller.crossAxisCount = 4
                                        );
                                      }),
                                ),

                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                ProductList(),
                                SizedBox(
                                  height: 20,
                                ),
                                ProductOwnership(),
                                if (controller.isMobile)
                                  const SizedBox(height: defaultPadding),

                                // if (controller.isMobile)
                                //   const UserPage(),
                                // const SizedBox(height: defaultPadding),

                              ],
                            ),
                          ),
                          if (!controller.isMobile)
                            const SizedBox(width: defaultPadding),
                          if (!controller.isMobile)
                             Expanded(
                              flex: 2,
                              child: UserPage(),
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

