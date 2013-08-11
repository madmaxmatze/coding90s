uses crt;

Const Pi = 3.1416;
Var Radius, Flache   : Real;

begin;
  ClrScr;
  Textcolor(15);
  Write ('Radius = ');
  Read (Radius);
  Flache := Pi * Radius * Radius;
  Writeln ('Fl„che =', Flache:9:2,' cmý');
  Repeat
  Until KeyPressed;
end.