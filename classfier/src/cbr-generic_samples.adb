with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Strings;
with Ada.Strings.Fixed;
with Ada.Integer_Text_IO;

package body CBR.Generic_Samples is

   procedure Read_Point (Name : String; Dim : Dimension; Last : out Integer; Result : out Sample_Array) is
      use Ada.Text_IO;
      use Ada.Float_Text_IO;
      F : File_Type;
   begin
      Open (F, In_File, Name);
      Last := Result'First;
      loop
         exit when End_Of_File (F);
         exit when Last > Result'Last;
         Get (F, Result (Last).Point (Dim));
         Last := Last + 1;
      end loop;
      Last := Last - 1;
   end;

   procedure Read_Class (Name : String; Last : out Integer; Result : out Sample_Array) is
      use Ada.Text_IO;
      package IIO is new Ada.Text_IO.Integer_IO (Class);
      F : File_Type;
   begin
      Open (F, In_File, Name);
      Last := Result'First;
      loop
         exit when End_Of_File (F);
         exit when Last > Result'Last;
         IIO.Get (F, Result (Last).Kind);
         Last := Last + 1;
      end loop;
      Last := Last - 1;
   end;


   procedure Put (Item : Feature_Vector) is
      use Ada.Float_Text_IO;
      use Ada.Text_IO;
   begin
      for I in Item'Range loop
         Put (Item (I), 3, 3, 0);
         Put (" ");
      end loop;
   end;

   procedure Put (Item : Sample_Array) is
      use Ada.Text_IO;
      use Ada.Strings.Fixed;
      use Ada.Integer_Text_IO;
   begin
      Put (Head ("Class", 5));
      Put (" ");
      for I in Dimension loop
         Put (Tail ("F" & I'Img & " ", 8));
      end loop;
      New_Line;
      for E of Item loop
         Put (Head (E.Kind'Img, 5));
         Put (" ");
         Put (E.Point);
         New_Line;
      end loop;
   end;

end;