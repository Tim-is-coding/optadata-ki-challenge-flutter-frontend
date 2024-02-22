// import 'package:flutter/material.dart';
// import 'package:flutter_locales/flutter_locales.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Locales.init(['en', 'ar']);
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LocaleBuilder(
//       builder: (locale) => MaterialApp(
//         debugShowCheckedModeBanner: false,
//         localizationsDelegates: Locales.delegates,
//         supportedLocales: Locales.supportedLocales,
//         locale: locale,
//         home: HomePage(),
//       ),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green[700],
//         title: const Text("Localization"),
//       ),
//       body: Container(
//         child: const Center(
//           child: LocaleText(
//             "welcome",
//             style: TextStyle(fontSize: 30),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.green[700],
//         child: const Icon(Icons.language_outlined,),
//         onPressed: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => LanguagePage()),
//         ),
//       ),
//     );
//   }
// }
//
// class LanguagePage extends StatefulWidget {
//   @override
//   _LanguagePageState createState() => _LanguagePageState();
// }
//
// class _LanguagePageState extends State<LanguagePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green[700],
//         title: const LocaleText("language"),
//       ),
//       body: Column(
//         children: [
//           ListTile(
//             title: const Text("English"),
//             onTap: () => LocaleNotifier.of(context)!.change('en'),
//           ),
//           ListTile(
//             title: const Text("دری"),
//             onTap: () => LocaleNotifier.of(context)!.change('ar'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:buzz/provider/proviercolors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'appstaticdata/routes.dart';
import 'login_signup/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ColorNotifire(),
        ),
      ],
      child: GetMaterialApp(
        locale: const Locale('en', 'US'),
        translations: AppTranslations(),
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.initial,
        getPages: getPage,
        title: 'Opta Data KI Challenge',
        theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            fontFamily: "Gilroy",
            dividerColor: Colors.transparent,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xFF0059E7),
            )),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'enter_mail': 'Enter your email',
        },
        'ur_PK': {
          'enter_mail': 'اپنا ای میل درج کریں۔',
        }
      };
}
