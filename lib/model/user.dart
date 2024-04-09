class User {
   String? userId;
   String? userName;
   String? userEmail;
   String? userPhone;

  User(
      {required this.userId,
      required this.userName,
      required this.userEmail,
      required this.userPhone});

 User.fromJson(Map data){
   userId= data['userId'] ;
   userName= data['name'];
   userEmail= data['email'];
   userPhone= data['phone'];
 }

   static Map<String, dynamic> toJson(User user) {
     final map = <String, dynamic>{};
     map['userId'] = user.userId;
     map['name'] = user.userName;
     map['email'] = user.userEmail;
     map['phone'] = user.userPhone;
     return map;
   }

}





