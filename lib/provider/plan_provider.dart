import 'package:flutter/material.dart';

import 'package:react_link_app/models/plans.dart';

class PlanProvider extends ChangeNotifier {
  List<Plan> _plans = [];
  String _selectedPlan;

  List<Plan> get getPlans => _plans;
  String get getSelectedPlan => _selectedPlan;

  void setPlans(List<Plan> plans) {
    _plans = plans;
    notifyListeners();
  }

  void setSelectedPlan(String planId) {
    _selectedPlan = planId;
    notifyListeners();
  }
}
