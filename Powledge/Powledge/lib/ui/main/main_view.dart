// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:Powledge/app/app.router.dart';
import 'package:Powledge/common/create_bottom_nav_item.dart';
import 'package:Powledge/ui/image_labeling/image_labeling_view.dart';
import 'package:stacked/stacked.dart';

import 'package:Powledge/ui/main/main_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => MainViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              /*bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                items: [
                  createNavItem(TabItem.ImageLabeling),
                  createNavItem(TabItem.FaceDetection),
                  createNavItem(TabItem.TextRecognition),
                ],
                onTap: (value) {
                  model.setTabIndex(value);
                },
                currentIndex: model.currentTabIndex,
              ),
              body: getViewForIndex(model.currentTabIndex),*/
              body:
              Stack(
                children: [
                  ArkaPlan(),
                  Center(
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 170,
                        height: 35,
                        child: MaterialButton(
                            color: Colors.deepOrange,
                            onPressed: () {
                              model.navigationService
                                  .navigateTo(Routes.imageLabelingView);
                            },
                            child: Text("Image Recognition")),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      SizedBox(
                        width: 170,
                        height: 35,
                        child: MaterialButton(
                            color: Colors.deepOrange,
                            onPressed: () {
                              model.navigationService
                                  .navigateTo(Routes.textRecognitionView);
                            },
                            child: Text("Text Recognition")),
                      ),
                      SizedBox(
                        width: 10,
                        height: 10,
                      ),
                      SizedBox(
                        width: 170,
                        height: 35,
                        child: MaterialButton(
                            color: Colors.deepOrange,
                            onPressed: () {
                              model.navigationService
                                  .navigateTo(Routes.faceDetectionView);
                            },
                            child: Text("Face Detection")),
                      ),
                    ],
                  ),
                ),
  ]
              ),
            ));
  }
}
class ArkaPlan extends StatelessWidget {
  const ArkaPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset('images/Powledge.png'),
    );
  }
}

class ArkaPlan2 extends StatelessWidget {
  const ArkaPlan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/Powledge2.png'),
    );
  }
}


