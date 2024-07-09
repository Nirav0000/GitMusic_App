class MusicData {
  String? id;
  String? title;
  List<Items>? items;

  MusicData({this.id, this.title, this.items});

  MusicData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? title;
  String? imgUrl;
  String? audioUrl;

  Items({this.id, this.title, this.imgUrl, this.audioUrl});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imgUrl = json['imgUrl'];
    audioUrl = json['audioUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['imgUrl'] = this.imgUrl;
    data['audioUrl'] = this.audioUrl;
    return data;
  }
}
