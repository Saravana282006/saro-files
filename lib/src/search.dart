import 'package:flutter/material.dart';
import 'api.dart';
import 'employees_list.dart';
import 'individual_list.dart';

class SearchUser extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = "";
          }
        },
      )
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        // Navigator.pop(context);
        close(context, null);
      },
    );
  }

  final FetchUser _fetchUser = FetchUser();

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Employees>>(
          future: _fetchUser.getEmployees(query: query),
          builder: (context, snapshot) {
            var data = snapshot.data;

            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(
                       height: 45,
                              width: 45,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 71, 166, 239),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              '${data?[index].id}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data?[index].name}',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text('${data?[index].email}'),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // return Center(
    //   child: Text('Search Users'),
    // );

    return Container(
      child: FutureBuilder<List<Employees>>(
          future: _fetchUser.getEmployees(query: query),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (query.isEmpty) return buildNoSuggestions();
                var data = snapshot.data;

                if (snapshot.hasError || snapshot.data!.isEmpty) {
                  return buildNoSuggestions();
                } else {
                  return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IndividualList()),
                          ),
                          title: Row(
                          children: [
                            Container(
                              child: Center(
                                child: 
                                Icon(Icons.search)
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data?[index].name}',
                                  style: TextStyle(fontWeight: FontWeight.w600,),
                                ),
                                Text('${data?[index].email}', style: TextStyle(color: Color.fromARGB(255, 175, 172, 172),)),
                              ],
                            )
                          ],
                        ),
                        ),
                      );
                    },
                  );
                }
            }
          }),
    );
  }
}

Widget buildNoSuggestions() => const Center(
      child: Text(
        'No Data found!',
        style: TextStyle(fontSize: 20),
      ),
    );

