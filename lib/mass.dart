class Weight{
  List<String> dropdownValues=['kg','lb','oz'];
  double converted=0;
  double lb2oz(double n){
    return n*16;
  }
  double oz2lb(double n){
    return n/16;
  }
  double kg2lb(double n){
    return n*2.20462;
  }
  double lb2kg(double n){
    return n*0.453592;
  }
  double kg2oz(double n){
    return n*35.274;
  }
  double oz2kg(double n){
    return n/35.274;
  }

  void Convert(String a, String b, double n){
    if(a==b)
    { converted=n;}
    else if (a=='kg' && b=='oz'){ converted=kg2oz(n);}
    else if (a=='kg' && b=='lb'){ converted=kg2lb(n);}
    else if (a=='lb' && b=='oz'){ converted=lb2oz(n);}
    else if (a=='lb' && b=='kg'){ converted=lb2kg(n);}
    else if (a=='oz' && b=='lb'){ converted=oz2lb(n);}
    else if (a=='oz' && b=='kg'){ converted=oz2kg(n);}

  }

}