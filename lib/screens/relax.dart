import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../drawer.dart';

const img = 'assets/images/';


class Relax extends StatelessWidget {
  const Relax({Key? key}) : super(key: key);

  row(s1, s2, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [soundBtn(s1, context), soundBtn(s2, context),],
    );
  }

  soundBtn(sound, context) {
    return GestureDetector(
      onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PlayRoute(sound: sound))); },
      child: Column(
        children: [
          Image.asset('assets/icons/$sound.png'),
          Text(sound.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 16, letterSpacing: 3.0))
        ],
      ),
    );
  }

  @override
  build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ELEVATE-UP'),
        centerTitle: true,
        elevation: 25,
      ),
      
      drawer: MyDrawer(0,0),

      body: Stack(
        children: [
          Positioned(top: 115, width: width, child: const Text('Relax With Nature', textAlign: TextAlign.center, textScaleFactor: 3,)),
          Positioned(top: 250, width: width, child: Column(
            children: [row('rain', 'forest', context)],)
          ),
        ],
      ),
    );
  }
}

class PlayRoute extends StatefulWidget {
  final String sound;
  const PlayRoute({Key? key, required this.sound}) : super(key: key);
  @override
  _PlayRouteState createState() => _PlayRouteState();
}

class _PlayRouteState extends State<PlayRoute> {
  late AudioPlayer player;
  late AudioCache cache;
  bool initialPlay = true;
  late bool playing;

  @override
  initState() {
    super.initState();
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
  }

  @override
  dispose() {
    super.dispose();
    player.stop();
  }

  playPause(sound) {
    if (initialPlay) {
      cache.play('audio/$sound.mp3');
      playing = true;
      initialPlay = false;
    }
    return IconButton(
      color: Colors.white70, iconSize: 50.0, icon: playing ? const Icon(Icons.pause_circle_filled) : const Icon(Icons.play_circle_filled),
      onPressed: () {
        setState(() {
          if (playing) {
            playing = false;
            player.pause();
          } else {
            playing = true;
            player.resume();
          }
        });
      },
    );
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 0, left: 0, child: Background(sound: widget.sound)),
          Positioned(top: 0, left: 0, right: 0, child: AppBar(backgroundColor: Colors.transparent, elevation: 0)),
          Padding(padding: const EdgeInsets.only(top: 180.0),
            child: Center(
              child: Column(children: [Text(widget.sound.toUpperCase()), playPause(widget.sound)])
            )
          ),
        ],
      ),
    );
  }
}

class Background extends StatefulWidget {
  final String sound;
  const Background({Key? key, required this.sound}) : super(key: key);
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  late Timer timer;
  bool _visible = false;

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  swap() {
    if (mounted) {
      setState(() { _visible = !_visible;
      });
    }
  }

  @override
  build(BuildContext context) {
    timer = Timer(const Duration(seconds: 6), swap);
    return Stack(
      children: [
        Image.asset(img + widget.sound + '_1.jpg'),
      ],
    );
  }
}
