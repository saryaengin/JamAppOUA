import 'package:Powledge/ui/face_detection/face_detection_view.dart';
import 'package:Powledge/ui/image_labeling/image_labeling_view.dart';
import 'package:Powledge/ui/main/main_view.dart';
import 'package:Powledge/ui/splash/splash_view.dart';
import 'package:Powledge/ui/text_recognition/text_recognition_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: MainView),
  MaterialRoute(page: ImageLabelingView),
  MaterialRoute(page: TextRecognitionView),
  MaterialRoute(page: FaceDetectionView),
],
)
class App{}