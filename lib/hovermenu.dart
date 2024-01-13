import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HoverMenu extends StatefulWidget {

  final double mainheight;
  final double  mainwidth;

  final double secondheight;
  final double secondwidth;

 final CrossAxisAlignment aligmant;
  final String icon;
  final Widget body;

 const HoverMenu({Key? key, required this.mainheight, required this.mainwidth, required this.secondheight, required this.secondwidth, required this.icon, required this.body, required this.aligmant}) : super(key: key);

  @override
  State<HoverMenu> createState() => _HoverMenuState();
}

class _HoverMenuState extends State<HoverMenu> {
  
  double _animatedContainerHeight = 100;
  double _animatedContainerWidth = 100;

  bool isanimated = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          _animatedContainerHeight = widget.secondheight;
          _animatedContainerWidth = widget.secondwidth;
          isanimated = true;
        });
      },
      onExit: (value) { 
        setState(() {
        _animatedContainerHeight = 100;
        _animatedContainerWidth = 100;
        isanimated = false;
      });
      },
      cursor: SystemMouseCursors.click,
      child: SizedBox(

        height: isanimated?widget.mainheight:25,
        width: isanimated?widget.mainwidth:25,

        child: Column(
          crossAxisAlignment: widget.aligmant,
          children: [


            SvgPicture.asset(widget.icon,width: 20,height: 20,),

            isanimated?const SizedBox(height: 10,):const SizedBox(),
            isanimated?AnimatedContainer(
              duration: const Duration(seconds: 5),
              height: _animatedContainerHeight,
              width: _animatedContainerWidth,
              decoration: BoxDecoration(
                  color: isanimated?Colors.white:Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),

                  border: Border.all(color: Colors.grey.shade300)
              ),

              child: widget.body,
            ):const SizedBox(),

          ],
        ),
      )
    );
  }
}
