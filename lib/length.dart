

class Length{
  List<String> dropdownValues=['cm','in','feet'];
  double converted=0;
  double feet2in(double n){
    return n*12;
  }
  double in2feet(double n){
    return n/12;
  }
  double cm2in(double n){
    return n*0.393701;
  }
  double in2cm(double n){
    return n*2.54;
  }
  double feet2cm(double n){
    return n*30.48;
  }
  double cm2feet(double n){
    return n/30.48;
  }

  void Convert(String a, String b, double n){
    if(a==b)
      { converted=n;}
    else if (a=='cm' && b=='in'){ converted=cm2in(n);}
    else if (a=='in' && b=='cm'){ converted=in2cm(n);}
    else if (a=='feet' && b=='in'){ converted=feet2in(n);}
    else if (a=='in' && b=='feet'){ converted=in2feet(n);}
    else if (a=='cm' && b=='feet'){ converted=cm2feet(n);}
    else if (a=='feet' && b=='cm'){ converted=feet2cm(n);}

  }
  
}