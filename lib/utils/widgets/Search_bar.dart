import 'package:estichara/utils/widgets/Cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/list_lawyer_controller.dart';
import '../../view/home/details_page.dart';

class SearchData extends SearchDelegate {
  final List_Lawyer_Controller controller = Get.find<List_Lawyer_Controller>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
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
    return FutureBuilder<List<dynamic>>(
      future: controller.GetAllLawyer(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          var searchList = snapshot.data!.where((lawyer) =>
              lawyer['firstName'].toLowerCase().contains(query.toLowerCase()) ||
              lawyer['lastName'].toLowerCase().contains(query.toLowerCase()));
          return _buildListView(context, searchList);
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: controller.GetAllLawyer(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          var filteredList = snapshot.data!.where((lawyer) =>
              lawyer['firstName'].toLowerCase().contains(query.toLowerCase()) ||
              lawyer['lastName'].toLowerCase().contains(query.toLowerCase()));
          return _buildListView(context, filteredList);
        }
      },
    );
  }

  Widget _buildListView(BuildContext context, Iterable<dynamic> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var lawyer = list.elementAt(index);
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              barrierColor: Color.fromARGB(163, 0, 0, 0),
              scrollControlDisabledMaxHeightRatio: 0.75,
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Theme.of(context)
                      .colorScheme
                      .background // White color with 14% opacity
                  : Color.fromARGB(202, 255, 255, 255),
              showDragHandle: true,
              isScrollControlled: false,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )),
              context: context,
              builder: (context) {
                return Details(
                  images: lawyer['profileImage'] ??
                      'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg',
                  Name: lawyer['firstName'] ?? '',
                  Type: 'Lawyer',
                  Lastname: lawyer['lastName'] ?? '',
                  Phone: lawyer['phoneNumber'] ?? '',
                  valide: lawyer['valide'] ?? true,
                  email: lawyer['email'] ?? '',
                  bio: lawyer['bio'] ?? '',
                  adress: lawyer['address'] ?? '',
                  id: lawyer['userID'],
                  userid: controller.userDataList![7],
                );
              },
            );
          },
          child: Column(
            children: [
              card(
                adrees: lawyer['address'] ?? 'no adress',
                valide: lawyer['valide'] ?? false,
                name: lawyer['firstName'] ?? '',
                Lastname: lawyer['lastName'] ?? '',
                image: Image.network(
                  lawyer['profileImage'] ??
                      'https://i.pinimg.com/564x/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg',
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
