// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:translator/translator.dart';

part 'google_translate_event.dart';
part 'google_translate_state.dart';

EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) {
    return events.debounce(duration).switchMap(mapper);
  };
}

const debounceDuration = Duration(milliseconds: 50);

class GoogleTranslateBloc
    extends Bloc<GoogleTranslateEvent, GoogleTranslateState> {
  final GoogleTranslator googleTranslator;
  GoogleTranslateBloc({required this.googleTranslator})
      : super(const GoogleTranslateState()) {
    on<GoogleTranslateInitData>(_onGoogleTranslateInitData);
    on<GoogleTranslateTyping>(_onTypingAndTranslate);
    on<Translate>(_onTranslate, transformer: debounce(debounceDuration));
    on<GoogleTranslateChangeSourceLanguage>(
        _onGoogleTranslateChangeSourceLanguage);
    on<GoogleTranslateChangeTargetLanguage>(
        _onGoogleTranslateChangeTargetLanguage);
    on<GoogleTranslateSwapLanguages>(_onGoogleTranslateSwapLanguage);
  }

  Future<void> _onGoogleTranslateInitData(GoogleTranslateInitData event,
      Emitter<GoogleTranslateState> emitter) async {
    emitter(state.copyWith(
        inputText: event.state.inputText,
        resultText: event.state.resultText,
        sourceLanguage: event.state.sourceLanguage,
        targetLanguage: event.state.targetLanguage));
  }

  void _onTypingAndTranslate(GoogleTranslateTyping event,
      Emitter<GoogleTranslateState> emitter) async {
    emitter(state.copyWith(inputText: event.inputText));
    add(Translate());
  }

  Future<void> _onTranslate(
      Translate event, Emitter<GoogleTranslateState> emitter) async {
    if (state.inputText != "") {
      try {
        final resultText = await googleTranslator.translate(state.inputText,
            from: state.sourceLanguage, to: state.targetLanguage);
        emitter(state.copyWith(resultText: resultText.text));
      } catch (e) {
        print(e);
      }
    } else {
      emitter(state.copyWith(resultText: ""));
    }
  }

  void _onGoogleTranslateChangeSourceLanguage(
      GoogleTranslateChangeSourceLanguage event,
      Emitter<GoogleTranslateState> emitter) {
    emitter(state.copyWith(sourceLanguage: event.from));
  }

  void _onGoogleTranslateChangeTargetLanguage(
      GoogleTranslateChangeTargetLanguage event,
      Emitter<GoogleTranslateState> emitter) {
    emitter(state.copyWith(targetLanguage: event.to));
  }

  void _onGoogleTranslateSwapLanguage(GoogleTranslateSwapLanguages event,
      Emitter<GoogleTranslateState> emitter) {
    emitter(state.copyWith(
        sourceLanguage: state.targetLanguage,
        targetLanguage: state.sourceLanguage,
        inputText: state.resultText,
        resultText: state.inputText));
  }
}
