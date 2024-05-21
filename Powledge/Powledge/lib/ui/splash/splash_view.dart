import 'package:flutter/material.dart';
import 'package:Powledge/ui/main/main_view.dart';
import 'package:Powledge/ui/splash/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child:
            ArkaPlan2()
        ),
      ),
    );
  }
}
