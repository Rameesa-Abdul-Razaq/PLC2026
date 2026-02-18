with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;     use Ada.Float_Text_IO;
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure PlayList is -- defines a subprogram named PlayList, which is the main entry point of the program

    type Person is record -- this defines a record type named Person
                          -- which has a single field called name of type Unbounded_String
        name : Unbounded_String;
    end record; -- end record

    procedure Put_Person (p : Person) is -- nested procedure to print the name of a Person
    begin
        Put (To_String (p.name)); -- takes person as an input
    end Put_Person;

    --type Item is record -- another record type with necessary fields to represent a music item
    --    name        : Unbounded_String;
    --    performer   : Person;
    --    length_secs : Float;
   -- end record;

      -- union in ada for item to put peice and pause togehter
      type item_variant_type is (piece, pause); 
    type Item(item_variant : item_variant_type) is 
         record 
            length_secs : Float; 
            case item_variant is 
               when piece => name : Unbounded_String; 
                     performer : Person; 
               when pause => 
                     null; 
            end case; 
         end record; 

    procedure Put_Item (i : Item) is -- printing to the terminal the details of an Item, 
                                     --including its name, performer, and length in seconds
    begin 
      case i.item_variant is 
         when Piece => 
            Put (To_String (i.name)); 
            Put (" by "); 
            Put_Person (i.performer); 
            Put (" ("); 
            Put (i.length_secs, aft => 1, exp => 0); 
            Put ("s)"); 
         when Pause => 
            Put ("Pause ("); 
            Put (i.length_secs, aft => 1, exp => 0); 
            Put ("s)"); 
      end case; 
   end Put_Item; 

    -- consutructing an instance of the Item record type to represent a music piece,
    -- with the name "Moonlight Sonata", performed by Claudio Arrau, and a length
    piece1 : Item(item_variant => piece) :=
       (name => To_Unbounded_String ("Moonlight Sonata"),
        performer => (name => To_Unbounded_String ("Claudio Arrau")),
        length_secs => 17.0*60.0+26.0
       );

     pause1 : Item(item_variant => pause) :=
        (
         length_secs => 5.0
       );

begin
    Put_Item (piece1);
    Put_Line ("");
    Put_Item(pause1);
    Put_Line ("");
end PlayList;
