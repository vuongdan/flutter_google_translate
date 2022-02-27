import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:translator/translator.dart';

import '../../../logic_bloc/blocs.dart';
import 'features_view/views.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);
  static Page page() => const MaterialPage<void>(child: Home());

  @override
  Widget build(BuildContext context) {
    final id = context.select((AppBloc bloc) => bloc.state.user.id);
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => DatabaseBloc(id: id)),
      BlocProvider(create: (_) => SpeechToTextBloc(speech: SpeechToText())),
      BlocProvider(create: (_) => TextToSpeechBloc(flutterTts: FlutterTts())),
      BlocProvider(
          create: (_) =>
              GoogleTranslateBloc(googleTranslator: GoogleTranslator()))
    ], child: HomeScreen(id: id));
  }
}

class HomeScreen extends StatefulWidget {
  final String id;
  const HomeScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

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

  Future<void> blocsInitData() async {
    final DatabaseState state =
        await context.read<DatabaseBloc>().getData(widget.id);
    final SpeechToTextState speechId =
        await context.read<SpeechToTextBloc>().initData();
    final targetLanguage = speechId.currentLocaleId.substring(0, 2);
    context.read<GoogleTranslateBloc>().add(GoogleTranslateInitData(
        state: GoogleTranslateState(
            inputText: "",
            resultText: "",
            sourceLanguage: "auto",
            targetLanguage: targetLanguage)));
    context
        .read<SpeechToTextBloc>()
        .add(SpeechToTextInitData(state: state.speechToTextState));
    context
        .read<TextToSpeechBloc>()
        .add(TextToSpeechInitData(state: state.textToSpeechState));
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
      // case 1:
      //   child = const SavedCardsView(
      //       // width: scafoldWidth, height: scafoldHeight
      //       );
      //   break;
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
          child: Center(
              child:
                  Text(context.select((AppBloc bloc) => bloc.state.user.id))),
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
