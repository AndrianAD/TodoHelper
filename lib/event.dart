

class Event {
  String name;
  String description;
  String time;
  String sortOrder;
  String eventId;

  Event({this.name, this.description, this.time, this.sortOrder, this.eventId});

  Event.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    time = json['time'];
    sortOrder = json['sort_order'];
    eventId = json['event_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['time'] = this.time;
    data['sort_order'] = this.sortOrder;
    data['event_id'] = this.eventId;
    return data;
  }
}