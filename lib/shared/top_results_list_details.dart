import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';
import 'top_results_list_container.dart';

class TopResultsListDetails extends StatelessWidget {
  const TopResultsListDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            TopResultsListContainer(
              child: Center(child: details[index]),
            ),
      ),
    );
  }
}