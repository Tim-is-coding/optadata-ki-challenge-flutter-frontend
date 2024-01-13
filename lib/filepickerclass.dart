
// ignore_for_file: deprecated_member_use

import 'package:buzz/provider/proviercolors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'appstaticdata/staticdata.dart';



class FilePickerClass extends StatefulWidget {
  const FilePickerClass({ Key? key }) : super(key: key);

  @override
  FilePickerClassState createState() => FilePickerClassState();
}

class FilePickerClassState extends State<FilePickerClass> with SingleTickerProviderStateMixin {
  late AnimationController loadingController;


  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg']
    );

    if (file != null) {
      setState(() {
      });
    }

    loadingController.forward();
  }

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() { setState(() {}); });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Consumer<ColorNotifire>(
          builder: (context, value, child) => Column(
            children: <Widget>[
              GestureDetector(
                onTap: selectFile,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      strokeCap: StrokeCap.round,
                      color: const Color(0xff8276ff),
                      child: Container(
                        width: double.infinity,
                        height: 230,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20,),
                            SvgPicture.asset("assets/cloud-upload.svg",height: 25,width: 25,color: const Color(0xff8276ff)),
                            const SizedBox(height: 15,),
                            Text('Drop files here or click to upload.', style: TextStyle(fontSize: 16,  color: notifire!.getMainText),),
                            Text('(This is just a demo dropzone. Selected files are not actually uploaded.)', style: TextStyle(fontSize: 13, color: Colors.grey.shade400),),
                          ],
                        ),
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
    );
  }
}