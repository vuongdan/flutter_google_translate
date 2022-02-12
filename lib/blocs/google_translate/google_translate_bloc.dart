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

const debounceDuration = Duration(milliseconds: 300);

class GoogleTranslateBloc
    extends Bloc<GoogleTranslateEvent, GoogleTranslateState> {
  final GoogleTranslator googleTranslator = GoogleTranslator();
  GoogleTranslateBloc() : super(const GoogleTranslateState()) {
    print("VD GTS create");
    on<GoogleTranslateTranslating>(
      _onGoogleTranslateTranslate,
    );
    on<GoogleTranslateTyping>(_onGoogleTranslateTypingEvent,
        transformer: debounce(debounceDuration));
    on<GoogleTranslateSwapLanguages>(_onGoogleTranslateSwapLanguageEvent);
    on<GoogleTranslateChangeTargetLanguage>(
        _onGoogleTranslateChangeTargetLanguageEvent);
    on<GoogleTranslateChangeSourceLanguage>(
        _onGoogleTranslateChangeSourceLanguageEvent);
    on<GoogleTranslateInit>(_onGoogleTranslateInit);
    on<GoogleTranslateRePlaceData>(_onGoogleTranslateReplaceDataEvent);
  }

  Future<void> _onGoogleTranslateReplaceDataEvent(
      GoogleTranslateRePlaceData event,
      Emitter<GoogleTranslateState> emitter) async {
    emitter(state.copyWith(
        inputText: event.googleTranslateState.inputText,
        resultText: event.googleTranslateState.resultText,
        from: event.googleTranslateState.from,
        to: event.googleTranslateState.to));
  }

  Future<void> _onGoogleTranslateInit(
      GoogleTranslateInit event, Emitter<GoogleTranslateState> emitter) async {
    emitter(state.copyWith(
        from: event.googleTranslateState.from,
        to: event.googleTranslateState.to,
        inputText: event.googleTranslateState.inputText,
        resultText: event.googleTranslateState.resultText));
  }

  void _onGoogleTranslateChangeSourceLanguageEvent(
      GoogleTranslateChangeSourceLanguage event,
      Emitter<GoogleTranslateState> emitter) {
    emitter(state.copyWith(from: event.from));
  }

  void _onGoogleTranslateChangeTargetLanguageEvent(
      GoogleTranslateChangeTargetLanguage event,
      Emitter<GoogleTranslateState> emitter) {
    emitter(state.copyWith(to: event.to));
  }

  void _onGoogleTranslateSwapLanguageEvent(GoogleTranslateSwapLanguages event,
      Emitter<GoogleTranslateState> emitter) {
    emitter(state.copyWith(
        from: event.currentTo,
        to: event.currentFrom,
        inputText: '',
        resultText: ''));
  }

  void _onGoogleTranslateTypingEvent(
      GoogleTranslateTyping event, Emitter<GoogleTranslateState> emitter) {
    emitter(state.copyWith(inputText: event.inputText));
    add(GoogleTranslateTranslating(
        inputText: state.inputText, from: state.from, to: state.to));
  }

  Future<void> _onGoogleTranslateTranslate(GoogleTranslateTranslating event,
      Emitter<GoogleTranslateState> emitter) async {
    if (event.inputText != null && event.inputText != "") {
      try {
        final result = await googleTranslator.translate(event.inputText!,
            from: event.from, to: event.to);
        emitter(state.copyWith(
            inputText: event.inputText, resultText: result.text));
      } catch (_) {}
    } else {
      emitter(state.copyWith(inputText: "", resultText: ""));
    }
  }
}
