import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_ts5/logic_bloc/google_translate_bloc/google_translate_bloc.dart';
import 'package:flutter_ts5/logic_bloc/speech_to_text_bloc/speech_to_text_bloc.dart';
import 'package:flutter_ts5/logic_bloc/text_to_speech_bloc/text_to_speech_bloc.dart';
import 'package:flutter_ts5/models/translatecard_model.dart';
import 'package:uuid/uuid.dart';

import '../../constants/share_keys.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final FirebaseDatabase database = FirebaseDatabase.instance;
  final String _id;

  DatabaseBloc({required String id})
      : _id = id,
        super(const DatabaseState()) {
    on<DatabaseCreateCard>(_createCard);
  }

  Future<DatabaseState> getData(String id) async {
    final ref = await database.ref('users');
    final refUser = await ref.child('$_id').once();
    final data = await refUser.snapshot.value;
    if (data == null) {
      await ref.update({'$_id': ''});
      await ref.child('$_id').update(Data.defaultData);
      final SpeechToTextState speechToTextState =
          await getSpeechToTextSettings();
      final TextToSpeechState textToSpeechState =
          await getTextToSpeechSettings();
      return DatabaseState(
          speechToTextState: speechToTextState,
          textToSpeechState: textToSpeechState);
    } else {
      final SpeechToTextState speechToTextState =
          await getSpeechToTextSettings();
      final TextToSpeechState textToSpeechState =
          await getTextToSpeechSettings();
      final List<TranslateCard> list = await getCards();
      return DatabaseState(
          cards: list,
          speechToTextState: speechToTextState,
          textToSpeechState: textToSpeechState);
    }
  }

  Future<List<TranslateCard>> getCards() async {
    final cards = await database.ref('users/$_id/cards').once();
    final data = cards.snapshot.value;
    if (data == null) {
      print("Empty data");
      return [];
    } else {
      print(data);
      return [];
    }
  }

  Future<SpeechToTextState> getSpeechToTextSettings() async {
    final pauseDuration = await database
        .ref('users/$_id/settings/speech_to_text_state/pause_duration')
        .once();

    final listenDuration = await database
        .ref('users/$_id/settings/speech_to_text_state/listen_duration')
        .once();
    final int pauseDurationValue =
        int.parse(pauseDuration.snapshot.value.toString());
    final int listenDurationValue =
        int.parse(listenDuration.snapshot.value.toString());
    return SpeechToTextState(
        pauseDuration: pauseDurationValue, listenDuration: listenDurationValue);
  }

  Future<TextToSpeechState> getTextToSpeechSettings() async {
    final volume = await database
        .ref('users/$_id/settings/text_to_speech_state/volume')
        .once();
    final pitch = await database
        .ref('users/$_id/settings/text_to_speech_state/pitch')
        .once();
    final rate = await database
        .ref('users/$_id/settings/text_to_speech_state/rate')
        .once();
    final double volumeValue = double.parse(volume.snapshot.value.toString());
    final double pitchValue = double.parse(pitch.snapshot.value.toString());
    final double rateValue = double.parse(rate.snapshot.value.toString());
    return TextToSpeechState(
        volume: volumeValue, pitch: pitchValue, rate: rateValue);
  }

  void _createCard(DatabaseCreateCard event, Emitter emitter) async {
    final String cardId = Uuid().v1();
    final String creatAt = DateTime.now().toString();
    final cardsRef = await database.ref('users/$_id/cards');
    final newCard = await cardsRef.child('$cardId').once();
    final data = newCard.snapshot.value;
    if (data == null) {
      print("New card");
      cardsRef.update({
        cardId: {
          'create_at': creatAt,
          'last_update': creatAt,
          'is_pinned': false,
          'state': {
            'input_text': event.state.inputText,
            'result_text': event.state.resultText,
            'source_language': event.state.sourceLanguage,
            'target_language': event.state.targetLanguage
          }
        }
      });
    } else {
      print("Duplicate");
    }
  }
}
