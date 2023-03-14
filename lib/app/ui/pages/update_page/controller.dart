import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_mobile/app/core.dart';
import 'package:test_mobile/app/infrastructures/base_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_mobile/app/ui/assets/widgets/custom_form.dart';
import 'package:test_mobile/app/ui/pages/update_page/presenter_update.dart';
import 'package:test_mobile/data/payload/api/update_api_request.dart';
import 'package:test_mobile/domains/entities/update.dart';
import 'package:test_mobile/domains/entities/user.dart';

class UpdateController extends BaseController {
  UpdatePresenter updatePresenter;

  UpdateController(
    this.updatePresenter,
  );

  final List<Users> _details = List<Users>.empty(growable: true);

  List<Users> get aktifitas => _details;

  TextEditingController controllerFirst = TextEditingController();
  TextEditingController controllerLast = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  bool isEnable = false;
  bool isSave = false;
  int idData = 0;

  File? _image;

  File? get image => _image;

  @override
  void disposing() {
    // TODO: implement disposing
  }

  @override
  void getArgs() {
    // TODO: implement getArgs
  }

  @override
  void initListeners() {
    updatePresenter.getUpdateUserOnNext = (Update data) async {
      Navigator.pop(context);
      AwesomeDialog(
        context: context,
        animType: AnimType.leftSlide,
        headerAnimationLoop: false,
        dialogType: DialogType.success,
        showCloseIcon: true,
        title: 'Succes melakukan Update data',
        titleTextStyle:
            blackTextStyle.copyWith(fontSize: 16, color: kGreenColor),
        desc: 'Dengan keterangan waktu ${data.updatedAt}',
        descTextStyle:
            blackTextStyle.copyWith(fontSize: 12, color: kBlackColor),
      ).show();
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context);
      });
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context);
      });
    };

    updatePresenter.getUpdateUserOnComplete = () {
      debugPrint("scan: completed ");
    };

    updatePresenter.getUpdateUserOnError = (e) {
      print("ini nama errornya $e");
      Navigator.pop(context);
      if (e == 400) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Perhatian',
          titleTextStyle:
              blackTextStyle.copyWith(fontSize: 18, color: kRedColor),
          desc: "Anda Sudah pernah melakukan scan pada aktivitas ini",
          descTextStyle:
              blackTextStyle.copyWith(fontSize: 12, color: kBlackColor),
        ).show();
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context);
        });
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Error',
          titleTextStyle:
              blackTextStyle.copyWith(fontSize: 16, color: kRedColor),
          desc: e.toString(),
          descTextStyle:
              blackTextStyle.copyWith(fontSize: 12, color: kBlackColor),
        ).show();
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context);
        });
      }
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pop(context);
      });
    };

    updatePresenter.getDetailsUserOnNext = (Users dataUser) async {
      debugPrint("get : success aktifitas");
      debugPrint("ini data aktivitas yang baru ${dataUser.id}");

      // save to aktifitas data
      _details.add(dataUser);
    };
    updatePresenter.getDetailsUserOnComplete = () {
      debugPrint("get : completed aktifitas");
      isLoading = false;
      refreshUI();
    };
    updatePresenter.getDetailsUserOnError = (e) {
      debugPrint("get : error aktifitas $e");
      isLoading = false;
      refreshUI();
    };

    updatePresenter.DeleteUserOnNext = (Update data) async {
      Navigator.pop(context);
      AwesomeDialog(
        context: context,
        animType: AnimType.leftSlide,
        headerAnimationLoop: false,
        dialogType: DialogType.success,
        showCloseIcon: true,
        title: 'Succes melakukan Update data',
        titleTextStyle:
            blackTextStyle.copyWith(fontSize: 16, color: kGreenColor),
        desc: 'Dengan keterangan waktu ${data.updatedAt}',
        descTextStyle:
            blackTextStyle.copyWith(fontSize: 12, color: kBlackColor),
      ).show();
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context);
      });
    };

    updatePresenter.DeleteUserOnComplete = () {
      debugPrint("scan: completed ");
    };

    updatePresenter.DeleteUserOnError = (e) {
      print("ini nama errornya $e");
      Navigator.pop(context);
      if (e == 400) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Perhatian',
          titleTextStyle:
              blackTextStyle.copyWith(fontSize: 18, color: kRedColor),
          desc: "Anda Sudah pernah melakukan scan pada aktivitas ini",
          descTextStyle:
              blackTextStyle.copyWith(fontSize: 12, color: kBlackColor),
        ).show();
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context);
        });
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          headerAnimationLoop: false,
          title: 'Error',
          titleTextStyle:
              blackTextStyle.copyWith(fontSize: 16, color: kRedColor),
          desc: e.toString(),
          descTextStyle:
              blackTextStyle.copyWith(fontSize: 12, color: kBlackColor),
        ).show();
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(context);
        });
      }
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pop(context);
      });
    };
  }

  @override
  void load() {
    updatePresenter.onGetAllAktifitas(idData);
  }

  void getdata() {
    showLoaderDialog(context);
    updatePresenter.onUpdateUser(UpdateApiRequest(idData, controllerFirst.text,
        controllerLast.text, controllerEmail.text));
  }

  void isEdit() {
    isEnable = !isEnable;
    isSave = !isSave;
    refreshUI();
  }

  void deleteData() {
    showLoaderDialog(context);
    updatePresenter.onDeleteUser(idData);
  }

  Future<PermissionStatus> requestPhotosPermission() async {
    return await Permission.photos.request();
  }

  Future<bool> handlePhotosPermission(BuildContext context) async {
    PermissionStatus photosPermissionStatus = await requestPhotosPermission();

    if (photosPermissionStatus != PermissionStatus.granted) {
      print(
          '😰 😰 😰 😰 😰 😰 Permission to photos not granted! 😰 😰 😰 😰 😰 😰 $photosPermissionStatus');
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Photos Permission'),
          content: const Text(
              'Photos permission should Be granted to use this feature, would you like to go to app settings to give photos permission?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                openAppSettings();
              },
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: const Text("okay"),
              ),
            ),
          ],
        ),
      );
      return false;
    }
    return true;
  }

  Future getImage(ImageSource source) async {
    bool canProceed = await handlePhotosPermission(context);
    if (canProceed) {
      try {
        final image = await ImagePicker().pickImage(
          source: source,
        );
        if (image == null) return;
        _image = File(image.path);

        refreshUI();
      } on PlatformAssetBundle catch (e) {
        print('Failed to get image: $e');
      }
    }
  }

  Widget buildAktifitas() {
    if (_details.isNotEmpty) {
      return SingleChildScrollView(
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
                  if (isEnable == true) {
                    getImage(ImageSource.gallery);
                  }
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: image == null
                          ? NetworkImage(aktifitas[0].avatar)
                          : FileImage(File(image!.path)) as ImageProvider,
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
                controller: controllerFirst,
                isEnable: isEnable,
                hintText: aktifitas[0].firstName,
                filled: isEnable,
              ),
              boxheight(15),
              CustomForm(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                controller: controllerLast,
                isEnable: isEnable,
                hintText: aktifitas[0].lastName,
                filled: isEnable,
              ),
              boxheight(15),
              CustomForm(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                controller: controllerEmail,
                isEnable: isEnable,
                hintText: aktifitas[0].email,
                filled: isEnable,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      );
    } else {
      return setShimmerLoading();
    }
  }

  void showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              child: const CircularProgressIndicator()),
          Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const Text("Harap Menunggu...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget setShimmerLoading() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Shimmer.fromColors(
          baseColor: const Color(0xFFDCDCDC),
          highlightColor: const Color(0xFFD3D3D3),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Color(0xFFE9E9E9),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: Color(0xFFE9E9E9),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
