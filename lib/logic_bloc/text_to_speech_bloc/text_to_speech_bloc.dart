import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../constants/text_to_speech_constants.dart';

part 'text_to_speech_event.dart';
part 'text_to_speech_state.dart';

class TextToSpeechBloc extends Bloc<TextToSpeechEvent, TextToSpeechState> {
  final FlutterTts flutterTts;
  TextToSpeechBloc({required this.flutterTts})
      : super(const TextToSpeechState()) {
    on<TextToSpeechInitData>(_onTextToSpeechInitialData);
    on<TextToSpeechPlay>(_onTextToSpeechPlay);
    on<TextToSpeechPlay2>(_onTextToSpeechPlay2);
    on<TextToSpeechStop>(_onTextToSpeechStop);
    on<TextToSpeechChangePitch>(_onTextToSpeechChangePitch);
    on<TextToSpeechChangeVolume>(_onTextToSpeechChangeVolume);
    on<TextToSpeechChangeRate>(_onTextToSpeechChangeRate);
    on<TextToSpeechChangeVoice>(_onTextToSpeechChangeVoice);
  }

  Future<void> _onTextToSpeechInitialData(
      TextToSpeechInitData event, Emitter<TextToSpeechState> emitter) async {
    final languages = await flutterTts.getLanguages as List;
    final List<Voice> voices = [];

    final voicesList = await flutterTts.getVoices as List;
    voicesList.forEach(((element) {
      voices.add(
          TextToSpeechConstants.mapStringToVoiceObject(element.toString()));
    }));

    emitter(state.copyWith(
        volume: event.state.volume,
        pitch: event.state.pitch,
        rate: event.state.rate,
        languages: languages,
        voices: voices,
        voice: voices.last));
  }

  Future<void> _onTextToSpeechPlay(
      TextToSpeechPlay event, Emitter<TextToSpeechState> emitter) async {
    if (event.voice.name == "") {
      await flutterTts.setLanguage(event.voice.locale);
    } else {
      await flutterTts
          .setVoice({"name": event.voice.name, "locale": event.voice.locale});
    }

    await flutterTts.setVolume(state.volume);
    await flutterTts.setPitch(state.pitch);
    await flutterTts.setSpeechRate(state.rate);
    await flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback,
        [IosTextToSpeechAudioCategoryOptions.defaultToSpeaker]);
    if (
        // event.text != null &&
        event.text != "") {
      await flutterTts.speak(event.text);
      emitter(state.copyWith(status: TextToSpeechStatus.playing1));
    }
    flutterTts.setCompletionHandler(() {
      add(TextToSpeechStop());
    });
  }

  Future<void> _onTextToSpeechPlay2(
      TextToSpeechPlay2 event, Emitter<TextToSpeechState> emitter) async {
    if (event.voice2.name == "") {
      await flutterTts.setLanguage(event.voice2.locale);
    } else {
      await flutterTts
          .setVoice({"name": event.voice2.name, "locale": event.voice2.locale});
    }

    await flutterTts.setVolume(state.volume);
    await flutterTts.setPitch(state.pitch);
    await flutterTts.setSpeechRate(state.rate);
    await flutterTts.setIosAudioCategory(IosTextToSpeechAudioCategory.playback,
        [IosTextToSpeechAudioCategoryOptions.defaultToSpeaker]);
    if (event.text != "") {
      emitter(state.copyWith(status: TextToSpeechStatus.playing2));
      await flutterTts.speak(event.text);
    }
    flutterTts.setCompletionHandler(() {
      add(TextToSpeechStop());
    });
  }

  Future<void> _onTextToSpeechStop(
      TextToSpeechStop event, Emitter<TextToSpeechState> emitter) async {
    await flutterTts.stop();
    emitter(state.copyWith(status: TextToSpeechStatus.stoped));
  }

  void _onTextToSpeechChangePitch(
      TextToSpeechChangePitch event, Emitter<TextToSpeechState> emitter) {
    emitter(state.copyWith(pitch: event.newPitch));
  }

  void _onTextToSpeechChangeVolume(
      TextToSpeechChangeVolume event, Emitter<TextToSpeechState> emitter) {
    emitter(state.copyWith(volume: event.newVolume));
  }

  void _onTextToSpeechChangeRate(
      TextToSpeechChangeRate event, Emitter<TextToSpeechState> emitter) {
    emitter(state.copyWith(rate: event.newRate));
  }

  void _onTextToSpeechChangeVoice(
      TextToSpeechChangeVoice event, Emitter<TextToSpeechState> emitter) {
    emitter(state.copyWith(voice: event.newVoice));
  }
}
