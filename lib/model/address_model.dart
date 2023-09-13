class AddressModel {
  //final String? documentId;
  final String name;
  final String phone;
  final String zipcode;
  final String housename;
  final String city;
  final String state;
  final String postoffice;
  AddressModel({
    //this.documentId,
    required this.name,
    required this.phone,
    required this.zipcode,
    required this.housename,
    required this.city,
    required this.state,
    required this.postoffice,
  });
  
  AddressModel.fromMap({required data})
      : //documentId=data['documentId'],
        name = data['name'],
        phone = data['phone'] as String,
        zipcode = data['zipcode']as String,
        housename = data['housename'],
        city = data['city'],
        state = data['state'],
        postoffice=data['postoffice'];
        

  Map<String, dynamic> toMap() {
    return {
      //'documentId':documentId,
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
