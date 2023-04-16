import 'package:flutter/material.dart';
import 'package:harucat/common/extension/custom_them_extension.dart';
import 'package:harucat/common/routes/routest.dart';
import 'package:harucat/common/widgets/custom_icon_buttom.dart';
import 'package:harucat/feature/auth/widgets/custom_text_field.dart';

class VerifcationPage extends StatefulWidget {
   const VerifcationPage({super.key,  required this.verifcationId,  required this.phoneNumber});
  final String verifcationId;
  final String phoneNumber;

  @override
  State<VerifcationPage> createState() => _VerifcationPageState();
}

class _VerifcationPageState extends State<VerifcationPage> {
  late TextEditingController codeController;

  @override
  void initState() {
    codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          '核实你的电话号码',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(onTap: () {}, icon: Icons.more_vert),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(
                      color: context.theme.greyColor,
                      height: 1.5,
                    ),
                    children: [
                       TextSpan(
                        text: "您尝试注册,",
                      ),
                     
                      TextSpan(
                          text: '请输入正确的验证码',
                          style: TextStyle(
                            color: context.theme.blueColor,
                          ))
                    ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                controller: codeController,
                keyBoardType: TextInputType.number,
                hintText: '- - -  - - -',
                fontSize: 30,
                onChanged: (value) {
                  if (value.length == 6 && value.contains('888888')){
                    Navigator.of(context).pushNamedAndRemoveUntil(Routes.userInfo, (route) => false);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '输入6位验证码,注:888888',
              style: TextStyle(
                color: context.theme.greyColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.message,
                  color: context.theme.greyColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '发送验证码',
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: context.theme.blueColor!.withOpacity(0.6),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  color: context.theme.greyColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '语音短信',
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: context.theme.blueColor!.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }
}
