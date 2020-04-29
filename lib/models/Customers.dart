class Customers {
  final String activityId;
  final String custName;
  final String waitingTime;
  final String whilee;
  final String documentId;


  Customers({
    this.activityId,
    this.custName,
    this.waitingTime,
    this.whilee,
    this.documentId,
  });

  Map<dynamic, dynamic> toMap() {
    return {
      'activityId': activityId,
      'custName': custName,
      'waitingTime': waitingTime,
      'whilee': whilee,
    };
  }
  static Customers fromMap(Map<dynamic, dynamic> map, String documentId) {
    if (map == null) return null;

    return Customers(
      activityId: map['activityId'],
      custName: map['custName'],
      waitingTime: map['waitingTime'],
      whilee: map['whilee'],
      documentId: documentId,

    );
  }
}
