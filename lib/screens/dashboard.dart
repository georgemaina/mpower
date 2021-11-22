// import 'package:mpower/responsive.dart';
// import 'package:mpower/screens/components/HouseMappingDetails.dart ';
// import 'package:mpower/controllers/MenuController.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:mpower/screens/register.dart';
import '../../constants.dart';
import 'components/header.dart';
import 'welcome.dart';
import 'summary.dart';
import 'components/upload.dart';

//
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: SingleChildScrollView(

        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: defaultPadding),
            Card(
             color: Color(4278727245),
             elevation: 5.0,
             child:WelcomeScreen(),
            ),
            SizedBox(height: 5),
            Card(
              color: Color(4278727245),
              elevation: 5.0,
              child:Summary(),
            ),
            SizedBox(height: 5),
            Card(
              color: Color(4278727245),
              elevation: 5.0,
              child:Upload(),
            ),
             FloatingActionButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => Register()));
              },
              child: const Icon(Icons.add),
              backgroundColor: Colors.green,
               mini: true,
            ),

          ],
        ),
      ),
    );
  }
}
