import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class IpMannager {
  String ip = "";

  IpMannager() {
    getMyIp();
  }

  Future<void> getMyIp() async {
    var res = await http.get(Uri.parse("https://api.ipify.org?format=json"));
    var result = json.decode(res.body);
    ip = result['ip'];
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentIp = "No se bro";

  var ip = IpMannager();

  void _increment() {
    setState(() {
      ip.getMyIp();
      currentIp = ip.ip + " Auto Doxeado Pa";
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi IP'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      // body is the majority of the screen.
      body: Center(
        child: Column(children: [
          const Text("Tu IP es:"),
          Text(currentIp),
          TextButton(
            child: const Text("Obtener mi IP"),
            onPressed: _increment,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Obtener Ip', // used by assistive technologies
        child: const Icon(Icons.add),
        onPressed: _increment,
      ),
    );
  }
}
