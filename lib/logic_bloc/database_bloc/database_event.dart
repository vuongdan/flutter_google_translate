part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object> get props => [];
}

class DatabaseCreateCard extends DatabaseEvent {
  final GoogleTranslateState state;
  DatabaseCreateCard({
    required this.state,
  });
}
