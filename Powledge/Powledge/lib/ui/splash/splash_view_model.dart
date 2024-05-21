import 'package:Powledge/app/app.router.dart';
import 'package:Powledge/ui/main/main_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends MainViewModel {
  init() {
    Future.delayed(Duration(seconds: 3), () {
      NavigationService().pushNamedAndRemoveUntil(Routes.mainView);
    },
    );
  }
}
