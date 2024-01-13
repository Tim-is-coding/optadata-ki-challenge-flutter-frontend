
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../Widgets/comuntitle.dart';
import '../Widgets/sizebox.dart';
import '../appstaticdata/staticdata.dart';
import '../comunbottombar.dart';
import '../provider/proviercolors.dart';


class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorNotifire>(
      builder: (context, value, child) => Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        color: notifire!.getbgcolor,

        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth < 600) {

              // Mobile layout
              return
                SizedBox(
                  height: 900,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const ComunTitle(title: 'FAQ',path: "FAQ"),
                        _buildui(),
                        const SizeBoxx(),
                        const ComunBottomBar(),

                      ],
                    ),
                  ),
                );
            } else {

              return   SizedBox(
                height: 1000,
                width: double.infinity,

                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ComunTitle(title: 'FAQ',path: "FAQ"),

                      _buildui(),
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

  Widget _buildui(){
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    color: notifire!.getcontiner,
    boxShadow: boxShadow,
),
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

               Text("Quick Questions are answered",style: mainTextStyle.copyWith(fontSize: 18,color: notifire!.getMainText)),
              const SizedBox(height: 20,),
              _buildFaq(title: "What is Flutter?",content: "Flutter is a UI toolkit for creating fast, beautiful, natively compiled mobile applications with one programming language and a single codebase."),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is Dart?",content: "Dart is a general-purpose, object-oriented programming language with C-style syntax. It is open-source and developed by Google in 2011. The purpose of Dart programming is to create a frontend user interfaces for the web and mobile apps."),
              const SizedBox(height: 12,),
              _buildFaq(title: "What are the Flutter widgets?",content: "A Flutter app is always considered as a tree of widgets. Whenever you are going to code for building anything in Flutter, it will be inside a widget. Widgets describe how your app view should look like with their current configuration and state"),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is pubspec.yaml file?",content: "It is the project's configuration file that will use a lot during working with the Flutter project. It allows you how your application works. It also allows us to set the constraints for the app. This file contains:"),

              const SizedBox(height: 25,),
               Text("Intellectual Property",style: mainTextStyle.copyWith(fontSize: 18,color: notifire!.getMainText)),
              const SizedBox(height: 20,),
              _buildFaq(title: "What is a property in Dart?",content: "Properties is a simple library to manage properties files (and something more) in Dart. The project aim is to provide a simple and lightweight implementation"),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is method property?",content: "Using a method causes something to happen to an object, while using a property returns information about the object or causes a quality about the object to change."),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is property in object?",content: "Object properties differentiate objects from other objects. The basic properties of an object are those items identified by its four-part name"),

              const SizedBox(height: 25,),
               Text("Selling And Buying",style: mainTextStyle.copyWith(fontSize: 18,color: notifire!.getMainText)),
              const SizedBox(height: 20,),
              _buildFaq(title: "What are functions in Flutter?",content: "Functions are used for code reusability and modularity. Basically, functions are separated into two parts: User-Defined Functions and Predefined Functions"),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is class in Flutter?",content: "Classes are the main building blocks for object-oriented programming language. Class is a custom type of holding variables and some functions. If you are new to variables and functions please check my Variables Article and Functions Article."),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is Oops in Dart?",content: "The Object-oriented programming approach is used to implement the concept like polymorphism, data-hiding, etc. The main goal of oops is to reduce programming complexity and do several tasks simultaneously"),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is an object method?",content: "an object is an element (or instance) of a class; objects have the behaviors of their class. The object is the actual component of programs, while the class specifies how instances are created and how they behave. method: a method is an action which an object is able to perform."),


              const SizedBox(height: 25,),
               Text("User Accounts",style: mainTextStyle.copyWith(fontSize: 18,color: notifire!.getMainText)),
              const SizedBox(height: 20,),
              _buildFaq(title: "What is main () in Flutter?",content: "In order to write any Dart program, be it a script or a Flutter app, you must define a function called main . This function tells Dart where the program starts, and it must be in the file that is considered the entry point for you program. By convention, this will be in a file called main."),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is string in Flutter?",content: "Strings are mainly used to represent text. A character may be represented by multiple code points, each code point consisting of one or two code units"),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is typedef in Flutter?",content: "Basically, typedef means user-defined function/data interfaces. So that means you can define your own data types and functions!"),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is array in Dart?",content: "An array is an object used to store a collection of values. This collection could be anything: numbers, objects, more arrays, etc. "),
              const SizedBox(height: 12,),
              _buildFaq(title: "What is object type in Dart?",content: "The base class for all Dart objects except null . Because Object is a root of the non-nullable Dart class hierarchy, every other non- Null Dart class is a subclass of Object . "),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFaq({required String title ,required String content}){
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side:  BorderSide(color: Colors.grey.shade200)
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child:  ExpansionTile(
        iconColor: appMainColor,
        collapsedIconColor: Colors.grey,
        leading: SizedBox(
          height: 30,
          width: 30,
          child: Center(child: SvgPicture.asset("assets/location-pin-question.svg",color: notifire!.getMainText,)),
        ),
        title:  Text(title,style:  mediumBlackTextStyle.copyWith(fontSize: 16,color: notifire!.getMainText)),
        children: [
          Column(
            children: [
              Divider(color: Colors.grey.shade300,height: 0,),
               Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Text(content,style:  mediumBlackTextStyle.copyWith(height: 1.5,fontSize: 14,fontWeight: FontWeight.w300,color: notifire!.getMainText),)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
