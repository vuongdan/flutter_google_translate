import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:translator/translator.dart';

import '../../logic_bloc/blocs.dart';
import '../features_view/views.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => SpeechToTextBloc(speech: SpeechToText())),
      BlocProvider(create: (_) => TextToSpeechBloc(flutterTts: FlutterTts())),
      BlocProvider(
          create: (_) =>
              GoogleTranslateBloc(googleTranslator: GoogleTranslator()))
    ], child: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  bool isTyping = false;
  String mapIndexTitle({required int index}) {
    Map<int, String> map = {
      0: "Google Translate",
      1: "Saved Cards",
      2: "Self Learning",
      3: "Settings"
    };
    return map[index] ?? "";
  }

  @override
  void initState() {
    super.initState();
    blocsInitData();
  }

  void blocsInitData() {
    context.read<GoogleTranslateBloc>().add(const GoogleTranslateInitData(
        inputText: "", resultText: "", from: "vi", to: "en"));
    context.read<SpeechToTextBloc>().add(SpeechToTextInitData());
    context.read<TextToSpeechBloc>().add(TextToSpeechInitData());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double scafoldHeight = size.height;
    final double scafoldWidth = size.width;
    Widget child;
    switch (currentIndex) {
      case 0:
        child = TranslateView(
          width: scafoldWidth,
          height: scafoldHeight,
        );
        break;
      case 1:
        child = SavedCardsView(width: scafoldWidth, height: scafoldHeight);
        break;
      case 3:
        child = SettingsView(
          height: scafoldHeight,
          width: scafoldWidth,
        );
        break;

      default:
        child = SizedBox(
          width: scafoldWidth,
          height: scafoldHeight,
        );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(mapIndexTitle(index: currentIndex)),
      ),
      drawer: const FeaturesSettingDrawer(),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Saved"),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: "Learn"),
            BottomNavigationBarItem(icon: Icon(Icons.build), label: "Setting"),
          ]),
    );
  }
}
