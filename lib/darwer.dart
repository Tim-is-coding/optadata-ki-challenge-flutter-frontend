// ignore_for_file: deprecated_member_use, unrelated_type_equality_checks

import 'package:buzz/provider/proviercolors.dart';
import 'package:buzz/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'appstaticdata/staticdata.dart';

class DarwerCode extends StatefulWidget {
  const DarwerCode({Key? key}) : super(key: key);

  @override
  State<DarwerCode> createState() => _DarwerCodeState();
}

class _DarwerCodeState extends State<DarwerCode> {
  AppConst obj = AppConst();
  final AppConst controller = Get.put(AppConst());

  final screenwidth = Get.width;
  bool ispresent = false;

  static const breakpoint = 600.0;

  @override
  Widget build(BuildContext context) {
    if (screenwidth >= breakpoint) {
      setState(() {
        ispresent = true;
      });
    }

    return GetBuilder<AppConst>(builder: (controller) {
      return SafeArea(
        child: Consumer<ColorNotifire>(
          builder: (context, value, child) => Drawer(
            backgroundColor: notifire!.getprimerycolor,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: notifire!.getbordercolor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: ispresent ? 30 : 15,
                      top: ispresent ? 24 : 20,
                      bottom: ispresent ? 10 : 12),
                  child: InkWell(
                    onTap: () {
                      controller.changePage(0);
                      Get.back();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.network(
                          "https://upload.wikimedia.org/wikipedia/commons/5/5b/Opta_Data_Gruppe_logo_(2021).svg",
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "SaniUp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                        //SvgPicture.asset("assets/Buzz..svg",height: 25,width: 32,color: notifire!.getTextColor1),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDivider(title: 'Abrechnen'),
                            SizedBox(
                              height: ispresent ? 10 : 8,
                            ),
                            _buildSingletile(
                                header: "Eingabe",
                                iconpath: "assets/euro.svg",
                                index: 0,
                                ontap: () {
                                  controller.changePage(0);
                                  Get.back();
                                }),
                            _buildSingletile(
                                header: "Übersicht",
                                iconpath: "assets/home.svg",
                                index: 1,
                                ontap: () {
                                  controller.changePage(1);
                                  Get.back();
                                }),
                            _buildSingletile(
                                header: "Historie",
                                iconpath: "assets/file-list.svg",
                                index: 2,
                                ontap: () {
                                  controller.changePage(2);
                                  Get.back();
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildSingletile(
      {required String header,
      required String iconpath,
      required int index,
      required void Function() ontap}) {
    return Obx(() => ListTileTheme(
          horizontalTitleGap: 12.0,
          dense: true,
          child: ListTile(
            hoverColor: Colors.transparent,
            onTap: ontap,
            title: Text(
              header,
              style: mediumBlackTextStyle.copyWith(
                  fontSize: 14,
                  color: controller.pageselecter.value == index
                      ? appMainColor
                      : notifire!.getMainText),
            ),
            leading: SvgPicture.asset(iconpath,
                height: 18,
                width: 18,
                color: controller.pageselecter.value == index
                    ? appMainColor
                    : notifire!.getMainText),
            trailing: const SizedBox(),
            contentPadding: EdgeInsets.symmetric(
                vertical: ispresent ? 5 : 2, horizontal: 8),
          ),
        ));
  }

  Widget _buildDivider({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: ispresent ? 15 : 10,
            width: ispresent ? 230 : 260,
            child: Center(
                child: Divider(color: notifire!.getbordercolor, height: 1))),
        SizedBox(
          height: ispresent ? 15 : 10,
        ),
        Text(
          title,
          style: mainTextStyle.copyWith(
              fontSize: 14, color: notifire!.getMainText),
        ),
        SizedBox(
          height: ispresent ? 10 : 8,
        ),
      ],
    );
  }
}
