// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressModel {
  final String name;
  final String phone;
  final String zipcode;
  final String housename;
  final String city;
  final String state;
  final String postoffice;
  AddressModel({
    required this.name,
    required this.phone,
    required this.zipcode,
    required this.housename,
    required this.city,
    required this.state,
    required this.postoffice,
  });
  

  AddressModel.fromMap({required Map<String, dynamic> data})
      : name = data['name'],
        phone = data['phone'],
        zipcode = data['zipcode'],
        housename = data['housename'],
        city = data['city'],
        state = data['state'],
        postoffice=data['postoffice'];
        

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'zipcode': zipcode,
      'housename': housename,
      'city': city,
      'state': state,
      'postoffice': postoffice,
    };
  }
}
