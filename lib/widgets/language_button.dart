import 'package:flutter/material.dart';
import 'package:harucat/common/utils/coloors.dart';
import 'package:harucat/common/widgets/custom_icon_buttom.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  showBottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10), //自适应大小
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // IconButton(
                    //   onPressed: () => Navigator.of(context).pop(),
                    //   splashColor: Colors.transparent,
                    //   splashRadius: 22,
                    //   iconSize: 22,
                    //   padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    //   constraints: const BoxConstraints(maxWidth: 40),
                    //   icon: Icon(
                    //     Icons.close_outlined,
                    //     color: Coloors.greyLight,
                    //   ),
                    // ),
                    CustomIconButton(
                        onTap: () => Navigator.of(context).pop(),
                        icon: Icons.close_outlined),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'App Language',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color.fromARGB(255, 197, 196, 196),
                  thickness: 1,
                ),
                RadioListTile(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {},
                  activeColor: Coloors.greenLight,
                  title: Text("English"),
                  // subtitle: const Text(
                  //   "(Phone's Language)",
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ),
                RadioListTile(
                  value: true,
                  groupValue: false,
                  onChanged: (value) {},
                  activeColor: Coloors.greenLight,
                  title: Text("简体中文"),
                  // subtitle: const Text(
                  //   "(手机语言)",
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ),
                RadioListTile(
                  value: true,
                  groupValue: false,
                  onChanged: (value) {},
                  activeColor: Coloors.greenLight,
                  title: Text("Follower system"),
                  // subtitle: const Text(
                  //   "(系统语言)",
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //   ),
                  // ),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => showBottomSheet(context),
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.language,
                color: Colors.blueGrey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'English',
                style: TextStyle(
                  color: Colors.blueGrey,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
