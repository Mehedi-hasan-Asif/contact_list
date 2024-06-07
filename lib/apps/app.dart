
import 'package:contact_list/provider/contact_list_provider.dart';
import 'package:contact_list/themes/appbarstyle.dart';
import 'package:contact_list/themes/elevatedbutoon.dart';
import 'package:contact_list/themes/textfieldstyle.dart';
import 'package:contact_list/utils/colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home Screen/homescreen.dart';

class ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) { return ContactListProvider(); },
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        theme: ThemeData(
          appBarTheme: AppbarStyle.getAppBarTheme(),
          inputDecorationTheme: TextFieldStyle.getTextFieldStyle(),
          elevatedButtonTheme: ElevatedButtonStyle.getElevatedButtonStyle(),
          scaffoldBackgroundColor: whiteColor,
        ),
      ),
    );
  }
}