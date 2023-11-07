import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Theme/colors.dart';
import 'package:http/http.dart'as http;

import 'helper/apiservices.dart';
import 'model/faqmodel.dart';

class FaQScreen extends StatefulWidget {
  const FaQScreen({Key? key}) : super(key: key);

  @override
  State<FaQScreen> createState() => _FaQScreenState();
}

class _FaQScreenState extends State<FaQScreen> {

  Faqmodel? getFaQ;
  faqApi() async {
    var headers = {
      'Cookie': 'ci_session=195222aacbc4ffb278fce93b58a79cb5cb0bd7de'
    };
    var request = http.Request('POST', Uri.parse('${ApiService.baseUrl}faq'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalresponse = await response.stream.bytesToString();
      final jsonresponse = Faqmodel.fromJson(json.decode(finalresponse));
      print('_____aaaaaa_____${finalresponse}_________');
      setState(() {
        getFaQ = jsonresponse;
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
    faqApi();
  }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: primary,
            title: Text("FAQs"),
          ),
          body: getFaQ == null || getFaQ == "" ?Center(child: CircularProgressIndicator(color: primary,)):getFaQ!.setting!.length == 0 ? Center(child: Text('Data Not Available'),)
          :Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: getFaQ!.setting!.length,
                itemBuilder: (context, index) {
                  return Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primary)
                        ),
                        child: ExpansionTile(
                          title: SizedBox(),
                          subtitle: Text("${getFaQ?.setting?[index].title}"),
                          children: <Widget>[
                            ListTile(title: Text("${getFaQ?.setting?[index].description}",
                              style: TextStyle(
                                  fontSize: 12, color: hintColor),),)
                          ],
                        ),
                      ),

                      // index != 2
                      //     ? Divider(thickness: 1)
                      //     : SizedBox.shrink(),
                    ],
                  );
                }),
          ),
      );
    }
}
