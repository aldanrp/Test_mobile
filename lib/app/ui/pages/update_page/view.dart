import 'package:flutter/cupertino.dart';
import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/app/ui/assets/widgets/custom_appbar.dart';
import 'package:test_mobile/app/ui/assets/widgets/custombutton.dart';
import 'package:test_mobile/app/ui/pages/update_page/controller.dart';

class UpdatePage extends View {
  final String id;
  const UpdatePage({
    super.key,
    required this.id,
  });

  _UpdatePageState createState() =>
      _UpdatePageState(AppComponent.getInjector().get<UpdateController>(), id);
}

class _UpdatePageState extends ViewState<UpdatePage, UpdateController> {
  final UpdateController controller;
  _UpdatePageState(
    this.controller,
    String id,
  ) : super(controller) {
    controller.idData = int.parse(id);
    print(controller.idData);
  }

  @override
  Widget get view => ControlledWidgetBuilder<UpdateController>(
        builder: (context, controller) {
          return Scaffold(
            key: globalKey,
            appBar: CustomAppBar(
              height: 70,
              isback: true,
              rightchild: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.isEdit();
                    },
                    icon: Icon(
                      CupertinoIcons.upload_circle,
                      size: 24,
                      color: kBlackColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.deleteData();
                    },
                    icon: Icon(
                      CupertinoIcons.delete,
                      size: 24,
                      color: kBlackColor,
                    ),
                  )
                ],
              ),
              titleAppbar: "Create Data",
              backFunction: () {
                Navigator.pop(context);
              },
            ),
            floatingActionButton: controller.isSave
                ? CustomButton(
                    textbutton: "Simpan",
                    colorbutton: kRedColor,
                    colorText: kWhiteColor,
                    colorOverlay: const Color.fromARGB(255, 56, 55, 52),
                    function: () {
                      controller.getdata();
                    },
                    backstep: false,
                    nextIcons: false,
                    widthButton: MediaQuery.of(context).size.width - 30,
                    heigthButton: 50,
                  )
                : Container(),
            body: controller.buildAktifitas(),
          );
        },
      );
}
