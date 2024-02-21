import 'package:buzz/provider/proviercolors.dart';
import 'package:buzz/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'appbar.dart';
import 'appstaticdata/staticdata.dart';
import 'darwer.dart';

class OpdaDataChallenge extends StatefulWidget {
  const OpdaDataChallenge({Key? key}) : super(key: key);

  @override
  State<OpdaDataChallenge> createState() => _OpdaDataChallengeState();
}

class _OpdaDataChallengeState extends State<OpdaDataChallenge> {
  AppConst obj = AppConst();
  final AppConst controller = Get.put(AppConst());

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: false);
    RxDouble? screenwidth = Get.width.obs;
    double? breakpoint = 600.0;
    bool? isMobile = screenwidth < breakpoint;

    return GetBuilder<AppConst>(builder: (controller) {
      return Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Obx(() {
            Widget selectedPage =
                controller.page[controller.pageselecter.value];
            return selectedPage;
          }),
        ),
      );
    });
  }
}
