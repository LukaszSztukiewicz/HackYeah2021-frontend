import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:landify/app/core/const/icons.dart';
import 'package:landify/app/core/const/string.dart';
import 'package:landify/app/core/const/vars.dart';
import 'package:landify/app/widgets/animatedtexts.dart';
import 'package:latlong2/latlong.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    MapController _mapctl = MapController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: vMspacing.w),
          child: Text(
            sAppTitle,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .apply(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, vMspacing.w, 0),
            child: IconButton(
              onPressed: () {
                if (Get.isDarkMode) {
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                }
              },
              icon: iconLightBulb,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          )
        ],
        //TODO leading: ,
      ),
      body: Stack(
        children: [
          Obx(
            () => SizedBox(
              width: 1920.w,
              height: 1080.h,
              child: FlutterMap(
                mapController: _mapctl,
                options: MapOptions(
                  center: LatLng(51.76, 19.46),
                  zoom: 10.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: Get.isDarkMode
                        ? "http://a.tile.stamen.com/toner/{z}/{x}/{y}.png"
                        : "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayerOptions(
                    markers: [
                      Marker(
                        point: controller.hasData.value
                            ? LatLng(controller.scores.coordinates.latitude,
                                controller.scores.coordinates.longitude)
                            : LatLng(51.76, 19.46),
                        builder: (ctx) => Transform.translate(
                            child: FaIcon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 100.w,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            offset: Offset.fromDirection(-500)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => SizedBox(
              width: 1200.w,
              height: 300.h,
              child: Column(
                mainAxisAlignment: controller.hasData.value
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                crossAxisAlignment: controller.hasData.value
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(vXLspacing.w),
                    child: const AnimatedTexts(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Theme.of(context).colorScheme.background,
                        child: SizedBox(
                          width: 960.w,
                          child: TextField(
                            onChanged: (str) =>
                                {controller.address.value = str},
                            autofillHints: const [
                              AutofillHints.streetAddressLevel1
                            ],
                            style: Theme.of(context).textTheme.headline3,
                            decoration: const InputDecoration(
                                hintText: sHintTextSearchBar,
                                labelText: sLabelTextSearchBar,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: mapMaker,
                                ),
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.snackbar(
                            sRequestSent,
                            controller.address.value,
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Theme.of(context).colorScheme.surface,
                            backgroundColor:
                                Theme.of(context).colorScheme.onBackground,
                            maxWidth: 500.w,
                            animationDuration:
                                const Duration(milliseconds: 500),
                            isDismissible: true,
                            duration: const Duration(milliseconds: 2500),
                          );
                          controller.getData();
                          _mapctl.move(
                              LatLng(controller.scores.coordinates.latitude,
                                  controller.scores.coordinates.longitude),
                              7.0);
                        },
                        child: Padding(
                            padding: EdgeInsets.all(vLspacing.w),
                            child: iconSearch),
                        style: ElevatedButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.button,
                            primary: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => SizedBox(
              width: 800.w,
              height: 500.h,
              child: controller.hasData.value
                  ? Card(
                      color: Theme.of(context).colorScheme.background,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: ListView(
                          padding: EdgeInsets.all(vLspacing.w),
                          children: [
                            ListTile(
                              leading: FaIcon(FontAwesomeIcons.adversal),
                              title: Text(
                                "Company flat",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              subtitle: Container(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  height: 20.h,
                                  width: controller.scores.targets.companyFlat *
                                      100),
                              trailing: Text(controller
                                      .scores.targets.companyFlat
                                      .toStringAsFixed(2) +
                                  "%"),
                            ),
                            ListTile(
                              leading: FaIcon(FontAwesomeIcons.adversal),
                              title: Text(
                                "Students",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              subtitle: Container(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  height: 20.h,
                                  width:
                                      controller.scores.targets.students * 100),
                              trailing: Text(controller
                                      .scores.targets.companyFlat
                                      .toStringAsFixed(2) +
                                  "%"),
                            ),
                            ListTile(
                              leading: FaIcon(FontAwesomeIcons.adversal),
                              title: Text(
                                "Couples",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              subtitle: Container(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  height: 20.h,
                                  width:
                                      controller.scores.targets.couples * 100),
                              trailing: Text(controller
                                      .scores.targets.companyFlat
                                      .toStringAsFixed(2) +
                                  "%"),
                            ),
                            ListTile(
                              leading: FaIcon(FontAwesomeIcons.adversal),
                              title: Text(
                                "Families",
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              subtitle: Container(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  height: 20.h,
                                  width:
                                      controller.scores.targets.families * 100),
                              trailing: Text(controller
                                      .scores.targets.companyFlat
                                      .toStringAsFixed(2) +
                                  "%"),
                            ),
                            ListTile(
                              title: Text(
                                  controller.scores.targets.couples.toString()),
                            ),
                            ListTile(
                              title: Text(controller.scores.targets.families
                                  .toString()),
                            ),
                            ListTile(
                              title: Text(
                                  controller.scores.targets.single.toString()),
                            ),
                            ListTile(
                              title: Text(controller.scores.targets.students
                                  .toString()),
                            ),
                          ],
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
