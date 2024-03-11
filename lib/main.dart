import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:producer_type_beat/constant/routes.dart';
import 'package:producer_type_beat/constant/theme.dart';
import 'package:producer_type_beat/providers/recording_provider.dart';
import 'package:producer_type_beat/providers/sample_provider.dart';
import 'package:producer_type_beat/sample.dart';
import 'package:producer_type_beat/screens/home_screen.dart';
import 'package:producer_type_beat/screens/sample_details_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => RecordingProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => SampleProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        Routes.sampleDetailsRoute: (context) {
          final args = ModalRoute.of(context)!.settings.arguments;
          return SampleDetailsScreen(
            currentSample: args as Sample,
          );
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SampleProvider sampleProvider = context.read<SampleProvider>();

    return FutureBuilder(
      future: sampleProvider.setSampleDir(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            log(sampleProvider.listOfSamples.toString());
            return const HomePage();

          default:
            return const Scaffold(
              body: Center(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
        }
      },
    );
  }
}
