import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components.dart';

const String listItemTitleText = "A BETTER COMPANY FOR INSURANCE";
const String listItemPreviewText =
    "Sed elementum tempus egestas sed sed risus. Mauris in aliquam sem fringilla ut morbi tincidunt. Placerat vestibulum lectus mauris ultrices eros. Et leo duis ut diam. Auctor neque vitae tempus […]";

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: <Widget>[
                  MenuBar(),
                  const ListItem(
                      imageUrl: 'assets/images/ecorp.png',
                      title: listItemTitleText,
                      description: listItemPreviewText),
                  divider,
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white60,
    );
  }
}
