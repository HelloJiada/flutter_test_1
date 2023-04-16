import 'package:flutter/material.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
            text: '阅读我们的',
            style: TextStyle(
              color: Colors.black87,
              height: 1.5,
            ),
            children: [
              TextSpan(
                  text: ' 隐私政策',
                  style: TextStyle(
                    color: Colors.blue,
                    height: 1.5,
                  )),
              TextSpan(
                  text: ' 轻按“同意并继续”接受 ',
                  style: TextStyle(
                    color: Colors.black87,
                  )),
              TextSpan(
                  text: '服务条款.',
                  style: TextStyle(
                    color: Colors.blue,
                  ))
            ]),
      ),
    );
  }
}
