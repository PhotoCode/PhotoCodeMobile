import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/edit_screen.dart';
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
  String _ocrResult;

  String _selectedLanguage = "Javascript";

  Future getImage(ImageSource source, BuildContext context) async {
    Dio dio = new Dio();
    var image = await ImagePicker.pickImage(source: source);
    Navigator.pop(context);
    FormData formData = new FormData.fromMap({
      "image": await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
    });
    var response = await dio.post("https://photo-code-web.herokuapp.com/scan", data: formData);
    setState(() {
      _image = image;
      _ocrResult = response.data["code"].toString();
    });
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

  void openEditor() {
    Navigator.pushNamed(
      context, 
      EditScreen.routeName,
      arguments: EditArguments(_ocrResult),
    );
  }

  void changeLanguage(String newSelection) {
    if (mounted) {
      setState(() {
        _selectedLanguage = newSelection;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 4),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: _image != null ? Image.file(_image, fit: BoxFit.contain) : null,
            ),
            Spacer(),
            GFButton(
              onPressed: openSheet,
              fullWidthButton: true,
              shape: GFButtonShape.pills,
              color: Constants.barBackgroundColor,
              size: GFSize.LARGE,
              child: Text("Select Image", style: TextStyle(color: Constants.accentColor)),
            ),
            Spacer(),
            GFButton(
              onPressed: openEditor, 
              fullWidthButton: true,
              shape: GFButtonShape.pills,
              color: Constants.barBackgroundColor,
              size: GFSize.LARGE,
              child: Text("Process Image", style: TextStyle(color: Constants.accentColor)),
            ),
            Spacer(),
            DropdownButton<String>(
              value: _selectedLanguage,
              dropdownColor: Constants.barBackgroundColor,
              items: <String>['Javascript', 'More coming soon...'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Constants.accentColor)),
                );
              }).toList(),
              onChanged: (newSelection) {
                changeLanguage(newSelection); 
              }
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
