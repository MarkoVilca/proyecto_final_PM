import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_pm/pages/login_page.dart';
import 'package:proyecto_final_pm/ui/general/colors.dart';
import 'package:proyecto_final_pm/widgets/general_widget.dart';
import 'package:proyecto_final_pm/widgets/item_task_widgets.dart';
import 'package:proyecto_final_pm/widgets/task_model.dart';

class Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandSecondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 18.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bienvenido",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: kBrandPrimaryColor,
                      ),
                    ),
                    Text(
                      "Tu Información",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w600,
                        color: kBrandPrimaryColor,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(4, 4),
                        ),
                      ]),
                      child: TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 15.0),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20.0,
                              color: kBrandPrimaryColor.withOpacity(0.06),
                            ),
                            hintText: "Buscar...",
                            hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: kBrandPrimaryColor.withOpacity(0.6),
                            ),
                            filled: true,
                            fillColor: kBrandSecondaryColor,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    Text(
                      "CUENTAS EXISTENTES",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Users')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snap) {
                        if (snap.hasData) {
                          List<UserModel> tasks = [];

//                          collection.docs.forEach((element) {
//                            Map<String, dynamic> myMap = element.data() as Map<String, dynamic>;
//                            tasks.add(TaskModel.fromJson(myMap));
//                          });

                          tasks = snap.data!.docs
                              .map((e) {
                                 print(e.data());
                                return UserModel.fromJson(
                                  e.data() as Map<String, dynamic>);
                              }).toList();
                          return ListView.builder(
                            itemCount: snap.data!.docs.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return ItemTaskWidget(
                                taskModel: tasks[index],
                              );
                            },
                          );
                        }
                        return loadingWidget();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
