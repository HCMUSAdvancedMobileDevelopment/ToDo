import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/constants/hive_constants.dart';
import 'package:todo/di/stores_locator.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/ui/home/home.dart';

import 'constants/route_constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  // Hive.deleteFromDisk();
  await Hive.openBox<TodoModel>(HiveConstants.boxName);

  StoresLocator.setUp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TODO",
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepOrangeAccent,
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
          backgroundColor: Colors.deepOrange[400]
        ),
      ),
      routes: RouteConstants.routesMap,
      home: const SafeArea(
        child: Home(),
      ),
    );
  }
}
