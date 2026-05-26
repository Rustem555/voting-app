import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'question_widget.dart' show QuestionWidget;
import 'package:flutter/material.dart';

class QuestionModel extends FlutterFlowModel<QuestionWidget> {
  ///  Local state fields for this page.

  List<int> item = [];
  void addToItem(int item) => this.item.add(item);
  void removeFromItem(int item) => this.item.remove(item);
  void removeAtIndexFromItem(int index) => item.removeAt(index);
  void insertAtIndexInItem(int index, int item) =>
      this.item.insert(index, item);
  void updateItemAtIndex(int index, Function(int) updateFn) =>
      item[index] = updateFn(item[index]);

  int? percentageYes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
