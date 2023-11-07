import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:http/http.dart'as http;

import '../../helper/apiservices.dart';
import '../../model/Terms_condition_model.dart';

class TncPage extends StatefulWidget {

  @override
  State<TncPage> createState() => _TncPageState();
}

class _TncPageState extends State<TncPage> {
  TermsConditionModel? termsConditionModel;
  getTMC() async {
    var headers = {
      'Cookie': 'ci_session=b1b0eba7591b38a7c05bf68eb6d0af9154aa441e'
    };
    var request = http.Request('GET', Uri.parse('${ApiService.getTermsCondition}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final result =  await response.stream.bytesToString();
      final finalResult = TermsConditionModel.fromJson(jsonDecode(result));
      setState(() {
        termsConditionModel = finalResult;
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTMC();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primary,
          title: Text("Terms & Condition"),
        ),
        body: termsConditionModel == null || termsConditionModel!.setting! == '' ?
        Center(child: CircularProgressIndicator()):
        Column(
          children: [
            Html(
                data:"${termsConditionModel!.setting!.data}"
            ),
            Html(
                data:"${termsConditionModel!.setting!.discription}"
            )
          ],
        )
    );
  }
}
