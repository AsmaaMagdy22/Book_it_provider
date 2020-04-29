//import 'package:flutter/cupertino.dart';

class Activity{
  final String name;
  final String activityId ;
  final String cataegory;
  final String owner;
  final String about;
  final String location;
  final String number;
  final String link;
  final String imageUrl;
  final String userId;
  final String documentId;
  final String imageFileName;


  Activity({
    this.userId,
    this.activityId,
    this.name,
    this.owner,
    this.about,
    this.location,
    this.number,
    this.link,
    this.cataegory,
    this.documentId,
    this.imageUrl,
    this.imageFileName,

  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'activityId' : activityId ,
      'name': name,
      'imageUrl': imageUrl,
      'owner': owner,
      'about': about,
      'location': location,
      'number': number,
      'link': link,
      'cataegory': cataegory,
      'imageFileName': imageFileName,


    };
  }

  static Activity fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    return Activity(
      name: map['name'],
      activityId: map ['activityId'],
      imageUrl: map['imageUrl'],
      userId: map['userId'],
      owner: map['owner'],
      about: map['about'],
      location: map['location'],
      link: map['link'],
      cataegory: map['cataegory'],
      number: map['number'],
      imageFileName: map['imageFileName'],

      documentId: documentId,
    );
  }
}
