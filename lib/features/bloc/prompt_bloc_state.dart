part of 'prompt_bloc_bloc.dart';

@immutable
sealed class PromptBlocState {}

final class PromptBlocInitial extends PromptBlocState {}

final class PromptgenratingImageLoadState extends PromptBlocState{}

final class PromptgenratingImageSuccessState extends PromptBlocState{
  final Uint8List file ;

  PromptgenratingImageSuccessState({required this.file});

}

final class PromptgenratingImageErrorState extends PromptBlocState{}
