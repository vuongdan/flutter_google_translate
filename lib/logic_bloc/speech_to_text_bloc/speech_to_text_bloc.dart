// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print, invalid_use_of_visible_for_testing_member

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_to_text_event.dart';
part 'speech_to_text_state.dart';

class SpeechToTextBloc extends Bloc<SpeechToTextEvent, SpeechToTextState> {
  final SpeechToText speech;
  SpeechToTextBloc({required this.speech}) : super(const SpeechToTextState()) {
    on<SpeechToTextInitData>(_onSpeechToTextInitData);
    on<SpeechToTextReadyToRecordnize>(_onSpeechToTextReadyToRecordnize);
    on<SpeechToTextStartRecognizing>(_onSpeechToTextStartRecordnizing);
    on<SpeechToTextCancelRecognizing>(_onSpeechToTextCancelRecordnizing);
    on<SpeechToTextDoneRecognizing>(_onSpeechToTextDoneRecordnizing);
    on<SpeechToTextWordByWord>(_onSpeechToTextWordByWord);
    on<SpeechToTextChangeLocale>(_onSpeechToTextChangeLocale);
    on<SpeechToTextChangePauseDuration>(_onSpeechToTextChangePauseDuration);
    on<SpeechToTextChangeListenDuration>(_onSpeechToTextChangeListemDuration);
    on<SpeechToTextStopRecognizing>(_onSpeechToTextStopRecordnizing);
  }
  Future<void> _onSpeechToTextInitData(
      SpeechToTextInitData event, Emitter<SpeechToTextState> emitter) async {
    emitter(state.copyWith(
      listenDuration: event.state.listenDuration,
      pauseDuration: event.state.pauseDuration,
      status: SpeechToTextStatus.ready,
      recognizedWords: "Enter Voice",
    ));
  }

  Future<SpeechToTextState> initData() async {
    bool available = await speech.initialize(
        onStatus: (status) {
          if (status == "done") {
            add(SpeechToTextDoneRecognizing());
          }
        },
        debugLogging: true);

    if (available == true) {
      try {
        final List<LocaleName> stateLocaleNames = [];
        final localeNames = await speech.locales();
        if (localeNames.isNotEmpty) {
          localeNames.forEach((element) {
            stateLocaleNames.add(element);
          });
        }
        final systmLocale = await speech.systemLocale();
        emit(state.copyWith(
            currentLocaleId: systmLocale?.localeId,
            localeNames: stateLocaleNames));
      } catch (_) {}
    } else {}
    return SpeechToTextState(
      currentLocaleId: state.currentLocaleId,
    );
  }

  void _onSpeechToTextReadyToRecordnize(
      SpeechToTextReadyToRecordnize event, Emitter<SpeechToTextState> emitter) {
    emitter(state.copyWith(
        status: SpeechToTextStatus.ready, recognizedWords: "Enter Voice"));
  }

  void _onSpeechToTextStartRecordnizing(
      SpeechToTextStartRecognizing event, Emitter emitter) async {
    emitter(state.copyWith(
        status: SpeechToTextStatus.recognizing,
        recognizedWords: "Enter Voice"));

    try {
      emitter(state.copyWith(
        status: SpeechToTextStatus.recognizing,
      ));
      speech.listen(
          cancelOnError: true,
          listenFor: Duration(seconds: state.listenDuration),
          pauseFor: Duration(seconds: state.pauseDuration),
          localeId: state.currentLocaleId,
          onResult: (result) {
            add(SpeechToTextWordByWord(currentText: result.recognizedWords));
          });
    } catch (_) {
      add(SpeechToTextCancelRecognizing());
    }
  }

  void _onSpeechToTextCancelRecordnizing(
      SpeechToTextCancelRecognizing event, Emitter<SpeechToTextState> emitter) {
    emitter(state.copyWith(
        status: SpeechToTextStatus.ready, recognizedWords: "Enter Voice"));
  }

  void _onSpeechToTextDoneRecordnizing(
      SpeechToTextDoneRecognizing event, Emitter emitter) {
    emitter(state.copyWith(status: SpeechToTextStatus.ready));
  }

  void _onSpeechToTextWordByWord(
      SpeechToTextWordByWord event, Emitter<SpeechToTextState> emitter) {
    emitter(state.copyWith(
        status: SpeechToTextStatus.recognizing,
        recognizedWords: event.currentText));
  }

  void _onSpeechToTextChangeLocale(
      SpeechToTextChangeLocale event, Emitter<SpeechToTextState> emitter) {
    emitter(state.copyWith(currentLocaleId: event.newLocale));
    print(state.currentLocaleId);
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

  void _onSpeechToTextStopRecordnizing(SpeechToTextStopRecognizing event,
      Emitter<SpeechToTextState> emitter) async {
    await speech.stop();
    emitter(state.copyWith(status: SpeechToTextStatus.ready));
  }
}
