// ignore_for_file: deprecated_member_use

import 'package:buzz/provider/proviercolors.dart';
import 'package:buzz/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'appstaticdata/staticdata.dart';

class AppBarCode extends StatefulWidget implements PreferredSizeWidget {
  const AppBarCode({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppBarCode> createState() => _AppBarCodeState();
}

class _AppBarCodeState extends State<AppBarCode> {
  bool search = false;
  bool darkMood = false;
  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ColorNotifire>(context);
    final screenwidth = Get.width;
    bool ispresent = false;
    // getting the value from the provider instance

    const breakpoint = 600.0;

    if (screenwidth >= breakpoint) {
      setState(() {
        ispresent = true;
      });
    }
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return AppBar(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: notifier.getbordercolor)),
        backgroundColor: notifier.getprimerycolor,
        elevation: 1,
        leading: ispresent
            ? const SizedBox() : InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: SizedBox(
                    height: 27,
                    width: 27,
                    child: Center(
                        child: SvgPicture.asset(
                      "assets/menu-left.svg",
                      height: 25,
                      width: 25,
                      color: notifier.geticoncolor,
                    )))),
            title: search
            ? Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(

                    height: 42,
                    width: Get.width*0.3,

                    child: TextField(
                      style: TextStyle(color: notifier.getMainText),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 5),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: notifier.getbordercolor,width: 2)),
                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: notifier.getbordercolor,width: 2)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: notifier.getbordercolor,width: 2)),
                        hintStyle: TextStyle(color: notifier.getMainText),
                        hintText: "Search..",
                        prefixIcon: SizedBox(
                            height: 16,
                            width: 16,
                            child: Center(
                                child: SvgPicture.asset(
                              "assets/search.svg",
                              height: 16,
                              width: 16,
                              color: notifier.geticoncolor,
                            ))),
                      ),
                    )),
              ],
            )
            : const SizedBox(),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              constraints.maxWidth < 600
                  ? PopupMenuButton(
                constraints: BoxConstraints(
                  minWidth: Get.width,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                color: notifier.getcontiner,
                offset: const Offset(-5, 55),
                      icon: SvgPicture.asset(
                         "assets/search.svg",
                        width:  20,
                        height: 20,
                        color: notifier.geticoncolor,
                      ),
                      itemBuilder: (context) =>
                          [
                             PopupMenuItem(
                               padding: const EdgeInsets.symmetric(horizontal: 8),
                               enabled: false,
                                child: SizedBox(
                                    height: 42,
                                    child: TextField(
                                      style: TextStyle(color: notifier.getMainText),
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(top: 5),
                                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: notifier.getbordercolor,width: 2)),
                                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: notifier.getbordercolor,width: 2)),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: notifier.getbordercolor,width: 2)),

                                        hintStyle: TextStyle(color: notifier.getMainText),

                                        hintText: "Search..",
                                        prefixIcon: SizedBox(
                                            height: 16,
                                            width: 16,
                                            child: Center(
                                                child: SvgPicture.asset(
                                                  "assets/search.svg",
                                                  height: 16,
                                                  width: 16,
                                                  color: notifier.geticoncolor,
                                                ))),
                                      ),
                                    )))

                          ],
                    )
                  : InkWell(
                      onTap: () {
                        setState(() {
                          search = !search;
                        });
                      },
                      child: SvgPicture.asset(
                        search ? "assets/times.svg" : "assets/search.svg",
                        width: search ? 16 : 20,
                        height: search ? 16 : 20,
                        color: notifier.geticoncolor,
                      ),
                    ),

              constraints.maxWidth < 600?  const SizedBox() :const SizedBox(
                width: 10,
              ),

              const SizedBox(
                width: 10,
              ),

              InkWell(
                onTap: () {

                  setState(() {
                  darkMood =! darkMood;
                  });

                  if (notifier.isDark ==false) {

                    notifier.isavalable(true);

                  } else {

                    notifier.isavalable(false);

                  }
                },
                child: SvgPicture.asset(
                  darkMood? "assets/sun.svg":"assets/moon.svg",
                  width: 20,
                  height: 20,
                  color: notifier.geticoncolor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              PopupMenuButton(
                color: notifier.getcontiner,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                tooltip: "Cart",
                offset: const Offset(0, 50),
                icon: SvgPicture.asset(
                  "assets/shopping-basket.svg",
                  width: 20,
                  height: 20,
                  color: notifier.geticoncolor,
                ),
                itemBuilder: (ctx) => [
                  _buildPopupCartMenuItem(),
                ],
              ),
              PopupMenuButton(
                color: notifier.getcontiner,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                tooltip: "Notifications",
                offset: const Offset(0, 50),
                icon: SvgPicture.asset(
                  "assets/bell-notification.svg",
                  width: 20,
                  height: 20,
                  color: notifier.geticoncolor,
                ),
                itemBuilder: (ctx) => [
                  _buildPopupNotificationsMenuItem12(),
                ],
              ),
              PopupMenuButton(
                color: notifier.getcontiner,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                tooltip: "Account",
                offset: Offset(0, constraints.maxWidth >= 800 ? 60 : 50),
                child: constraints.maxWidth >= 800
                    ? SizedBox(
                        width: 140,
                        child: ListTile(
                          leading: const CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage("assets/profile.png"),
                              backgroundColor: Colors.transparent),
                          title: Text("Tim",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                  color: notifier.getMainText)),
                          trailing: null,
                          subtitle: Row(
                            children: [
                              Text("admin",
                                  style: TextStyle(
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis,
                                      color: notifier.getMaingey)),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 12,
                                color: notifier.geticoncolor,
                              )
                            ],
                          ),
                        ),
                      )
                    : const CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage("assets/profile.png"),
                        backgroundColor: Colors.transparent),
                itemBuilder: (ctx) => [
                  _buildPopupAdminMenuItem(),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      );
    });
  }



  PopupMenuItem _buildPopupCartMenuItem() {
    return PopupMenuItem(
      enabled: false,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Cart",
            style: TextStyle(
                color: notifire!.getMainText,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const SizedBox(
            height: 25,
          ),
          Divider(
            height: 1,
            color: notifire!.getbordercolor,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 100,
              width: 300,
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 60,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                                "assets/dance-shoes-png-transparent-dance-shoes-images-5-min.png"),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 80,
                    width: 178,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Nike Shoes",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: notifire!.getMainText)),
                            const SizedBox(width: 10,),
                            SvgPicture.asset(
                              "assets/times.svg",
                              height: 10,
                              width: 10,
                              color: Colors.red,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Wrap(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.grey.shade200,
                              child: Center(
                                  child:
                                      Text("-", style: mediumBlackTextStyle)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text("0",
                                  style: mediumBlackTextStyle.copyWith(
                                      color: notifire!.getMainText)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.grey.shade200,
                              child: Center(
                                  child:
                                      Text("+", style: mediumBlackTextStyle)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text("\$800",
                            style: TextStyle(
                                fontSize: 14,
                                color: appMainColor,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              )),
          Divider(
            height: 1,
            color: notifire!.getbordercolor,
          ),
          SizedBox(
              height: 100,
              width: 300,
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 60,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image:
                                AssetImage("assets/fashion-shoes-sneakers-removebg-preview-min.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 80,
                    width: 178,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Jorden Shoes",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: notifire!.getMainText)),
                            const SizedBox(width: 10),
                            SvgPicture.asset(
                              "assets/times.svg",
                              height: 10,
                              width: 10,
                              color: Colors.red,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Wrap(
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.grey.shade200,
                              child: Center(
                                  child:
                                      Text("-", style: mediumBlackTextStyle)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text("0",
                                  style: mediumBlackTextStyle.copyWith(
                                      color: notifire!.getMainText)),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.grey.shade200,
                              child: Center(
                                  child:
                                      Text("+", style: mediumBlackTextStyle)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text("\$1900",
                            style: TextStyle(
                                fontSize: 14,
                                color: appMainColor,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Order Total :",
                  style: mediumBlackTextStyle.copyWith(
                      color: notifire!.getMainText)),
              Text("\$2700.00",
                  style: mediumBlackTextStyle.copyWith(
                      color: notifire!.getMainText))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "GO TO YOUR CART",
            style: TextStyle(
                color: appMainColor,
                decoration: TextDecoration.underline,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                controller.changePage(11);
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: appMainColor,
                  fixedSize: const Size(140, 35)),
              child: const Text(
                "CHECK OUT",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
              )),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }



  final AppConst controller = Get.put(AppConst());
  PopupMenuItem _buildPopupAdminMenuItem() {
    return PopupMenuItem(
      enabled: false,
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 305,
            width: 155,
            child: Center(
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(20),
                },
                children: [
                  row(title: 'Profile', icon: 'assets/user.svg', index: 13),
                  row(title: 'Chat', icon: 'assets/chat-dots.svg', index: 12),
                  row(title: 'Email', icon: 'assets/envelope.svg', index: 0),
                  row(
                      title: 'Todo',
                      icon: 'assets/clipboard-check.svg',
                      index: 0),
                  row(title: 'Setting', icon: 'assets/settings.svg', index: 0),
                  row(
                      title: 'Price',
                      icon: 'assets/credit-card.svg',
                      index: 11),
                  row(title: 'Faq', icon: 'assets/chat-info.svg', index: 26),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                        "assets/tool.svg",
                        width: 18,
                        height: 18,
                        color: notifire!.geticoncolor,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 5, left: 20, top: 12, right: 20),
                          child: Text("RTL",
                              style: mediumBlackTextStyle.copyWith(
                                  color: notifire!.getMainText)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Obx(() => Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: SizedBox(
                                height: 20,
                                width: 50,
                                child: Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                    value: controller.switchistrue.value,
                                    onChanged: (bool value) {
                                      controller.switchistrue.value = value;
                                      Future.delayed(
                                        const Duration(milliseconds: 300),
                                        () {
                                          if (value == true) {
                                            Get.updateLocale(
                                                const Locale('ur', 'PK'));
                                            Get.back();
                                          } else {
                                            Get.updateLocale(
                                                const Locale('en', 'US'));
                                            Get.back();
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            )),
                      ],
                    )
                  ]),
                  row(title: 'Logout', icon: 'assets/log-out.svg', index: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool light1 = true;

  TableRow row(
      {required String title, required String icon, required int index}) {
    return TableRow(children: [
      TableRowInkWell(
        onTap: () {
          controller.changePage(index);
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SvgPicture.asset(icon,
              width: 18, height: 18, color: notifire!.geticoncolor),
        ),
      ),
      TableRowInkWell(
        onTap: () {
          controller.changePage(index);
          Get.back();
        },
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 5, left: 20, top: 12, right: 20),
          child: Text(title,
              style:
                  mediumBlackTextStyle.copyWith(color: notifire!.getMainText)),
        ),
      ),
    ]);
  }


}
PopupMenuItem _buildPopupNotificationsMenuItem12() {
  return PopupMenuItem(

    padding: EdgeInsets.zero,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,top: 5),
          child: Row(
            children: [
              Text(
                "Notifications",
                style: TextStyle(
                    color: notifire!.getMainText,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              const Spacer(),
              PopupMenuButton(itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child:  Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Get The App")
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 1,
                  child:  Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        width: 10,
                      ),
                      Text("about")
                    ],
                  ),
                ),
              ],
                offset: const Offset(0, 100),
                color: Colors.grey,
                elevation: 2,
                // on selected we show the dialog box
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Divider(
          height: 1,
          color: notifire!.getbordercolor,
        ),
        const SizedBox(
          height: 7,
        ),
        _buildcomuntile(
            colorsub: notifire!.getsubcolors,
            width: 13,
            height: 13,
            padding: const EdgeInsets.all(5),
            colors: notifire!.getTextColor1,
            title: 'Google',
            backgroundImage: 'assets/google-min.png',
            subtile: "Hey, I just found out what's causing the\nserver to crash!",
            color: Colors.grey.shade300),
        const SizedBox(
          height: 5,
        ),
        Divider(
          height: 1,
          color: notifire!.getbordercolor,
        ),
        _buildcomuntile(
            colorsub: notifire!.getsubcolors,
            colors: notifire!.getTextColor1,
            fontWeight: FontWeight.w800,
            backcolor: notifire!.getbacknoticolor,
            title: 'Dai Jiang',
            backgroundImage: 'assets/avatar.png',
            subtile: "What about some coffee this afternoon to discuss?",
            color: const Color(0xff0d6efd)),
        Divider(
          height: 1,
          color: notifire!.getbordercolor,
        ),
        const SizedBox(
          height: 5,
        ),
        _buildcomuntile(
            colorsub: notifire!.getsubcolors,
            height: 13,
            width: 13,
            padding: const EdgeInsets.all(5),
            colors: notifire!.getTextColor1,
            title: 'Snapchat',
            backgroundImage: 'assets/005-snapchat.png',
            subtile: "I finally got the present i mentioned to\nsteven, you'll love it",
            color: Colors.grey.shade300),
        const SizedBox(
          height: 5,
        ),
        Divider(
          height: 1,
          color: notifire!.getbordercolor,
        ),
        const SizedBox(
          height: 5,
        ),
        _buildcomuntile(
            colorsub: notifire!.getsubcolors,
            colors: notifire!.getTextColor1,
            title: 'Trashae Hubbard',
            backgroundImage: "assets/avatar1.png",
            subtile: "Hey, I just found out what's causing the\nserver to crash!",
            color: Colors.grey.shade300),
        const SizedBox(
          height: 5,
        ),
        Divider(
          height: 1,
          color: notifire!.getbordercolor,
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            "View All",style: TextStyle(color: notifire!.getTextColor1),
          ),
        )
      ],
    ),
  );
}
Widget _buildcomuntile(
    {required String title, required String subtile, EdgeInsetsGeometry? padding,required Color color,required String backgroundImage,Color? backcolor,FontWeight? fontWeight,Color? colors,double? width,double? height,required Color colorsub}) {
  return Container(
    color: backcolor,
    child: Padding(
      padding: const EdgeInsets.only(top: 5,bottom: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: color
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: ListTile(
              trailing: Text("just now",style: TextStyle(color: Colors.grey[500],fontSize: 11,overflow: TextOverflow.ellipsis),),
              title: Text(title,style: TextStyle(color: colors,fontSize: 16,overflow: TextOverflow.ellipsis),),
              subtitle: Text(subtile,style: TextStyle(color: colorsub,fontWeight: fontWeight,overflow: TextOverflow.ellipsis)),
              leading: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  padding: padding,
                  child:
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(backgroundImage,width: width,height: height,fit: BoxFit.cover,)),

                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}