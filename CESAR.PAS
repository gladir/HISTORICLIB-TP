{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/HISTORICLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit CESAR;

INTERFACE

Function ChiffrerCesarCode(Msg:String):String;
Function DechiffrerCesarCode(Msg:String):String;

IMPLEMENTATION

Function ChiffrerCesarCode(Msg:String):String;
Var
 R:String;
 I:Integer;
Begin
 R:='';
 For I:=1 to Length(Msg)do Begin
  If Msg[I]in['A'..'Z','a'..'z']Then Begin
   If UpCase(Msg[I])in['X','Y','Z']Then Begin
    Write(Chr(Ord(Msg[I])-26+3));
   End
    Else
   Write(Chr(Ord(Msg[I])+3));
  End
   Else
  Write(Msg[I]);
 End;
 ChiffrerCesarCode:=R;
End;

Function DechiffrerCesarCode(Msg:String):String;
Var
 R:String;
 I:Integer;
Begin
 R:='';
 For I:=1 to Length(Msg)do Begin
  If Msg[I] in['A'..'Z','a'..'z']Then Begin
   If UpCase(Msg[I])in['A','B','C']Then Begin
    R:=R+Chr(Ord(Msg[I])+26-3);
   End
    Else
   R:=R+Chr(Ord(Msg[I])-3);
  End
   Else
  Write(Msg[I]);
 End;
 DechiffrerCesarCode:=R;
End;

END.