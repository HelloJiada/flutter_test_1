import 'package:flutter/material.dart';
import 'package:harucat/common/extension/custom_them_extension.dart';
import 'package:harucat/common/routes/routest.dart';
import 'package:harucat/common/utils/coloors.dart';
import 'package:harucat/widgets/language_button.dart';

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
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Align(
              
              alignment: Alignment.topCenter,
              child: Padding(
                
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                child: Image.asset('assets/cat.jpg',fit: BoxFit.cover,width: double.infinity,),
              ),
            )),
            const SizedBox(
              height: 50,
            ),
            Expanded(
                child: Column(
              children: [
                const Text(
                  "欢迎使用 HaruCat",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Coloors.authAppbarTextColor,
                  ),
                ),
                const PrivacyAndTerms(),
                const SizedBox(height: 50,),
                CustomElevatedButton(
                  onPressed: () => navigateToLoginPage(context),
                  text: '同意并继续',
                ),
                const SizedBox(
                  height: 40,
                ),
              //  const LanguageButton(),
              ], 
            ))
          ],
        ));
  }
}

