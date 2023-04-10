import 'package:flutter/material.dart';
import 'package:jadeapp/common/widgets/custom_icon_buttom.dart';
import 'package:jadeapp/feature/home/pages/call_home_page.dart';
import 'package:jadeapp/feature/home/pages/chat_home_page.dart';
import 'package:jadeapp/feature/home/pages/status_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'JadeAPP',
            style: TextStyle(letterSpacing: 1),
          ),
          elevation: 1,
          actions: [
            CustomIconButton(onTap: () {}, icon: Icons.search),
            CustomIconButton(onTap: () {}, icon: Icons.more_vert),
          ],
          bottom: const TabBar(
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Tab(
                text: 'RECOMMEND',
              ),
              Tab(
                text: 'FOCUS',
              ),
              Tab(
                text: 'NEARBY',
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          ChatHomePage(),
          StatusHomePage(),
          CallHomePage(),
        ]),
      ),
    );
  }
}
