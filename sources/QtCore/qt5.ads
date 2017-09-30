with Interfaces.C.Extensions;

package Qt5 is

   pragma Pure;

   subtype bool is Interfaces.C.Extensions.bool;
   subtype int is Interfaces.C.int;
   subtype float is Interfaces.C.c_float;

   subtype qreal is Interfaces.C.double;

end Qt5;
