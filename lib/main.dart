import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:skrapai/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();

  final firstCamera = cameras.first;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      theme: ThemeData.light(),
      home: HomeScreen(
        camera: firstCamera,
      ),
    ),
  );
}
