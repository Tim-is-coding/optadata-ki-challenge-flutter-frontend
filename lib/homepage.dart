

import 'package:buzz/provider/proviercolors.dart';
import 'package:buzz/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'appbar.dart';
import 'appstaticdata/staticdata.dart';
import 'darwer.dart';


 class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AppConst obj = AppConst();
  final AppConst controller = Get.put(AppConst());


  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: false);
    RxDouble? screenwidth = Get.width.obs;
    double? breakpoint = 600.0;
    if (screenwidth >= breakpoint) {
      return GetBuilder<AppConst>(
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: 260,
                        child: const DarwerCode()),
                    Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child:  Column(
                         children:[
                           const AppBarCode(),
                           Expanded(child: Obx(() {
                             Widget selectedPage = controller.page[controller.pageselecter.value];
                             return selectedPage;
                           }),),
                         ],
                       ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      );
    } else {
      return  GetBuilder<AppConst>(
        builder: (controller) {
          return Scaffold(
            appBar: const AppBarCode(),
            drawer: const Drawer(width: 260, child: DarwerCode()),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Obx(() {
                Widget selectedPage = controller.page[controller.pageselecter.value];
                return selectedPage;
              }),
            ),
          );
        }
      );
    }
  }
}
