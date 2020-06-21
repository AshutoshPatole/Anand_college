import 'package:anand_college/models/loginModels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpPage extends StatelessWidget {
  final TextEditingController _review = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Send us your queries. We will get back to you.",
                  style: TextStyle(color: Color(0xff90979a), fontSize: 18.0),
                ),
                const Text(
                  "You can also send us an email to aiht_college@gmail.com.",
                  style: TextStyle(color: Color(0xff90979a), fontSize: 18.0),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Text(
                  'Your query',
                  style: TextStyle(color: Color(0xff90979a), fontSize: 18.0),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xffe5e5e5), width: 1)),
                    child: TextFormField(
                      controller: _review,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      validator: (value) =>
                          (value.isEmpty) ? 'Please fill the query' : null,
                      decoration: const InputDecoration(
                        hintText: 'Type your query',
                        hintStyle: TextStyle(fontSize: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        final user =
                            Provider.of<LoginModels>(context, listen: false);
                        user.help(_review.text);
                        _review.clear();
                        _key.currentState.showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                  'Your query is submitted successfully'),
                              const Icon(
                                Icons.thumb_up,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ));
                      }
                    },
                    color: Colors.blue,
                    child: const Text(
                      'Send',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
