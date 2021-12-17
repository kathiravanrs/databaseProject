import 'package:flutter/material.dart';
import 'package:login_example/helpers/global.dart';

class InsuranceCard extends StatefulWidget {
  String name;
  String cost;
  String desc;
  int number = 0;

  InsuranceCard({
    Key? key,
    required this.name,
    required this.cost,
    required this.desc,
  }) : super(key: key);

  @override
  _InsuranceCardState createState() => _InsuranceCardState();
}

class _InsuranceCardState extends State<InsuranceCard> {
  @override
  Widget build(BuildContext context) {
    insuranceCost[widget.name] = widget.cost;
    insuranceDesc[widget.name] = widget.desc;
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
                HeadingText(text: "Plan Cost: "),
                SideText(text: widget.cost),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(text: "Plan Name: "),
                SideText(text: (widget.name))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingText(text: "Description"),
                SideText(text: widget.desc)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.number != 0) {
                      chosenInsuranceCount.value--;
                      setState(() {
                        widget.number--;
                      });
                      insuranceCount[widget.name] = widget.number;
                      print(insuranceCount[widget.name].toString() +
                          " " +
                          widget.name);
                    }
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Text(
                widget.number.toString(),
                style: const TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    chosenInsuranceCount.value++;
                    setState(() {
                      widget.number++;
                    });
                    insuranceCount[widget.name] = widget.number;
                    print(insuranceCount[widget.name].toString() +
                        " " +
                        widget.name);
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
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
