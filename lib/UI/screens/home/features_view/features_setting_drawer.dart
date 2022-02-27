import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic_bloc/blocs.dart';

class FeaturesSettingDrawer extends StatelessWidget {
  const FeaturesSettingDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
          child: TextButton(
              onPressed: () {
                context.read<AppBloc>().add(AppLogoutRequested());
              },
              child: const Text("Logout"))),
    );
  }
}
