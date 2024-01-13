// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';

class UsersProfilePage extends StatefulWidget {
  const UsersProfilePage({Key? key}) : super(key: key);

  @override
  State<UsersProfilePage> createState() => _UsersProfilePageState();
}

class _UsersProfilePageState extends State<UsersProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: notifire!.getbgcolor,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile layout
              return  SizedBox(
                height: 900,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const ComunTitle(title: 'User Profile',path: "Users"),
                      _buildprofile1(size: constraints.maxWidth),
                      _buildprofile2(),
                      _buildprofile3(size: constraints.maxWidth),
                      _buildprofile4(),
                      _buildprofile5(size: constraints.maxWidth),
                      const SizeBoxx(),
                      const ComunBottomBar(),
                    ],
                  ),
                ),
              );
            } else if (constraints.maxWidth < 1000) {
              return  SizedBox(
                height: 1000,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'User Profile',path: "Users"),
                      _buildprofile1(size: constraints.maxWidth),
                      _buildprofile2(),
                      _buildprofile3(size:  constraints.maxWidth),
                      _buildprofile4(),
                      _buildprofile5(size: constraints.maxWidth),
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
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const ComunTitle(title: 'User Profile',path: "Users"),
                      _buildprofile1(size: constraints.maxWidth),
                      _buildprofile2(),
                      _buildprofile3(size: constraints.maxWidth),
                      _buildprofile4(),
                      _buildprofile5(size: constraints.maxWidth),
                      const SizeBoxx(),
                      const ComunBottomBar(),

                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildprofile2(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 750,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 20),
          child: Column(
            children: [
               ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const CircleAvatar(radius: 25,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/pexels-pixabay-220453.jpg")),
                title: Text("JOHAN DIO",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                trailing:  Text("10 hours ago",style: TextStyle(color: notifire!.getMainText)),
              ),

              Divider(color: Colors.grey.shade300,height: 50,),

              Text("you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.",style: mediumGreyTextStyle.copyWith(height: 1.9,wordSpacing: 2,overflow: TextOverflow.ellipsis),maxLines: 5,),
              const SizedBox(height: 20,),
              Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(image: AssetImage("assets/pexels-michael-block-3225517 (1).jpg"),fit: BoxFit.cover)
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              Row(
                children: [
                  SvgPicture.asset("assets/heartfill.svg",height: 15,width: 15,color: const Color(0xff898989),),
                  const SizedBox(width: 12,),
                   Text("Like 238",style: TextStyle(color: notifire!.getMainText)),

                  const SizedBox(width: 30,),

                  SvgPicture.asset("assets/comment.svg",height: 15,width: 15,color: const Color(0xff898989),),
                  const SizedBox(width: 12,),
                   Text("Comment 47",style: TextStyle(color: notifire!.getMainText)),
                ],
              ),
              const SizedBox(height: 10,),

            ],
          ),
        ),

      ),
    );
  }

  Widget _buildprofile3({required double size}){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 650,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 20),
          child: Column(
            children: [
               ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const CircleAvatar(radius: 25,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/pexels-pixabay-220453.jpg")),
                title: Text("JOHAN DIO",style: mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                trailing:  Text("10 hours ago",style: TextStyle(color: notifire!.getMainText)),
              ),

              Divider(color: Colors.grey.shade300,height: 50,),

              Text("you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.",style:  mediumGreyTextStyle.copyWith(height: 1.9,wordSpacing: 2,overflow: TextOverflow.ellipsis),maxLines: 3,),
              const SizedBox(height: 20,),

              SizedBox(
                height: 380,
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  size < 600? 1 :2,mainAxisExtent: size < 600?  180:360),children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: const DecorationImage(image: AssetImage("assets/pexels-christyn-reyes-13458334.jpg"),fit: BoxFit.cover)),
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(image: AssetImage("assets/pexels-christyn-reyes-13458334.jpg"),fit: BoxFit.cover)),
                    ),
                  ),

                ]),
              ),
              const Expanded(child: SizedBox(height: 20,)),

              Row(
                children: [
                  SvgPicture.asset("assets/heartfill.svg",height: 15,width: 15,color: const Color(0xff898989),),
                  const SizedBox(width: 12,),
                   Text("Like 238",style: TextStyle(color: notifire!.getMainText)),

                  const SizedBox(width: 30,),

                  SvgPicture.asset("assets/comment.svg",height: 15,width: 15,color: const Color(0xff898989),),
                  const SizedBox(width: 12,),
                   Text("Comment 47",style: TextStyle(color: notifire!.getMainText)),
                ],
              ),
              const SizedBox(height: 10,),

            ],
          ),
        ),

      ),
    );
  }
  Widget _buildprofile4(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: 400,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 20),
          child: Column(
            children: [
               ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const CircleAvatar(radius: 25,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/pexels-pixabay-220453.jpg")),
                title: Text("JOHAN DIO",style:  mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                trailing:  Text("10 hours ago",style: TextStyle(color: notifire!.getMainText)),
              ),

              Divider(color: Colors.grey.shade300,height: 50,),

              Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source .Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source",style:  mediumGreyTextStyle.copyWith(height: 1.9,wordSpacing: 2,overflow: TextOverflow.ellipsis),maxLines: 8,),
              const Expanded(child: SizedBox(height: 20,)),

              Row(
                children: [
                  SvgPicture.asset("assets/heartfill.svg",height: 15,width: 15,color: const Color(0xff898989),),
                  const SizedBox(width: 12,),
                   Text("Like 238",style: TextStyle(color: notifire!.getMainText)),

                  const SizedBox(width: 30,),

                  SvgPicture.asset("assets/comment.svg",height: 15,width: 15,color: const Color(0xff898989),),
                  const SizedBox(width: 12,),
                   Text("Comment 47",style: TextStyle(color: notifire!.getMainText)),
                ],
              ),
              const SizedBox(height: 10,),

            ],
          ),
        ),

      ),
    );
  }

  Widget _buildprofile5({required double size}){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: size<600?630:500,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 20),
          child: Column(
            children: [
               ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const CircleAvatar(radius: 25,backgroundColor: Colors.transparent,backgroundImage: AssetImage("assets/pexels-pixabay-220453.jpg")),
                title: Text("JOHAN DIO",style:  mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                trailing:  Text("10 hours ago",style: TextStyle(color: notifire!.getMainText)),
              ),

              Divider(color: Colors.grey.shade300,height: 50,),

              size<600?SizedBox(
                height: 450,
                child: Column(
                  children: [

                Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(image: AssetImage("assets/pexels-boys-in-bristol-photography-10528234.jpg"),fit: BoxFit.cover)
                          ),
                        ),
                      ),
                    ),

                Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 300,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(
                                      height: 300,
                                      child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source .Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source",style:  mediumGreyTextStyle.copyWith(height: 1.9,wordSpacing: 2,overflow: TextOverflow.ellipsis),maxLines: 8,)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )


                  ],
                ),
              ):

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(image: AssetImage("assets/pexels-pixabay-219692.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 300,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                  height: 300,
                                  child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source .Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source",style:  mediumGreyTextStyle.copyWith(height: 1.9,wordSpacing: 2,overflow: TextOverflow.ellipsis),maxLines: 8,)),
                            ),

                            const Expanded(
                                flex: 1,child: SizedBox(width: 120,)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Expanded(child: SizedBox(height: 12,)),

              Row(
                children: [
                  SvgPicture.asset("assets/heartfill.svg",height: 15,width: 15,color: const Color(0xff898989),),
                  const SizedBox(width: 12,),
                   Text("Like 238",style: TextStyle(color: notifire!.getMainText)),

                  const SizedBox(width: 30,),

                  SvgPicture.asset("assets/comment.svg",height: 15,width: 15,color: const Color(0xff898989),),
                  const SizedBox(width: 12,),
                   Text("Comment 47",style: TextStyle(color: notifire!.getMainText)),
                ],
              ),
              const SizedBox(height: 10,),

            ],
          ),
        ),

      ),
    );
  }

  Widget _buildprofile1({required double size}){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        height: size<600?  750 : size<1000? 640:850,
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Column(
          children: [
            Expanded(
              flex: size<1000? 2:6,
              child:  Stack(
                clipBehavior: Clip.none,
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/pexels-boys-in-bristol-photography-10528234.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(12))),

                  ),
                   Positioned(
                    bottom: -80,
                    left: 0,
                    right: 0,

                    child: Center(child: Column(
                      children: [
                        const CircleAvatar(backgroundImage: AssetImage("assets/pexels-davide-de-giovanni-2340978.jpg"),radius: 50,backgroundColor: Colors.transparent),
                        const SizedBox(height: 12,),
                        Text("MARK JECNO",style:  mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
                        Text("DESIGNER",style: mediumGreyTextStyle),
                      ],
                    )),)
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     SizedBox(height: size>600?20:60,),

                    size<600 ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                     children: [

                       _buildListtile(title: 'Email', subtitle: 'Marekjecno@yahoo.com', icon: 'assets/envelope.svg'),
                       const SizedBox(height: 18,),
                       _buildListtile(title: 'BOD', subtitle: '02 January 1988', icon: 'assets/calendar.svg'),
                       const SizedBox(height: 18,),

                       _buildListtile(title: 'Contact Us', subtitle: 'India +91 123-456-7890', icon: 'assets/phone-plus.svg'),
                       const SizedBox(height: 18,),

                       _buildListtile(title: 'Location', subtitle: 'B69 Near Schoool Demo Home', icon: 'assets/location-pin.svg'),
                       const SizedBox(height: 18,),

                     ],
                   ):const SizedBox(),
                   size>600 ?Padding(
                      padding:  EdgeInsets.symmetric(horizontal: size<1000? 40:20),
                      child: Row(
                        children: [
                          _buildListtile(title: 'Email', subtitle: 'Marekjecno@yahoo.com', icon: 'assets/envelope.svg'),
                          size>1000? const SizedBox(width: 80,):const Expanded(child: SizedBox(width: 80,)),
                          _buildListtile(title: 'BOD', subtitle: '02 January 1988', icon: 'assets/calendar.svg'),
                          size<1000? const SizedBox(width: 90):const Expanded(child: SizedBox(width: 50,)),

                          size<1000? const SizedBox():_buildListtile(title: 'Contact Us', subtitle: 'India +91 123-456-7890', icon: 'assets/phone-plus.svg'),
                          size<1000? const SizedBox(): const SizedBox(width: 80,),

                          size<1000? const SizedBox():_buildListtile(title: 'Location', subtitle: 'B69 Near Schoool Demo Home', icon: 'assets/location-pin.svg'),

                        ],
                      ),
                    ):const SizedBox(),
                    size>600 ? size<1000? Padding(
                        padding:  EdgeInsets.symmetric(horizontal: size<1000? 40:20,vertical: 20),
                      child: Row(
                         children: [
                           _buildListtile(title: 'Contact Us', subtitle: 'India +91 123-456-7890', icon: 'assets/phone-plus.svg'),
                           size>1000? const SizedBox():const Expanded(child: SizedBox(width: 80,)),

                           _buildListtile(title: 'Location', subtitle: 'B69 Near Schoool Demo Home', icon: 'assets/location-pin.svg'),
                         ],
                      ),
                    ):const SizedBox():const SizedBox(),

                    Divider(color: Colors.grey.shade400,height: size<1000?40:80,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/Snapchat-176-svgrepo-com.svg",height: 24,width: 24,color: const Color(0xff59667a)),
                        const SizedBox(width: 28,),
                        SvgPicture.asset("assets/Twitter-167-svgrepo-com.svg",height: 24,width: 24,color: const Color(0xff59667a)),
                        const SizedBox(width: 28,),
                        SvgPicture.asset("assets/Tumblr-154-svgrepo-com.svg",height: 24,width: 24,color: const Color(0xff59667a)),
                        const SizedBox(width: 28,),
                        SvgPicture.asset("assets/google-plus-165-svgrepo-com.svg",height: 28,width: 28,color: const Color(0xff59667a)),
                        const SizedBox(width: 28,),
                        SvgPicture.asset("assets/wifi.svg",height: 16,width: 16,color: const Color(0xff6c7789)),
                      ],
                    ),
                    const SizedBox(height: 20,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("25869",style: TextStyle( color: notifire!.getMainText,fontSize: 18,fontWeight: FontWeight.w700)),
                            const SizedBox(height: 10,),
                            Text("Follower",style: TextStyle(color: notifire!.getMainText,fontSize: 16,fontWeight: FontWeight.w400)),
                          ],
                        ),

                        const SizedBox(
                            height: 60,
                            child: VerticalDivider(color: Colors.grey,width: 50)),

                        Column(
                          children: [
                            Text("659887",style: TextStyle(color: notifire!.getMainText,fontSize: 18,fontWeight: FontWeight.w700)),
                            const SizedBox(height: 10,),
                            Text("Following",style: TextStyle(color: notifire!.getMainText,fontSize: 16,fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget _buildListtile({required String title,required String subtitle,required String icon}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(icon,height: 12,width: 12,color: const Color(0xff687486)),
            const SizedBox(width: 10,),
             Text(title,style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: Color(0xff687486)),)
          ],
        ),
        const SizedBox(height: 6,),
         Text(subtitle,style: const TextStyle(fontSize: 13,color: Color(0xff687486)),)
      ],
    );
  }
}
