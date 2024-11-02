import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class tts extends StatefulWidget {
  const tts({super.key});

  @override
  State<tts> createState() => _ttsState();
}

class _ttsState extends State<tts> {
  TextEditingController value = TextEditingController();
  FlutterTts flutterTts = FlutterTts();


  speak()async{
    await flutterTts.speak(value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){flutterTts.stop();}),

      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Center(
              child: TextField(
                controller: value,
                decoration: InputDecoration(
                  hintText: "Enter text here",

                ),
              ),
            ),
          ),
          SizedBox(height: 30.0,),

          ElevatedButton(onPressed: (){speak();}, child: Icon(Icons.volume_down))

        ],
      ),

    );
  }
}
