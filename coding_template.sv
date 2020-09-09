1) License copy
//  ###########################################################################
//
//  Licensed to the Apache Software Foundation (ASF) under one
//  or more contributor license agreements.  See the NOTICE file
//  distributed with this work for additional information
//  regarding copyright ownership.  The ASF licenses this file
//  to you under the Apache License, Version 2.0 (the
//  "License"); you may not use this file except in compliance
//  with the License.  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing,
//  software distributed under the License is distributed on an
//  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
//  KIND, either express or implied.  See the License for the
//  specific language governing permissions and limitations
//  under the License.
//
//  ###########################################################################

2) Use of Include Guards
`ifndef FILE_NAME_INCLUDED_
`define FILE_NAME_INCLUDED_
.....
.....
`endif

Example:
`ifndef CODING_TEMPLATE_INCLUDED_
`define CODING_TEMPLATE_INCLUDED_

3) Use of comments and code as per the coding guidelines

//-----------------------------------------------------------------------------
// Class: config_template
// Description of the class. For ex:
// This class provides the template for coding
//-----------------------------------------------------------------------------
class config_template extends uvm_monitor;
  `uvm_component_utils(config_template)

  // Variable: core_no
  // Useful for creating separate files
  int core_no = -1;    

  // Variable: m_ap
  // UVM analysis port
  uvm_analysis_port#(int) m_ap;

  //---------------------------------------------
  // Externally defined tasks and functions
  //---------------------------------------------
  extern function new(string name, uvm_component parent); 
  extern virtual function void build_phase(uvm_phase phase);
  extern virtual task run_phase(uvm_phase phase);
endclass: config_template

//-----------------------------------------------------------------------------
// Constructor: new
// Initializes the config_template class object
//
// Parameters:
//  name - instance name of the config_template
//  parent - parent under which this component is created
//-----------------------------------------------------------------------------
function config_template::new(string name, uvm_component parent); 
  super.new(name,parent); 
endfunction: new 

//-----------------------------------------------------------------------------
// Function: build_phase
// Creates the required ports
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------
function void config_template::build_phase(uvm_phase phase);
  super.build_phase(phase);

  // Creating the ports
  m_ap = new("m_item_aport",this);    
endfunction: build_phase

//-----------------------------------------------------------------------------
// Task: run_phase
// Waits for reset and initiates the main montoring task 
//
// Parameters:
//  phase - stores the current phase 
//-----------------------------------------------------------------------------
task config_template::run_phase(uvm_phase phase);
  string name;
  
  // Wait for active-high reset
  @(posedge rstn);
  
  name = get_string_val();
endtask: run_phase

//-----------------------------------------------------------------------------
// Function: get_imm
// Get the immediate value from the I format instruction
//
// Returns:
//  String representation of the name 
//-----------------------------------------------------------------------------
function string config_template::get_string_val();
  return "muneeb";      
endfunction: get_string_val    
    
4) Close of Include guard
`endif
