import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'model/data.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  List<DataModels> datas = [];

  Future<List<DataModels>> showJson() async {
    final response = await http.get(
        Uri.parse('https://61f59dd762f1e300173c41ef.mockapi.io/api/posts'));
    if (response.statusCode == 200) {
      var jsonList = jsonDecode(response.body);
      for (var item in jsonList) {
        datas.add(DataModels.fromJson(item));
      }
      return datas;
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'JSON Data',
            ),
            backgroundColor: Colors.black),
        body: Container(
          color: Colors.black,
          child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(children: [
                ElevatedButton(
                  child: const Text('Show Data'),
                  onPressed: () async {
                    await showJson();
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(300, 30),
                      primary: Colors.deepOrange),
                ),
                datas.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: datas.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                leading: Text(
                                  "test",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                                title: Text("${datas[index].title}"),
                                subtitle: Text("${datas[index].body}"),
                              ),
                            );
                          },
                        ),
                      )
                    : Container()
              ])),
        ));
  }
}
