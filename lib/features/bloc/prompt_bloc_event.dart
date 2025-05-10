part of 'prompt_bloc_bloc.dart';

@immutable
sealed class PromptBlocEvent {}



class onPromptEntered extends PromptBlocEvent {
  String prompt ; 

  onPromptEntered({required this.prompt});
 

}


