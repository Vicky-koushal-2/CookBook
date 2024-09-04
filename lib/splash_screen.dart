
import 'package:cookbook/recipilist.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    _navigetehome();
  }

  _navigetehome() async{
    await Future.delayed(const Duration(seconds: 3),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Recipilist()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5D5B9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/cookbook.png',width: 250,height: 250,),
            SizedBox(height: 10,),
            Text('Cook Book',
            style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black
            ),),
            SizedBox(height: 20,),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
