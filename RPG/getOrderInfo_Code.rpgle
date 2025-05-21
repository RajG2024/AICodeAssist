**free

// File Declaration
Dcl-F ORDERPF  keyed Usage(*Input);

Dcl-Pi ORDERINFOR;
   inOrderId Zoned(6:0);
End-Pi;

// Variable Declaration
Dcl-S wkCurrentYear Zoned(4:0);
Dcl-S wkOrdYear     Zoned(4:0);

// Main Logic

Chain inOrderId ORDERPF;

// If record is found in ORDERPF equal to inOrderId, display it. Else display the error msg
If %Found();

  wkCurrentYear = %Subdt(%Date():*Years);
  wkOrdYear = %Subdt(OrdDate:*Years);

  If wkCurrentYear = wkOrdYear;
     Dsply %Char(OrdAmt);
  Else;
     Dsply 'Order is not of the current year';
  EndIf;

Else;
  Dsply 'Order Not Found';
EndIf;

*Inlr = *On;