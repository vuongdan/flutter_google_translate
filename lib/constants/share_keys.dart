class ShareKeys {
  static const localCardsData = "localCardsData";
  static const deviceId = "deviceId";
}

class Data {
  static const defaultData = {
    'settings': {
      'text_to_speech_state': {'volume': 0.8, 'pitch': 1.0, 'rate': 0.5},
      'speech_to_text_state': {
        'listen_duration': 25,
        'pause_duration': 3,
      }
    },
    'cards': '',
    'user': {'name': 'VuongDan'}
  };
}
