
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  String _username, _email, _password = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (String email) {
                  return email.contains('@') ? 'Do not use the @ char.' : null;
                },
                onSaved: (String email) {
                  _email=email;
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.person), labelText: 'Email:'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password:'),
              ),
              RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    _formKey.currentState.save();
                    toastMessage("Email: $_email");
                  }
                  toastMessage("Email: $_email");

                },
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }

  void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
  }
}
