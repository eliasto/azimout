import 'package:azimout/views/Auth/OTPScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_banner/dropdown_banner.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

TextEditingController _controller = TextEditingController();
String countryCode = '+33';
String phone = '0';

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return DropdownBanner(
        navigatorKey: null,
        child: new Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Color(0xffE94560),
              leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Intro');
                  }),
            ),
            body: Container(
                color: Color(0xFF1A1A2E),
                child: Column(children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 18.0, right: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'Inscription',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Veuillez entrer votre numéro de téléphone pour vous inscrire.',
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 20.0,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    height: 180.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffE94560),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50.0)),
                    ),
                  ),
                  Row(
                    children: [
                      CountryCodePicker(
                          textStyle: TextStyle(color: Colors.white),
                          onChanged: (code) {
                            setState(() {
                              countryCode = code.toString();
                            });
                          },
                          initialSelection: 'FR',
                          favorite: ['+33', 'FR'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          backgroundColor: Color(0xffE94560)),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                          child: TextField(
                            onChanged: (text) {
                              setState(() {
                                phone = text;
                              });
                            },
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFFFFFFF), width: 2.0),
                              ),
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(color: Colors.white),
                              hoverColor: Colors.white,
                            ),
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: _controller,
                          ),
                        ),
                      )
                    ],
                  ),
                  phone.length >= 8
                      ? Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                          child: ElevatedButton(
                            child: Text('Submit',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400)),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(0xFF0F3460)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ))),
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OTPScreen('$countryCode$phone'))),
                          ))
                      : Text(''),
                ]))));
  }
}
