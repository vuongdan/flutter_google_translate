// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_ts5/constants/google_translate_constants.dart';
// import 'package:flutter_ts5/models/translatecard_model.dart';

// import '../../../../logic_bloc/blocs.dart';

// class SavedCardsView extends StatelessWidget {
//   const SavedCardsView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TranslateCardsBloc, TranslateCardsState>(
//       builder: (context, state) {
//         if (state.listData.isEmpty) {
//           return const SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//           );
//         } else {
//           return Container(
//             padding: const EdgeInsets.all(8),
//             width: double.infinity,
//             height: double.infinity,
//             child: ListView.builder(
//                 itemCount: state.listData.length * 2 - 1,
//                 itemBuilder: (context, index) {
//                   if (index.isEven) {
//                     return ListTile(
//                         isThreeLine: true,
//                         onLongPress: () {
//                           context
//                               .read<TranslateCardsBloc>()
//                               .add(TranslateCardsRemoveItem(index: index ~/ 2));
//                         },
//                         title: Text(
//                             TranslateCard.fromJson(state.listData[index ~/ 2])
//                                 .googleTranslateState
//                                 .inputText),
//                         subtitle: Text(
//                             "${GoogleTranslateConstants.maplanguageCodeToName(languageCode: TranslateCard.fromJson(state.listData[index ~/ 2]).googleTranslateState.sourceLanguage)} > ${GoogleTranslateConstants.maplanguageCodeToName(languageCode: TranslateCard.fromJson(state.listData[index ~/ 2]).googleTranslateState.targetLanguage)}"),
//                         trailing: TranslateCard.fromJson(
//                                     state.listData[index ~/ 2])
//                                 .isPinned
//                             ? IconButton(
//                                 onPressed: () {
//                                   context.read<TranslateCardsBloc>().add(
//                                       TranslateCardsUnPinItem(
//                                           index: index ~/ 2));
//                                 },
//                                 icon: const Icon(
//                                   Icons.favorite,
//                                   color: Colors.red,
//                                 ))
//                             : IconButton(
//                                 onPressed: () {
//                                   context.read<TranslateCardsBloc>().add(
//                                       TranslateCardsPinItem(index: index ~/ 2));
//                                 },
//                                 icon: const Icon(
//                                   Icons.favorite,
//                                 )));
//                   } else {
//                     return const Divider();
//                   }
//                 }),
//           );
//         }
//       },
//     );
//   }
// }
