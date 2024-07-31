/// events : {"incoming":[{"name":"Easter Sunday Service","title":"Easter Celebration","image":"easter_celebration.jpg","date":"2024-04-21","time":"10:00 AM","ages":"All ages","description":"Join us for a special Easter Sunday service to celebrate the resurrection of Jesus Christ.","additional_data":"Special guest speaker, choir performance, and a community lunch after the service."},{"name":"Youth Retreat","title":"Summer Youth Retreat","image":"youth_retreat.jpg","date":"2024-07-15","time":"9:00 AM","ages":"13-18 years","description":"A week-long retreat for the youth to grow in faith and fellowship.","additional_data":"Workshops, outdoor activities, and nightly worship sessions."},{"name":"Christmas Eve Service","title":"Christmas Eve Celebration","image":"christmas_eve.jpg","date":"2024-12-24","time":"7:00 PM","ages":"All ages","description":"Celebrate the birth of Jesus with a special Christmas Eve service.","additional_data":"Candlelight service, children's nativity play, and Christmas carols."},{"name":"Fall Harvest Festival","title":"Harvest Festival","image":"harvest_festival.jpg","date":"2024-10-10","time":"3:00 PM","ages":"All ages","description":"Join us for a fun-filled fall festival with activities for all ages.","additional_data":"Hayrides, pumpkin carving, and a potluck dinner."},{"name":"Spring Revival","title":"Spring Revival Event","image":"spring_revival.jpg","date":"2024-05-18","time":"6:00 PM","ages":"All ages","description":"A revival event to renew and refresh your spirit this spring.","additional_data":"Inspirational speakers, prayer sessions, and uplifting worship music."}],"past":[{"name":"Christmas Eve Service","title":"Christmas Celebration","image":"christmas_celebration.jpg","date":"2023-12-24","time":"7:00 PM","ages":"All ages","description":"A beautiful Christmas Eve service with carols, a nativity play, and a candlelight vigil.","additional_data":"Family-friendly event with hot cocoa and cookies after the service."},{"name":"Thanksgiving Service","title":"Thanksgiving Celebration","image":"thanksgiving_service.jpg","date":"2023-11-23","time":"10:00 AM","ages":"All ages","description":"A service to give thanks and celebrate the blessings of the past year.","additional_data":"Community potluck dinner following the service."},{"name":"Easter Sunday Service","title":"Easter Celebration","image":"easter_celebration_past.jpg","date":"2023-04-09","time":"10:00 AM","ages":"All ages","description":"Join us for a joyful Easter Sunday service celebrating the resurrection of Jesus.","additional_data":"Easter egg hunt for kids and a special choir performance."},{"name":"Summer Youth Camp","title":"Youth Camp","image":"youth_camp.jpg","date":"2023-07-20","time":"9:00 AM","ages":"13-18 years","description":"A week-long summer camp for the youth filled with fun and fellowship.","additional_data":"Outdoor adventures, faith-based workshops, and evening worship sessions."},{"name":"New Year's Eve Service","title":"New Year Celebration","image":"new_year_eve.jpg","date":"2023-12-31","time":"10:00 PM","ages":"All ages","description":"Ring in the New Year with a special evening service and celebration.","additional_data":"Midnight prayer, live music, and refreshments."}]}
/// prayers : [{"image":"prayer_image1.jpg","title":"Morning Prayer","details":"A prayer to start the day with a focus on Jesus Christ.","phrases":["Lord, thank You for a new day.","Guide me and protect me throughout the day.","Let Your light shine through me."]},{"image":"prayer_image2.jpg","title":"Evening Prayer","details":"A prayer to end the day with gratitude and peace.","phrases":["Thank You, Lord, for this day.","Forgive me for my mistakes and guide me tomorrow.","Grant me peaceful rest and renewal."]},{"image":"prayer_image3.jpg","title":"Prayer for Strength","details":"A prayer asking for strength and perseverance.","phrases":["Lord, give me strength to face my challenges.","Help me to remain steadfast in my faith.","Empower me to overcome any obstacles."]},{"image":"prayer_image4.jpg","title":"Prayer for Healing","details":"A prayer for physical, emotional, and spiritual healing.","phrases":["Lord, bring Your healing touch to my body and soul.","Grant me comfort in times of pain.","Restore me to full health according to Your will."]},{"image":"prayer_image5.jpg","title":"Prayer for Guidance","details":"A prayer seeking God's guidance in making decisions.","phrases":["Lord, lead me on the right path.","Grant me wisdom to make wise choices.","Let Your will be done in my life."]}]
/// contact : {"email":"contact@jesushouse.org","phone":"+1234567890","address":"123 Faith Avenue, Heaven City, HC 12345"}
/// about : {"information":"Jesus House is a place of worship, community, and spiritual growth. Our mission is to spread the love of Jesus Christ through our services, events, and outreach programs.","images":["church_front.jpg","inside_church.jpg","community_event.jpg"]}
/// gallery : [{"title":"Church Services","images":["service1.jpg","service2.jpg","service3.jpg"]},{"title":"Community Events","images":["event1.jpg","event2.jpg","event3.jpg"]}]
/// news : [{"title":"New Pastor Announcement","date":"2024-05-01","description":"We are excited to welcome Pastor John Doe as our new lead pastor.","image":"pastor_john.jpg"},{"title":"Church Expansion Project","date":"2024-06-10","description":"Our church is expanding to accommodate more members and community services.","image":"expansion_project.jpg"}]

class JModels {
  JModels({
      Events? events, 
      List<Prayers>? prayers, 
      Contact? contact, 
      About? about, 
      List<Gallery>? gallery, 
      List<News>? news,}){
    _events = events;
    _prayers = prayers;
    _contact = contact;
    _about = about;
    _gallery = gallery;
    _news = news;
}

  JModels.fromJson(dynamic json) {
    _events = json['events'] != null ? Events.fromJson(json['events']) : null;
    if (json['prayers'] != null) {
      _prayers = [];
      json['prayers'].forEach((v) {
        _prayers?.add(Prayers.fromJson(v));
      });
    }
    _contact = json['contact'] != null ? Contact.fromJson(json['contact']) : null;
    _about = json['about'] != null ? About.fromJson(json['about']) : null;
    if (json['gallery'] != null) {
      _gallery = [];
      json['gallery'].forEach((v) {
        _gallery?.add(Gallery.fromJson(v));
      });
    }
    if (json['news'] != null) {
      _news = [];
      json['news'].forEach((v) {
        _news?.add(News.fromJson(v));
      });
    }
  }
  Events? _events;
  List<Prayers>? _prayers;
  Contact? _contact;
  About? _about;
  List<Gallery>? _gallery;
  List<News>? _news;
JModels copyWith({  Events? events,
  List<Prayers>? prayers,
  Contact? contact,
  About? about,
  List<Gallery>? gallery,
  List<News>? news,
}) => JModels(  events: events ?? _events,
  prayers: prayers ?? _prayers,
  contact: contact ?? _contact,
  about: about ?? _about,
  gallery: gallery ?? _gallery,
  news: news ?? _news,
);
  Events? get events => _events;
  List<Prayers>? get prayers => _prayers;
  Contact? get contact => _contact;
  About? get about => _about;
  List<Gallery>? get gallery => _gallery;
  List<News>? get news => _news;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_events != null) {
      map['events'] = _events?.toJson();
    }
    if (_prayers != null) {
      map['prayers'] = _prayers?.map((v) => v.toJson()).toList();
    }
    if (_contact != null) {
      map['contact'] = _contact?.toJson();
    }
    if (_about != null) {
      map['about'] = _about?.toJson();
    }
    if (_gallery != null) {
      map['gallery'] = _gallery?.map((v) => v.toJson()).toList();
    }
    if (_news != null) {
      map['news'] = _news?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "New Pastor Announcement"
/// date : "2024-05-01"
/// description : "We are excited to welcome Pastor John Doe as our new lead pastor."
/// image : "pastor_john.jpg"

class News {
  News({
      String? title, 
      String? date, 
      String? description, 
      String? image,}){
    _title = title;
    _date = date;
    _description = description;
    _image = image;
}

  News.fromJson(dynamic json) {
    _title = json['title'];
    _date = json['date'];
    _description = json['description'];
    _image = json['image'];
  }
  String? _title;
  String? _date;
  String? _description;
  String? _image;
News copyWith({  String? title,
  String? date,
  String? description,
  String? image,
}) => News(  title: title ?? _title,
  date: date ?? _date,
  description: description ?? _description,
  image: image ?? _image,
);
  String? get title => _title;
  String? get date => _date;
  String? get description => _description;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['date'] = _date;
    map['description'] = _description;
    map['image'] = _image;
    return map;
  }

}

/// title : "Church Services"
/// images : ["service1.jpg","service2.jpg","service3.jpg"]

class Gallery {
  Gallery({
      String? title, 
      List<String>? images,}){
    _title = title;
    _images = images;
}

  Gallery.fromJson(dynamic json) {
    _title = json['title'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  String? _title;
  List<String>? _images;
Gallery copyWith({  String? title,
  List<String>? images,
}) => Gallery(  title: title ?? _title,
  images: images ?? _images,
);
  String? get title => _title;
  List<String>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['images'] = _images;
    return map;
  }

}

/// information : "Jesus House is a place of worship, community, and spiritual growth. Our mission is to spread the love of Jesus Christ through our services, events, and outreach programs."
/// images : ["church_front.jpg","inside_church.jpg","community_event.jpg"]

class About {
  About({
      String? information, 
      List<String>? images,}){
    _information = information;
    _images = images;
}

  About.fromJson(dynamic json) {
    _information = json['information'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  String? _information;
  List<String>? _images;
About copyWith({  String? information,
  List<String>? images,
}) => About(  information: information ?? _information,
  images: images ?? _images,
);
  String? get information => _information;
  List<String>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['information'] = _information;
    map['images'] = _images;
    return map;
  }

}

/// email : "contact@jesushouse.org"
/// phone : "+1234567890"
/// address : "123 Faith Avenue, Heaven City, HC 12345"

class Contact {
  Contact({
      String? email, 
      String? phone, 
      String? address,}){
    _email = email;
    _phone = phone;
    _address = address;
}

  Contact.fromJson(dynamic json) {
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
  }
  String? _email;
  String? _phone;
  String? _address;
Contact copyWith({  String? email,
  String? phone,
  String? address,
}) => Contact(  email: email ?? _email,
  phone: phone ?? _phone,
  address: address ?? _address,
);
  String? get email => _email;
  String? get phone => _phone;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    map['address'] = _address;
    return map;
  }

}

/// image : "prayer_image1.jpg"
/// title : "Morning Prayer"
/// details : "A prayer to start the day with a focus on Jesus Christ."
/// phrases : ["Lord, thank You for a new day.","Guide me and protect me throughout the day.","Let Your light shine through me."]

class Prayers {
  Prayers({
      String? image, 
      String? title, 
      String? details, 
      List<String>? phrases,}){
    _image = image;
    _title = title;
    _details = details;
    _phrases = phrases;
}

  Prayers.fromJson(dynamic json) {
    _image = json['image'];
    _title = json['title'];
    _details = json['details'];
    _phrases = json['phrases'] != null ? json['phrases'].cast<String>() : [];
  }
  String? _image;
  String? _title;
  String? _details;
  List<String>? _phrases;
Prayers copyWith({  String? image,
  String? title,
  String? details,
  List<String>? phrases,
}) => Prayers(  image: image ?? _image,
  title: title ?? _title,
  details: details ?? _details,
  phrases: phrases ?? _phrases,
);
  String? get image => _image;
  String? get title => _title;
  String? get details => _details;
  List<String>? get phrases => _phrases;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['title'] = _title;
    map['details'] = _details;
    map['phrases'] = _phrases;
    return map;
  }

}

/// incoming : [{"name":"Easter Sunday Service","title":"Easter Celebration","image":"easter_celebration.jpg","date":"2024-04-21","time":"10:00 AM","ages":"All ages","description":"Join us for a special Easter Sunday service to celebrate the resurrection of Jesus Christ.","additional_data":"Special guest speaker, choir performance, and a community lunch after the service."},{"name":"Youth Retreat","title":"Summer Youth Retreat","image":"youth_retreat.jpg","date":"2024-07-15","time":"9:00 AM","ages":"13-18 years","description":"A week-long retreat for the youth to grow in faith and fellowship.","additional_data":"Workshops, outdoor activities, and nightly worship sessions."},{"name":"Christmas Eve Service","title":"Christmas Eve Celebration","image":"christmas_eve.jpg","date":"2024-12-24","time":"7:00 PM","ages":"All ages","description":"Celebrate the birth of Jesus with a special Christmas Eve service.","additional_data":"Candlelight service, children's nativity play, and Christmas carols."},{"name":"Fall Harvest Festival","title":"Harvest Festival","image":"harvest_festival.jpg","date":"2024-10-10","time":"3:00 PM","ages":"All ages","description":"Join us for a fun-filled fall festival with activities for all ages.","additional_data":"Hayrides, pumpkin carving, and a potluck dinner."},{"name":"Spring Revival","title":"Spring Revival Event","image":"spring_revival.jpg","date":"2024-05-18","time":"6:00 PM","ages":"All ages","description":"A revival event to renew and refresh your spirit this spring.","additional_data":"Inspirational speakers, prayer sessions, and uplifting worship music."}]
/// past : [{"name":"Christmas Eve Service","title":"Christmas Celebration","image":"christmas_celebration.jpg","date":"2023-12-24","time":"7:00 PM","ages":"All ages","description":"A beautiful Christmas Eve service with carols, a nativity play, and a candlelight vigil.","additional_data":"Family-friendly event with hot cocoa and cookies after the service."},{"name":"Thanksgiving Service","title":"Thanksgiving Celebration","image":"thanksgiving_service.jpg","date":"2023-11-23","time":"10:00 AM","ages":"All ages","description":"A service to give thanks and celebrate the blessings of the past year.","additional_data":"Community potluck dinner following the service."},{"name":"Easter Sunday Service","title":"Easter Celebration","image":"easter_celebration_past.jpg","date":"2023-04-09","time":"10:00 AM","ages":"All ages","description":"Join us for a joyful Easter Sunday service celebrating the resurrection of Jesus.","additional_data":"Easter egg hunt for kids and a special choir performance."},{"name":"Summer Youth Camp","title":"Youth Camp","image":"youth_camp.jpg","date":"2023-07-20","time":"9:00 AM","ages":"13-18 years","description":"A week-long summer camp for the youth filled with fun and fellowship.","additional_data":"Outdoor adventures, faith-based workshops, and evening worship sessions."},{"name":"New Year's Eve Service","title":"New Year Celebration","image":"new_year_eve.jpg","date":"2023-12-31","time":"10:00 PM","ages":"All ages","description":"Ring in the New Year with a special evening service and celebration.","additional_data":"Midnight prayer, live music, and refreshments."}]

class Events {
  Events({
      List<Incoming>? incoming, 
      List<Past>? past,}){
    _incoming = incoming;
    _past = past;
}

  Events.fromJson(dynamic json) {
    if (json['incoming'] != null) {
      _incoming = [];
      json['incoming'].forEach((v) {
        _incoming?.add(Incoming.fromJson(v));
      });
    }
    if (json['past'] != null) {
      _past = [];
      json['past'].forEach((v) {
        _past?.add(Past.fromJson(v));
      });
    }
  }
  List<Incoming>? _incoming;
  List<Past>? _past;
Events copyWith({  List<Incoming>? incoming,
  List<Past>? past,
}) => Events(  incoming: incoming ?? _incoming,
  past: past ?? _past,
);
  List<Incoming>? get incoming => _incoming;
  List<Past>? get past => _past;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_incoming != null) {
      map['incoming'] = _incoming?.map((v) => v.toJson()).toList();
    }
    if (_past != null) {
      map['past'] = _past?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Christmas Eve Service"
/// title : "Christmas Celebration"
/// image : "christmas_celebration.jpg"
/// date : "2023-12-24"
/// time : "7:00 PM"
/// ages : "All ages"
/// description : "A beautiful Christmas Eve service with carols, a nativity play, and a candlelight vigil."
/// additional_data : "Family-friendly event with hot cocoa and cookies after the service."

class Past {
  Past({
      String? name, 
      String? title, 
      String? image, 
      String? date, 
      String? time, 
      String? ages, 
      String? description, 
      String? additionalData,}){
    _name = name;
    _title = title;
    _image = image;
    _date = date;
    _time = time;
    _ages = ages;
    _description = description;
    _additionalData = additionalData;
}

  Past.fromJson(dynamic json) {
    _name = json['name'];
    _title = json['title'];
    _image = json['image'];
    _date = json['date'];
    _time = json['time'];
    _ages = json['ages'];
    _description = json['description'];
    _additionalData = json['additional_data'];
  }
  String? _name;
  String? _title;
  String? _image;
  String? _date;
  String? _time;
  String? _ages;
  String? _description;
  String? _additionalData;
Past copyWith({  String? name,
  String? title,
  String? image,
  String? date,
  String? time,
  String? ages,
  String? description,
  String? additionalData,
}) => Past(  name: name ?? _name,
  title: title ?? _title,
  image: image ?? _image,
  date: date ?? _date,
  time: time ?? _time,
  ages: ages ?? _ages,
  description: description ?? _description,
  additionalData: additionalData ?? _additionalData,
);
  String? get name => _name;
  String? get title => _title;
  String? get image => _image;
  String? get date => _date;
  String? get time => _time;
  String? get ages => _ages;
  String? get description => _description;
  String? get additionalData => _additionalData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['title'] = _title;
    map['image'] = _image;
    map['date'] = _date;
    map['time'] = _time;
    map['ages'] = _ages;
    map['description'] = _description;
    map['additional_data'] = _additionalData;
    return map;
  }

}

/// name : "Easter Sunday Service"
/// title : "Easter Celebration"
/// image : "easter_celebration.jpg"
/// date : "2024-04-21"
/// time : "10:00 AM"
/// ages : "All ages"
/// description : "Join us for a special Easter Sunday service to celebrate the resurrection of Jesus Christ."
/// additional_data : "Special guest speaker, choir performance, and a community lunch after the service."

class Incoming {
  Incoming({
      String? name, 
      String? title, 
      String? image, 
      String? date, 
      String? time, 
      String? ages, 
      String? description, 
      String? additionalData,}){
    _name = name;
    _title = title;
    _image = image;
    _date = date;
    _time = time;
    _ages = ages;
    _description = description;
    _additionalData = additionalData;
}

  Incoming.fromJson(dynamic json) {
    _name = json['name'];
    _title = json['title'];
    _image = json['image'];
    _date = json['date'];
    _time = json['time'];
    _ages = json['ages'];
    _description = json['description'];
    _additionalData = json['additional_data'];
  }
  String? _name;
  String? _title;
  String? _image;
  String? _date;
  String? _time;
  String? _ages;
  String? _description;
  String? _additionalData;
Incoming copyWith({  String? name,
  String? title,
  String? image,
  String? date,
  String? time,
  String? ages,
  String? description,
  String? additionalData,
}) => Incoming(  name: name ?? _name,
  title: title ?? _title,
  image: image ?? _image,
  date: date ?? _date,
  time: time ?? _time,
  ages: ages ?? _ages,
  description: description ?? _description,
  additionalData: additionalData ?? _additionalData,
);
  String? get name => _name;
  String? get title => _title;
  String? get image => _image;
  String? get date => _date;
  String? get time => _time;
  String? get ages => _ages;
  String? get description => _description;
  String? get additionalData => _additionalData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['title'] = _title;
    map['image'] = _image;
    map['date'] = _date;
    map['time'] = _time;
    map['ages'] = _ages;
    map['description'] = _description;
    map['additional_data'] = _additionalData;
    return map;
  }

}