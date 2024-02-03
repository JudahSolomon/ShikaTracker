import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:rydex_driver_app/src/controller/HomeController.dart';

import '../../constants/Colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<HomeController>(builder: (ctrl) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: const Icon(Icons.arrow_back_ios_new),
              actions: const[
                Icon(Icons.settings),
              ],
            ),
            body: const SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    SizedBox(
                        width: 100,
                        height: 100,
                        child: Image(
                            image:
                            AssetImage("assets/images/profile_image.jpg"))),
                    Column(
                      children: [
                        Text(
                          "Jacobs Donald Sing",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: darkBlue),
                        ),
                        Text("jacobs_sing@gmail.com",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: grey)),
                        Text("Edit Profile",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: green)),

                        //GENERAL SETTINGS

                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  String iconName;

  ProfileWidget({required this.iconName, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Image.asset(
          iconName,
          width: 35.0,
          height: 35.0,
        ),
        title: Text(" widget.item",
            style: Theme
                .of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(
                color: darkBlue, fontWeight: FontWeight.w600, fontSize: 20.0)),
        subtitle: Text("widget.itemDetails",
            style: Theme
                .of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: grey, fontWeight: FontWeight.w400)),
        trailing: Column(children: [
          Text('',
              // Assuming price is a double
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                  color: black, fontWeight: FontWeight.w700, fontSize: 18.0)),
          Text(" widget.date",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: grey, fontWeight: FontWeight.w400)),
        ]),
      ),
    );
  }
}
