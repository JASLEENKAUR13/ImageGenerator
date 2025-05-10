import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_generator/features/bloc/prompt_bloc_bloc.dart';

class CreatePromptScreen extends StatefulWidget {
  @override
  _PromptScreen createState() => _PromptScreen();
}

class _PromptScreen extends State<CreatePromptScreen> {
  final prompt = TextEditingController();
  final PromptBlocBloc mybloc = PromptBlocBloc();

  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        title: Text("Image Generator 😎", style: TextStyle(fontSize: 18)),
      ),
      body: BlocProvider(
        create: (context) => mybloc,
        child: BlocConsumer<PromptBlocBloc, PromptBlocState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch(state.runtimeType) {
              case PromptgenratingImageLoadState: 
                return Center(child: CircularProgressIndicator());
                
              case PromptgenratingImageErrorState:
                return Center(child: Text("Something went wrong"));
                
              case PromptgenratingImageSuccessState:
                final successState = state as PromptgenratingImageSuccessState;
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.grey[850]!, Colors.grey[900]!],
                          ),
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.55,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: MemoryImage(successState.file), 
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildInputSection(),
                  ],
                );
                
              default: 
                return Column(
                  children: [
                    
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.grey[850]!, Colors.grey[900]!],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.55,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image, size: 50, color: Colors.grey[600]),
                                  SizedBox(height: 10),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "✨ Imagine Anything ✨\n\n",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.amber
                                          )
                                        ),
                                        TextSpan(
                                          text: "Describe your vision and\nwatch the AI bring it to life!\n\n",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white70,
                                          )
                                        ),
                                        TextSpan(
                                          text: "Try: 'A futuristic city at sunset'\nor 'A cute robot petting a cat'",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[400],
                                            fontStyle: FontStyle.italic
                                          )
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildInputSection(),
                  ],
                );
            }
          },
        ),
      ),
    );
  }

  Widget _buildInputSection() {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: prompt,
              decoration: InputDecoration(
                hintText: "Enter prompt here",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), 
                ), 
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () {
              if (prompt.text.isNotEmpty) {
                mybloc.add(onPromptEntered(prompt: prompt.text));
              }
            }, 
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            label: Text("Generate", style: TextStyle(fontSize: 16)),
            icon: Icon(Icons.generating_tokens),
          ),
        ],
      ),
    );
  }
}