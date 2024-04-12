class Lawyer {
  String firstName;
  String lastName;
  String? phoneNumber;
  String image;
  bool? valide;
  String address;
  String bio;
  Lawyer(
      {required this.firstName,
      required this.lastName,
      this.phoneNumber,
      required this.image,
      this.valide,
      required this.address,
      required this.bio});
}
