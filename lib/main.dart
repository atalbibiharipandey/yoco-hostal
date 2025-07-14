import 'package:flutter_application_1/core/common.dart';
import 'package:flutter_application_1/presentation/screens.dart' as s;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    size = getSize(context);
    return MaterialApp(
      title: 'YOCO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: cPrimery),
          useMaterial3: true,
          fontFamily: "Quicksand",
          scaffoldBackgroundColor: cwhite,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: borderRadius12),
                  backgroundColor: cPrimery,
                  foregroundColor: cwhite))),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            // textScaler: TextScaler.linear(1),
            alwaysUse24HourFormat: false,
            textScaler: TextScaler.linear(
                1.0), // 👈 Ye OS ke text size scale ko ignore karega
          ),
          child: child!,
        );
      },
      home: s.LoginPageScreen(),
    );
  }
}
