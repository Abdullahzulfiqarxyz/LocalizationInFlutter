import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', '');

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).translate('title'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      home: MyHomePage(changeLanguage: _changeLanguage),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(Locale) changeLanguage;

  const MyHomePage({super.key, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('title')),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              switch (value) {
                case 'English':
                  changeLanguage(const Locale('en', ''));
                  break;
                case 'Spanish':
                  changeLanguage(const Locale('es', ''));
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'English',
                  child: Text('English'),
                ),
                const PopupMenuItem<String>(
                  value: 'Spanish',
                  child: Text('Spanish'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Text(AppLocalizations.of(context).translate('greeting')),
      ),
    );
  }
}
