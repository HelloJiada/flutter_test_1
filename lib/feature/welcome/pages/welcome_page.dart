import 'package:flutter/material.dart';
import 'package:jadeapp/common/extension/custom_them_extension.dart';
import 'package:jadeapp/common/routes/routest.dart';
import 'package:jadeapp/common/utils/coloors.dart';
import 'package:jadeapp/widgets/language_button.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../../../widgets/privacy_and_terms.dart';



class welcomePage extends StatelessWidget {
  const welcomePage({super.key});

  navigateToLoginPage(context){
    Navigator.of(context).pushNamedAndRemoveUntil(Routes.login, (route) => false,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          children: [
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 100,
                ),
                child: Image.asset('assets/logo-cat.png'),
              ),
            )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Column(
              children: [
                const Text(
                  "Welcome to JadeApp",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Coloors.authAppbarTextColor,
                  ),
                ),
                const PrivacyAndTerms(),
                const SizedBox(height: 55,),
                CustomElevatedButton(
                  onPressed: () => navigateToLoginPage(context),
                  text: 'Agree AND CONTINUE',
                ),
                const SizedBox(
                  height: 40,
                ),
               const LanguageButton(),
              ], 
            ))
          ],
        ));
  }
}

