import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomeView',
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'HomeView',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'HomeView',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'HomeView',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'HomeView',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'HomeView',
              style: Theme.of(context).textTheme.headline5,
            ),
          ]),
    );
  }
}
