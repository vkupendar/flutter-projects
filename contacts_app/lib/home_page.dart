import 'package:flutter/material.dart';

import 'contacts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contacts> contacts = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contacts List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "Contact Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                  hintText: "Phone NO",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          contacts.add(Contacts(name: name, contact: contact));
                        });
                      }
                    },
                    child: const Text("save")),
                ElevatedButton(
                    onPressed: () {
                      String name = nameController.text.trim();
                      String contact = contactController.text.trim();
                      if (name.isNotEmpty && contact.isNotEmpty) {
                        setState(() {
                          nameController.text = '';
                          contactController.text = '';
                          contacts[selectedIndex].name = name;
                          contacts[selectedIndex].contact = contact;

                          selectedIndex = -1;
                        });
                      }
                    },
                    child: const Text("update"))
              ],
            ),
            contacts.isEmpty
                ? const Text(
                    "No contacts saved",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (context, index) => getRow(index)),
                  ),
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: index % 2 == 0 ? Colors.blue : Colors.deepOrange,
          child: Text(contacts[index].name[0])),
      title: Column(children: [
        Text(contacts[index].name),
        Text(contacts[index].contact)
      ]),
      trailing: SizedBox(
        width: 50,
        child: Row(
          children: [
            InkWell(
                onTap: () {
                  nameController.text = contacts[index].name;
                  contactController.text = contacts[index].contact;
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: const Icon(Icons.edit)),
            InkWell(
                onTap: () {
                  setState(() {
                    contacts.removeAt(index);
                  });
                },
                child: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
