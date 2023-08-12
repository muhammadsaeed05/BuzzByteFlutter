import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

class LoadingArticleRowItem extends StatelessWidget {
  const LoadingArticleRowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105.h,
      width: double.infinity,
      child: SkeletonListTile(
        hasSubtitle: true,
      ),
    );
  }
}
