import 'package:academics/model/units/owner.dart';
import 'package:academics/model/units/owner_service.dart';
import 'package:academics/screen/owner_edit_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OwnerListScreen extends StatelessWidget {
  const OwnerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var service = OwnerService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listagem de Moradores"),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: service.getOwners(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if (data != null) {
              final docs = data.docs;
              return ListView.separated(
                itemBuilder: (context, index) {
                  Owner owner = Owner(
                    docs[index].get('name'),
                    docs[index].get('email'),
                    docs[index].get('phone'),
                    id: docs[index].id,
                  );
                  return GestureDetector(
                    child: Card(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  owner.name,
                                ),
                                Text(
                                  owner.email,
                                ),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              service.deleteOwner(docs[index].id);
                            },
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => OwnerEditScreen(owner: owner),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: docs.length,
              );
            }
            //
            else if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: const [
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text("Não há dados disponíveis"),
                  ),
                ],
              );
            }
            //
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
