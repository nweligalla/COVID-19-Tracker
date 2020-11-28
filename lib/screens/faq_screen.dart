import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../modals/faq_data.dart';

class FAQScreen extends StatefulWidget {
  static String id = "FAQSceen";
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<FAQ> faqData = FAQ.faqData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.blueGrey[600],
        title: Text("Covid-19 FAQ"),
      ),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView.builder(
            itemCount: faqData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                child: Card(
                  color: Colors.grey[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 10,
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 2, vertical: 10),
                      child: Text(
                        "${faqData[index].question.toUpperCase()}?",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 4, 3, 15),
                      child: Text(
                        faqData[index].answer,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
