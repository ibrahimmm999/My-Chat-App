import 'package:chat_app/config/app_route.dart';
import 'package:chat_app/config/theme.dart';
import 'package:chat_app/controller/c_feed.dart';
import 'package:chat_app/controller/c_home.dart';
import 'package:chat_app/controller/c_user.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id_ID').then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CUser()),
        ChangeNotifierProvider(create: (_) => CHome()),
        ChangeNotifierProvider(create: (_) => CFeed()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColor.primary,
            colorScheme:
                const ColorScheme.light().copyWith(primary: AppColor.primary)),
        routerConfig: AppRoute.routerConfig,
      ),
    );
  }
}
