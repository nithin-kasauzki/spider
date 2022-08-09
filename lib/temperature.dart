class Temperature{
  List<String> dropdownValues=['*c','*f','k'];
  double converted=0;
  double c2f(double n){
    return (1.8*n +32);
  }
  double f2c(double n){
    return (n-32)/1.8;
  }
  double c2k(double n){
    return n+273;
  }
  double k2c(double n){
    return n-273;
  }
  double f2k(double n){
    return f2c(n)+273;
  }
  double k2f(double n){
    return c2f(n-273);
  }

  void Convert(String a, String b, double n){
    if(a==b)
    { converted=n;}
    else if (a=='*c' && b=='*f'){ converted=c2f(n);}
    else if (a=='*c' && b=='k'){ converted=c2k(n);}
    else if (a=='*f' && b=='*c'){ converted=f2c(n);}
    else if (a=='*f' && b=='k'){ converted=f2k(n);}
    else if (a=='k' && b=='*f'){ converted=k2f(n);}
    else if (a=='k' && b=='*c'){ converted=k2c(n);}

  }

}