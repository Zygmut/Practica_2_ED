with Ada.Text_IO; use Ada.Text_IO;
with d_conjunto;
with d_arbol_binario;
with d_priority_queue;
with d_cola;

procedure Main is

--SPRINT 1----------------------------------------------------------------------

   subtype alphabet is Character range ' ' .. 'z';

   package d_frequency_table is new d_conjunto (alphabet, Integer);
   use d_frequency_table;

   set: conjunto;       -- set
   k: alphabet;         -- alphabet key
   inputF: File_Type;   -- input file type
   outputF: File_type;  -- output file type
   outputFC: File_Type; -- output file type to code
   s: String (1..50);   -- reading buffer
   l: Natural;          -- length of the buffer


   -- Prints all the values of a set
   procedure printSet(set: in conjunto; into: in File_Type) is

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
         actualiza(set, k, f_aux+1);
      else
         poner(set, k, 1);
      end if;

   end add_k;

--SPRINT 2----------------------------------------------------------------------

   type node is record
      caracter : Character ;
      frequencia : integer ;
   end record;

   package darbre is new d_arbol_binario ( elem => node ) ;
   use darbre;

   type parbol is access arbol ;

   function menor (x1,x2: in parbol) return boolean is

      n1,n2: node;

   begin

      raiz(x1.all,n1);
      raiz(x2.all,n2);
      return n1.frequencia < n2.frequencia;

   end menor;


   function major(x1,x2: in parbol) return boolean is

      n1,n2: node;

   begin

      raiz(x1.all,n1);
      raiz(x2.all,n2);
      return n1.frequencia > n2.frequencia;

   end major;

   package d_priority_queue_arbol is new d_priority_queue (
      size => 20 ,
      item => parbol ,
      "<" => menor ,
      ">" => major ) ;

   use d_priority_queue_arbol;


   procedure get_tree (k: in alphabet; f: in Integer; a: in out arbol;
                      ar, al: in arbol) is
      n: node;

   begin
      n.caracter := k;
      n.frequencia := f;
      graft(a,al,ar,n);
   end get_tree;


   procedure sort_conjunto (set: in conjunto; q: in out priority_queue) is

      i: iterador;
      k: alphabet;
      f: Integer;
      a: parbol;
      ar: parbol;
      al: parbol;

   begin

      primero(set, i);
      empty(q);
      while es_valido(i) loop
         a:= new arbol;
         ar:= new arbol;
         al:= new arbol;
         avacio(a.all);
         avacio(ar.all);
         avacio(al.all);
         obtener(set, i, k, f);
         get_tree(k, f, a.all, ar.all, al.all);
         put(q,a);
         siguiente(set, i);

      end loop;

   end sort_conjunto;



   procedure print_priority_q (q: in out priority_queue) is

      b: parbol;
      n: node;
   begin

      while not is_empty(q) loop

         b := get_least(q);
         raiz(b.all,n);
         Put_Line(n.caracter & ": " & n.frequencia'Img);
         delete_least(q);
      end loop;

   end print_priority_q;

-- Sprint 3 --------------------------------------------------------------------

   package dcola is new d_cola (elem => parbol);
   use dcola;

   procedure huffman_tree(t1: in out parbol; q: in out priority_queue) is

      t2 : parbol;
      a : parbol;
      n1,n2,na : node;
      i: Integer;
   begin

      i:=0;
      while not is_empty(q) loop

         t1 := get_least(q);
         delete_least(q);

         if not is_empty(q) then
            t2 := get_least(q);
            delete_least(q);
            a := new arbol;
            avacio(a.all);
            raiz(t1.all,n1); raiz(t2.all,n2);
            na.caracter := '-';
            na.frequencia := n1.frequencia + n2.frequencia;
            Put_Line("frecuencia en la iteracion: " & i'Image & " es: " & na.frequencia'Image);
            Put_Line("caracter1: " & n1.caracter & " caracter2: " & n2.caracter);
            graft(a.all, t1.all, t2.all, na);
            put(q,a);
            i := i+1;
         end if;


      end loop;

   end huffman_tree;


   procedure amplitude_tour(t1: in parbol) is

      c: cola;
      a, ar, al: parbol;
      n,nl,nr: node;
   begin
      cvacia(c);
      poner(c,t1);
      while not esta_vacia(c) loop
         a:= new arbol;
         ar:= new arbol;
         al:= new arbol;
         avacio(a.all);
         avacio(ar.all);
         avacio(al.all);
         a := coger_primero(c);
         raiz(a.all, n);
         Put_Line(n.caracter & ": " & n.frequencia'Img);
         izq(a.all, al.all);
         der(a.all, ar.all);

         if not esta_vacio(al.all) then

            poner(c,al);
            raiz(al.all,nl);
            Put_Line("Ponemos el nodo izq: " & nl.caracter);

         end if;

         if not esta_vacio(ar.all) then

            poner(c,ar);
            raiz(ar.all,nr);
            Put_Line("Ponemos el nodo izq: " & nr.caracter);

         end if;

         borrar_primero(c);

      end loop;


   end amplitude_tour;

-- Sprint 4 --------------------------------------------------------------------

   type tcodi is record

      c: String(1..10);
      l: Natural;

   end record;

   function char_in_set(c: in Character; set: in conjunto) return boolean is

      i: iterador;
      k: alphabet;
      f: Integer;
      trobat: boolean;

   begin
      trobat := False;
      primero(set,i);
      while es_valido(i) and trobat = False loop

         obtener(set, i, k, f);
         if c = k then
            trobat := True;
         else
            trobat := False;
         end if;
         siguiente(set, i);

      end loop;

      return trobat;

   end char_in_set;


   procedure genera_codi(x: in arbol; c: in Character; trobat: in out boolean;
                         idx: in Integer; codi: in out tcodi) is

      l,r: arbol;
      n: node;
   begin

      raiz(x,n);
      if n.caracter = c then
         trobat := True;
      else
         trobat := False;
      end if;

      if not trobat then

         izq(x,l);
         if not esta_vacio(l) and not trobat then
            codi.c(idx) := '0';
            codi.l := idx;
            genera_codi(l,c,trobat,idx+1, codi);
         end if;

         der(x,r);
         if not esta_vacio(r) and not trobat then
            codi.c(idx) := '1';
            codi.l := idx;
            genera_codi(r,c,trobat,idx+1, codi);
         end if;

      end if;

   end genera_codi;


-- Main ------------------------------------------------------------------------
   q: priority_queue;
   t1: parbol;
   codi: tcodi;
   i: Integer;
   trobat: boolean;
begin

   cvacio(set);

   -- Read the input
   Open(inputF, In_File, "entrada.txt");

   while not End_Of_File(inputF) loop
      Get_Line(inputF, s, l);

      for i in 1..l loop
         k := s(i);
         add_k(k, set);
      end loop;
   end loop;

   Close(inputF);

   sort_conjunto(set, q);
   huffman_tree(t1,q);
   --print_priority_q(q);
   --amplitude_tour(t1);
   Create(outputFC, Out_File, "entrada_codi.txt");
   for c in alphabet loop
      i := 1;
      trobat := False;
      if char_in_set(c, set) then

         genera_codi(t1.all,c,trobat,i,codi);
         Put_Line(outputFC, c & ": " & codi.c(1..codi.l));

      end if;

   end loop;
   Close(outputFC);

   -- Write the outputs
   Create(outputF, Out_File, "entrada_freq.txt");
   printSet(set, outputF);
   Close(outputF);

end Main;
