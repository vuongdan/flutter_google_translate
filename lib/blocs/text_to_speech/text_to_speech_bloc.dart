import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../constants/ts_constants.dart';

part 'text_to_speech_event.dart';
part 'text_to_speech_state.dart';

class TextToSpeechBloc extends Bloc<TextToSpeechEvent, TextToSpeechState> {
  final FlutterTts flutterTts = FlutterTts();
  TextToSpeechBloc() : super(const TextToSpeechState()) {
    print("VD TTS create");
    on<TextToSpeechInit>(_onTextToSpeechInit);
    on<TextToSpeechChangePitch>(_onTextToSpeechChangePitchEvent);
    on<TextToSpeechChangeVolume>(_onTextToSpeechChangeVolumeEvent);
    on<TextToSpeechChangeRate>(_onTextToSpeechChangeRateEvent);
    on<TextToSpeechChangeVoice>(_onTextToSpeechChangeVoiceEvent);
    on<TextToSpeechTyping>(_onTextToSpeechTypingEvent);
    on<TextToSpeechPlay>(_onTextToSpeechPlayEvent);
    on<TextToSpeechStop>(_onTextToSpeechStopEvent);
    on<TextToSpeechReplaceData>(_onTextToSpeechReplaceDataEvent);
  }

  Future<void> _onTextToSpeechInit(
      TextToSpeechInit event, Emitter<TextToSpeechState> emitter) async {
    emitter(state.copyWith(
        pitch: event.textToSpeechState.pitch,
        volume: event.textToSpeechState.volume,
        rate: event.textToSpeechState.rate,
        status: event.textToSpeechState.status,
        voice: event.textToSpeechState.voice,
        voiceList: event.textToSpeechState.voiceList,
        textToSpeechText: event.textToSpeechState.textToSpeechText));
  }

  Future<void> _onTextToSpeechReplaceDataEvent(
      TextToSpeechReplaceData event, Emitter<TextToSpeechState> emitter) async {
    emitter(state.copyWith(
        voice: event.textToSpeechState.voice,
        voiceList: event.textToSpeechState.voiceList,
        textToSpeechText: event.textToSpeechState.textToSpeechText,
        pitch: event.textToSpeechState.pitch,
        volume: event.textToSpeechState.volume,
        rate: event.textToSpeechState.rate,
        status: event.textToSpeechState.status));
  }

  void _onTextToSpeechChangePitchEvent(
      TextToSpeechChangePitch event, Emitter<TextToSpeechState> emitter) {
    emitter(state.copyWith(pitch: event.newPitch));
  }

  void _onTextToSpeechChangeVolumeEvent(
      TextToSpeechChangeVolume event, Emitter<TextToSpeechState> emitter) {
    emitter(state.copyWith(volume: event.newVolume));
  }

  void _onTextToSpeechChangeRateEvent(
      TextToSpeechChangeRate event, Emitter<TextToSpeechState> emitter) {
    emitter(state.copyWith(rate: event.newRate));
  }

  void _onTextToSpeechChangeVoiceEvent(
      TextToSpeechChangeVoice event, Emitter<TextToSpeechState> emitter) {
    emitter(state.copyWith(voice: event.newVoice));
  }

  void _onTextToSpeechTypingEvent(
      TextToSpeechTyping event, Emitter<TextToSpeechState> emitter) {
    emitter(state.copyWith(textToSpeechText: event.textToSpeechText));
  }

  void _onTextToSpeechPlayEvent(
      TextToSpeechPlay event, Emitter<TextToSpeechState> emitter) async {
    await flutterTts.setVoice({
      "name": TextToSpeechConstants.mapVoiceCodeToName(state.voice),
      "locale": TextToSpeechConstants.mapVoiceCodeToLocale(state.voice)
    });
    await flutterTts.setVolume(state.volume);
    await flutterTts.setPitch(state.pitch);
    await flutterTts.setSpeechRate(state.rate);
    await flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback,
        [IosTextToSpeechAudioCategoryOptions.defaultToSpeaker]);
    if (event.textToSpeechText.isNotEmpty && event.textToSpeechText != "") {
      emitter(state.copyWith(status: TextToSpeechStatus.playing));
      await flutterTts.speak(event.textToSpeechText);
    }
    flutterTts.setCompletionHandler(() {
      add(TextToSpeechStop());
    });
  }

  void _onTextToSpeechStopEvent(
      TextToSpeechStop event, Emitter<TextToSpeechState> emitter) async {
    await flutterTts.stop();
    emitter(state.copyWith(status: TextToSpeechStatus.stoped));
  }
}
