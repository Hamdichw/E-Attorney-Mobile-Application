import 'package:estichara/model/lawyers.dart';
import 'package:estichara/utils/const.dart';
import 'package:estichara/utils/widgets/Cards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/details_page.dart';

class SearchData extends SearchDelegate {
  String? locationFilter;
  String? typeFilter;
  List<String> appliedFilters = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Wrap(
        children: appliedFilters
            .map((filter) => Chip(
                  label: Text(filter),
                  deleteIcon: Icon(Icons.clear),
                  onDeleted: () {
                    remove();
                    query = '';
                  },
                ))
            .toList(),
      ),
      IconButton(
        onPressed: () {
          _showFilterDialog(context);
        },
        icon: Icon(Icons.filter_list),
      ),
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
    var searchList = data.where((lawyer) =>
        lawyer.name.toLowerCase().contains(query.toLowerCase()) ||
        lawyer.lastName.toLowerCase().contains(query.toLowerCase()));

    // Apply filters if they are set
    if (appliedFilters.contains(locationFilter)) {
      searchList = searchList
          .where((lawyer) => lawyer.location == locationFilter)
          .toList();
    }

    if (appliedFilters.contains(typeFilter)) {
      searchList = searchList
          .where((lawyer) =>
              lawyer.type.toLowerCase() == typeFilter!.toLowerCase())
          .toList();
    }

    return _buildListView(context, searchList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var filteredList = data.where((lawyer) =>
        lawyer.name.toLowerCase().contains(query.toLowerCase()) ||
        lawyer.lastName.toLowerCase().contains(query.toLowerCase()));

    // Apply filters if they are set
    if (appliedFilters.contains(locationFilter)) {
      filteredList =
          filteredList.where((lawyer) => lawyer.location == locationFilter);
    }

    if (appliedFilters.contains(typeFilter)) {
      filteredList = filteredList.where(
          (lawyer) => lawyer.type.toLowerCase() == typeFilter!.toLowerCase());
    }

    return _buildListView(context, filteredList);
  }

  Widget _buildListView(BuildContext context, Iterable<Lawyer> list) {
    return ListView.builder(
      itemCount: list.length,
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
                  images: list.elementAt(index).image,
                  Name: list.elementAt(index).name,
                  Type: 'Lawyer',
                  Lastname: list.elementAt(index).lastName,
                  Phone: list.elementAt(index).phone,
                  valide: list.elementAt(index).valide,
                );
              },
            );
          },
          child: Column(
            children: [
              card(
                valide: list.elementAt(index).valide,
                name: list.elementAt(index).name,
                Lastname: list.elementAt(index).lastName,
                image: Image(
                  image: AssetImage(list.elementAt(index).image),
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

  void _showFilterDialog(BuildContext context) {
    String? selectedLocation;
    String? selectedType;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Apply Filters"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    spacing: 8.0,
                    children: [
                      for (String location in [
                        "Tunis",
                        "Ariana",
                        "Nabel",
                        "Sousse",
                        "Medenine",
                        "Gafsa"
                      ])
                        ChoiceChip(
                          label: Text(location),
                          selected: selectedLocation == location,
                          onSelected: (selected) {
                            setState(() {
                              selectedLocation = selected ? location : null;
                              appliedFilters.add(selectedLocation!);
                            });
                          },
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    children: [
                      ChoiceChip(
                        label: Text("Normal"),
                        selected: selectedType == "Normal",
                        onSelected: (selected) {
                          setState(() {
                            selectedType = selected ? "Normal" : null;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Apply filters based on selectedLocation and selectedType
                  },
                  child: Text("Apply"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void remove() {
    appliedFilters = [];
  }
}
