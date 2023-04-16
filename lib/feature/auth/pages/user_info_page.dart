import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:harucat/common/extension/custom_them_extension.dart';
import 'package:harucat/common/routes/routest.dart';
import 'package:harucat/common/utils/coloors.dart';
import 'package:harucat/common/widgets/custom_elevated_button.dart';
import 'package:harucat/common/widgets/custom_icon_buttom.dart';
import 'package:harucat/common/widgets/short_h_bar.dart';
import 'package:harucat/feature/auth/pages/image_picker_page.dart';
import 'package:harucat/feature/auth/widgets/custom_text_field.dart';
import 'package:harucat/feature/home/pages/home_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/helper/show_alert_dialog.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  File? imageCamera;
  Uint8List? imageGallery;

  imagePickerTypeBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ShortHBar(),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    '上传头像',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomIconButton(
                      onTap: () => Navigator.pop(context), icon: Icons.close),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
              Divider(
                color: context.theme.greyColor!.withOpacity(0.6),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  imagePickerIcon(
                      onTap: pickImageFromCamera,
                      icon: Icons.camera_alt_rounded,
                      text: "相机"),
                  const SizedBox(
                    width: 15,
                  ),
                  imagePickerIcon(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const ImagePickerPage()),
                        );
                      },
                      icon: Icons.photo_camera_back_rounded,
                      text: "相册"),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          );
        });
  }

  pickImageFromCamera() async {
    Navigator.of(context).pop();
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        imageCamera = File(image!.path);
        imageGallery = null;
      });
    } catch (e) {
      showAlertDialog(context: context, message: e.toString());
    }
  }

  
    set() async {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs =
          await SharedPreferences.getInstance(); //定义一个SharedPreferences类型
      prefs.setString('isLogin','1'); //写入具体的数据
      // Navigator.pushNamedAndRemoveUntil(context, Routes.home);
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    }
  

  imagePickerIcon({
    required VoidCallback onTap,
    required IconData icon,
    required String text,
  }) {
    return Column(
      children: [
        CustomIconButton(
          onTap: onTap,
          icon: icon,
          iconColor: Coloors.greenLight,
          minWidth: 50,
          border: Border.all(
            color: context.theme.greyColor!.withOpacity(.6),
            width: 1,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(
            color: context.theme.greyColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          '个人信息',
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          children: [
            Text(
              '请提供您的姓名和可选的头像照片',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: imagePickerTypeBottomSheet,
              child: Container(
                padding: const EdgeInsets.all(26),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.theme.photoIconBgColor,
                    border: Border.all(
                      color: imageCamera == null && imageGallery == null
                          ? Colors.transparent
                          : context.theme.greyColor!.withOpacity(0.4),
                    ),
                    image: imageCamera != null || imageGallery != null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: imageGallery != null
                                ? MemoryImage(imageGallery!) as ImageProvider
                                : FileImage(imageCamera!),
                          )
                        : null),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 3, right: 3),
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    size: 48,
                    color: imageCamera == null && imageGallery == null
                        ? context.theme.photoIconColor
                        : Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: CustomTextField(
                    controller: null,
                    keyBoardType: TextInputType.number,
                    hintText: '在这里输入你的昵称',
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: context.theme.photoIconColor,
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: CustomElevatedButton(
        onPressed: set,
        text: 'NEXT',
        bottonWidth: 80,
      ),
    );
  }
}
