import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/config/theme/app_theme.dart';
import 'package:todo_app/presentation/screens/home_screen.dart';

void main() {
  runApp(
   // DevicePreview(
    //  enabled: !kReleaseMode,
    //  builder: (context) => const ProviderScope(child: MyApp()), // Wrap your app
    
    const ProviderScope(child: ToDo()),
  );
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //DevicePreview
     // locale: DevicePreview.locale(context),
     // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      //DevicePreview

      theme: AppTheme().getAppTheme(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
