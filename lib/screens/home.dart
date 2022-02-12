// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ts5/blocs/blocs.dart';
import 'package:flutter_ts5/models/data.dart';

import '../widgets/widgets.dart';
import 'views/views.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => GoogleTranslateBloc()),
      BlocProvider(create: (_) => TextToSpeechBloc()),
      BlocProvider(create: (_) => SpeechToTextBloc())
    ], child: const HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initBlocState();
  }

  void initBlocState() {
    context.read<GoogleTranslateBloc>().add(GoogleTranslateInit(
        googleTranslateState: TranslateCard.defaultData.googleTranslateState));
    context.read<SpeechToTextBloc>().add(SpeechToTextInit(
        speechToTextState: TranslateCard.defaultData.speechToTextState));
    context.read<TextToSpeechBloc>().add(TextToSpeechInit(
        textToSpeechState: TranslateCard.defaultData.textToSpeechState));
  }

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const double appBarHeight = 76.0;
    const double bottomNavigationBarHeight = 56.0;
    final double scafoldHeight =
        size.height - appBarHeight - bottomNavigationBarHeight;
    final double languageAreaHeight = scafoldHeight / 4;
    final double translateFieldHeight = languageAreaHeight * 2 - 60;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () async {}, icon: const Icon(Icons.delete)),
          IconButton(onPressed: () async {}, icon: const Icon(Icons.check))
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: currentIndex,
        onTap: _onItemTapped,
      ),
      body: context.watch<SpeechToTextBloc>().state.isListening
          ? const SpeechToTextView()
          : MyScafold(
              currentIndex: currentIndex,
              translateFieldHeight: translateFieldHeight,
              scafoldHeight: scafoldHeight,
              scafoldWidth: size.width,
            ),
      // floatingActionButton: FloatingActionButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const TextToSpeechPlayingButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              SpeechToTextRecordingButton(),
              SizedBox(
                width: 27.5,
              )
            ],
          )
        ],
      ),
    );
  }
}
