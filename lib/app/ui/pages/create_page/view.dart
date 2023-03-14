import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/app/ui/assets/widgets/custom_appbar.dart';
import 'package:test_mobile/app/ui/assets/widgets/custom_form.dart';
import 'package:test_mobile/app/ui/assets/widgets/custombutton.dart';
import 'package:test_mobile/app/ui/pages/create_page/controller.dart';

class CreatePage extends View {
  final String? id;
  const CreatePage({
    super.key,
    this.id,
  });

  _CreatePageState createState() =>
      _CreatePageState(AppComponent.getInjector().get<CreateController>(), id);
}

class _CreatePageState extends ViewState<CreatePage, CreateController> {
  final CreateController controller;
  _CreatePageState(
    this.controller,
    String? id,
  ) : super(controller);

  @override
  Widget get view => ControlledWidgetBuilder<CreateController>(
        builder: (context, controller) {
          return Scaffold(
            key: globalKey,
            appBar: CustomAppBar(
              height: 70,
              isback: true,
              rightchild: IconButton(
                onPressed: () {
                  controller.isEdit();
                },
                icon: Icon(
                  CupertinoIcons.pencil,
                  size: 24,
                  color: kBlackColor,
                ),
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  bottom: 70,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.isEnable == true) {
                          controller.getImage(ImageSource.gallery);
                        }
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: controller.image == null
                                ? const AssetImage(
                                    "lib/app/ui/assets/images/photo.png")
                                : FileImage(File(controller.image!.path))
                                    as ImageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomForm(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      controller: controller.controllerFirst,
                      isEnable: controller.isEnable,
                      hintText: "Masukan nama pertama anda",
                      filled: controller.isEnable,
                    ),
                    boxheight(15),
                    CustomForm(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      controller: controller.controllerLast,
                      isEnable: controller.isEnable,
                      hintText: "Masukan nama terakhir anda",
                      filled: controller.isEnable,
                    ),
                    boxheight(15),
                    CustomForm(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      controller: controller.controllerEmail,
                      isEnable: controller.isEnable,
                      hintText: "Masukan Email anda",
                      filled: controller.isEnable,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
