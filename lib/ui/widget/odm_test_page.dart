import 'package:flutter/material.dart';
import 'package:todo_app/viewModel/odm_test.dart';
import 'package:provider/provider.dart';

class OdmTestPage extends StatefulWidget {
  const OdmTestPage({super.key});

  @override
  State<OdmTestPage> createState() => _OdmTestPageState();
}

class _OdmTestPageState extends State<OdmTestPage> {
  @override
  Widget build(BuildContext context) {
    OdmTest odm = context.watch<OdmTest>();

    return Scaffold(
      appBar: AppBar(title: Text('할 일 추가')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        ListView(
          children: [
            SizedBox(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: ()async {
                      await odm.addData();
                    },
                    child: Text('add'),
                  ),
                  ElevatedButton(
                    onPressed: ()async {
                      await odm.getData();
                    },
                    child: Text('get'),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );

  }
}
