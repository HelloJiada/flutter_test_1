

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jadeapp/common/helper/show_alert_dialog.dart';
import 'package:jadeapp/common/routes/routest.dart';

import 'package:jadeapp/common/utils/coloors.dart';
import 'package:jadeapp/common/widgets/custom_elevated_button.dart';
// import 'package:jadeapp/feature/auth/controller/auth_controller.dart';
import 'package:jadeapp/feature/auth/widgets/custom_text_field.dart';

import '../../../common/widgets/custom_icon_buttom.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController countryNumberController;

sendCodeToPhone() {
  final phoneNumber = countryNumberController.text;
  final countryName = countryNameController.text;
  final countryCode = countryCodeController.text;

  if(phoneNumber.isEmpty) {
    return showAlertDialog(context: context, message: 'Please enter you phone number');
  }
   
  else if(phoneNumber.length != 11) {
    return showAlertDialog(context: context, message: 'Please enter the correct mobile phone number in $countryName.Thank you.');
   }

// ref.read(authControllerProvider).sendSmsCode(context: context, phoneNumber: '+$countryCode$phoneNumber');
   Navigator.of(context).pushNamedAndRemoveUntil(Routes.verification, (route) => false,arguments: {"verifcationId":countryCode,"phoneNumber":phoneNumber});
   
}

  showCountryCodePicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['English', 'China'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).backgroundColor,
        flagSize: 20,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(
          color: Colors.grey,
        ),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: Icon(
            Icons.language,
            color: Coloors.greenLight,
          ),
          hintText: 'Search country code or name',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Coloors.greenLight,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.phoneCode;
      },
    );
  }

  @override
  void initState() {
    countryNameController = TextEditingController(text: "China");
    countryCodeController = TextEditingController(text: "86");
    countryNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    countryNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          "Enter your phone number",
          style: TextStyle(color: Coloors.authAppbarTextColor),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  text: "JadeApp will need to verify your phone number",
                  style: TextStyle(
                    color: Coloors.greyDark,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: " what's my number",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomTextField(
                onTap: showCountryCodePicker,
                readOnly: true,
                suffixIcon: const Icon(
                  Icons.arrow_drop_down,
                  color: Coloors.greenLight,
                ),
                controller: countryNameController,
                keyBoardType: null,
              )),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    controller: countryCodeController,
                    prefixText: "+",
                    readOnly: true,
                    onTap: showCountryCodePicker,
                    keyBoardType: null,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomTextField(
                    controller: countryNumberController,
                    onTap: () {},
                    hintText: "phone number",
                    textAlign: TextAlign.left,
                    keyBoardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Carrier charges may apply',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodeToPhone,
        text: 'NETX',
        bottonWidth: 90,
      ),
    );
  }
}
