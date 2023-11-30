class UserData {
  final int userId;
  final String userName;
  final String issuedOn;
  late final String phoneNumber;
  late final String email;
  final String address;
  final String password;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final bool isActive;
  final int nfcId;

  UserData({
    required this.userId,
    required this.userName,
    required this.issuedOn,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.isActive,
    required this.nfcId,
  });
}
