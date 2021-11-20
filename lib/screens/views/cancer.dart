import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:validate/expect.dart';
import 'package:mpower/screens/globals.dart' as globals;

class Cancer extends StatefulWidget {
  const Cancer({Key? key}) : super(key: key);

  @override
  _CancerState createState() => _CancerState();
}

class _CancerState extends State<Cancer> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _contentStyle = TextStyle(color: Color(0xff999999), fontSize: 18, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        FormBuilder(
          key: _formKey,
          // autovalidateMode: AutovalidateMode(isTrue(expression)),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              FormBuilderCheckbox(name: 'bc1',title: Text('What is breast cancer?',style: _contentStyle,),
                  onChanged:( val) {
                    setState(() {
                      globals.bc1=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'bc2',title: Text('What to do to find breast cancer early?'),
                  onChanged:( val) {
                    setState(() {
                      globals.bc2=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'bc3',title: Text('What to do to lower chances of getting breast cancer?'),
                  onChanged:( val) {
                    setState(() {
                      globals.bc3=val.toString();
                    });
                  }),
              FormBuilderCheckbox(name: 'bc4',title: Text('Where to seek screening services?'),
                  onChanged:( val) {
                    setState(() {
                      globals.bc4=val.toString();
                    });
                  }),

            ],
          ),
        )
      ],
    );
  }
}
