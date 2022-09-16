import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  List<PopupMenuEntry<String>> myItem = [
    const PopupMenuItem(
      child: Text("Profile"),
      value: "0",
    ),
    const PopupMenuItem(
      child: Text("theme"),
      value: "1",
    ),
    const PopupMenuItem(
      child: Text("About"),
      value: "2",
    ),
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Map value = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: const Text(
          "CONTACT US",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (result) {
              if (result == "0") {
                Navigator.pushNamed(
                  context,
                  "/profile",
                  arguments: value,
                );
              }
              if (result == "1") {
                Navigator.pushNamed(context, "/theme");
              }
              if (result == "2") {
                Navigator.pushNamed(context, "/about");
              }
            },
            itemBuilder: (BuildContext context) {
              return myItem;
            },
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                height: 390,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 20,
                      ),
                      hintText: "Type here",
                      border: InputBorder.none,
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Can't be Empty";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.reset();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Successful",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          content: const Text(
                            "we have received your message and we will reply after the necessary checks.Thank you",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Done"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text(
                  "send to us",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
