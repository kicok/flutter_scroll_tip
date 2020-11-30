import 'package:flutter/material.dart';

class KeyboardAvodding extends StatefulWidget {
  @override
  _KeyboardAvoddingState createState() => _KeyboardAvoddingState();
}

class _KeyboardAvoddingState extends State<KeyboardAvodding> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username;

  String email;

  String address;

  String password;

  String password2;

  void submit() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      return;
    }

    form.save();
    print('You entered following information');
    print('username: $username');
    print('email: $email');
    print('address: $address');
    print('password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keyboard Avoidding'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // 아무곳이나 눌러도 키보드가 사라지도록 함
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to My World',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onSaved: (value) => username = value,
                      decoration: InputDecoration(
                        labelText: 'useranme',
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onSaved: (value) => email = value,
                      decoration: InputDecoration(
                        labelText: 'email',
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onSaved: (value) => address = value,
                      decoration: InputDecoration(
                        labelText: 'address',
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onSaved: (value) => password = value,
                      decoration: InputDecoration(
                        labelText: 'password',
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      onSaved: (value) => password2 = value,
                      decoration: InputDecoration(
                        labelText: 'password2',
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
