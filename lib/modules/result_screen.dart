import 'package:flutter/material.dart';
import 'package:test_color_blindness/modules/recap_answer_screen.dart';

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  final int score;
  // ignore: deprecated_member_use
  List ans = List(38);
  ResultScreen(this.score, this.ans, {Key key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int finalScore = 0;
  @override
  Widget build(BuildContext context) {
    finalScore = ((widget.score / 38) * 100).toInt();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'The Result..',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              Text(
                "$finalScore" " %",
                style: const TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 80.0,
              ),
              finalScore == 100
                  ? const Text(
                      "You don't have a type of color blindness",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )
                  : const Text(
                      "You have a type of color blindness",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
              const SizedBox(
                height: 80.0,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecapAnswer(widget.score, widget.ans),
                    ),
                  );
                },
                child: const Text(
                  'Recap your answer',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
