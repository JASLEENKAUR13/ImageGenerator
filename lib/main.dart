import 'package:flutter/material.dart';
import 'package:image_generator/features/prompt/Ui/create_prompt_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Generator App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900] ,
        brightness: Brightness.dark
       ),
      
      home: CreatePromptScreen(),
    );
  }
}


