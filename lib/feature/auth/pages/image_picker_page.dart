import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jadeapp/common/extension/custom_them_extension.dart';
import 'package:jadeapp/common/helper/show_alert_dialog.dart';
import 'package:jadeapp/common/widgets/custom_icon_buttom.dart';
import 'package:photo_manager/photo_manager.dart';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  List<Widget> imageList = [];



  fetchAllImage() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) return PhotoManager.openSetting();

    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
      onlyAll: true,
    );
    List<AssetEntity> photos =
        await albums[0].getAssetListPaged(page: 0, size: 20);

    List<Widget> temp = [];

    // ignore: unused_local_variable
    for (var asset in photos) {
      temp.add(
        FutureBuilder(
            future: asset.thumbnailDataWithSize(
              const ThumbnailSize(300, 300),
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                if (snapshot.data == null) return const SizedBox();
                return Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 1,
                    ),
                    image: DecorationImage(
                      image:
                          MemoryImage(snapshot.data as Uint8List, scale: 1.0),
                    ),
                  ),
                );
              }
              return const SizedBox();
            }),
      );
    }
    setState(() {
      imageList.addAll(temp);
    });
  }



  @override
  void initState() {
    fetchAllImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: CustomIconButton(
          onTap: () => Navigator.pop(context),
          icon: Icons.arrow_back,
        ),
        title: Text(
          'JadeApp',
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        actions: [
          CustomIconButton(onTap: () {}, icon: Icons.more_vert),
        ],
      ),
      body: GridView.builder(
          itemCount: imageList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (_, index) {
            return imageList[index];
          }),
    );
  }
}
