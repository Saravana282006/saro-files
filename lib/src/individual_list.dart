// import 'package:flutter/material.dart';
// import 'api.dart';
// import 'employees_list.dart';

// class IndividualList extends StatefulWidget {
//   const IndividualList({super.key});

//     @override
//   State<IndividualList> createState() => _IndividualList();
// }

// class _IndividualList extends State<IndividualList> {
//   FetchUser _fetchUser = FetchUser();
  
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('back'),
//         ),
//         body: Container(
//           child: FutureBuilder<List<Employees>>(
//               future: _fetchUser.getEmployees(),
//               builder: (context, snapshot) {
//                 var data = snapshot.data;

//                 return ListView.builder(
//                   itemCount: data?.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: ListTile(
//                         title: Row(
//                           children: [
//                             Container(
//                              height: 45,
//                               width: 45,
//                               decoration: BoxDecoration(
//                                 color: Color.fromARGB(255, 71, 166, 239),
//                                 borderRadius: BorderRadius.circular(50),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   '${data?[index].id}',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 10),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${data?[index].name}',
//                                   style: TextStyle(fontWeight: FontWeight.w600),
//                                 ),
//                                 Text('${data?[index].email}'),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
                
//               }),
//         ),
//       ),
//     );
//   }
// }