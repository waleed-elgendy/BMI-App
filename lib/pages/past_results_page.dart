
import 'package:bmi_app/models/bmi_model.dart';
import 'package:bmi_app/shared/no_result_view.dart';
import 'package:bmi_app/shared/results_list_view.dart';
import 'package:bmi_app/shared/top_results_list_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PastResultPage extends StatefulWidget {
  const PastResultPage({Key? key, required this.user}) : super(key: key);
  final String user;

  @override
  State<PastResultPage> createState() => _PastResultPageState();
}

class _PastResultPageState extends State<PastResultPage> {
  int max = 10;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    CollectionReference results =
        FirebaseFirestore.instance.collection('users/${widget.user}/results');
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: StreamBuilder<QuerySnapshot>(
        stream: results.orderBy('createdAt').limit(max).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<BMIModel> resultsList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              resultsList.add(BMIModel.fromJson(snapshot.data!.docs[i]));
            }
            if (resultsList.isEmpty) {
              return const NoResult();
            } else {
              return Padding(
                padding: EdgeInsets.only(top: 10.h, left: 10.w, bottom: 10.h),
                child: Column(
                  children: [
                    const TopResultsListDetails(),
                    Expanded(
                      child: NotificationListener(
                        onNotification: (t) {
                          if (t is ScrollEndNotification) {
                            setState(() {
                              max += 1;
                            });
                            return true;
                          } else {
                            return false;
                          }
                        },
                        child: ResultsListView(
                          resultsList: resultsList,
                          user: widget.user,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          } else {
            return Padding(
              padding: EdgeInsets.only(top: 63.h),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
