import 'package:bmi_app/models/bmi_model.dart';
import 'package:bmi_app/shared/cell_of_results_list_text.dart';
import 'package:bmi_app/shared/edit_and_delete_row.dart';
import 'package:bmi_app/shared/top_results_list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultsListView extends StatelessWidget {
  const ResultsListView({
    super.key,
    required this.resultsList,
    required this.user,
  });

  final List<BMIModel> resultsList;
  final String user;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: resultsList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50.h,
          child: Row(
            children: [
              TopResultsListContainer(
                child: CellText(
                  text: resultsList[index].age.toInt().toString(),
                ),
              ),
              TopResultsListContainer(
                child: CellText(
                  text: resultsList[index].height.toInt().toString(),
                ),
              ),
              TopResultsListContainer(
                child: CellText(
                  text: resultsList[index].weight.toInt().toString(),
                ),
              ),
              TopResultsListContainer(
                child: CellText(
                  text: resultsList[index].result,
                ),
              ),
              EditAndDeleteRow(
                resultsList: resultsList,
                index: index,
                user: user,
              ),
            ],
          ),
        );
      },
    );
  }
}
