import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class DisplayDetails extends StatefulWidget {
  final String imagePath;

  const DisplayDetails({Key key, this.imagePath}) : super(key: key);

  @override
  _DisplayDetails createState() => _DisplayDetails();
}

class _DisplayDetails extends State<DisplayDetails> {
  List _outputs;
  File _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Trash Details",
          style: TextStyle(color: Colors.greenAccent, fontFamily: 'Oswald'),
        ),
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 300,
                      height: 300,
                      child: _image == null ? Container() : Image.file(_image)),
                  SizedBox(
                    height: 20,
                  ),
                  _outputs != null
                      ? Text(
                          "Trash Item: ${_outputs[0]["label"]}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            background: Paint()..color = Colors.white,
                          ),
                        )
                      : Container(),
                  Container(
                    width: 200,
                    height: 50,
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(10),
                    color: Colors.black,
                    child: TextButton(
                      onPressed: pickImage,
                      child: Text(
                        'Showdetails',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  pickImage() async {
    var image = widget.imagePath;
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image);
    });
    classifyImage(image);
  }

  classifyImage(String image) async {
    var output = await Tflite.runModelOnImage(
      path: image,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
