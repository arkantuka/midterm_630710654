import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class calculator_page extends StatefulWidget {
  const calculator_page({super.key});

  @override
  _page createState() => _page();
}

class _page extends State<calculator_page> {
  static const addSign = "\u002B";
  static const subtractSign = "\u2212";
  static const multiplySign = "\u00D7";
  static const divideSign = "\u00F7";
  static const equalSign = "\u003D";

  String num_string = '';
  var num_numpad = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  var status = true;

  void add_number(String num) {
    setState(() {
      num_string += num;
    });
  }

  void add_sign(String sign) {
    setState(() {
      if (status) {
        num_string += sign;
        status = false;
      } else {
        num_string = num_string.substring(0, num_string.length - 1);
        num_string += sign;
      }
    });
  }

  void clear_number() {
    setState(() {
      num_string = '';
    });
  }

  void delete_number() {
    setState(() {
      if (num_string.isNotEmpty) {
        num_string = num_string.substring(0, num_string.length - 1);
        if (!status) {
          status = true;
        }
      }
    });
  }

  Widget build_sign_button(String sign_str) {
    return InkWell(
      onTap: () => add_sign(sign_str),
      child: Container(
        width: 70.0,
        height: 65.0,
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sign_str,
              style: GoogleFonts.kanit(
                color: Colors.black,
                fontSize: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_equal_button(String equal_sign) {
    return InkWell(
      onTap: () => clear_number(),
      child: Container(
        width: 500.0,
        height: 65.0,
        decoration: BoxDecoration(
          color: Colors.pink[600],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              equal_sign,
              style: GoogleFonts.kanit(
                color: Colors.black,
                fontSize: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_clear_button() {
    return InkWell(
      onTap: () => clear_number(),
      child: Container(
        width: 150.0,
        height: 65.0,
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'C',
              style: GoogleFonts.kanit(
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build_delete_button() {
    return InkWell(
      onTap: () => delete_number(),
      child: Container(
        width: 150,
        height: 65.0,
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.backspace_outlined,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget build_numpad_button(String number) {
    return InkWell(
      onTap: () => add_number(number),
      child: Container(
        width: 70.0,
        height: 65.0,
        decoration: BoxDecoration(
          color: Colors.red[100],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: GoogleFonts.kanit(
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget numpad() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: build_clear_button(),
            ),
            build_delete_button(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            build_numpad_button(num_numpad[7]),
            build_numpad_button(num_numpad[8]),
            build_numpad_button(num_numpad[9]),
            build_sign_button(divideSign),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            build_numpad_button(num_numpad[4]),
            build_numpad_button(num_numpad[5]),
            build_numpad_button(num_numpad[6]),
            build_sign_button(multiplySign),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            build_numpad_button(num_numpad[1]),
            build_numpad_button(num_numpad[2]),
            build_numpad_button(num_numpad[3]),
            build_sign_button(subtractSign),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            build_numpad_button(num_numpad[0]),
            build_sign_button(addSign),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            build_equal_button(equalSign),
          ],
        ),
      ],
    );
  }

  Widget display() {
    return Text(
      num_string.padRight(1, '0'),
      style: GoogleFonts.kanit(
        fontSize: 40.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("My Calculator"),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            display(),
            numpad(),
          ],
        ),
      ),
    );
  }
}
