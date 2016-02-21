with Birds.Attributes;

package Birds.Samples is


   type Sample is record
      Bird : Birds.Kinds.Kind;
      Attribute : Attributes.Vector;
   end record;

   type Vector is array (Integer range <>) of Sample;


   procedure Read_Vector (Name : String; Kind : Attributes.Kinds.Kind; Destination : out Vector; Min : out Float; Max : out Float);
   procedure Read_Vector_Kind (Name : String; Destination : out Vector);
   procedure Read_Vector_Normalized (Name : String; Kind : Attributes.Kinds.Kind; Destination : out Vector);
   procedure Normalize_Vector (Kind : Attributes.Kinds.Kind; Min, Max : Float; Destination : in out Vector);

end;
