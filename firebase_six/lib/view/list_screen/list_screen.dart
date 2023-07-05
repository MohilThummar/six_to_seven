import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Screen"),
      ),
      // body: FutureBuilder<QuerySnapshot>(
      //   future: users.get(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting || snapshot.connectionState == ConnectionState.active) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //
      //     if (snapshot.hasError) {
      //       return const Center(child: Text("Something went wrong"));
      //     }
      //
      //     if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
      //       return const Center(child: Text("Document does not exist"));
      //     }
      //
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       debugPrint("snapshot.data!.docs --->> ${snapshot.data!.docs}");
      //
      //       return ListView.builder(
      //         itemCount: snapshot.data!.docs.length,
      //         itemBuilder: (context, index) {
      //           Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
      //
      //           return ListTile(
      //             title: Text(data["first_name"] + " " + data["last_name"]),
      //             subtitle: Text(data["email"]),
      //           );
      //         },
      //       );
      //     }
      //
      //     return const Text("loading");
      //   },
      // ),

      body: StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Document does not exist"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;

              return ListTile(
                title: Text(data["first_name"] + " " + data["last_name"]),
                subtitle: Text(data["email"]),
              );
            },
          );
        },
      ),
    );
  }
}
