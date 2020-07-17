import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';


class Auth with ChangeNotifier{
  String _token;
  DateTime _dateTime;
  String _userId;

  Future _authenticate(String email, String password, String urlSegment) async {
    print('inside authenticate');
    final url ="https://identitytoolkit.googleapis.com/v1/$urlSegment?key=AIzaSyCinkDvbmQ0DIB4SrJRfSNGXBaPMM1RUjE";
      try{
          final response =  await http.post(
            url, 
            body:json.encode(
              { 'email':email,
                'password': password, 
                'returnSecureToken':true,
              },
            ),
          );
          //print('inside try');
          final responseData= json.decode(response.body);
          //print(responseData);
          if(responseData['error'] != null){
            throw HttpException(responseData['error']['message']);
          }
          else{
            return responseData;
          }
      }
      catch(error){
        print( error);
        throw error;
      }
  }

  Future signup( String email,String password) async{
    print('inside auth.dart'+ password );
    return _authenticate( email, password, 'accounts:signUp');
    
  }

  Future login( String email, String password) async {
    print('inside auth.dart'+ email );
    return _authenticate( email, password, 'accounts:signInWithPassword');
  }
}