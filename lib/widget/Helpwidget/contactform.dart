import 'package:flutter/material.dart';

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
          TextButton(onPressed: null, child: Text("Send"))
        ],
      )),
    );
  }
}
