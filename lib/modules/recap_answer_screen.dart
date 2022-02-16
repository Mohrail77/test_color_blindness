import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_color_blindness/components/components.dart';
import 'package:test_color_blindness/data/test_list.dart';
import 'package:test_color_blindness/modules/result_screen.dart';

// ignore: must_be_immutable
class RecapAnswer extends StatefulWidget {
  final int score;
  // ignore: deprecated_member_use
  List ans = List(38);
  RecapAnswer(this.score, this.ans, {Key key}) : super(key: key);

  @override
  State<RecapAnswer> createState() => _RecapAnswerState();
}

class _RecapAnswerState extends State<RecapAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        shadowColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(widget.score, widget.ans),
              ),
            );
          },
        ),
      ),
      body: ConditionalBuilder(
        condition: true,
        builder: (context) => ListView.separated(
          itemCount: questions.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(10.0.w),
            child: Container(
              child: buildReport(
                questions[index].image,
                'Your answer : ' + widget.ans[index],
                'Normal view : ' +
                    questions[index].answer.keys.firstWhere(
                        (k) => questions[index].answer[k].toString() == 'true',
                        orElse: () => null),
                'Color blindness : ' + questions[index].colorBlind,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.grey[300]),
            ),
          ),
          separatorBuilder: (context, index) => DividerReport(),
        ),
        fallback: (context) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
