import 'package:academics/model/academic_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AcademicList extends StatelessWidget {
  const AcademicList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var service = AcademicService();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: service.getAcademicList(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data != null) {
            final docs = data.docs;
            return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    docs[index].get('name') ?? '',
                  ),
                  subtitle: Text(
                    docs[index].get('email') ?? '',
                  ),
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
    );
  }
}
