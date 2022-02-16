import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildReport(
  String image,
  String textAnswer,
  String textNormal,
  String textBlind,
) =>
    Row(
      children: [
        Container(
          width: 120.0.r,
          height: 120.0.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.r),
            border: Border.all(color: Colors.grey[300], width: 10.w),
            image: DecorationImage(
              //scale: 0.1,
              fit: BoxFit.cover,
              image: AssetImage(
                image,
                //questions[index].image,
              ),
              //fit: BoxFit.cover,
            ),
          ),
        ),
        // const SizedBox(
        //   width: 10.0,
        // ),

        Expanded(
          child: Container(
            height: 110.0.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(3.0.w),
                  child: Flexible(
                    child: Text(
                      textAnswer,
                      //'Your answer : ' + ans[index],
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0.sp,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0.w),
                  child: Flexible(
                    child: Text(
                      textNormal,
                      //'Normal view : ' +
                      //    questions[index].answer.keys.firstWhere(
                      //        (k) =>
                      //            questions[index].answer[k].toString() == 'true',
                      //        orElse: () => null),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0.sp,
                      ),
                      maxLines: 3,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0.w),
                  child: Flexible(
                    child: Text(
                      textBlind,
                      //'Color blindness : ' + questions[index].colorBlind,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0.sp,
                      ),
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
      padding: EdgeInsets.all(10.0.w),
      child: Container(
        width: double.infinity,
        height: 1.0.h,
        color: Colors.grey[300],
      ),
    );
