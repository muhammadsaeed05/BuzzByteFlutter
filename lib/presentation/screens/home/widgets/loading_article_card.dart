import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

class LoadingArticleCard extends StatelessWidget {
  const LoadingArticleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      child: SkeletonItem(
          child: SkeletonLine(
        style: SkeletonLineStyle(
            width: 300.w,
            height: 270.h,
            padding: EdgeInsets.only(right: 8.w, top: 8.w)),
      )),
    );
  }
}
