function RemoveAcento(const stringAcentuada: string): string;
const
  comAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  semAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
  remove1 = '"';
  remove2 = ',';
var
   x,y: Integer;
   comAcentoList,semAcentoList,palavraList: TStringList;
begin
  if Trim(stringAcentuada) <> '' then
  begin
    comAcentoList := TStringList.Create;
    semAcentoList := TStringList.Create;
    palavraList   := TStringList.Create;

    for x := 1 to Length(ComAcento) do
    begin
      comAcentoList.Add(Copy(ComAcento, x, 1));
      semAcentoList.Add(Copy(SemAcento, x, 1));
    end;

    for x := 1 to Length(stringAcentuada) do
      palavraList.Add(Copy(stringAcentuada, x, 1));

    for x := 0 to palavraList.Count - 1 do
    begin
      for y := 0 to comAcentoList.Count - 1 do
      begin
        if Pos(palavraList[x],comAcentoList[y]) <> 0 then
          palavraList[x] := semAcentoList[y];
      end;
    end;
    Result := StringReplace(StringReplace(palavraList.CommaText,remove1,''), remove2, '');
  end
  else
    Result := '';
end;

Usage:
Text := RemoveAcento('m¡rÌng·'); // Output: mAringa