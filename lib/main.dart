import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main (){
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache(
    /*prefix: 'audios/' só para caso tenha uma pasta dentro de assets*/);

  bool primeiroPlay = true;

  _executar() async {
    if(primeiroPlay){
      audioPlayer = await audioCache.play("musica.mp3");
      primeiroPlay = false;
    }else{
      audioPlayer.resume();
    }



    //String url = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
    //int resultado = await audioPlayer.play(url);
  }

  _pause() async {
    int resultado = await audioPlayer.pause();

  }

  _stop () async {
    int resultado = await audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    _executar();
                  },
                  child: Container(
                    child: Icon(Icons.play_arrow, size: 70),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.orange
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                      _pause();
                  },
                  child: Container(
                    child: Icon(Icons.pause, size: 70),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.orange
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    _stop();
                  },
                  child: Container(
                    child: Icon(Icons.stop, size: 70),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.orange
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )

    );
  }
}
