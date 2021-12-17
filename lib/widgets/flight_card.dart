import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_example/helpers/global.dart';

class FlightCard extends StatefulWidget {
  String airlines;
  String dept;
  String arrival;
  String depTime;
  String arrTime;
  String arrCity;
  String depCity;

  FlightCard(
      {Key? key,
      required this.airlines,
      required this.dept,
      required this.arrival,
      required this.depCity,
      required this.arrCity,
      required this.arrTime,
      required this.depTime})
      : super(key: key);

  @override
  _FlightCardState createState() => _FlightCardState();
}

class _FlightCardState extends State<FlightCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      elevation: 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(text: "Departure Airport: "),
                SideText(text: widget.dept),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(text: "Departure Time: "),
                SideText(
                    text: DateFormat('yyyy-MM-dd – kk:mm')
                        .format(DateTime.parse(widget.depTime)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(text: "Airlines"),
                SideText(text: widget.airlines)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(text: "Arrival Airport: "),
                SideText(text: widget.arrival),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(text: "Arrival Time: "),
                SideText(
                    text: DateFormat('yyyy-MM-dd – kk:mm')
                        .format(DateTime.parse(widget.arrTime))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                departure.value = widget.dept;
                print(widget.dept + " " + widget.arrival);
                arrival.value = widget.arrival;
              },
              child: const Text("Select"),
            ),
          ),
        ],
      ),
    );
  }
}

class SideText extends StatelessWidget {
  String text;

  SideText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class HeadingText extends StatelessWidget {
  String text;

  HeadingText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      textAlign: TextAlign.left,
    );
  }
}
