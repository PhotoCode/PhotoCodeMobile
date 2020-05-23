import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_action_sheet/platform_action_sheet.dart';

class PhotoScreen extends StatefulWidget {
  static const routeName = '/photo';
  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  var _image;
  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future openImagePicker() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void getImage() {
    PlatformActionSheet().displaySheet(context: context, actions: [
      ActionSheetAction(
        text: "Take Picture",
        onPressed: () {
          openCamera();
          Navigator.pop(context);
        },
      ),
      ActionSheetAction(
        text: "Choose picture from gallery",
        onPressed: () {
          openImagePicker();
          Navigator.pop(context);
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Image Picker Example'),
        ),
        body: Center(
          child:
              _image == null ? Text('No image selected.') : Image.file(_image),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}
