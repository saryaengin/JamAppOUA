import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:Powledge/common/face_detection_pointer.dart';
import 'package:Powledge/ui/image_labeling/detector_view.dart';

class FaceDetectionView extends StatefulWidget {
  const FaceDetectionView({super.key});

  @override
  State<FaceDetectionView> createState() => _FaceDetectionViewState();
}

class _FaceDetectionViewState extends State<FaceDetectionView> {
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  var cameraLensDirection = CameraLensDirection.front;
  final FaceDetector _faceDetector = FaceDetector(
      options:
          FaceDetectorOptions(enableContours: true, enableLandmarks: true));

  @override
  void dispose() {
    _canProcess = false;
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(automaticallyImplyLeading: true),
      body: DetectorView(
        title: "Face Detector",
        onImage: _processImage,
        customPaint: _customPaint,
        initialCameraLensDirection: cameraLensDirection,
        onCameraLensDirectionChanged: (mode) => cameraLensDirection = mode,
      ),
    );
  }

  Future<void> _processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final faces = await _faceDetector.processImage(inputImage);
    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = FaceDetectorPainter(faces, inputImage.metadata!.size,
          inputImage.metadata!.rotation, cameraLensDirection);
      _customPaint = CustomPaint(
        painter: painter,
      );
    } else {
      String text = "Faces Found: ${faces.length}\n\n";
      for (final face in faces) {
        text = "face: ${face.boundingBox}\n\n";
      }
      _text = text;
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
