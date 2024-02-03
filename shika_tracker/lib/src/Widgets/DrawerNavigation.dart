// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../constants/Colors.dart';
// import 'Navigator.dart';
//
// class DrawerNavigation extends StatelessWidget {
//   const DrawerNavigation({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       elevation: 10.0,
//       child: ListView(
//         children: [
//           Container(
//             color: primaryColor,
//             height: 250.0,
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Image(
//                         image: AssetImage(
//                           "assets/images/profile_pic.png",
//                         ),
//                         width: 70,
//                         height: 70,
//                       ),
//                       Column(
//                         children: [
//                           const Text(
//                             "John Mensah Doe",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                                 fontSize: 16.0),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.only(top: 8.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(20)),
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 8.0, vertical: 2),
//                                 child: RichText(
//                                   text: const TextSpan(
//                                     style: TextStyle(
//                                         color: Colors.black, fontSize: 16),
//                                     children: <InlineSpan>[
//                                       WidgetSpan(
//                                         child: Icon(
//                                           Icons.star,
//                                           size: 16,
//                                           color: goldColor,
//                                         ),
//                                       ),
//                                       TextSpan(
//                                           text: ' Gold Member',
//                                           style: TextStyle(
//                                               color: goldColor, fontSize: 14)),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           // Text("John Mensah Doe"),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 30.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Icon(
//                               CupertinoIcons.time,
//                               size: 30,
//                               color: Colors.white,
//                             ),
//                             Icon(
//                               Icons.speed,
//                               size: 30,
//                               color: Colors.white,
//                             ),
//                             Icon(
//                               Icons.book,
//                               size: 30,
//                               color: Colors.white,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 30.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 Text(
//                                   "10.2",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       fontSize: 16.0),
//                                 ),
//                                 Text(
//                                   "Time Speed",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.normal,
//                                       color: Colors.white,
//                                       fontSize: 10.0),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   "10.2",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       fontSize: 16.0),
//                                 ),
//                                 Text(
//                                   "Time Speed",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.normal,
//                                       color: Colors.white,
//                                       fontSize: 10.0),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 Text(
//                                   "10.2",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                       fontSize: 16.0),
//                                 ),
//                                 Text(
//                                   "Time Speed",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.normal,
//                                       color: Colors.white,
//                                       fontSize: 10.0),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           // const UserAccountsDrawerHeader(
//           //     currentAccountPicture:
//           //         Image(image: AssetImage("assets/images/profile_pic.png")),
//           //     accountName: Text("John Mensah Doe"),
//           //     accountEmail: Text("johndoa@gmail.com")
//           // ),
//           ListTile(
//             leading: const Icon(
//               Icons.add,
//               color: Colors.grey,
//             ),
//             title: const Text("Add Vehicle",
//                 style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16.0,
//                     color: Colors.black)),
//             onTap: () {
//               PageNavigator(context: context)
//                   // .nextPage(page: const AddVehicleForm());
//             },
//           ),
//           ListTile(
//             leading: const Icon(
//               Icons.home,
//               color: Colors.grey,
//             ),
//             title: const Text("Accept Rides",
//                 style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16.0,
//                     color: Colors.black)),
//             onTap: () {
//               PageNavigator(context: context).nextPage(page:);
//             },
//           ),
//           ListTile(
//             leading: const Icon(
//               Icons.wallet,
//               color: Colors.grey,
//             ),
//             title: Text("My Wallet",
//                 style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16.0,
//                     color: Colors.black)),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.history,
//               color: Colors.grey,
//             ),
//             title: Text("History",
//                 style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16.0,
//                     color: Colors.black)),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.history,
//               color: Colors.grey,
//             ),
//             title: Text("Requests Accepted",
//                 style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16.0,
//                     color: Colors.black)),
//             onTap: () {
//               PageNavigator(context: context).nextPage(page: RequestAccepted());
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.history,
//               color: Colors.grey,
//             ),
//             title: Text("Select Route",
//                 style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16.0,
//                     color: Colors.black)),
//             onTap: () {
//               PageNavigator(context: context).nextPage(page: SelectRoute());
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.notifications,
//               color: Colors.grey,
//             ),
//             title: Text("Notifications",
//                 style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16.0,
//                     color: Colors.black)),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.card_giftcard,
//               color: Colors.grey,
//             ),
//             title: Text("Invite Friends",
//                 style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16.0,
//                     color: Colors.black)),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.settings,
//               color: Colors.grey,
//             ),
//             title: Text("Settings",
//                 style: TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16.0,
//                     color: Colors.black)),
//             onTap: () {},
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.logout,
//               color: Colors.grey,
//             ),
//             title: const Text(
//               "Logout",
//               style: TextStyle(
//                   fontWeight: FontWeight.normal,
//                   fontSize: 16.0,
//                   color: Colors.black),
//             ),
//             onTap: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
