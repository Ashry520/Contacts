import 'package:contacts/Contact.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> contacts = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool addButtonVisible = contacts.length < 3;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contacts Screen'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
            ),
            Visibility(
              visible: addButtonVisible,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    String name = nameController.text;
                    String phone = phoneController.text;
                    if (name.isNotEmpty && phone.isNotEmpty) {
                      setState(() {
                        contacts.add(Contact(name: name, phone: phone));
                        nameController.clear();
                        phoneController.clear();
                      });
                    }
                  },
                  child: Text('Add'),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(contacts[index].name),
                    subtitle: Text(contacts[index].phone),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          contacts.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
