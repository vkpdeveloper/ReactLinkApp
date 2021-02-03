import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:react_link_app/models/plans.dart';
import 'package:react_link_app/provider/plan_provider.dart';
import 'package:react_link_app/provider/userprovider.dart';
import 'package:react_link_app/utils/http_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentSetting extends StatefulWidget {
  PaymentSetting({Key key}) : super(key: key);

  @override
  _PaymentSettingState createState() => _PaymentSettingState();
}

class _PaymentSettingState extends State<PaymentSetting> {
  PlanProvider _planProvider;
  @override
  void initState() {
    super.initState();
    _planProvider = Provider.of<PlanProvider>(context, listen: false);
    getAllPlans();
  }

  bool _isLoading;
  String hostURL = HttpUtils.hostURL;
  getAllPlans() async {
    List<Plan> plans = [];
    Response res = await get("$hostURL/plans");
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      var rowPlans = data['plans'];
      for (var item in rowPlans) {
        Plan plan = Plan.fromJson(item);
        plans.add(plan);
      }
      _planProvider.setPlans(plans);
      _planProvider.setSelectedPlan(plans[0].sId);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    _planProvider = Provider.of<PlanProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Payment Settings",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Divider(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Your current plan: ${userProvider.userProfile.plan.name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                top: 10,
              ),
              child: Text(
                "Plan",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _planProvider.getPlans.length > 0
                ? Container(
                    width: MediaQuery.of(context).size.width - 20,
                    child: DropdownButtonHideUnderline(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black38),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(left: 14, right: 5),
                        padding: EdgeInsets.only(left: 8),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.black38,
                          onChanged: (value) =>
                              _planProvider.setSelectedPlan(value),
                          value: _planProvider.getSelectedPlan,
                          items: _planProvider.getPlans
                              .map((e) => DropdownMenuItem(
                                    child: Text(e.name),
                                    value: e.sId,
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("loading...")),
            SizedBox(
              height: 10,
            ),
            Text(
                "Note: To upgrade the plan to need to go to our website by clicking on upgrade plan button."),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: MaterialButton(
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                minWidth: MediaQuery.of(context).size.width - 40,
                onPressed: () => launch("http://reactlink.com"),
                color: Colors.deepPurpleAccent,
                child: Text(
                  "Upgrade Plan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
