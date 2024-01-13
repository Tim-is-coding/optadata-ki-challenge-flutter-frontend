
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';
import '../staticdata.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final AppConst controller = Get.put(AppConst());

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) {
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: notifire!.getbgcolor,

          child: GetBuilder<AppConst>(
              builder: (controller) {
                return DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      if (constraints.maxWidth < 600) {

                        // Mobile layout
                        return   SizedBox(
                          height: 900,
                          width: double.infinity,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                const ComunTitle(title: 'Chat',path: "App"),

                                _buildChatUiTab(size:  constraints.maxWidth),
                                _buildSearch(),
                                const SizeBoxx(),
                                const ComunBottomBar(),



                              ],
                            ),
                          ),
                        );
                      } else if (constraints.maxWidth < 1000) {

                        return   SizedBox(
                          height: 1000,
                          width: double.infinity,

                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const ComunTitle(title: 'Chat',path: "App"),

                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: _buildSearch(),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child:_buildChatUiTab(size:  constraints.maxWidth),
                                    )
                                  ],
                                ),
                                const SizeBoxx(),
                                const ComunBottomBar(),

                              ],
                            ),
                          ),
                        );
                      } else {
                        // Website layout
                        return SizedBox(
                          height: 1000,
                          width: double.infinity,

                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const ComunTitle(title: 'Chat',path: "App"),

                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: _buildSearch(),
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child:_buildChatUi(size: constraints.maxWidth),
                                    )
                                  ],
                                ),
                                const SizeBoxx(),
                                const ComunBottomBar(),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              }
          ),
        );
      },

    );
  }
  Widget _buildSearch(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 800,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),

        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
          child: Column(
            children: [
               ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const CircleAvatar(backgroundImage: AssetImage("assets/Item10.png"),radius: 25,backgroundColor: Colors.transparent),
                title:Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Mark Jecno",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Status...",style: mediumGreyTextStyle.copyWith(fontSize: 12,color: notifire!.getMainText)),
                ),
              ),

              TextField(
                style: TextStyle(color: notifire!.getMainText),
                decoration: InputDecoration(
                  hintStyle: mediumBlackTextStyle.copyWith(fontSize: 14,color: notifire!.getMainText),
                  hintText: "Search",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  suffixIcon: SizedBox(
                      height: 15,
                      width: 15,
                      child: Center(child: SvgPicture.asset("assets/search.svg",height: 15,width: 15,color: notifire!.getMainText,))),
                ),
              ),

              Flexible(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                  return  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: const CircleAvatar(backgroundImage: AssetImage("assets/Item7.png"),radius: 20,backgroundColor: Colors.transparent),
                    title:Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("Vincent Porter",style: mediumBlackTextStyle.copyWith(fontSize: 16,overflow: TextOverflow.ellipsis,color: notifire!.getMainText)),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text("Hello Name" ,style: mediumGreyTextStyle.copyWith(fontSize: 12,overflow:TextOverflow.ellipsis)),
                    ),
                  );

                },),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatUi({required double size}){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
         height: 800,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: _buildComunChatui(size: size),
            ),
            VerticalDivider(color: Colors.grey.shade300,width: 1),
            Expanded(
              flex: 2,
              child: _buildtabbarview(),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildChatUiTab({required double size}){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 800,
        decoration:BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Row(
          children: [
            Expanded(
              child: _buildComunChatui(size: size),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildtabbarview(){
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
           Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: TabBar(
                    indicatorColor: appMainColor,
                    unselectedLabelColor:  notifire!.getMainText,
                    labelColor: appMainColor,
                    tabs: const <Widget>[
                      Tab(
                        text: "CALL",
                      ),
                      Tab(
                          text: "STATUS",
                      ),
                      Tab(
                          text: "PROFILE",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return  ListTile(
                      contentPadding: const EdgeInsets.all(5),
                      leading: const CircleAvatar(backgroundImage: AssetImage("assets/Item3.png"),radius: 20,backgroundColor: Colors.transparent),
                      title:Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("Vincent Porter",style:mediumBlackTextStyle.copyWith(fontSize: 16,overflow: TextOverflow.ellipsis,color: notifire!.getMainText)),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("Hello Name" ,style: mediumGreyTextStyle.copyWith(fontSize: 12,overflow: TextOverflow.ellipsis,color: notifire!.getMainText)),
                      ),
                    );
                    
                  
                },),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     const SizedBox(height: 20,),


                     TextField(
                       style: TextStyle(color: notifire!.getMainText),
                       decoration: InputDecoration(

                         hintStyle:  TextStyle(fontSize: 14,color: notifire!.getMainText),
                         hintText: "Write Status..",
                         focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                         ),
                         suffixIcon: SizedBox(
                             height: 15,
                             width: 15,
                             child: Center(child: SvgPicture.asset("assets/pen.svg",height: 15,width: 15,color: Colors.black87,))),
                       ),
                     ),
                     const SizedBox(height: 30,),

                      Text("Active",style: TextStyle(color: notifire!.getMainText)),
                     Divider(color: Colors.grey.shade300,height: 40),
                      Text("Established fact that a reader will be distracted 🥰 🥰 ",style: TextStyle(color: notifire!.getMainText)),
                     Divider(color: Colors.grey.shade300,height: 40),
                      Text("Dolore magna aliqua 😘",style: TextStyle(color: notifire!.getMainText)),



                   ],
                 ),
               ),
                 Column(
                  children: [
                    const SizedBox(height: 25,),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.bottomRight,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("assets/Item10.png"))
                            ),
                          ),
                          Positioned(

                              left: 0,
                              right: -60,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration:  const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                                ),
                              child: Center(child: SvgPicture.asset("assets/pen.svg",height: 12,width: 12,)),
                              ))

                        ],
                      ),
                    ),
                    const SizedBox(height: 25,),
                     Text("MARK JENCO",style: mediumBlackTextStyle.copyWith(fontSize: 18,color: notifire!.getMainText),),
                    const SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/Snapchat-176-svgrepo-com.svg",height: 16,width: 16,color: const Color(0xff6c7789)),
                        const SizedBox(width: 18,),
                        SvgPicture.asset("assets/Twitter-167-svgrepo-com.svg",height: 16,width: 16,color: const Color(0xff6c7789)),
                        const SizedBox(width: 18,),
                        SvgPicture.asset("assets/Tumblr-154-svgrepo-com.svg",height: 17,width: 17,color: const Color(0xff6c7789)),
                        const SizedBox(width: 18,),
                        SvgPicture.asset("assets/google-plus-165-svgrepo-com.svg",height: 18,width: 18,color: const Color(0xff6c7789)),
                        const SizedBox(width: 18,),
                        SvgPicture.asset("assets/wifi.svg",height: 14,width: 14,color: const Color(0xff6c7789)),
                      ],
                    ),

                    Divider(color: Colors.grey.shade400,height: 50,),

                      Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("Following",style: mediumGreyTextStyle.copyWith(fontSize: 16)),
                            const SizedBox(height: 10,),
                            Text("236k",style: mediumBlackTextStyle.copyWith(fontSize: 18,color: notifire!.getMainText)),
                          ],
                        ),

                        const SizedBox(

                            height: 60,
                            child: VerticalDivider(color: Colors.grey,width: 50)),




                         Column(
                          children: [
                            Text("Follower",style: mediumGreyTextStyle.copyWith(fontSize: 16)),
                            const SizedBox(height: 10,),
                            Text("3691k",style: mediumBlackTextStyle.copyWith(fontSize: 18,color: notifire!.getMainText)),
                          ],
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey.shade400,height: 50,),
                    
                     Column(

                      children: [
                        Text("Mark.jecno23@gmail.com",style: mediumBlackTextStyle.copyWith(fontSize: 15,color: notifire!.getMainText) ),
                        const SizedBox(height: 10,),
                        Text("+91 365 - 658 - 1236",style:mediumBlackTextStyle.copyWith(fontSize: 15,color: notifire!.getMainText)),
                        const SizedBox(height: 10,),

                        Text("Fax: 123-4560",style:mediumBlackTextStyle.copyWith(fontSize: 15,color: notifire!.getMainText)),
                      ],
                    )

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildComunChatui({required double size}){
    return Padding(
      padding:  EdgeInsets.all(size<600? 2 : 8.0),
      child: Column(
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(5.0),
              child: RichText(
                  text:
              TextSpan(children: [
                TextSpan(text: "Kori Thomas  ",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                TextSpan(text: "Typing...",style: mediumGreyTextStyle.copyWith(fontSize: 14,color: appMainColor))
              ]),overflow: TextOverflow.ellipsis,maxLines: 1),
            ),
            leading: const CircleAvatar(radius: 25,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/Item5.png")),
            subtitle:  Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("Last Seen 3:55 PM",style: mediumGreyTextStyle.copyWith(fontSize: 13),maxLines: 1),
            ),
            trailing: SizedBox(
              width: size < 1000? 180 : 150,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset("assets/search.svg",height: 20,width: 20,color: notifire!.getMainText),
                  const SizedBox(width: 10,),
                  SvgPicture.asset("assets/paperclip.svg",height: 20,width: 20,color: notifire!.getMainText),
                  const SizedBox(width: 10,),
                  SvgPicture.asset("assets/headphones.svg",height: 20,width: 20,color: notifire!.getMainText),
                  const SizedBox(width: 10,),
                   SvgPicture.asset("assets/video.svg",height: 20,width: 20,color: notifire!.getMainText),
                  size < 1000? PopupMenuButton(
                    color: notifire!.getcontiner,
                    offset: const Offset(0, 50),
                    icon: SvgPicture.asset("assets/menu.svg",width:20,height:  20,color: notifire!.getMainText),
                    itemBuilder: (ctx) => [
                      _buildPopupBookmarkMenuItem(),

                    ],
                  ):const SizedBox(),


                ],
              ),
            ),
          ),
          Divider(color: Colors.grey.shade300,height: 20),

          SizedBox(
            height: 640,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildchatbox(time: "10:12 am", content: "Are we meeting today? ", image: 'assets/Item5.png'),

                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 180,
                        ),
                      ),

                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildchatbox(time: "10:12 am", content: "Project has been already finished ", image: 'assets/Item5.png'),

                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 180,
                        ),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 180,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildchatbox(time: "10:14 am", content: "Well I am not sure. The rest of the team", image: 'assets/Item6.png'),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: appMainColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Center(child: Text( '😊', style: TextStyle(fontSize: 20),)),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        border: Border.all(color:  appMainColor),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child:  TextField(
                      style: TextStyle(color: notifire!.getMainText),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(fontSize: 14,color: notifire!.getMainText),
                          hintText: "Type a messenge....."
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      color: appMainColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Center(child: Text("Send",style: TextStyle(color: Colors.white,fontSize: 14),)),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
  Widget _buildchatbox({required String time,required String content,required String image}){
    return SizedBox(
      height: 100,
      width: 120,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300)
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(time,style:  mediumGreyTextStyle),
                      const SizedBox(width: 20,),
                    ],
                  ),
                  const SizedBox(height: 13,),
                  Text(content,style: mediumGreyTextStyle.copyWith(fontSize: 14, height: 1.6),maxLines: 2,)

                ],
              ),
            ),
          ),
          Positioned(
              top: -10,
              left: 20,
              child: CircleAvatar(radius: 14,backgroundColor: Colors.transparent, backgroundImage: AssetImage(image),))
        ],
      ),
    );
  }
  PopupMenuItem _buildPopupBookmarkMenuItem() {
    return PopupMenuItem(
      padding: const EdgeInsets.all(8),
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: SizedBox(
          height: 550,
          width: 400,
          child: Column(
            children: [
               Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: TabBar(
                        indicatorColor: appMainColor,
                        unselectedLabelColor:  notifire!.getMainText,
                        labelColor: appMainColor,
                        tabs: const <Widget>[
                          Tab(
                            text: "CALL",
                          ),
                          Tab(
                            text: "STATUS",
                          ),
                          Tab(
                            text: "PROFILE",
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return  ListTile(
                          contentPadding: const EdgeInsets.all(5),
                          leading: const CircleAvatar(backgroundImage: AssetImage("assets/pexels-garrett-morrow-623305.jpg"),radius: 20,backgroundColor: Colors.transparent),
                          title:Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("Vincent Porter",style: TextStyle(color: notifire!.getMainText,fontSize: 16,overflow: TextOverflow.ellipsis)),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text("Hello Name" ,style: TextStyle(color: notifire!.getMainText,fontWeight: FontWeight.w400,fontSize: 13,overflow: TextOverflow.ellipsis)),
                          ),
                        );


                      },),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(height: 20,),


                          TextField(
                            decoration: InputDecoration(
                              hintStyle:  TextStyle(fontSize: 14,color: notifire!.getMainText),
                              hintText: "Write Status..",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
                              ),
                              suffixIcon: SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Center(child: SvgPicture.asset("assets/pen.svg",height: 15,width: 15,color: Colors.black87,))),
                            ),
                          ),
                          const SizedBox(height: 30,),

                           Text("Active",style: TextStyle(color: notifire!.getMainText)),
                          Divider(color: Colors.grey.shade300,height: 40),
                           Text("Established fact that a reader will be distracted 🥰 🥰 ",style: TextStyle(color: notifire!.getMainText)),
                          Divider(color: Colors.grey.shade300,height: 40),
                           Text("Dolore magna aliqua 😘",style: TextStyle(color: notifire!.getMainText)),



                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 25,),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.bottomRight,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage("assets/Item10.png"))
                                ),
                              ),
                              Positioned(

                                  left: 0,
                                  right: -60,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration:  const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                    child: Center(child: SvgPicture.asset("assets/pen.svg",height: 12,width: 12,)),
                                  ))

                            ],
                          ),
                        ),
                        const SizedBox(height: 25,),
                         Text("MARK JENCO",style: TextStyle(color: notifire!.getMainText,fontSize: 18,fontWeight: FontWeight.w700),),
                        const SizedBox(height: 20,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/Snapchat-176-svgrepo-com.svg",height: 16,width: 16,color: const Color(0xff6c7789)),
                            const SizedBox(width: 18,),
                            SvgPicture.asset("assets/Twitter-167-svgrepo-com.svg",height: 16,width: 16,color: const Color(0xff6c7789)),
                            const SizedBox(width: 18,),
                            SvgPicture.asset("assets/Tumblr-154-svgrepo-com.svg",height: 17,width: 17,color: const Color(0xff6c7789)),
                            const SizedBox(width: 18,),
                            SvgPicture.asset("assets/google-plus-165-svgrepo-com.svg",height: 18,width: 18,color: const Color(0xff6c7789)),
                            const SizedBox(width: 18,),
                            SvgPicture.asset("assets/wifi.svg",height: 14,width: 14,color: const Color(0xff6c7789)),
                          ],
                        ),

                        Divider(color: Colors.grey.shade400,height: 50,),

                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text("Following",style: TextStyle(color: notifire!.getMainText,fontSize: 16,fontWeight: FontWeight.w400)),
                                const SizedBox(height: 10,),
                                Text("236k",style: TextStyle(color: notifire!.getMainText,fontSize: 18,fontWeight: FontWeight.w700)),
                              ],
                            ),

                            const SizedBox(
                                height: 60,
                                child: VerticalDivider(color: Colors.grey,width: 50)),

                            Column(
                              children: [
                                Text("Follower",style: TextStyle(color: notifire!.getMainText,fontSize: 16,fontWeight: FontWeight.w400)),
                                const SizedBox(height: 10,),
                                Text("3691k",style: TextStyle(color: notifire!.getMainText,fontSize: 18,fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey.shade400,height: 50,),

                         Column(

                          children: [
                            Text("Mark.jecno23@gmail.com",style:TextStyle(fontSize: 15,color: notifire!.getMainText) ),
                            const SizedBox(height: 10,),
                            Text("+91 365 - 658 - 1236",style:TextStyle(fontSize: 15,color: notifire!.getMainText)),
                            const SizedBox(height: 10,),

                            Text("Fax: 123-4560",style:TextStyle(fontSize: 15,color: notifire!.getMainText)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

