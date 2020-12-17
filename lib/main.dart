import 'package:drop_down_custom/customdropdown.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: DropDown(),
        ),
      ),
    );
  }
}

// /// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);
//
//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }
//
// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   String dropdownValue = 'One';
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 55.0, //gives the height of the dropdown button
//       width: 220.0, //gives the width of the dropdown button
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(3)),
//         // color: Color(0xFFF2F2F2)
//       ),
//       // padding: const EdgeInsets.symmetric(horizontal: 13), //you can include padding to control the menu items
//       child: Theme(
//         data: Theme.of(context).copyWith(
//             canvasColor: Colors.white,
//             // background color for the dropdown items
//             buttonTheme: ButtonTheme.of(context).copyWith(
//               alignedDropdown:
//                   true, //If false (the default), then the dropdown's menu will be wider than its button.
//             )),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<String>(
//             value: dropdownValue,
//             icon: Icon(
//               Icons.arrow_drop_down_circle_sharp,
//               color: Color(0XFF11DFEB),
//             ),
//             iconSize: 50,
//             elevation: 16,
//             style: TextStyle(color: Colors.deepPurple),
//             onChanged: (String newValue) {
//               setState(() {
//                 print("Value Changed");
//                 dropdownValue = newValue;
//               });
//             },
//             items: <String>['One', 'Two', 'Free', 'Four']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(25.0),
//                     color: Color(0XFF11DFEB),
//                   ),
//                   width: 149.0,
//                   height: 50.0,
//                   child: Center(
//                       child: Text(
//                     value,
//                     style: TextStyle(fontSize: 17.0, color: Colors.white),
//                   )),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }

class DropDown extends StatefulWidget {
  DropDown() : super();

  final String title = "DropDown Demo";

  @override
  DropDownState createState() => DropDownState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(1, 'New Consult'),
      Company(2, 'Certificate'),
      Company(3, 'Use template'),
      Company(4, 'Sony'),
      Company(5, 'LG'),
    ];
  }

  @override
  String toString() {
    return 'Company{id: $id, name: $name}';
  }
}

class DropDownState extends State<DropDown> {
  //
  List<Company> _companies = Company.getCompanies();
  List<DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    setState(() {
      _selectedCompany = _dropdownMenuItems[0].value;
    });
    print("ObjectAtIndex0:${_dropdownMenuItems[0].value}");
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Center(child: Text(company.name)), //Here aligned at center
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // DropdownButton(
            //   value: _selectedCompany,
            //   items: _dropdownMenuItems,
            //   onChanged: onChangeDropdownItem,
            // ),
            Container(
              width: 250.0,
              height: 50.0,
              child: CustomDropdownButton(
                style: TextStyle(color: Colors.white,fontSize: 17.0),
                iconSize: 57.0,
                elevation: 0,
                value: _selectedCompany,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              ),
            ),
          ],
        ),
      ),
    );
  }
}