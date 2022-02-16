import 'package:flutter/material.dart';

Widget buildReport(
  String image,
  String textAnswer,
  String textNormal,
  String textBlind,
) =>
    Row(
      children: [
        Container(
          width: 120,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage(
                image,
                //questions[index].image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Container(
            height: 170.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    textAnswer,
                    //'Your answer : ' + ans[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    textNormal,
                    //'Normal view : ' +
                    //    questions[index].answer.keys.firstWhere(
                    //        (k) =>
                    //            questions[index].answer[k].toString() == 'true',
                    //        orElse: () => null),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                    maxLines: 3,
                  ),
                ),
                Expanded(
                  child: Text(
                    textBlind,
                    //'Color blindness : ' + questions[index].colorBlind,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

Widget DividerReport() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
