import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactForm extends StatelessWidget {
  ContactForm(this._formsize);
  final Size _formsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _formsize.height,
      width: _formsize.width,
      child: Form(
          child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Personal Email Address'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Subject'),
          ),
          TextFormField(),
          TextButton(
              onPressed: () {
                Uri _email = Uri(
                    scheme: 'mailto',
                    path: 'himanshusharma.cse23@jecrc.ac.in',
                    queryParameters: {
                      'subject': 'Example Subject & Symbols are allowed!'
                    });
                launch(_email.toString());
              },
              child: Text("Send"))
        ],
      )),
    );
  }
}
