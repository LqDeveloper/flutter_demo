import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/logger_utils.dart';
import 'network/api_request.dart';
import 'package:dio_demo/utils/string_extensions.dart';
import 'package:dio_demo/utils/shared_preferences_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SPUtils.initSP();
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      exit(1);
    };
    runApp(MyApp());
  }, (Object error, StackTrace stack) {});
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<MyApp> {
  String _text = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _text = SPUtils.preference.getString('key') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: Scaffold(
            body: Container(
          color: Colors.yellow,
          child: Center(
              child:CupertinoSwitch(
                value: true, onChanged: (bool value) {  },
              ) ,
        ))));
  }
}
