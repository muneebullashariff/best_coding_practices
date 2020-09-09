`ifndef <<USER_FILENAME>>_INCLUDED_
`define <<USER_FILENAME>>_INCLUDED_

//--------------------------------------------------------------------------------------------
// Class: <<user_classname>>
// <Description_here>
//--------------------------------------------------------------------------------------------
class <<user_classname>> extends uvm_object;
  `uvm_object_utils(<<user_classname>>)

  //-------------------------------------------------------
  // Externally defined Tasks and Functions
  //-------------------------------------------------------
  extern function new(string name = "<<user_classname>>");
endclass : <<user_classname>>

//--------------------------------------------------------------------------------------------
// Construct: new
//
// Parameters:
//  name - <<user_classname>>
//--------------------------------------------------------------------------------------------
function <<user_classname>>::new(string name = "<<user_classname>>");
  super.new(name);
endfunction : new

`endif
