import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_action_sheet/platform_action_sheet.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

class PhotoScreen extends StatefulWidget {
  static const routeName = '/photo';
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  File _image;

  Future getImage(ImageSource source, BuildContext context) async {
    Dio dio = new Dio();
    var image = await ImagePicker.pickImage(source: source);
    Navigator.pop(context);
    setState(() {
      _image = image;
    });
    FormData formData = new FormData.fromMap({
      "image": await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
    });
    var response = await dio.post("https://photo-code-web.herokuapp.com/scan", data: formData);
    print(response);
  }

  void openSheet() {
    PlatformActionSheet().displaySheet(context: context, actions: [
      ActionSheetAction(
        text: "Take Picture",
        onPressed: () => getImage(ImageSource.camera, context),
      ),
      ActionSheetAction(
        text: "Choose picture from gallery",
        onPressed: () => getImage(ImageSource.gallery, context),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            _image == null ? Text('No image selected.') : Image.file(_image),
            GFButton(
              onPressed: openSheet,
              text: "Get Image"
            ),
          ],
        ),
      ),
    );
  }
}
