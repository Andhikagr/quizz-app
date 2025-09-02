import 'package:flutter/material.dart';
import 'package:quizz_app/homepage.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Opacity(
            //   opacity: 0.7,
            //   child: Image.asset('assets/quiztime.png', width: 300),
            // ),
            Image.asset('assets/quiztime.png', width: 300),

            SizedBox(height: 10),
            Text(
              "Learn Flutter the fun way!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
              // child: Text("Start Quiz", style: TextStyle(color: Colors.white),
              icon: Icon(Icons.arrow_right_alt),
              label: Text("Start Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
