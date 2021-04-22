with Ada.Text_IO; use Ada.Text_IO;
with d_conjunto;

procedure Main is

   -- Declarations

   subtype alphabet is Character range ' ' .. 'z';

   package d_frequency_table is new d_conjunto (alphabet, Integer);
   use d_frequency_table;

   set: conjunto;       -- set
   k: alphabet;         -- alphabet key
   inputF: File_Type;   -- input file type
   outputF: File_type;  -- output file type
   s: String (1..50);   -- reading buffer
   l: Natural;          -- length of the buffer


   -- Prints all the values of a set
   procedure printSet(set: in conjunto; into: in File_Type) is

      -- Declarations
      i: iterador;
      k: alphabet;
      f: Integer;
   begin

      primero(set, i);
      while es_valido(i) loop
         obtener(set, i, k, f);
         Put_Line(into, k & ": " & f'Img);
         siguiente(set, i);
      end loop;
   end printSet;


   -- Adds of modifies a key frequency of a given set
   procedure add_k(k: in alphabet; set: in out conjunto) is

      -- Declarations
      i: iterador;
      found: Boolean;
      k_aux: alphabet;
      f_aux: Integer;
   begin

      found := false;
      primero(set, i);

      while es_valido(i) and not found loop  -- Check all values inside a set
         obtener(set, i, k_aux, f_aux); -- Check value

         if k = k_aux then
            found := true;
         else
            siguiente(set, i);         -- Go to the next one
         end if;
      end loop;

      if found then
         -- Increment frequency of key 'k'
         actualiza(set, k, f_aux+1);

      else
         -- Add key 'k' to the set

         poner(set, k, 1);
      end if;

   end add_k;



begin
   cvacio(set);

   -- Read the input file
   Open(inputF, In_File, "entrada.txt");
   while not End_Of_File(inputF) loop
      Get_Line(inputF, s, l);
      for i in 1..l loop
         k := s(i);                       -- Get each char of the string
         add_k(k, set);
      end loop;
   end loop;
   Close(inputF);

   Create(outputF, Out_File, "entrada_freq.txt");
   printSet(set, outputF);
   Close(outputF);

end Main;
