class Time{
  gettime(var Datetime){
    if(Datetime<12){
      return "Morning";

    }
    else if (Datetime>12&&Datetime<17){
      return "Afternoon";
    }
    else {
      return "Evening";
    }
  }

  getimage(var datetime){
    int imagenum;
    if(datetime<12){
      imagenum =1;
      return imagenum;

    }
    else if (datetime>12&&datetime<17){
      imagenum=2;
      return imagenum;
    }
    else {
      imagenum =3;
      return imagenum;  ;
    }
  }
}