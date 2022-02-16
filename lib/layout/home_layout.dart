import 'package:flutter/material.dart';
import 'package:test_color_blindness/data/test_list.dart';
import 'package:test_color_blindness/modules/result_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key key}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  // ignore: prefer_final_fields
  PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  int score = 0;
  // ignore: deprecated_member_use
  List ans = List(38);
  int count = 0;
  // ignore: non_constant_identifier_names
  bool Arrowshow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Card ${index + 1} of 38',
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 1,
                    height: 8.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    questions[index].question,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Image(
                    width: 233.0,
                    height: 233.0,
                    image: AssetImage(
                      questions[index].image,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: Arrowshow,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                          iconSize: 50.0,
                          color: Colors.black,
                          onPressed: isPressed
                              ? index + 1 == questions.length
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ResultScreen(score, ans),
                                        ),
                                      );
                                    }
                                  : () {
                                      if (index + 1 == questions.length - 1) {
                                        Arrowshow = false;
                                      }
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.linear);
                                    }
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < questions[index].answer.length; i++)
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 250.0,
                          margin: const EdgeInsets.only(bottom: 18.0),
                          child: MaterialButton(
                            shape: const StadiumBorder(),
                            color: isPressed
                                ? questions[index]
                                        .answer
                                        .entries
                                        .toList()[i]
                                        .value
                                    ? isTrue
                                    : isWrong
                                : Colors.blueGrey,
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            onPressed: isPressed
                                ? () {}
                                : () {
                                    setState(() {
                                      isPressed = true;
                                    });
                                    if (questions[index]
                                        .answer
                                        .entries
                                        .toList()[i]
                                        .value) {
                                      score++;

                                      ans[count] = questions[index]
                                          .answer
                                          .entries
                                          .toList()[i]
                                          .key;
                                      count++;
                                      //ignore: avoid_print
                                      print(ans);
                                      //ignore: avoid_print
                                      print(score);
                                    } else {
                                      //ignore: avoid_print

                                      ans[count] = questions[index]
                                          .answer
                                          .entries
                                          .toList()[i]
                                          .key;
                                      count++;
                                      // ignore: avoid_print
                                      print(ans);
                                    }
                                  },
                            child: Text(
                              questions[index].answer.keys.toList()[i],
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  Visibility(
                    visible: !Arrowshow,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultScreen(score, ans),
                              ),
                            );
                          },
                          child: const Text(
                            'Show result',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
