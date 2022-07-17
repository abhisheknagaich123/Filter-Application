import 'dart:async';
import 'dart:io';
import 'package:filter_app/Dashboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart';
import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imageLib;
import 'package:image_picker/image_picker.dart';

import 'UserMain.dart';

class Mainscreen extends StatefulWidget {
  @override
  _MainscreenState createState() => new _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  String? fileName;
  List<Filter> filters = presetFiltersList;
  final picker = ImagePicker();
  File? imageFile;

  Future getImage(context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = new File(pickedFile.path);
      fileName = basename(imageFile!.path);
      var image = imageLib.decodeImage(await imageFile!.readAsBytes());
      image = imageLib.copyResize(image!, width: 600);
      Map imagefile = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => new PhotoFilterSelector(
            title: Text("Photo Filter"),
            image: image!,
            filters: presetFiltersList,
            filename: fileName!,
            loader: Center(child: CircularProgressIndicator()),
            fit: BoxFit.contain,
          ),
        ),
      );

      if (imagefile != null && imagefile.containsKey('image_filtered')) {
        setState(() {
          imageFile = imagefile['image_filtered'];
        });
        print(imageFile!.path);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new Container(
            child: imageFile == null
                ? Center(
                    child: new Text('Please Select Image .'),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 400,
                          height: 350,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            image: DecorationImage(
                                image: FileImage(imageFile!),
                                fit: BoxFit.cover),
                            // border: Border.all(width: 8, color: Colors.black),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await Share.shareFiles([imageFile!.path]);
                                  },
                                  child: const Text('Share',
                                      style: TextStyle(fontSize: 18))),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  onPressed: () async {
                                    await GallerySaver.saveImage(
                                        imageFile!.path);
                                    print(imageFile!.path);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.orangeAccent,
                                        content: Text(
                                          ' images Save',
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      ),
                                    );
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UserMain(),
                                      ),
                                    );
                                  },
                                  child: const Text('Save',
                                      style: TextStyle(fontSize: 18))),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () => getImage(context),
        tooltip: 'Pick Image',
        child: new Icon(Icons.add_a_photo),
      ),
    );
  }
}
