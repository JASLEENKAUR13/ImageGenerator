import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:image_generator/features/Repo/promptRepo.dart';
import 'package:meta/meta.dart';

part 'prompt_bloc_event.dart';
part 'prompt_bloc_state.dart';

class PromptBlocBloc extends Bloc<PromptBlocEvent, PromptBlocState> {
  PromptBlocBloc() : super(PromptBlocInitial()) {
    on<onPromptEntered>(OnPromptEntered);
    
  }

  FutureOr<void> OnPromptEntered(onPromptEntered event, 
  Emitter<PromptBlocState> emit) async  {

    emit(PromptgenratingImageLoadState());
    Uint8List? myfile = await Promptrepo.generateImage(event.prompt);

    if(myfile != null && myfile.isNotEmpty){
      
      emit(PromptgenratingImageSuccessState(
       file : myfile));
    }else{

      emit(PromptgenratingImageErrorState());
    }






  }

  
}
