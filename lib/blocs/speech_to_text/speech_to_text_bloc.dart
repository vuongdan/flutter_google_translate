import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ts5/constants/ts_constants.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_to_text_event.dart';
part 'speech_to_text_state.dart';

class SpeechToTextBloc extends Bloc<SpeechToTextEvent, SpeechToTextState> {
  final SpeechToText speech = SpeechToText();
  SpeechToTextBloc() : super(const SpeechToTextState()) {
    print("VD STT create");
    on<SpeechToTextCancelListening>(_onSpeechToTextCancelListeningEvent);
    on<SpeechToTextStartListening>(_onSpeechToTextStartListeningEvent);
    on<SpeechToTextWordByWordListening>(
        _onSpeechToTextWordByWordListeningEvent);
    on<SpeechToTextInit>(_onSpeechToTextInit);
    on<SpeechToTextListenDone>(_onSpeechToTextListenDone);
    on<SpeechToTextChangePauseDuration>(_onSpeechToTextChangePauseDuration);
    on<SpeechToTextChangeListenDuration>(_onSpeechToTextChangeListemDuration);
    on<SpeechToTextReplaceData>(_onSpeechToTextReplaceDataEvent);
    on<SpeechToTextChangeLocale>(_onSpeechToTextChangeLocale);
  }

  Future<void> _onSpeechToTextReplaceDataEvent(
      SpeechToTextReplaceData event, Emitter<SpeechToTextState> emitter) async {
    emitter(state.copyWith(
      pauseDuration: event.speechToTextState.pauseDuration,
      listenDuration: event.speechToTextState.listenDuration,
      isListening: event.speechToTextState.isListening,
      recognizedWords: event.speechToTextState.recognizedWords,
      currentLocaleId: event.speechToTextState.currentLocaleId,
    ));
  }

  void _onSpeechToTextChangeLocale(
      SpeechToTextChangeLocale event, Emitter<SpeechToTextState> emitter) {
    emitter(state.copyWith(currentLocaleId: event.newLocale));
  }

  void _onSpeechToTextChangePauseDuration(SpeechToTextChangePauseDuration event,
      Emitter<SpeechToTextState> emitter) {
    emitter(state.copyWith(pauseDuration: event.newPauseDuration));
  }

  void _onSpeechToTextChangeListemDuration(
      SpeechToTextChangeListenDuration event,
      Emitter<SpeechToTextState> emitter) {
    emitter(state.copyWith(listenDuration: event.newListenDuration));
  }

  Future<void> _onSpeechToTextInit(
      SpeechToTextInit event, Emitter<SpeechToTextState> emitter) async {
    emitter(state.copyWith(
        localeIds: event.speechToTextState.localeIds,
        currentLocaleId: event.speechToTextState.currentLocaleId,
        pauseDuration: event.speechToTextState.pauseDuration,
        listenDuration: event.speechToTextState.listenDuration,
        isListening: event.speechToTextState.isListening,
        recognizedWords: event.speechToTextState.recognizedWords));
  }

  void _onSpeechToTextWordByWordListeningEvent(
      SpeechToTextWordByWordListening event,
      Emitter<SpeechToTextState> emitter) {
    emitter(
        state.copyWith(isListening: true, recognizedWords: event.currentText));
  }

  void _onSpeechToTextListenDone(
      SpeechToTextListenDone event, Emitter<SpeechToTextState> emitter) {
    emitter(state.copyWith(isListening: false));
  }

  void _onSpeechToTextStartListeningEvent(SpeechToTextStartListening event,
      Emitter<SpeechToTextState> emitter) async {
    emitter(state.copyWith(isListening: true, recognizedWords: "Enter Voice"));
    bool available = await speech.initialize(onError: (e) {
      add(SpeechToTextCancelListening());
    }, onStatus: (status) {
      if (status == 'done') {
        add(SpeechToTextListenDone());
      }
    });
    if (available == true) {
      try {
        // final localeNames = await speech.locales();
        // final systemLocale = await speech.systemLocale();
        emitter(state.copyWith(
          isListening: true,
          // currentLocaleId: systemLocale?.localeId,
          // localeNames: localeNames,
        ));
        speech.listen(
            cancelOnError: true,
            listenFor: Duration(seconds: state.listenDuration),
            //setting
            pauseFor: Duration(seconds: state.pauseDuration),
            //setting
            localeId: state.currentLocaleId,
            //setting
            onResult: (result) {
              add(SpeechToTextWordByWordListening(
                  currentText: result.recognizedWords));
            });
      } catch (_) {
        add(SpeechToTextCancelListening());
      }
    } else {
      add(SpeechToTextCancelListening());
    }
  }

  void _onSpeechToTextCancelListeningEvent(SpeechToTextCancelListening event,
      Emitter<SpeechToTextState> emitter) async {
    emitter(state.copyWith(recognizedWords: "", isListening: false));
    await speech.cancel();
  }
}
