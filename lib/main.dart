import 'package:chat_app/config/app_route.dart';
import 'package:chat_app/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppColor.primary,
          colorScheme:
              const ColorScheme.light().copyWith(primary: AppColor.primary)),
      routerConfig: AppRoute.routerConfig,
    );
  }
}
