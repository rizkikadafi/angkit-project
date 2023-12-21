import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({
    super.key,
  });

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraController _controller;

  Future<CameraDescription> getCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    CameraDescription camera = cameras.first;
    return camera;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ambil foto')),
      body: FutureBuilder(
        future: getCamera(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _controller = CameraController(
              snapshot.data!,
              ResolutionPreset.high,
            );
            return FutureBuilder<void>(
              future: _controller.initialize(),
              builder: (context, snapshot) {
                _controller.setFlashMode(FlashMode.off);
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(

        onPressed: () async {
          try {
            // await _initializeControllerFuture;

            final image = await _controller.takePicture();

            if (!mounted) return;

            Navigator.pop(context, image.path);

          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
