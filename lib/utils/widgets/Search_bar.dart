import 'package:estichara/models/lawyers.dart';
import 'package:estichara/utils/const.dart';
import 'package:estichara/utils/widgets/Cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

import '../../view/details_page.dart';

class SearshData extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, []);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchList = query.isEmpty
        ? data
        : data
            .where((lawyer) =>
                lawyer.name.toLowerCase().contains(query.toLowerCase()) ||
                lawyer.lastName.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemCount: searchList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
                barrierColor: Color.fromARGB(163, 0, 0, 0),
                backgroundColor: Color.fromARGB(202, 255, 255, 255),
                scrollControlDisabledMaxHeightRatio: 0.75,
                showDragHandle: true,
                isScrollControlled: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                context: context,
                builder: (context) {
                  return Details(
                    images: searchList[index].image,
                    Name: searchList[index].name,
                    Type: 'Lawyer',
                    Lastname: searchList[index].lastName,
                    Phone: searchList[index].phone,
                    valide: searchList[index].valide,
                  );
                });
          },
          child: Column(
            children: [
              card(
                valide: searchList[index].valide,
                name: searchList[index].name,
                Lastname: searchList[index].lastName,
                image: Image(
                  image: AssetImage(searchList[index].image),
                  height: 65,
                  width: 65,
                  fit: BoxFit.cover,
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromARGB(35, 0, 0, 0),
              )
            ],
          ),
        );
      },
    );
  }
}
