import 'package:flutter/widgets.dart';

import '../UI/screens/login/login.dart';
import '../UI/screens/screens.dart';
import '../logic_bloc/app_bloc/app_bloc.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [Home.page()];
    case AppStatus.unauthenticated:
    default:
      return [LoginPage.page()];
  }
}
