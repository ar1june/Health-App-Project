import 'package:url_launcher/url_launcher.dart';

import '../drawer.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ELEVATE-UP'),
        centerTitle: true,
        elevation: 25,
      ),
      drawer: MyDrawer(0,0),
      body: Column(
        children: const [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Lets talk to X'),
            
            subtitle: Text('First step in healing is revealing'),
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Lets talk to Y.'),
            subtitle: Text('First step in healing is revealing'),
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Lets join Discord Server'),
            subtitle: Text('First step in healing is revealing'),
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Lets join Slack Server'),
            subtitle: Text('First step in healing is revealing'),
          ),
          ListTile(
            leading: Icon(Icons.android),
            title: Text("Let's chat with AIbot"),
            subtitle: Text('First step in healing is revealing'),
          ),
        ],
      ),
    );
  }
}
