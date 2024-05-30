{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2024
  @website(https://www.gladir.com/8086-tools)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Program _8086DICT;

Uses Strings;

Type
 Instr8086Rec=Record
  Name:String[4];
  Description:PChar;
  Syntax:PChar;
 End;

Const
 Instr8086:Array[0..90]of Instr8086Rec=(
  (Name:'AAA';
   Description:'Cette instruction permet d''adapter le r‚sultat obtenu '+
               'par l''addition de 2 valeur en format DCB.';
   Syntax:'AAA'),
  (Name:'AAD';
   Description:'Cette instruction permet de convertir une valeur de '+
               'format DCB non compact‚e.';
   Syntax:'AAD'#13#10+
          'AAD imm‚diat 8'),
  (Name:'AAM';
   Description:'Cette instruction offre la possibilit‚ de convertir le '+
               'produit de la multiplication de 2 valeurs de format DCB '+
               'en un format DCB.';
   Syntax:'AAM'#13#10+
          'AAM imm‚diat 8'),
  (Name:'AAS';
   Description:'Cette instruction permet d''adapter le r‚sultat de la '+
               'soustraction de nombre de format DCB.';
   Syntax:'AAS'),
  (Name:'ADC';
   Description:'Cette instruction additionne 2 quantit‚s num‚riques sur '+
               '8 ou 16 bits et ajoute ensuite la valeur de l''indicateur '+
               'de retenue, lequel est contenu dans le drapeau CF(CARRY '+
               'FLAG), … la somme obtenu.';
   Syntax:'ADC Op‚rande Cible,Op‚rande Source'),
  (Name:'ADD';
   Description:'Cette instruction additionne 2 quantit‚s num‚rique sur 8, '+
               '16 ou 32 bits.';
   Syntax:'ADD Op‚rande Cible, Op‚rande Source'),
  (Name:'AND';
   Description:'Cette instruction permet d''effectuer un ET BINAIRE sur '+
               'les 2 op‚randes sp‚cifi‚s.';
   Syntax:'AND Op‚rande Cible, Op‚rande Source'),
  (Name:'CALL';
   Description:'Cette instruction force le microprocesseur … ex‚cuter '+
               'les instructions du sous-programme indiqu‚ par l''adresse '+
               'd''appel avant de continuer.';
   Syntax:'CALL adresse'),
  (Name:'CBW';
   Description:'Cette instruction permet de convertir un nombre contenu '+
               'dans le registre AL en un format sur 16 bits pour se '+
               'retrouver dans le registre AX en appliquant une extension '+
               'du signe.';
   Syntax:'CBW'),
  (Name:'CLC';
   Description:'Cette instruction permet de mettre l''indicateur d''‚tat '+
               'de retenu CF … 0.';
   Syntax:'CLC'),
  (Name:'CLD';
   Description:'Cette instruction met l''indicateur d''‚tat DF … 0, soit '+
               'la direction croissante.';
   Syntax:'CLD'),
  (Name:'CLI';
   Description:'Cette instruction met l''indicateur d''‚tat IF … 0, soit '+
               'l''interdiction des interruptions.';
   Syntax:'CLI'),
  (Name:'CMC';
   Description:'Cette instruction offre la possibilit‚ d''inverser la '+
               'valeur de l''indicateur de retenue. Si ce dernier vaut 1, '+
               'elle le met … 0 et inversement.';
   Syntax:'CMC'),
  (Name:'CMP';
   Description:'Cette instruction offre la possibilit‚ essentielle de '+
               'comparer 2 registres ou emplacements de m‚moire.';
   Syntax:'CMP Op‚rande Cible, Op‚rande Source'),
  (Name:'CMPS';
   Description:'Cette instruction permet d''effectuer la comparaison d''un '+
               'octet, d''un mot ou double mot sp‚cifi‚ avec l''op‚rande source '+
               'et destination sp‚cifi‚ et fixe l''‚tat des drapeaux du '+
               'registres EFLAGS en fonction des r‚sultats de la comparaison';
   Syntax:'CMPS destination,source'),
  (Name:'CMPSB';
   Description:'Cette instruction permet d''effectuer la comparaison d''un '+
               'octet avec l''op‚rande source (DS:(R)SI) et destination '+
               '(ES:(R)DI) et fixe l''‚tat des drapeaux du registres '+
               'EFLAGS en fonction des r‚sultats de la comparaison.';
   Syntax:'CMPSB'),
  (Name:'CMPSW';
   Description:'Cette instruction permet d''effectuer la comparaison '+
               'd''un mot avec l''op‚rande source (DS:(R)SI) et '+
               'destination (ES:(R)DI) et fixe l''‚tat des drapeaux du '+
               'registres EFLAGS en fonction des r‚sultats de la '+
               'comparaison.';
   Syntax:'CMPSW'),
  (Name:'CWD';
   Description:'Cette instruction est l''alternative pour convertir le '+
               'mot du registre AX en un double mot contenu dans le '+
               'couple de registre DX et AX par extension du signe.';
   Syntax:'CWD'),
  (Name:'DAA';
   Description:'Cette instruction corrige aprŠs coup les retenues lors '+
               'de la manipulation de valeur DCB.';
   Syntax:'DAA'),
  (Name:'DAS';
   Description:'Cette instruction offre l''int‚ressante possibilit‚ de '+
               'corrige le r‚sultat d''une soustraction de 2 nombres de '+
               'format DCB compact‚es.';
   Syntax:'DAS'),
  (Name:'DEC';
   Description:'Cette instruction d‚cr‚ment de 1 le registre ou l''adresse '+
               'm‚moire sp‚cifi‚.';
   Syntax:'DEC op‚rande'),
  (Name:'DIV';
   Description:'Cette instruction permet d''effectuer une division '+
               'non-sign‚e (nombre naturel).';
   Syntax:'DIV Op‚rande'),
  (Name:'ESC';
   Description:'Cette instruction active le coprocesseur, lequel se '+
               'permettra d''utiliser les m‚thodes d''adressage du '+
               'processeur principal (CPU).';
   Syntax:'ESC CodeOp‚ration,Adresse'),
  (Name:'HLT';
   Description:'Cette instruction permet de faire passer le microprocesseur '+
               'en mode d''arrˆt. Toutefois, le processeur peut quitter '+
               'cet ‚tat lorsqu''une ligne mat‚rielle RESET ou lorsqu''une '+
               'interruption non-masquable (NMI) re‡oit un signal.';
   Syntax:'HLT'),
  (Name:'IDIV';
   Description:'Cette instruction permet d''effectuer une division '+
               'sign‚e (nombre entier).';
   Syntax:'IDIV Op‚rande'),
  (Name:'IMUL';
   Description:'Cette instruction permet d''effectuer une multiplication '+
               'sign‚e (nombre entier).';
   Syntax:'IMUL Op‚rande'),
  (Name:'IN';
   Description:'Cette instruction permet de demander un octet, un mot ou un '+
               'double mot provenant du port d''entr‚e/sortie et le '+
               'retourne dans le registre accumulateur (AL, AX, EAX).';
   Syntax:'IN accumulateur,imm'#13#10+
          'IN accumulateur,DX'),
  (Name:'INC';
   Description:'Cette instruction permet d''incr‚menter un registre ou un '+
               'emplacement m‚moire.';
   Syntax:'INC registre'#13#10+
          'INC m‚moire'),
  (Name:'INT';
   Description:'Cette instruction permet d''ex‚cuter l''interruption avec '+
               'le num‚ro sp‚cifi‚.';
   Syntax:'INT num‚ro'),
  (Name:'INTO';
   Description:'Cette instruction permet d''ex‚cuter l''interruption '+
               'num‚ro 4 si le drapeau de d‚bordement (OF) est fix‚ sur 1.';
   Syntax:'INTO'),
  (Name:'IRET';
   Description:'Cette instruction permet d''effectuer un retour pr‚c‚demment '+
               'provoquer par une interruption.';
   Syntax:'IRET'),
  (Name:'Jcc';
   Description:'Ces instructions permettent d''effectuer d''effectuer un '+
               'branchement conditionnel … emplacement m‚moire sp‚cifi‚.';
   Syntax:'Jcc destination'),
  (Name:'JMP';
   Description:'Cette instruction permet d''effectuer un branchement … un '+
               'emplacement m‚moire sp‚cifi‚.';
   Syntax:'JMP destination'),
  (Name:'LAHF';
   Description:'Cette instruction permet de transf‚rer les bits '+
               'd''indicateurs du registre d''‚tat vers le registre AH.';
   Syntax:'LAHF'),
  (Name:'LDS';
   Description:'Cette instruction permet de copier une adresse de m‚moire '+
               'contenu sur 32 bits dans la paire de registre de segment DS '+
               'et dans un registre d''offset sp‚cifi‚.';
   Syntax:'LDS op‚rande_cible,op‚rande_source'),
  (Name:'LEA';
   Description:'Cette instruction permet de copier le d‚placement d''une '+
               'adresse de m‚moire contenu dans un registre sp‚cifi‚.';
   Syntax:'LEA op‚rande_cible,op‚rande_source'),
  (Name:'LES';
   Description:'Cette instruction permet de copier une adresse de m‚moire '+
               'contenu sur 32 bits dans la paire de registre de segment '+
               'ES et dans un registre de d‚placement sp‚cifi‚.';
   Syntax:'LES op‚rande_cible,op‚rande_source'),
  (Name:'LOCK';
   Description:'Cette instruction est utilis‚ comme pr‚fixe avec d''autres '+
               'instructions pour amener le microprocesseur … ‚mettre un '+
               'signal de verrouillage (Lock) sur le bus lors du traitement '+
               'de l''instruction suivante.';
   Syntax:'LOCK'),
  (Name:'LODS';
   Description:'Cette instruction permet de copier un ‚l‚ment de l''adresse '+
               'DS:SI dans le registre accumulateur et incr‚mente/d‚cr‚mente '+
               'le registre SI en fonction de la taille de l''op‚rande '+
               'source et de l''‚tat du drapeau de direction.';
   Syntax:'LODS chainesource'),
  (Name:'LODSB';
   Description:'Cette instruction permet de copier un ‚l‚ment de l''adresse '+
               'DS:SI dans le registre accumulateur et incr‚mente/d‚cr‚mente '+
               'le registre SI de 1 en fonction de l''‚tat du drapeau de '+
               'direction.';
   Syntax:'LODSB'),
  (Name:'LODSW';
   Description:'Cette instruction permet de copier un ‚l‚ment de l''adresse '+
               'DS:SI dans le registre accumulateur et incr‚mente/d‚cr‚mente '+
               'le registre SI de 2 en fonction de l''‚tat du drapeau de '+
               'direction.';
   Syntax:'LODSW'),
  (Name:'LOOP';
   Description:'Cette instruction de boucle permet de d‚cr‚menter le registre '+
               'CX (compteur de boucle) de 1 et par la suite de donner le '+
               'contr“le … une ‚tiquette destinataire tant que le registre '+
               'CX ne vaut pas 0.';
   Syntax:'LOOP ‚tiquette'),
  (Name:'LOOPE';
   Description:'Cette instruction de boucle permet de d‚cr‚menter le registre '+
               'CX (compteur de boucle) de 1 et par la suite de donner le '+
               'contr“le … une ‚tiquette destinataire tant que le registre '+
               'CX ne vaut pas 0 et si le drapeau ZF vaut 1.';
   Syntax:'LOOPE ‚tiquette'),
  (Name:'LOOPNE';
   Description:'Cette instruction de boucle permet de d‚cr‚menter le registre '+
               'CX (compteur de boucle) de 1 et par la suite de donner le '+
               'contr“le … une ‚tiquette destinataire tant que le registre '+
               'CX ne vaut pas 0 et si le drapeau ZF vaut 0.';
   Syntax:'LOOPNE ‚tiquette'),
  (Name:'MOV';
   Description:'Cette instruction permet de copier op‚rande source dans une '+
               'op‚rande destinataire.';
   Syntax:'MOV op‚randecible,op‚randesource'),
  (Name:'MOVS';
   Description:'Cette instruction permet de copier un ‚l‚ment de l''adresse '+
               'DS:SI dans l''adresse ES:DI et incr‚mente/d‚cr‚mente les '+
               'registres DI et SI en fonction de la taille de l''op‚rande '+
               'source et de l''‚tat du drapeau de direction.';
   Syntax:'MOVS op‚randecible,op‚randesource'),
  (Name:'MOVSB';
   Description:'Cette instruction permet de copier un octet de l''adresse '+
               'DS:SI dans l''adresse ES:DI et incr‚mente/d‚cr‚mente les '+
               'registres DI et SI de 1 en fonction de l''‚tat du drapeau de '+
               'direction.';
   Syntax:'MOVSB'),
  (Name:'MOVSW';
   Description:'Cette instruction permet de copier un mot de l''adresse '+
               'DS:SI dans l''adresse ES:DI et incr‚mente/d‚cr‚mente les '+
               'registres DI et SI de 2 en fonction de l''‚tat du drapeau '+
               'de direction.';
   Syntax:'MOVSW'),
  (Name:'MUL';
   Description:'Cette instruction permet d''effectuer une multiplication '+
               'non-sign‚e (nombre naturel).';
   Syntax:'MUL Op‚rande'),
  (Name:'NEG';
   Description:'Cette instruction permet d''effectuer le compl‚ment … 2 '+
               'd''une op‚rande.';
   Syntax:'NEG registre'#13#10+
          'NEG m‚moire'),
  (Name:'NOP';
   Description:'Cette instruction ne fait rien.';
   Syntax:'NOP'),
  (Name:'NOT';
   Description:'Cette instruction permet d''inverser la valeur de chacun '+
               'des bits d''une op‚rande.';
   Syntax:'NOT registre'#13#10+
          'NOT m‚moire'),
  (Name:'OR';
   Description:'Cette instruction permet d''effectuer un OU BINAIRE sur '+
               'les 2 op‚randes sp‚cifi‚s.';
   Syntax:'OR Op‚rande Cible, Op‚rande Source'),
  (Name:'OUT';
   Description:'Cette instruction permet d''envoyer un octet, un mot ou un '+
               'double mot sur le port d''entr‚e/sortie.';
   Syntax:'OUT adresse,accumulateur'),
  (Name:'POP';
   Description:'Cette instruction permet de d‚sempiler de la pile une mot '+
               'ou un double mot et la met dans une op‚rande.';
   Syntax:'POP op‚rande'),
  (Name:'POPF';
   Description:'Cette instruction permet de d‚sempiler de la pile le '+
               'registre 16 bits de drapeau contenant les indicateurs d''‚tat.';
   Syntax:'POPF'),
  (Name:'PUSH';
   Description:'Cette instruction permet d''empiler une mot ou un double '+
               'mot dans la pile.';
   Syntax:'PUSH op‚rande'),
  (Name:'PUSHF';
   Description:'Cette instruction permet d''empiler respectivement le '+
               'registre 16 bits de drapeau des indicateurs d''‚tat dans '+
               'la pile.';
   Syntax:'PUSHF'),
  (Name:'RCL';
   Description:'Cette instruction permet d''effectuer une rotation des bits '+
               'vers la gauche en r‚ins‚rant le bit dans l''indicateur de '+
               'retenue (CF) ainsi que dans le bit le plus … droite lib‚r‚.';
   Syntax:'RCL op‚randecible,1'#13#10+
          'RCL op‚randecible,CL'),
  (Name:'RCR';
   Description:'Cette instruction permet d''effectuer une rotation des bits '+
               'vers la droite en r‚ins‚rant le bit dans l''indicateur de '+
               'retenue (CF) ainsi que dans le bit le plus … gauche lib‚r‚.';
   Syntax:'RCR op‚randecible,1'#13#10+
          'RCR op‚randecible,CL'),
  (Name:'REP';
   Description:'Cette instruction est utilis‚ comme pr‚fixe avec d''autres '+
               'instructions pour effectuer des r‚p‚titions d''instructions '+
               'tant que CX ne vaut pas 0.';
   Syntax:'REP chaine_d''instruction_paramŠtre'),
  (Name:'REPE';
   Description:'Cette instruction est utilis‚ comme pr‚fixe avec d''autres '+
               'instructions pour effectuer des r‚p‚titions d''instructions '+
               'jusqu''… ce que CX = 0 ou tant que l''indicateur ZF = 0.';
   Syntax:'REPE chaine_d''instruction_paramŠtre'),
  (Name:'REPNE';
   Description:'Cette instruction est utilis‚ comme pr‚fixe avec d''autres '+
               'instructions pour effectuer des r‚p‚titions d''instructions '+
               'jusqu''… ce que CX = 0 ou tant que l''indicateur ZF = 1.';
   Syntax:'REPNE chaine_d''instruction_paramŠtre'),
  (Name:'RET';
   Description:'Cette instruction permet de quitter une proc‚dure.';
   Syntax:'RET'#13#10+
          'RET imm‚diat'),
  (Name:'RETF';
   Description:'Cette instruction permet de quitter une proc‚dure ayant '+
               'lieu avec un appel long (FAR CALL).';
   Syntax:'RETF'#13#10+
          'RETF imm‚diat'),
  (Name:'RETN';
   Description:'Cette instruction permet de quitter une proc‚dure ayant '+
               'lieu avec un appel court (NEAR CALL).';
   Syntax:'RETN'#13#10+
          'RETN imm‚diat'),
  (Name:'ROL';
   Description:'Cette instruction permet d''effectuer une rotation des '+
               'bits vers la gauche en r‚ins‚rant le bit dans le bit le '+
               'plus … droite lib‚r‚.';
   Syntax:'ROL op‚randecible,1'#13#10+
          'ROL op‚randecible,CL'),
  (Name:'ROR';
   Description:'Cette instruction permet d''effectuer une rotation des '+
               'bits vers la droite en r‚ins‚rant le bit dans le bit le '+
               'plus … gauche lib‚r‚.';
   Syntax:'ROR op‚randecible,1'#13#10+
          'ROR op‚randecible,CL'),
  (Name:'SAHF';
   Description:'Cette instruction permet de copier les bits du registre '+
               'AH dans l''octet de poids faible dans le registre des '+
               'drapeaux (les indicateurs d''‚tat).';
   Syntax:'SAHF'),
  (Name:'SAL';
   Description:'Cette instruction permet d''effectuer une rotation des '+
               'bits vers la gauche en r‚ins‚rant le bit dans '+
               'l''indicateur de retenue (CF).';
   Syntax:'SAL op‚randecible,1'#13#10+
          'SAL op‚randecible,CL'),
  (Name:'SAR';
   Description:'Cette instruction permet d''effectuer une rotation des '+
               'bits vers la droite en r‚ins‚rant le bit dans '+
               'l''indicateur de retenue (CF).';
   Syntax:'SAR op‚randecible,1'#13#10+
          'SAR op‚randecible,CL'),
  (Name:'SBB';
   Description:'Cette instruction permet de soustraire avec l''indicateur '+
               'de retenue (CF) une valeur … une op‚rande.';
   Syntax:'SBB op‚randecible,op‚randesource'),
  (Name:'SCAS';
   Description:'Cette instruction permet de comparer un octet, un mot ou un '+
               'double mot avec la cellule m‚moire … l''adresse ES:[DI] et '+
               'incr‚mente/d‚cr‚mente le registre DI en fonction de la taille '+
               'de l''op‚rande cible et de l''‚tat du drapeau de direction';
   Syntax:'SCAS chainecible'),
  (Name:'SCASB';
   Description:'Cette instruction permet de comparer le registre AL '+
               'avec la cellule m‚moire … l''adresse ES:[DI] et '+
               'incr‚mente/d‚cr‚mente le registre DI de 1 en fonction '+
               'de l''‚tat du drapeau de direction.';
   Syntax:'SCASB'),
  (Name:'SCASW';
   Description:'Cette instruction permet de comparer le registre AX avec '+
               'la cellule m‚moire … l''adresse ES:[DI] et '+
               'incr‚mente/d‚cr‚mente le registre DI de 2 en fonction '+
               'de l''‚tat du drapeau de direction.';
   Syntax:'SCASW'),
  (Name:'SEG';
   Description:'Cette directive permet de demander la partie segment '+
               'de l''adresse d''une op‚rande.';
   Syntax:'... SEG expression'),
  (Name:'SETALC';
   Description:'Cette instruction permet de copier la valeur du drapeau '+
               'de retenue dans le registre AL en la multipliant par 0FFh.';
   Syntax:'SETALC'),
  (Name:'SHL';
   Description:'Cette instruction permet d''effectuer une rotation des '+
               'bits vers la gauche en r‚ins‚rant le bit dans '+
               'l''indicateur de retenue (CF).';
   Syntax:'SHL op‚randecible,1'#13#10+
          'SHL op‚randecible,CL'),
  (Name:'SHR';
   Description:'Cette instruction permet d''effectuer une rotation des '+
               'bits vers la droite en r‚ins‚rant le bit dans '+
               'l''indicateur de retenue (CF).';
   Syntax:'SHR op‚randecible,1'#13#10+
          'SHR op‚randecible,CL'),
  (Name:'STC';
   Description:'Cette instruction permet de fixer l''indicateur de '+
               'retenue (CF) … la valeur 1.';
   Syntax:'STC'),
  (Name:'STD';
   Description:'Cette instruction permet de fixer l''indicateur de '+
               'direction (DF) … la valeur 1.';
   Syntax:'STD'),
  (Name:'STI';
   Description:'Cette instruction permet de fixer l''indicateur '+
               'd''interruption (IF) … la valeur 1.';
   Syntax:'STI'),
  (Name:'STOS';
   Description:'Cette instruction permet de copier un octet, un mot ou un '+
               'double mot dans la cellule m‚moire … l''adresse ES:[DI] et '+
               'incr‚mente/d‚cr‚mente le registre DI en fonction de la '+
               'taille de l''op‚rande cible et de l''‚tat du drapeau de '+
               'direction';
   Syntax:'STOS chainecible'),
  (Name:'STOSB';
   Description:'Cette instruction permet de copier le registre AL dans '+
               'la cellule m‚moire … l''adresse ES:[DI] et '+
               'incr‚mente/d‚cr‚mente le registre DI de 1 en fonction '+
               'de l''‚tat du drapeau de direction.';
   Syntax:'STOSB'),
  (Name:'STOSW';
   Description:'Cette instruction permet de copier le registre AX dans '+
               'la cellule m‚moire … l''adresse ES:[DI] et '+
               'incr‚mente/d‚cr‚mente le registre DI de 2 en fonction de '+
               'l''‚tat du drapeau de direction.';
   Syntax:'STOSW'),
  (Name:'SUB';
   Description:'Cette instruction permet de soustraire une valeur … '+
               'une op‚rande.';
   Syntax:'SUB op‚randecible,op‚randesource'),
  (Name:'TEST';
   Description:'Cette instruction permet d''effectuer un ®Et binaire¯ '+
               'sur une op‚rande cible sans modifier sa valeur.';
   Syntax:'TEST op‚randecible,op‚randesource'),
  (Name:'WAIT';
   Description:'Cette instruction permet de faire passer le microprocesseur '+
               'en mode d''attente jusqu''… ce que la ligne de teste sur la '+
               'carte mŠre s''active.';
   Syntax:'WAIT'),
  (Name:'XCHG';
   Description:'Cette instruction permet d''‚changer la valeur de deux '+
               'op‚randes.';
   Syntax:'XCHG op‚randecible1,op‚randecible2'),
  (Name:'XLAT';
   Description:'Cette instruction permet de remplacer le contenu du '+
               'registre AL par un octet de la ®tablesource¯.';
   Syntax:'XLAT tablesource'),
  (Name:'XOR';
   Description:'Cette instruction permet d''effectuer un OU exclusif '+
               'BINAIRE sur les 2 op‚randes sp‚cifi‚s.';
   Syntax:'XOR Op‚randeCible, Op‚randeSource')
 );

Var
 I,J:Integer;

Function PadRight(S:String;Space:Byte):String;
Var
 I:Byte;
Begin
 If Length(S)<Space Then For I:=Length(S)+1 to Space do S:=S+' ';
 PadRight:=S;
End;

Function StrToUpper(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 StrToUpper:=S;
End;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('8086DICT : Cette commande permet d''afficher la liste des ',
           'instructions ou une instruction de l''assembleur 8086.');
  WriteLn;
  WriteLn('Syntaxe : 8086DICT [/LIST] [instruction]');
  WriteLn;
  WriteLN(' instruction   Affiche l''instruction sp‚cifi‚');
  WriteLn(' /LIST         Affiche la liste des instructions');
 End
  Else
 If ParamCount>0 Then Begin
  For I:=1 to ParamCount do Begin
   If StrToUpper(ParamStr(I))='/LIST'Then Begin
    For J:=Low(Instr8086)to High(Instr8086)do Begin
     WriteLn(PadRight(Instr8086[J].Name,10),StrPas(Instr8086[J].Description));
    End;
   End
    Else
   Begin
    For J:=Low(Instr8086)to High(Instr8086)do Begin
     If StrToUpper(ParamStr(I))=StrToUpper(Instr8086[J].Name)Then Begin
      WriteLn('Instruction : ');
      WriteLn;
      WriteLn(Instr8086[J].Name);
      WriteLn;
      WriteLn('Syntaxe : ');
      WriteLn;
      WriteLn(StrPas(Instr8086[J].Syntax));
      WriteLn;
      WriteLn('Description :');
      WriteLn;
      WriteLn(StrPas(Instr8086[J].Description));
     End;
    End;
   End;
  End;
 End
  Else
 WriteLn('ParamŠtre requis !');
END.


