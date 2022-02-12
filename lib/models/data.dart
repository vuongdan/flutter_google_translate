// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter_ts5/constants/ts_constants.dart';

import '../blocs/blocs.dart';

class Data {
  final List<TranslateCard> translateCards;
  const Data({required this.translateCards});

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        translateCards: List<TranslateCard>.from(
            json["translate_cards"].map((x) => TranslateCard.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "translate_cards":
            List<dynamic>.from(translateCards.map((x) => x.toMap())),
      };

  static const defaultData = Data(translateCards: [TranslateCard.defaultData]);
  bool get isDefault => this == Data.defaultData;
  bool get isNotDefault => this != Data.defaultData;
}

class TranslateCard {
  final GoogleTranslateState googleTranslateState;
  final TextToSpeechState textToSpeechState;
  final SpeechToTextState speechToTextState;
  const TranslateCard({
    required this.googleTranslateState,
    required this.textToSpeechState,
    required this.speechToTextState,
  });
  factory TranslateCard.fromJson(String str) =>
      TranslateCard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TranslateCard.fromMap(Map<String, dynamic> json) => TranslateCard(
        googleTranslateState:
            GoogleTranslateState.fromMap(json["google_translate_state"]),
        textToSpeechState:
            TextToSpeechState.fromMap(json["text_to_speech_state"]),
        speechToTextState:
            SpeechToTextState.fromMap(json["speech_to_text_state"]),
      );

  Map<String, dynamic> toMap() => {
        "google_translate_state": googleTranslateState.toMap(),
        "text_to_speech_state": textToSpeechState.toMap(),
        "speech_to_text_state": speechToTextState.toMap(),
      };
  static const defaultData = TranslateCard(
      googleTranslateState: GoogleTranslateState(
          from: "auto", to: "en", inputText: "", resultText: ""),
      textToSpeechState: TextToSpeechState(
          voice: "Alex (en-US)",
          voiceList: TextToSpeechConstants.textToSpeechVoiceName,
          textToSpeechText: "",
          pitch: 1.0,
          volume: 0.8,
          rate: 0.5,
          status: TextToSpeechStatus.stoped),
      speechToTextState: SpeechToTextState(
          listenDuration: 30,
          pauseDuration: 3,
          isListening: false,
          status: SpeechToTextStatus.unknown,
          recognizedWords: "Enter Voice",
          currentLocaleId: "en-US",
          localeIds: SpeechToTextConstants.localeIds));
}
