class Speed{
  List<String> dropdownValues=['km/h','m/s','miles/hr'];
  double converted=0;
  double kh2ms(double n){
    return n/3.6;
  }
  double ms2kh(double n){
    return n*3.6;
  }
  double kh2ml(double n){
    return n/1.609;
  }
  double ml2kh(double n){
    return n*1.609;
  }
  double ms2ml(double n){
    return n*2.237;
  }
  double ml2ms(double n){
    return n/2.237;
  }

  void Convert(String a, String b, double n){
    if(a==b)
    { converted=n;}
    else if (a=='km/h' && b=='m/s'){ converted=kh2ms(n);}
    else if (a=='km/h' && b=='miles/hr'){ converted=kh2ml(n);}
    else if (a=='m/s' && b=='km/h'){ converted=ms2kh(n);}
    else if (a=='m/s' && b=='miles/hr'){ converted=ms2ml(n);}
    else if (a=='miles/hr' && b=='km/h'){ converted=ml2kh(n);}
    else if (a=='miles/hr' && b=='m/s'){ converted=ml2ms(n);}

  }

}