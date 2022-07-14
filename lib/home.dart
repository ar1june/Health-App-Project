import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';    
            
import 'authentication.dart';    
import 'drawer.dart';
import 'main.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isloggedin = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.userChanges().listen((event) {
      if(event==null)
      {
        isloggedin = false;
      }
      else 
      {
        isloggedin = true;
      }
      setState(() {
        
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('ELEVATE-UP'),
        centerTitle: true,
        elevation: 25,
      ),
      
      drawer: Visibility(child: MyDrawer(0,0),
          visible: isloggedin,
          ),

      body: ListView(
        children: <Widget>[
          SizedBox(
              child: Image.asset('assets/images/health.jpeg'),
          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
        ],
      ),
      
    );
  }
}