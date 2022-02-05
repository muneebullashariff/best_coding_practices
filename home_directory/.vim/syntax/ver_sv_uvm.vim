" Vim syntax file
" Language:   SystemVerilog + UVM
" Maintainer: David C Black <dcblack@hldwizard.com>
" Modified:   $Last Updated: 2015-Feb-12 Thu 20:15PM dcblack
" Depends_on: Assumes few named colors: gold, sky and red from $HOME/.vim/etc/colors.vim
"             Uses $HOME/.vim/etc/sv.dict
" Notes:      See comments at end for categorization of SystemVerilog keywords
"             Includes UVM keywords.
"             Probably still incomplete.
"             Don't forget to update $HOME/.vim/filetype.vim with:
"               autocmd  BufRead,BufNewFile *.sv        setlocal filetype=sv
"               autocmd  BufRead,BufNewFile *.svh       setlocal filetype=sv
"               autocmd  BufRead,BufNewFile *.sva       setlocal filetype=sv

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Read Verilog syntax
runtime! syntax/verilog.vim
unlet b:current_syntax

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255
else
   set iskeyword=@,48-57,_,192-255
endif

syn keyword Todo TBS NYI TO_BE_SUPPLIED NOT_YET_IMPLEMENTED
"setlocal dict=$HOME/.vim/etc/sv.dict
setlocal errorfile="error.log"
" The following probably needs to be modified per simulator...
setlocal errorformat="%f:%l: %m"

"Matching
let b:match_words  = '[:],(:),{:},[/][*]:[*][/]'
let b:match_words .= ',\<\(rand\)\?case[xz]\?\>:\<endcase\>'
let b:match_words .= ',\<begin\>:\<end\>'
let b:match_words .= ',\<class\>:\<endclass\>'
let b:match_words .= ',\<clocking\>:\<endclocking\>'
let b:match_words .= ',\<config\>:\<endconfig\>'
let b:match_words .= ',\<covergroup\>:\<endgroup\>'
let b:match_words .= ',\<do\>:\<while\>'
let b:match_words .= ',\<fork\>:\<join\(_none\|_any\|_all\)\?\>'
let b:match_words .= ',\<function\>:\<endfunction\>'
"let b:match_words .= ',\<if\>:\<else if\>:\<else\>' as this creates confusion
"between if-else if-else and if-else and nested ifs'
let b:match_words .= ',\<interface\>:\<endinterface\>'
let b:match_words .= ',\<property\>:\<endproperty\>'
let b:match_words .= ',\<sequence\>:\<endsequence\>'
let b:match_words .= ',\<task:^\s*\<endtask\>'
" Following should always be at the beginning of a line
let b:match_words .= ',^\s*\<\(macro\)\?module\>:^\s*\<endmodule\>'
let b:match_words .= ',^\s*\<checker\>:^\s*\<endchecker\>'
let b:match_words .= ',^\s*\<generate\>:^\s*\<endgenerate\>'
let b:match_words .= ',^\s*\<package:^\s*\<endpackage\>'
let b:match_words .= ',^\s*\<primitive\>:^\s*\<endprimitive\>'
let b:match_words .= ',^\s*\<program:^\s*\<endprogram\>'
let b:match_words .= ',^\s*\<specify\>:^\s*\<endspecify\>'
let b:match_words .= ',^\s*\<table\>:^\s*\<endtable\>'
let b:match_words .= ',^\s*`if\(n\?def\)\?\>:^\s*`else\>:^\s*`endif\>'
let b:match_words .= ',\<whilem\>:\<endwhile\>'

"" Folding (also see match_words)
":syn region begin_fold      start="\<begin\>"      end="\<end\>"          fold 
"":syn region begin_fold      start="\<begin\>"      end="\<end\>"          transparent fold contained
":syn region checker_fold    start="\<checker\>"    end="\<endchecker\>"   transparent fold contains=ALLBUT,module_fold
":syn region class_fold      start="\<class\>"      end="\<endclass\>"     transparent fold
":syn region clocking_fold   start="\<clocking\>"   end="\<endclocking\>"  transparent fold
":syn region config_fold     start="\<config\>"     end="\<endconfig\>"    transparent fold contains=ALLBUT,program_fold
":syn region covergroup_fold start="\<covergroup\>" end="\<endgroup\>"     transparent fold contained
":syn region fork_fold       start="\<fork\>"       end="\<join\(_none\|_any\|_all\)?\>" transparent fold contained
":syn region function_fold   start="\<function\>"   end="\<endfunction\>"  transparent fold contained
":syn region generate_fold   start="\<generate\>"   end="\<endgenerate\>"  transparent fold contained
":syn region interface_fold  start="\<interface\>"  end="\<endinterface\>" transparent fold
":syn region module_fold     start="\<module\>"     end="\<endmodule\>"    transparent fold contains=ALLBUT,program_fold
":syn region package_fold    start="\<package\>"    end="\<endpackage\>"   transparent fold contains=ALLBUT,module_fold
":syn region primitive_fold  start="\<primitive\>"  end="\<endprimitive\>" transparent fold contains=ALLBUT,module_fold
":syn region program_fold    start="\<program\>"    end="\<endprogram\>"   transparent fold contains=ALLBUT,module_fold
":syn region property_fold   start="\<property\>"   end="\<endproperty\>"  transparent fold contained
":syn region sequence_fold   start="\<sequence\>"   end="\<endsequence\>"  transparent fold
":syn region specify_fold    start="\<specify\>"    end="\<endspecify\>"   transparent fold contains=ALLBUT,module_fold
":syn region table_fold      start="\<table\>"      end="\<endtable\>"     transparent fold
":syn region task_fold       start="\<task\>"       end="\<endtask\>"      transparent fold contained
":syn sync fromstart
":set foldmethod=syntax

" All the SystemVerilog keywords
syn keyword svStatement  accept_on
syn keyword svStatement  alias
syn keyword svStatement  always_comb
syn keyword svStatement  always_ff
syn keyword svStatement  always_latch
syn keyword Alert        assert
syn keyword svStatement  assume
syn keyword svStatement  before
syn keyword svStatement  bind
syn keyword svStatement  bins
syn keyword svStatement  binsof
syn keyword svStatement  bit
syn keyword svStatement  break
syn keyword svStatement  byte
syn keyword svStatement  chandle
syn keyword svStatement  class
syn keyword svStatement  clocking
syn keyword svStatement  const
syn keyword svStatement  constraint
syn keyword svStatement  context
syn keyword svStatement  continue
syn keyword svStatement  cover
syn keyword svStatement  covergroup
syn keyword svStatement  coverpoint
syn keyword svStatement  cross
syn keyword svStatement  design
syn keyword svStatement  dist
syn keyword svStatement  do
syn keyword svStatement  endclass
syn keyword svStatement  endclocking
syn keyword svStatement  endgroup
syn keyword svStatement  endinterface
syn keyword svStatement  endpackage
syn keyword svStatement  endprogram
syn keyword svStatement  endproperty
syn keyword svStatement  endsequence
syn keyword svStatement  enum
syn keyword svStatement  error_bins
syn keyword svStatement  eventually
syn keyword svStatement  expect
syn keyword svStatement  export
syn keyword svStatement  extends
syn keyword svStatement  extern
syn keyword svStatement  final
syn keyword svStatement  first_match
syn keyword svStatement  foreach
syn keyword svStatement  forkjoin
syn keyword svStatement  iff
syn keyword svStatement  ifnone
syn keyword svStatement  ignore_bins
syn keyword svStatement  illegal_bins
syn keyword svStatement  implements
syn keyword svStatement  import
syn keyword svStatement  inside
syn keyword svStatement  int
syn keyword svStatement  interface
syn keyword svStatement  intersect
syn keyword svStatement  join_any
syn keyword svStatement  join_none
syn keyword svStatement  local
syn keyword svStatement  logic
syn keyword svStatement  longint
syn keyword svStatement  matches
syn keyword svStatement  modport
syn keyword svStatement  new
syn keyword svStatement  null
syn keyword svStatement  option
syn keyword svStatement  package
syn keyword svStatement  packed
syn keyword svStatement  priority
syn keyword svStatement  program
syn keyword svStatement  property
syn keyword svStatement  protected
syn keyword svStatement  pure
syn keyword svStatement  rand
syn keyword svStatement  randc
syn keyword svStatement  randcase
syn keyword svStatement  randomize
syn keyword svStatement  randsequence
syn keyword svStatement  ref
syn keyword svStatement  return
syn keyword svStatement  s_until_with
syn keyword svStatement  sample
syn keyword svStatement  sequence
syn keyword svStatement  shortint
syn keyword svStatement  shortreal
syn keyword svStatement  soft
syn keyword svStatement  solve
syn keyword svStatement  static
syn keyword svStatement  string
syn keyword svStatement  struct
syn keyword svStatement  super
syn keyword svStatement  tagged
syn keyword svStatement  this
syn keyword svStatement  throughout
syn keyword svStatement  timeprecision
syn keyword svStatement  timeunit
syn keyword svStatement  type
syn keyword svStatement  type_option
syn keyword svStatement  typedef
syn keyword svStatement  union
syn keyword svStatement  unique
syn keyword svStatement  var
syn keyword svStatement  virtual
syn keyword svStatement  void
syn keyword svStatement  wait_order
syn keyword svStatement  wildcard
syn keyword svStatement  with
syn keyword svStatement  within

syn keyword svStd std process semaphore mailbox

syn keyword Alert        REPORT_INFO REPORT_WARNING REPORT_ERROR REPORT_FATAL uvm_severity_type
syn match   Alert        "[\$]\(finish\|error\|stop\|warning\|info\)\>"

syn keyword myMethod     copy_from clone to_string compare

syn match   uvm_method   "::type_id::create"

syn keyword uvm_class    uvm_active_passive_enum
syn keyword uvm_class    uvm_adaptor
syn match   uvm_class    /\<uvm_analysis_imp_\w\+\s/
syn keyword uvm_class    uvm_barrier
syn keyword uvm_class    uvm_barrier_pool
syn keyword uvm_class    uvm_component
syn keyword uvm_class    uvm_configure_phase
syn keyword uvm_class    uvm_domain
syn keyword uvm_class    uvm_driver
syn keyword uvm_class    uvm_enum_wrapper
syn keyword uvm_class    uvm_env
syn keyword uvm_class    uvm_event
syn keyword uvm_class    uvm_event_base
syn keyword uvm_class    uvm_event_pool
syn keyword uvm_class    uvm_factory
syn keyword uvm_class    uvm_heartbeat
syn keyword uvm_class    uvm_heartbeat_cb
syn keyword uvm_class    uvm_in_order_built_in_comparator
syn keyword uvm_class    uvm_in_order_class_comparator
syn keyword uvm_class    uvm_in_order_comparator
syn keyword uvm_class    uvm_main_phase
syn keyword uvm_class    uvm_mem
syn keyword uvm_class    uvm_monitor
syn keyword uvm_class    uvm_object
syn keyword uvm_class    uvm_object_registry
syn keyword uvm_class    uvm_objection
syn keyword uvm_class    uvm_path_e
syn keyword uvm_class    uvm_phase
syn keyword uvm_class    uvm_task_phase
syn keyword uvm_class    uvm_topdown_phase
syn keyword uvm_class    uvm_bottomup_phase
syn keyword uvm_class    uvm_phase_cb
syn keyword uvm_class    uvm_pool
syn keyword uvm_class    uvm_port_base
syn keyword uvm_class    uvm_post_configure_phase
syn keyword uvm_class    uvm_post_main_phase
syn keyword uvm_class    uvm_post_reset_phase
syn keyword uvm_class    uvm_post_shutdown_phase
syn keyword uvm_class    uvm_pre_configure_phase
syn keyword uvm_class    uvm_pre_main_phase
syn keyword uvm_class    uvm_pre_reset_phase
syn keyword uvm_class    uvm_pre_shutdown_phase
syn keyword uvm_class    uvm_predict_e
syn keyword uvm_class    uvm_predictor
syn keyword uvm_class    uvm_printer
syn keyword uvm_class    uvm_printer_knobs
syn keyword uvm_class    uvm_push_driver
syn keyword uvm_class    uvm_push_sequencer
syn keyword uvm_class    uvm_recorder
syn keyword uvm_class    uvm_reg
syn keyword uvm_class    uvm_reg_adapter
syn keyword uvm_class    uvm_reg_backdoor
syn keyword uvm_class    uvm_reg_block
syn keyword uvm_class    uvm_reg_bus_op
syn keyword uvm_class    uvm_reg_cbs
syn keyword uvm_class    uvm_reg_data_t
syn keyword uvm_class    uvm_reg_field
syn keyword uvm_class    uvm_reg_item
syn keyword uvm_class    uvm_reg_map
syn keyword uvm_class    uvm_reg_predictor
syn keyword uvm_class    uvm_reg_sequence
syn keyword uvm_class    uvm_reg_transaction_order_policy
syn keyword uvm_class    uvm_report_catcher
syn keyword uvm_class    uvm_reset_phase
syn keyword uvm_class    uvm_sequence
syn keyword uvm_class    uvm_sequencer
syn keyword uvm_class    uvm_sequencer_base
syn keyword uvm_class    uvm_severity
syn keyword uvm_class    uvm_shutdown_phase
syn keyword uvm_class    uvm_test
syn keyword uvm_class    uvm_text_tr_database
syn keyword uvm_class    uvm_tlm_analysis_fifo
syn keyword uvm_class    uvm_tlm_extension
syn keyword uvm_class    uvm_tlm_extension_base
syn keyword uvm_class    uvm_tlm_fifo
syn keyword uvm_class    uvm_tlm_generic_payload
syn keyword uvm_class    uvm_tr_stream
syn keyword uvm_class    uvm_transaction

syn keyword uvm_data     adaptor
syn keyword uvm_data     analysis_export
syn keyword uvm_data     analysis_port
syn keyword uvm_data     bus_in
syn keyword uvm_data     enable_print_topology
syn keyword uvm_data     fld
syn keyword uvm_data     kind
syn keyword uvm_data     map
syn keyword uvm_data     p_sequencer
syn keyword uvm_data     parent phase
syn keyword uvm_data     path
syn keyword uvm_data     reg_ap
syn keyword uvm_data     req
syn keyword uvm_data     rsp
syn keyword uvm_data     rw
syn keyword uvm_data     seq_item_export
syn keyword uvm_data     seq_item_port
syn keyword uvm_data     starting_phase
syn keyword uvm_data     uvm_top
syn keyword uvm_data     value

syn keyword uvm_enum     UVM_ACTIVE
syn keyword uvm_enum     UVM_ALL_ON
syn keyword uvm_enum     UVM_BIN
syn keyword uvm_enum     UVM_CALL_HOOK
syn keyword uvm_enum     UVM_COUNT
syn keyword uvm_enum     UVM_DEC
syn keyword uvm_enum     UVM_DISPLAY
syn keyword uvm_enum     UVM_ERROR
syn keyword uvm_enum     UVM_EXIT
syn keyword uvm_enum     UVM_FATAL
syn keyword uvm_enum     UVM_INFO
syn keyword uvm_enum     UVM_LOG
syn keyword uvm_enum     UVM_NOCOMPARE
syn keyword uvm_enum     UVM_NOPRINT
syn keyword uvm_enum     UVM_NO_ACTION
syn keyword uvm_enum     UVM_PASSIVE
syn keyword uvm_enum     UVM_PRINT
syn keyword uvm_enum     UVM_RGM
syn keyword uvm_enum     UVM_STOP
syn keyword uvm_enum     UVM_WARNING

syn keyword uvm_macros   uvm_add_to_seq_lib
syn keyword uvm_macros   uvm_analysis_imp_decl
syn keyword uvm_macros   uvm_component_param_utils
syn keyword uvm_macros   uvm_component_utils
syn keyword uvm_macros   uvm_component_utils_begin
syn keyword uvm_macros   uvm_component_utils_end
syn keyword uvm_macros   uvm_create
syn keyword uvm_macros   uvm_create_on
syn keyword uvm_macros   uvm_create_seq
syn keyword uvm_macros   uvm_declare_p_sequencer
syn keyword uvm_macros   uvm_do
syn keyword uvm_macros   uvm_do_on
syn keyword uvm_macros   uvm_do_on_pri
syn keyword uvm_macros   uvm_do_on_pri_with
syn keyword uvm_macros   uvm_do_on_with
syn keyword uvm_macros   uvm_do_pri
syn keyword uvm_macros   uvm_do_pri_with
syn keyword uvm_macros   uvm_do_seq
syn keyword uvm_macros   uvm_do_seq_with
syn keyword uvm_macros   uvm_do_with
syn keyword uvm_macros   uvm_error
syn keyword uvm_macros   uvm_error_context
syn keyword uvm_macros   uvm_fatal
syn keyword uvm_macros   uvm_fatal_context
syn keyword uvm_macros   uvm_field_enum
syn keyword uvm_macros   uvm_field_int
syn keyword uvm_macros   uvm_info
syn keyword uvm_macros   uvm_info_begin
syn keyword uvm_macros   uvm_info_context
syn keyword uvm_macros   uvm_info_end
syn keyword uvm_macros   uvm_message_add_int
syn keyword uvm_macros   uvm_message_add_object
syn keyword uvm_macros   uvm_message_add_string
syn keyword uvm_macros   uvm_message_add_tag
syn keyword uvm_macros   uvm_object_param_utils
syn keyword uvm_macros   uvm_object_utils
syn keyword uvm_macros   uvm_object_utils_begin
syn keyword uvm_macros   uvm_object_utils_end
syn keyword uvm_macros   uvm_rand_send
syn keyword uvm_macros   uvm_rand_send_pri
syn keyword uvm_macros   uvm_rand_send_pri_with
syn keyword uvm_macros   uvm_rand_send_with
syn keyword uvm_macros   uvm_record_int
syn keyword uvm_macros   uvm_record_real
syn keyword uvm_macros   uvm_record_string
syn keyword uvm_macros   uvm_record_time
syn keyword uvm_macros   uvm_send
syn keyword uvm_macros   uvm_send_pri
syn keyword uvm_macros   uvm_sequence_library_utils
syn keyword uvm_macros   uvm_warning
syn keyword uvm_macros   uvm_warning_context

syn keyword uvm_method   add
syn keyword uvm_method   add_callback
syn keyword uvm_method   add_uvm_phases
syn keyword uvm_method   after_phase
syn keyword uvm_method   b_transport
syn keyword uvm_method   before_phase
syn keyword uvm_method   block
syn keyword uvm_method   body
syn keyword uvm_method   can_get
syn keyword uvm_method   can_peek
syn keyword uvm_method   can_put
syn keyword uvm_method   connect
syn keyword uvm_method   convert2string
syn keyword uvm_method   create
syn keyword uvm_method   default_sequence
syn keyword uvm_method   delete_callback
syn keyword uvm_method   do_compare
syn keyword uvm_method   do_copy
syn keyword uvm_method   do_global_phase
syn keyword uvm_method   do_print
syn keyword uvm_method   drop_objection
syn keyword uvm_method   dump_report_state
syn keyword uvm_method   encode decode
syn keyword uvm_method   end_prematurely
syn keyword uvm_method   find
syn keyword uvm_method   finish_item
syn keyword uvm_method   get
syn keyword uvm_method   get_adjacent_predecessor_nodes
syn keyword uvm_method   get_adjacent_successor_nodes
syn keyword uvm_method   get_child
syn keyword uvm_method   get_children
syn keyword uvm_method   get_common_domain
syn keyword uvm_method   get_depth
syn keyword uvm_method   get_first_child
syn keyword uvm_method   get_full_name
syn keyword uvm_method   get_global_pool
syn keyword uvm_method   get_is_active
syn keyword uvm_method   get_name
syn keyword uvm_method   get_next_child
syn keyword uvm_method   get_next_item
syn keyword uvm_method   get_num_children
syn keyword uvm_method   get_num_waiters
syn keyword uvm_method   get_objection
syn keyword uvm_method   get_parent
syn keyword uvm_method   get_phase_type
syn keyword uvm_method   get_sequence_path
syn keyword uvm_method   get_starting_phase
syn keyword uvm_method   get_trigger_data
syn keyword uvm_method   get_trigger_time
syn keyword uvm_method   get_type_name
syn keyword uvm_method   global_stop_request
syn keyword uvm_method   has_child
syn keyword uvm_method   is_off
syn keyword uvm_method   is_on
syn keyword uvm_method   item_done
syn keyword uvm_method   lookup
syn keyword uvm_method   max_quit_count
syn keyword uvm_method   mid_do
syn keyword uvm_method   nb_transport_bw
syn keyword uvm_method   nb_transport_fw
syn keyword uvm_method   peek
syn keyword uvm_method   post_body
syn keyword uvm_method   post_do
syn keyword uvm_method   post_predict
syn keyword uvm_method   post_read
syn keyword uvm_method   post_start
syn keyword uvm_method   post_write
syn keyword uvm_method   pre_body
syn keyword uvm_method   pre_do
syn keyword uvm_method   pre_predict
syn keyword uvm_method   pre_read
syn keyword uvm_method   pre_start
syn keyword uvm_method   pre_write
syn keyword uvm_method   print
syn keyword uvm_method   print_real
syn keyword uvm_method   print_topology
syn keyword uvm_method   put
syn keyword uvm_method   raise_objection
syn keyword uvm_method   ralgen
syn keyword uvm_method   read_by_name
syn keyword uvm_method   regfile
syn keyword uvm_method   register
syn keyword uvm_method   report_hook
syn keyword uvm_method   report_summarize
syn keyword uvm_method   reset
syn keyword uvm_method   run_test
syn keyword uvm_method   set
syn keyword uvm_method   set_automatic_phase_object
syn keyword uvm_method   set_config
syn keyword uvm_method   set_domain
syn keyword uvm_method   set_drain_time set_timeout
syn keyword uvm_method   set_global_timeout
syn keyword uvm_method   set_id_info
syn keyword uvm_method   set_inst_override_by_type
syn keyword uvm_method   set_jump_phase
syn keyword uvm_method   set_phase_imp
syn keyword uvm_method   set_propagate_mode
syn keyword uvm_method   set_report_default_file
syn keyword uvm_method   set_report_default_file_hier
syn keyword uvm_method   set_report_id_action
syn keyword uvm_method   set_report_id_action_hier
syn keyword uvm_method   set_report_id_file
syn keyword uvm_method   set_report_id_file_hier
syn keyword uvm_method   set_report_max_quit_count
syn keyword uvm_method   set_report_severity_action
syn keyword uvm_method   set_report_severity_action_hier
syn keyword uvm_method   set_report_severity_file
syn keyword uvm_method   set_report_severity_file_hier
syn keyword uvm_method   set_report_severity_id_action
syn keyword uvm_method   set_report_severity_id_action_hier
syn keyword uvm_method   set_report_severity_id_file
syn keyword uvm_method   set_report_severity_id_file_hier
syn keyword uvm_method   set_report_verbosity_level
syn keyword uvm_method   set_report_verbosity_level_hier
syn keyword uvm_method   set_starting_phase
syn keyword uvm_method   set_threshold
syn keyword uvm_method   set_type_override_by_type
syn keyword uvm_method   sprint
syn keyword uvm_method   start_item
syn keyword uvm_method   transform
syn keyword uvm_method   trigger
syn keyword uvm_method   try_get
syn keyword uvm_method   try_next_item
syn keyword uvm_method   try_peek
syn keyword uvm_method   try_put
syn keyword uvm_method   type_id
syn keyword uvm_method   uvm_agent
syn keyword uvm_method   uvm_algorithmic_comparator
syn keyword uvm_method   uvm_analysis_export
syn keyword uvm_method   uvm_analysis_port
syn keyword uvm_method   uvm_bitstream_t
syn keyword uvm_method   uvm_callback
syn keyword uvm_method   uvm_callback_iter
syn keyword uvm_method   uvm_callbacks
syn keyword uvm_method   uvm_callbacks_objection
syn keyword uvm_method   uvm_cmdline_proc
syn keyword uvm_method   uvm_cmdline_processor
syn keyword uvm_method   uvm_component_registry
syn keyword uvm_method   uvm_config_db
syn keyword uvm_method   uvm_default_line_printer
syn keyword uvm_method   uvm_default_printer
syn keyword uvm_method   uvm_default_table_printer
syn keyword uvm_method   uvm_default_tree_printer
syn keyword uvm_method   uvm_event_callback
syn keyword uvm_method   uvm_integral_t
syn keyword uvm_method   uvm_is_match
syn keyword uvm_method   uvm_line_printer
syn keyword uvm_method   uvm_objection_callback
syn keyword uvm_method   uvm_objection_cbs_t
syn keyword uvm_method   uvm_process_report_message
syn keyword uvm_method   uvm_random_stimulus
syn keyword uvm_method   uvm_report_error
syn keyword uvm_method   uvm_report_fatal
syn keyword uvm_method   uvm_report_handler
syn keyword uvm_method   uvm_report_info
syn keyword uvm_method   uvm_report_message
syn keyword uvm_method   uvm_report_object
syn keyword uvm_method   uvm_report_server
syn keyword uvm_method   uvm_coreservice_t
syn keyword uvm_method   uvm_report_warning
syn keyword uvm_method   uvm_resource_db
syn keyword uvm_method   uvm_root
syn keyword uvm_method   uvm_scoreboard
syn keyword uvm_method   uvm_seq_item_export
syn keyword uvm_method   uvm_seq_item_port
syn keyword uvm_method   uvm_seq_item_pull_export
syn keyword uvm_method   uvm_seq_item_pull_port
syn keyword uvm_method   uvm_sequence_base
syn keyword uvm_method   uvm_sequence_item
syn keyword uvm_method   uvm_sequence_library
syn keyword uvm_method   uvm_sequence_library_cfg
syn keyword uvm_method   uvm_sequence_state
syn keyword uvm_method   uvm_sequencer_param_base
syn keyword uvm_method   uvm_subscriber
syn keyword uvm_method   uvm_table_printer
syn keyword uvm_method   uvm_table_printer_knobs
syn keyword uvm_method   uvm_test_done_objection
syn keyword uvm_method   uvm_tlm_if
syn keyword uvm_method   uvm_tlm_time
syn keyword uvm_method   uvm_tree_printer
syn keyword uvm_method   uvm_tree_printer_knobs
syn keyword uvm_method   wait_for
syn keyword uvm_method   wait_off
syn keyword uvm_method   wait_on
syn keyword uvm_method   wait_ptrigger
syn keyword uvm_method   wait_trigger
syn keyword uvm_method   with_phase
syn keyword uvm_method   /\<write_\w\+\>/
"syn match uvm_method   /\<write_\w\+\>/

syn keyword uvm_phase    build_phase
syn keyword uvm_phase    check_phase
syn keyword uvm_phase    configure_phase
syn keyword uvm_phase    connect_phase
syn keyword uvm_phase    define_domain
syn keyword uvm_phase    do_kill
syn keyword uvm_phase    end_of_elaboration_phase
syn keyword uvm_phase    exec_task
syn keyword uvm_phase    extract_phase
syn keyword uvm_phase    final_phase
syn keyword uvm_phase    main_phase
syn keyword uvm_phase    phase_ended
syn keyword uvm_phase    phase_ready_to_end
syn keyword uvm_phase    phase_started
syn keyword uvm_phase    post_configure_phase
syn keyword uvm_phase    post_main_phase
syn keyword uvm_phase    post_reset_phase
syn keyword uvm_phase    post_shutdown_phase
syn keyword uvm_phase    pre_configure_phase
syn keyword uvm_phase    pre_main_phase
syn keyword uvm_phase    pre_reset_phase
syn keyword uvm_phase    pre_shutdown_phase
syn keyword uvm_phase    report_phase
syn keyword uvm_phase    reset_phase
syn keyword uvm_phase    run_phase
syn keyword uvm_phase    shutdown_phase
syn keyword uvm_phase    start_of_simulation_phase

syn keyword uvm_seq      uvm_reg_bit_hash_seq
syn keyword uvm_seq      uvm_reg_hw_reset_seq
syn keyword uvm_seq      uvm_reg_mem_built_in_seq

syn keyword verilogConditional unique priority

syn match   verilogNumber "\(\<\d[0-9_]*\|\)'[sS]?[bB]\s*[0-1_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d[0-9_]*\|\)'[sS]?[oO]\s*[0-7_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d[0-9_]*\|\)'[sS]?[dD]\s*[0-9_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d[0-9_]*\|\)'[sS]?[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
"yn match   verilogNumber "\(\<\d[0-9_]*\)[munpf]\?s\>"
syn match   verilogNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)[munpa]s\>"
syn keyword verilogNumber 1step
syn match   verilogTodo   "\<\(File\|IFile\|Include\|Continue\): .*" contained

set include="^\s*`include\ \""
set define="^\s*\(`define\|parameter\|defparam\)\>\ \""
" Directives
" ideally, exclude (*) which is not an attribute
syn region  verilogDirective   start="(\*" end="\*)"

let b:current_syntax = "sv"

let b:color_path = "$HOME/.vim/etc/color_uvm.vim"
if !filereadable(expand(b:color_path))
  source b:color_path
else
endif
" Just as back up
so $HOME/.vim/etc/color_uvm.vim

: highlight link svStd       sky
: highlight link myMethod    hlcyan
: highlight link uvm_enum    Constant
: highlight link uvm_macros  gold
: highlight link uvm_method  sky
: highlight link uvm_class   sky
: highlight link uvm_seq     sky
: highlight link uvm_data    gray
: highlight link uvm_phase   purple
: highlight link svStatement Statement
: highlight link Alert       red

" Map CTRL-n to search for incomplete templates
:nmap <C-N> /{:.\{-}:}/b<CR>

" Categorization of SystemVerilog keywords:
" ------------------------------------------------------
" r=rtl o=object a=assertion c=coverage r=randomization
" v=verilog s=systemverilog b=blocking n=non-bocking
"
" KIND  KEYWORD
"       accept_on
"       alias
" v     always
" sr    always_comb
" sr    always_ff
" sr    always_latch
" v     and
" s     assert
" v     assign
"       assume
" v     automatic
" s     before
" v     begin
" v     bind
" sc    bins
" sc    binsof
" s     bit
" s     break
" v     buf
" v     bufif0
" v     bufif1
" s     byte
" v     case
" v     casex
" v     casez
"       cell
" so    chandle
" s     checker
" so    class
" s     clocking
" v     cmos
" v     config
" s     const
" s     constraint
" s     context
" sc    continue
" sc    cover
" sc    covergroup
" sc    coverpoint
" sc    cross
" v     deassign
" v     default
" v     defparam
" s     design
" v     disable
" s     dist
" s     do
" v     edge
" v     else
" v     end
" v     endcase
" s     endchecker
" so    endclass
" s     endclocking
" v     endconfig
" v     endfunction
" v     endgenerate
" sc    endgroup
" v     endinterface
" v     endmodule
" v     endpackage
" v     endprimitive
" s     endprogram
" sa    endproperty
" sa    endsequence
" v     endspecify
" v     endtable
" v     endtask
" s     enum
" v     event
" sa    eventually
" sa    expect
" s     export
" sc    extends
" s     extern
" s     final
" s     first_match
" v     for
" v     force
" s     foreach
" v     forever
" v     fork
" s     forkjoin
" v     function
" v     generate
" v     genvar
"       global
" v     highz0
" v     highz1
" v     if
" s     iff
" s     ifnone
" sc    ignore_bins
" sc    illegal_bins
"       implies
" s     import
"       incdir
" v     include
" v     initial
" v     inout
" v     input
" s     inside
"       instance
" s     int
" v     integer
" v     interface
"       intersect
" v     join
" v     join_any
" v     join_none
"       large
"       let
"       liblist
"       library
" sc    local
"       localparam
" s     logic
" s     longint
"       macromodule
"       matches
"       medium
" v     modport
"       module
"       nand
"       negedge
"       new
"       nexttime
"       nmos
" v     nor
"       noshowcancelled
" v     not
" v     notif0
" v     notif1
"  o    null
" v     or
"       output
" s     package
" s     packed
" v     parameter
" v     pmos
" v     posedge
" v     primitive
"       priority
" v     program
" s     property
" sc    protected
" v     pull0
" v     pull1
" v     pulldown
" v     pullup
"       pulsestyle_ondetect
"       pulsestyle_onevent
" sc    pure
" v     rand
" v     randc
" s     randcase
" s     randsequence
" v     rcmos
" v     real
" v     realtime
" s     ref
" v     reg
"       reject_on
" v     release
" v     repeat
"       restrict
" s     return
" v     rnmos
" v     rpmos
" v     rtran
" v     rtranif0
" v     rtranif1
"       s_always
"       s_eventually
"       s_nexttime
"       s_until
" sa    s_until_with
"       scalared
" s     sequence
" s     shortint
" s     shortreal
"       showcancelled
" v     signed
"       small
"       solve
" v     specify
" v     specparam
" sc    static
" s     string
" v     strong
" v     strong0
" v     strong1
" s     struct
" sc    super
" v     supply0
" v     supply1
"       sync_accept_on
"       sync_reject_on
"       table
"       tagged
" v     task
" sc    this
"       throughout
" v     time
" s     timeprecision
" s     timeunit
" v     tran
" v     tranif0
" v     tranif1
" v     tri
" v     tri0
" v     tri1
" v     triand
" v     trior
" v     trireg
"       type
" s     typedef
" s     union
" s     unique
"       unique0
" v     unsigned
"       until
"       until_with
"       untyped
" s     use
"       uwire
" s     var
"       vectored
" s     virtual
" s     void
" v     wait
"       wait_order
" v     wand
" v     weak
" v     weak0
" v     weak1
" v     while
"       wildcard
" v     wire
" sr    with
" s     within
" v     wor
" v     xnor
" v     xor

" Categorization of UVM keywords:
" ------------------------------------------------------
" A=API c=class C=component e=enum f=function F=field g=global
" m=macro O=object p=phase P=port s=static t=type T=task v=virtual
"
" KIND  KEYWORD
" # classes
" C     uvm_agent
" C     uvm_algorithmic_comparator
" c     uvm_barrier
" c     uvm_bit_rsrc
" c     uvm_blocking_get_export
" c     uvm_blocking_get_imp
" c     uvm_blocking_get_peek_export
" c     uvm_blocking_get_peek_imp
" c     uvm_blocking_get_peek_port
" c     uvm_blocking_get_port
" c     uvm_blocking_master_export
" c     uvm_blocking_master_imp
" c     uvm_blocking_master_port
" c     uvm_blocking_peek_export
" c     uvm_blocking_peek_imp
" c     uvm_blocking_peek_port
" c     uvm_blocking_put_export
" c     uvm_blocking_slave_export
" c     uvm_blocking_slave_imp
" c     uvm_blocking_slave_port
" c     uvm_blocking_transport_export
" c     uvm_blocking_transport_imp
" c     uvm_blocking_transport_port
" c     uvm_bogus_class
" c     uvm_bottom_up_visitor_adapter
" c     uvm_bottomup_phase
" c     uvm_build_phase
" c     uvm_built_in_clone
" c     uvm_by_level_visitor_adapter
" c     uvm_byte_rsrc
" c     uvm_callback
" c     uvm_callback_iter
" c     uvm_callbacks
" c     uvm_callbacks_base
" c     uvm_cause_effect_link
" c     uvm_check_phase
" c     uvm_class_clone
" c     uvm_cmd_line_verb
" c     uvm_cmdline_processor
" c     uvm_comparer
" c     uvm_component_name_check_visitor
" c     uvm_component_proxy
" c     uvm_config_db_options
" c     uvm_config_object_wrapper
" c     uvm_configure_phase
" c     uvm_connect_phase
" c     uvm_default_factory
" c     uvm_default_report_server
" c     uvm_derived_callbacks
" c     uvm_driver
" c     uvm_end_of_elaboration_phase
" c     uvm_enum_wrapper
" c     uvm_env
" c     uvm_event_base
" c     uvm_exhaustive_sequence
" c     uvm_extract_phase
" c     uvm_factory_override
" c     uvm_factory_queue_class
" c     uvm_final_phase
" c     uvm_get_export
" c     uvm_get_imp
" c     uvm_get_peek_export
" c     uvm_get_peek_imp
" c     uvm_get_peek_port
" c     uvm_get_port
" c     uvm_get_to_lock_dap
" c     uvm_heartbeat
" c     uvm_heartbeat_callback
" c     uvm_in_order_built_in_comparator
" c     uvm_in_order_comparator
" c     uvm_int_rsrc
" c     uvm_line_printer
" c     uvm_link_base
" c     uvm_main_phase
" c     uvm_master_export
" c     uvm_master_imp
" c     uvm_master_port
" c     uvm_mem
" c     uvm_mem_access_seq
" c     uvm_mem_mam_policy
" c     uvm_mem_region
" c     uvm_mem_shared_access_seq
" c     uvm_mem_single_access_seq
" c     uvm_mem_single_walk_seq
" c     uvm_mem_walk_seq
" c     uvm_monitor
" c     uvm_nonblocking_get_export
" c     uvm_nonblocking_get_imp
" c     uvm_nonblocking_get_peek_export
" c     uvm_nonblocking_get_peek_imp
" c     uvm_nonblocking_get_peek_port
" c     uvm_nonblocking_get_port
" c     uvm_nonblocking_master_export
" c     uvm_nonblocking_master_imp
" c     uvm_nonblocking_master_port
" c     uvm_nonblocking_peek_export
" c     uvm_nonblocking_peek_imp
" c     uvm_nonblocking_peek_port
" c     uvm_nonblocking_put_export
" c     uvm_nonblocking_put_imp
" c     uvm_nonblocking_put_port
" c     uvm_nonblocking_slave_export
" c     uvm_nonblocking_slave_imp
" c     uvm_nonblocking_slave_port
" c     uvm_nonblocking_transport_export
" c     uvm_nonblocking_transport_imp
" c     uvm_nonblocking_transport_port
" c     uvm_obj_rsrc
" c     uvm_object_string_pool
" c     uvm_objection
" c     uvm_objection_callback
" c     uvm_objection_context_object
" c     uvm_objection_events
" c     uvm_peek_export
" c     uvm_peek_imp
" c     uvm_peek_port
" c     uvm_phase_cb
" c     uvm_phase_state_change
" c     uvm_port_base
" c     uvm_port_component
" c     uvm_port_component_base
" c     uvm_post_configure_phase
" c     uvm_post_main_phase
" c     uvm_post_reset_phase
" c     uvm_post_shutdown_phase
" c     uvm_pre_configure_phase
" c     uvm_pre_main_phase
" c     uvm_pre_reset_phase
" c     uvm_pre_shutdown_phase
" c     uvm_predict_s
" c     uvm_printer_knobs
" c     uvm_push_driver
" c     uvm_push_sequencer
" c     uvm_put_export
" c     uvm_put_imp
" c     uvm_put_port
" c     uvm_random_sequence
" c     uvm_random_stimulus
" c     uvm_reg
" c     uvm_reg_access_seq
" c     uvm_reg_adapter
" c     uvm_reg_bit_bash_seq
" c     uvm_reg_fifo
" c     uvm_reg_hw_reset_seq
" c     uvm_reg_indirect_data
" c     uvm_reg_indirect_ftdr_seq
" c     uvm_reg_mem_access_seq
" c     uvm_reg_mem_built_in_seq
" c     uvm_reg_mem_hdl_paths_seq
" c     uvm_reg_predictor
" c     uvm_reg_read_only_cbs
" c     uvm_reg_sequence
" c     uvm_reg_shared_access_seq
" c     uvm_reg_single_access_seq
" c     uvm_reg_single_bit_bash_seq
" c     uvm_reg_tlm_adapter
" c     uvm_reg_transaction_order_policy
" c     uvm_reg_write_only_cbs
" c     uvm_report_catcher
" c     uvm_report_handler
" c     uvm_report_message_element_base
" c     uvm_report_message_int_element
" c     uvm_report_message_object_element
" c     uvm_report_message_string_element
" c     uvm_report_phase
" c     uvm_report_server
" c     uvm_reset_phase
" c     uvm_resource_db_options
" c     uvm_resource_options
" c     uvm_root
" c     uvm_run_phase
" c     uvm_scoreboard
" c     uvm_seed_map
" c     uvm_seq_item_pull_export
" c     uvm_sequence_base
" c     uvm_sequence_item
" c     uvm_sequence_library
" c     uvm_sequence_library_cfg
" c     uvm_sequence_process_wrapper
" c     uvm_sequence_request
" c     uvm_sequencer_analysis_fifo
" c     uvm_sequencer_base
" c     uvm_shutdown_phase
" c     uvm_simple_lock_dap
" c     uvm_simple_sequence
" c     uvm_slave_export
" c     uvm_slave_imp
" c     uvm_slave_port
" c     uvm_start_of_simulation_phase
" c     uvm_status_container
" c     uvm_string_rsrc
" c     uvm_structure_proxy
" c     uvm_subscriber
" c     uvm_table_printer
" c     uvm_test
" c     uvm_text_recorder
" c     uvm_text_tr_database
" c     uvm_tlm_b_initiator_socket
" c     uvm_tlm_b_passthrough_initiator_socket
" c     uvm_tlm_b_passthrough_target_socket
" c     uvm_tlm_b_target_socket
" c     uvm_tlm_b_transport_export
" c     uvm_tlm_b_transport_imp
" c     uvm_tlm_b_transport_port
" c     uvm_tlm_event
" c     uvm_tlm_extension
" c     uvm_tlm_extension_base
" c     uvm_tlm_fifo_base
" c     uvm_tlm_nb_initiator_socket
" c     uvm_tlm_nb_passthrough_initiator_socket
" c     uvm_tlm_nb_passthrough_target_socket
" c     uvm_tlm_nb_target_socket
" c     uvm_tlm_nb_transport_bw_export
" c     uvm_tlm_nb_transport_bw_imp
" c     uvm_tlm_nb_transport_bw_port
" c     uvm_tlm_nb_transport_fw_export
" c     uvm_tlm_nb_transport_fw_imp
" c     uvm_tlm_nb_transport_fw_port
" c     uvm_tlm_req_rsp_channel
" c     uvm_tlm_transport_channel
" c     uvm_top_down_visitor_adapter
" c     uvm_transport_export
" c     uvm_transport_imp
" c     uvm_transport_port
" c     uvm_tree_printer
" c     uvm_typed_callbacks
" c     uvm_typeid
" c     uvm_typeid_base
" c     uvm_utils
" c     uvm_visitor
" c     uvm_visitor_adapter
" c     uvm_void
" c     uvm_vreg_cbs

" #define
" UVM_BASE_SVH
" UVM_BLOCKING_GET_IMP
" UVM_BLOCKING_GET_IMP_SFX
" UVM_BLOCKING_GET_PEEK_IMP
" UVM_BLOCKING_PEEK_IMP
" UVM_BLOCKING_PEEK_IMP_SFX
" UVM_BLOCKING_PUT_IMP
" UVM_BLOCKING_PUT_IMP_SFX
" UVM_BLOCKING_TRANSPORT_IMP
" UVM_BLOCKING_TRANSPORT_IMP_SFX
" UVM_CALLBACK_SVH
" UVM_CB_MACROS_SVH
" UVM_CMDLINE_NO_DPI
" UVM_CMDLINE_PROCESSOR_SV
" UVM_CORESERVICE_TYPE
" UVM_DAP_SVH
" UVM_DEFAULT_TIMEOUT
" UVM_DEPRECATED_STARTING_PHASE
" UVM_DPI_SVH
" UVM_EXPORT_COMMON
" UVM_FUNCTION_ERROR
" UVM_GET_IMP
" UVM_GET_PEEK_IMP
" UVM_GLOBAL_DEFINES_SVH
" UVM_HDL_MAX_WIDTH
" UVM_HDL_NO_DPI
" UVM_HDL__SVH
" UVM_HEARTBEAT_SVH
" UVM_IMP_COMMON
" UVM_LINE_WIDTH
" UVM_MACROS_SVH
" UVM_MAJOR_REV
" UVM_MAJOR_REV_1
" UVM_MAJOR_VERSION_1_2
" UVM_MAX_STREAMBITS
" UVM_MEM_MAM__SV
" UVM_MESSAGE_DEFINES_SVH
" UVM_MINOR_REV
" UVM_MINOR_REV_2
" UVM_MS_IMP_COMMON
" UVM_NAME
" UVM_NONBLOCKING_GET_IMP
" UVM_NONBLOCKING_GET_IMP_SFX
" UVM_NONBLOCKING_GET_PEEK_IMP
" UVM_NONBLOCKING_PEEK_IMP
" UVM_NONBLOCKING_PEEK_IMP_SFX
" UVM_NONBLOCKING_PUT_IMP
" UVM_NONBLOCKING_PUT_IMP_SFX
" UVM_NONBLOCKING_TRANSPORT_IMP
" UVM_NONBLOCKING_TRANSPORT_IMP_SFX
" UVM_NO_REGISTERED_CONVERTER
" UVM_NUM_LINES
" UVM_OBJECTION_SVH
" UVM_OBJECT_DEFINES_SVH
" UVM_PACKER_MAX_BYTES
" UVM_PEEK_IMP
" UVM_PHASE_DEFINES_SVH
" UVM_PH_TRACE
" UVM_PORT_COMMON
" UVM_POST_VERSION_1_1
" UVM_PRINTER_DEFINES_SVH
" UVM_PUT_IMP
" UVM_QUEUE_SVH
" UVM_REGEX_NO_DPI
" UVM_REGISTRY_SVH
" UVM_REG_ADDR_WIDTH
" UVM_REG_BYTENABLE_WIDTH
" UVM_REG_CVR_WIDTH
" UVM_REG_DATA_WIDTH
" UVM_REG_MODEL__SV
" UVM_REPORT_CATCHER_SVH
" UVM_REPORT_CLIENT_SVH
" UVM_REPORT_DISABLE_FILE
" UVM_REPORT_DISABLE_LINE
" UVM_REPORT_HANDLER_SVH
" UVM_REPORT_MESSAGE_SVH
" UVM_REPORT_SERVER_SVH
" UVM_RESOURCE_GET_FCNS
" UVM_SEQ_ITEM_FUNCTION_ERROR
" UVM_SEQ_ITEM_GET_MASK
" UVM_SEQ_ITEM_GET_NEXT_ITEM_MASK
" UVM_SEQ_ITEM_HAS_DO_AVAILABLE_MASK
" UVM_SEQ_ITEM_ITEM_DONE_MASK
" UVM_SEQ_ITEM_PEEK_MASK
" UVM_SEQ_ITEM_PULL_IMP
" UVM_SEQ_ITEM_PULL_MASK
" UVM_SEQ_ITEM_PUSH_MASK
" UVM_SEQ_ITEM_PUT_MASK
" UVM_SEQ_ITEM_PUT_RESPONSE_MASK
" UVM_SEQ_ITEM_TASK_ERROR
" UVM_SEQ_ITEM_TRY_NEXT_ITEM_MASK
" UVM_SEQ_ITEM_UNI_PULL_MASK
" UVM_SEQ_ITEM_WAIT_FOR_SEQUENCES_MASK
" UVM_SEQ_PORT
" UVM_STRING_QUEUE_STREAMING_PACK
" UVM_TASK_ERROR
" UVM_TLM_ANALYSIS_MASK
" UVM_TLM_BLOCKING_GET_MASK
" UVM_TLM_BLOCKING_GET_PEEK_MASK
" UVM_TLM_BLOCKING_MASTER_MASK
" UVM_TLM_BLOCKING_PEEK_MASK
" UVM_TLM_BLOCKING_PUT_MASK
" UVM_TLM_BLOCKING_SLAVE_MASK
" UVM_TLM_BLOCKING_TRANSPORT_MASK
" UVM_TLM_B_MASK
" UVM_TLM_B_TRANSPORT_IMP
" UVM_TLM_FIFO_FUNCTION_ERROR
" UVM_TLM_FIFO_TASK_ERROR
" UVM_TLM_FUNCTION_ERROR
" UVM_TLM_GET_MASK
" UVM_TLM_GET_PEEK_MASK
" UVM_TLM_GET_TYPE_NAME
" UVM_TLM_IMPS_SVH
" UVM_TLM_MASTER_BIT_MASK
" UVM_TLM_MASTER_MASK
" UVM_TLM_NB_BW_MASK
" UVM_TLM_NB_FW_MASK
" UVM_TLM_NB_TRANSPORT_BW_IMP
" UVM_TLM_NB_TRANSPORT_FW_IMP
" UVM_TLM_NONBLOCKING_GET_MASK
" UVM_TLM_NONBLOCKING_GET_PEEK_MASK
" UVM_TLM_NONBLOCKING_MASTER_MASK
" UVM_TLM_NONBLOCKING_PEEK_MASK
" UVM_TLM_NONBLOCKING_PUT_MASK
" UVM_TLM_NONBLOCKING_SLAVE_MASK
" UVM_TLM_NONBLOCKING_TRANSPORT_MASK
" UVM_TLM_PEEK_MASK
" UVM_TLM_PUT_MASK
" UVM_TLM_SLAVE_BIT_MASK
" UVM_TLM_SLAVE_MASK
" UVM_TLM_TASK_ERROR
" UVM_TLM_TRANSPORT_MASK
" UVM_TRANSPORT_IMP
" UVM_USE_PROCESS_CONTAINER
" UVM_VERSION_1_2
" UVM_VERSION_DEFINES_SVH
" UVM_VERSION_STRING
" UVM_VERSION_SVH
" __built_in
" m_uvm_bottomup_phase
" m_uvm_component_registry_internal
" m_uvm_component_registry_param
" m_uvm_get_type_name_func
" m_uvm_object_create_func
" m_uvm_object_registry_internal
" m_uvm_object_registry_param
" m_uvm_print_int
" m_uvm_record_int
" m_uvm_record_object
" m_uvm_record_qda_enum
" m_uvm_record_qda_int
" m_uvm_record_qda_object
" m_uvm_record_qda_string
" m_uvm_record_string
" m_uvm_register_sequence
" m_uvm_task_phase
" m_uvm_topdown_phase
" uvm_add_to_seq_lib
" uvm_analysis_imp_decl
" uvm_blocking_get_imp_decl
" uvm_blocking_get_peek_imp_decl
" uvm_blocking_master_imp_decl
" uvm_blocking_peek_imp_decl
" uvm_blocking_put_imp_decl
" uvm_blocking_slave_imp_decl
" uvm_blocking_transport_imp_decl
" uvm_builtin_bottomup_phase
" uvm_builtin_task_phase
" uvm_builtin_topdown_phase
" uvm_cb_trace
" uvm_cb_trace_noobj
" uvm_component_param_utils
" uvm_component_param_utils_begin
" uvm_component_registry
" uvm_component_utils
" uvm_component_utils_begin
" uvm_component_utils_end
" uvm_create
" uvm_create_on
" uvm_create_seq
" uvm_declare_p_sequencer
" uvm_declare_sequence_lib
" uvm_delay
" uvm_do
" uvm_do_callbacks
" uvm_do_callbacks_exit_on
" uvm_do_obj_callbacks
" uvm_do_obj_callbacks_exit_on
" uvm_do_on
" uvm_do_on_pri
" uvm_do_on_pri_with
" uvm_do_on_with
" uvm_do_pri
" uvm_do_pri_with
" uvm_do_seq
" uvm_do_seq_with
" uvm_do_with
" uvm_end_package
" uvm_error
" uvm_error_begin
" uvm_error_context
" uvm_error_context_begin
" uvm_error_context_end
" uvm_error_end
" uvm_fatal
" uvm_fatal_begin
" uvm_fatal_context
" uvm_fatal_context_begin
" uvm_fatal_context_end
" uvm_fatal_end
" uvm_field_aa_int_byte
" uvm_field_aa_int_byte_unsigned
" uvm_field_aa_int_enumkey
" uvm_field_aa_int_int
" uvm_field_aa_int_int_unsigned
" uvm_field_aa_int_integer
" uvm_field_aa_int_integer_unsigned
" uvm_field_aa_int_key
" uvm_field_aa_int_longint
" uvm_field_aa_int_longint_unsigned
" uvm_field_aa_int_shortint
" uvm_field_aa_int_shortint_unsigned
" uvm_field_aa_int_string
" uvm_field_aa_object_int
" uvm_field_aa_object_string
" uvm_field_aa_string_int
" uvm_field_aa_string_string
" uvm_field_array_enum
" uvm_field_array_int
" uvm_field_array_object
" uvm_field_array_string
" uvm_field_enum
" uvm_field_event
" uvm_field_int
" uvm_field_object
" uvm_field_queue_enum
" uvm_field_queue_int
" uvm_field_queue_object
" uvm_field_queue_string
" uvm_field_real
" uvm_field_sarray_enum
" uvm_field_sarray_int
" uvm_field_sarray_object
" uvm_field_sarray_string
" uvm_field_string
" uvm_field_utils_begin
" uvm_field_utils_end
" uvm_file
" uvm_get_imp_decl
" uvm_get_peek_imp_decl
" uvm_info
" uvm_info_begin
" uvm_info_context
" uvm_info_context_begin
" uvm_info_context_end
" uvm_info_end
" uvm_line
" uvm_master_imp_decl
" uvm_message_add_int
" uvm_message_add_object
" uvm_message_add_string
" uvm_message_add_tag
" uvm_message_begin
" uvm_message_context_begin
" uvm_message_context_end
" uvm_message_end
" uvm_new_func
" uvm_non_blocking_transport_imp_decl
" uvm_nonblocking_get_imp_decl
" uvm_nonblocking_get_peek_imp_decl
" uvm_nonblocking_master_imp_decl
" uvm_nonblocking_peek_imp_decl
" uvm_nonblocking_put_imp_decl
" uvm_nonblocking_slave_imp_decl
" uvm_nonblocking_transport_imp_decl
" uvm_object_param_utils
" uvm_object_param_utils_begin
" uvm_object_registry
" uvm_object_utils
" uvm_object_utils_begin
" uvm_object_utils_end
" uvm_pack_array
" uvm_pack_arrayN
" uvm_pack_enum
" uvm_pack_enumN
" uvm_pack_int
" uvm_pack_intN
" uvm_pack_queue
" uvm_pack_queueN
" uvm_pack_real
" uvm_pack_sarray
" uvm_pack_sarrayN
" uvm_pack_string
" uvm_package
" uvm_peek_imp_decl
" uvm_print_aa_int_key4
" uvm_print_aa_int_object
" uvm_print_aa_int_object3
" uvm_print_aa_string_int
" uvm_print_aa_string_int3
" uvm_print_aa_string_object
" uvm_print_aa_string_object3
" uvm_print_aa_string_string
" uvm_print_aa_string_string2
" uvm_print_array_int
" uvm_print_array_int3
" uvm_print_array_object
" uvm_print_array_object3
" uvm_print_array_string
" uvm_print_array_string2
" uvm_print_enum
" uvm_print_int
" uvm_print_int3
" uvm_print_int4
" uvm_print_object
" uvm_print_object2
" uvm_print_object_qda4
" uvm_print_object_queue
" uvm_print_object_queue3
" uvm_print_qda_enum
" uvm_print_qda_int4
" uvm_print_queue_int
" uvm_print_queue_int3
" uvm_print_sarray_int3
" uvm_print_sarray_object
" uvm_print_sarray_object3
" uvm_print_sarray_string2
" uvm_print_string
" uvm_print_string2
" uvm_print_string_qda3
" uvm_print_string_queue
" uvm_print_string_queue2
" uvm_put_imp_decl
" uvm_rand_send
" uvm_rand_send_pri
" uvm_rand_send_pri_with
" uvm_rand_send_with
" uvm_record_attribute
" uvm_record_field
" uvm_record_int
" uvm_record_real
" uvm_record_string
" uvm_record_time
" uvm_register_cb
" uvm_send
" uvm_send_pri
" uvm_sequence_library_package
" uvm_sequence_library_utils
" uvm_sequence_utils
" uvm_sequence_utils_begin
" uvm_sequence_utils_end
" uvm_sequencer_param_utils
" uvm_sequencer_param_utils_begin
" uvm_sequencer_utils
" uvm_sequencer_utils_begin
" uvm_sequencer_utils_end
" uvm_set_super_type
" uvm_slave_imp_decl
" uvm_transport_imp_decl
" uvm_typename
" uvm_unpack_array
" uvm_unpack_arrayN
" uvm_unpack_enum
" uvm_unpack_enumN
" uvm_unpack_int
" uvm_unpack_intN
" uvm_unpack_queue
" uvm_unpack_queueN
" uvm_unpack_real
" uvm_unpack_sarray
" uvm_unpack_sarrayN
" uvm_unpack_string
" uvm_update_sequence_lib
" uvm_update_sequence_lib_and_item
" uvm_user_bottomup_phase
" uvm_user_task_phase
" uvm_user_topdown_phase
" uvm_warning
" uvm_warning_begin
" uvm_warning_context
" uvm_warning_context_begin
" uvm_warning_context_end
" uvm_warning_end

" #function
" uvm_args
" uvm_bits_to_string
" uvm_bitstream_to_string
" uvm_create_random_seed
" uvm_domain
" uvm_dpi_get_next_arg
" uvm_dpi_get_next_arg_c
" uvm_dpi_get_tool_name
" uvm_dpi_get_tool_name_c
" uvm_dpi_get_tool_version
" uvm_dpi_get_tool_version_c
" uvm_dpi_regcomp
" uvm_dpi_regexec
" uvm_dpi_regfree
" uvm_dump_re_cache
" uvm_field_automation
" uvm_get_array_index_int
" uvm_get_array_index_string
" uvm_get_report_object
" uvm_get_root
" uvm_glob_to_re
" uvm_has_wildcard
" uvm_hdl_check_path
" uvm_hdl_concat2string
" uvm_hdl_deposit
" uvm_hdl_force
" uvm_hdl_read
" uvm_hdl_release
" uvm_hdl_release_and_read
" uvm_instance_scope
" uvm_integral_to_string
" uvm_is_array
" uvm_is_match
" uvm_leaf_scope
" uvm_object_value_str
" uvm_oneway_hash
" uvm_phases
" uvm_process_report_message
" uvm_radix_to_string
" uvm_re_match
" uvm_report
" uvm_report_dpi
" uvm_report_enabled
" uvm_report_error
" uvm_report_fatal
" uvm_report_info
" uvm_report_warning
" uvm_revision_string
" uvm_schedule
" uvm_split_string
" uvm_string_queue_join
" uvm_string_to_action
" uvm_string_to_bits
" uvm_string_to_severity
" uvm_vector_to_string

" #task
" uvm_hdl_force_time
" uvm_wait_for_nba_region

" #typedef
" uvm_barrier_pool
" uvm_callbacks_objection
" uvm_config_obj_misc
" uvm_config_seq
" uvm_config_wrapper
" uvm_default_driver_type
" uvm_default_sequence_type
" uvm_default_sequencer_param_type
" uvm_default_sequencer_type
" uvm_hdl_data_t
" uvm_heartbeat_cbs_t
" uvm_id_actions_array
" uvm_id_file_array
" uvm_id_verbosities_array
" uvm_mem_cb
" uvm_objection_cbs_t
" uvm_pack_bitstream_t
" uvm_phase_cb_pool
" uvm_reg_addr_logic_t
" uvm_reg_bd_cb
" uvm_reg_bd_cb_iter
" uvm_reg_cb
" uvm_reg_field_cb
" uvm_report_cb
" uvm_report_cb_iter
" uvm_resource_converter
" uvm_sequence_state_enum
" uvm_sev_override_array
" uvm_severity_type
" uvm_table_printer_knobs
" uvm_tree_printer_knobs
" uvm_virtual_sequencer
" uvm_vreg_cb
" uvm_vreg_cb_iter
" uvm_vreg_field_cb

" # other
" uvm_aa_string_key
" uvm_access_e
" uvm_action
" uvm_action_type
" uvm_active_passive_enum
" uvm_analysis_export
" uvm_analysis_imp
" uvm_analysis_port
" uvm_apprepend
" uvm_bitstream_t
" uvm_blocking_put_imp
" uvm_blocking_put_port
" uvm_built_in_comp
" uvm_built_in_converter
" uvm_built_in_pair
" uvm_cdn_copyright
" uvm_check_e
" uvm_class_comp
" uvm_class_converter
" uvm_class_pair
" uvm_cmdline_parsed_arg_t
" uvm_cmdline_proc
" uvm_component
" uvm_config_db
" uvm_config_int
" uvm_config_object
" uvm_config_string
" uvm_coreservice_t
" uvm_coverage_model_e
" uvm_cy_copyright
" uvm_default_comparer
" uvm_default_coreservice_t
" uvm_default_line_printer
" uvm_default_packer
" uvm_default_printer
" uvm_default_table_printer
" uvm_default_tree_printer
" uvm_elem_kind_e
" uvm_endianness_e
" uvm_event
" uvm_event_callback
" uvm_event_pool
" uvm_factory
" uvm_get_array_index_
" uvm_global_copy_map
" uvm_global_random_seed
" uvm_hdl_path_concat
" uvm_hdl_path_slice
" uvm_heartbeat_modes
" uvm_hier_e
" uvm_in_order_class_comparator
" uvm_integral_t
" uvm_mem_cb_iter
" uvm_mem_mam
" uvm_mem_mam_cfg
" uvm_mem_mam_cfg_valid
" uvm_mem_mam_policy_no_overlap
" uvm_mem_mam_policy_valid
" uvm_mgc_copyright
" uvm_nv_copyright
" uvm_object
" uvm_object_wrapper
" uvm_objection_event
" uvm_packer
" uvm_parent_child_link
" uvm_path_e
" uvm_phase
" uvm_phase_state
" uvm_phase_type
" uvm_pkg
" uvm_pool
" uvm_port_list
" uvm_port_type_e
" uvm_predict_e
" uvm_print_aa_
" uvm_print_aa_int_object_3
" uvm_print_aa_string_object_3
" uvm_print_aa_string_string_2
" uvm_print_qda_int3
" uvm_printer
" uvm_printer_row_info
" uvm_queue
" uvm_radix_enum
" uvm_random_seed_table_lookup
" uvm_recorder
" uvm_recursion_policy_enum
" uvm_reg_addr_t
" uvm_reg_backdoor
" uvm_reg_block
" uvm_reg_bus_op
" uvm_reg_byte_en_t
" uvm_reg_cb_iter
" uvm_reg_cbs
" uvm_reg_cvr_rsrc_db
" uvm_reg_cvr_t
" uvm_reg_data_logic_t
" uvm_reg_data_t
" uvm_reg_field
" uvm_reg_field_cb_iter
" uvm_reg_field_valid
" uvm_reg_file
" uvm_reg_frontdoor
" uvm_reg_item
" uvm_reg_map
" uvm_reg_map_addr_range
" uvm_reg_map_info
" uvm_reg_mem_shared_access_seq
" uvm_reg_mem_tests_e
" uvm_related_link
" uvm_report_message
" uvm_report_message_element_container
" uvm_report_object
" uvm_resource
" uvm_resource_base
" uvm_resource_db
" uvm_resource_pool
" uvm_resource_types
" uvm_resources
" uvm_revision
" uvm_scope_stack
" uvm_seq_item_pull_imp
" uvm_seq_item_pull_port
" uvm_sequence
" uvm_sequence_lib_mode
" uvm_sequence_state
" uvm_sequencer
" uvm_sequencer_arb_mode
" uvm_sequencer_param_base
" uvm_set_action
" uvm_set_before_get_dap
" uvm_set_get_dap_base
" uvm_set_severity
" uvm_severity
" uvm_snps_copyright
" uvm_spell_chkr
" uvm_sqr_if_base
" uvm_start_uvm_declarations
" uvm_status_e
" uvm_task_phase
" uvm_test_done
" uvm_test_done_objection
" uvm_test_top
" uvm_text_tr_stream
" uvm_tlm_analysis_fifo
" uvm_tlm_b_initiator_socket_base
" uvm_tlm_b_passthrough_initiator_socket_base
" uvm_tlm_b_passthrough_target_socket_base
" uvm_tlm_b_target_socket_base
" uvm_tlm_command_e
" uvm_tlm_fifo
" uvm_tlm_generic_payload
" uvm_tlm_gp
" uvm_tlm_if
" uvm_tlm_if_base
" uvm_tlm_nb_initiator_socket_base
" uvm_tlm_nb_passthrough_initiator_socket_base
" uvm_tlm_nb_passthrough_target_socket_base
" uvm_tlm_nb_target_socket_base
" uvm_tlm_phase_e
" uvm_tlm_response_status_e
" uvm_tlm_sync_e
" uvm_tlm_time
" uvm_top
" uvm_topdown_phase
" uvm_tr_database
" uvm_tr_stream
" uvm_transaction
" uvm_verbosity
" uvm_vreg
" uvm_vreg_field
" uvm_vreg_field_cb_iter
" uvm_vreg_field_cbs
" uvm_wait_op

" UVM_ABSTRACT
" UVM_ACTIVE
" UVM_ALL_ACTIVE
" UVM_ALL_DROPPED
" UVM_ALL_ON
" UVM_ANY_ACTIVE
" UVM_APPEND
" UVM_BACKDOOR
" UVM_BIG_ENDIAN
" UVM_BIG_FIFO
" UVM_BIN
" UVM_BODY
" UVM_BURST_READ
" UVM_BURST_WRITE
" UVM_CALLBACK_TRACE
" UVM_CALL_HOOK
" UVM_CB_TRACE_ON
" UVM_CHECK
" UVM_CHECK_FIELDS
" UVM_COMPARE
" UVM_COPY
" UVM_COUNT
" UVM_CREATED
" UVM_CVR_ADDR_MAP
" UVM_CVR_ALL
" UVM_CVR_FIELD_VALS
" UVM_CVR_REG_BITS
" UVM_DEBUG
" UVM_DEC
" UVM_DEEP
" UVM_DEFAULT
" UVM_DEFAULT_PATH
" UVM_DEFAULT_POLICY
" UVM_DEPRECATED_REPORTING
" UVM_DISABLE_AUTO_ITEM_RECORDING
" UVM_DISPLAY
" UVM_DO_ALL_REG_MEM_TESTS
" UVM_DO_MEM_ACCESS
" UVM_DO_MEM_WALK
" UVM_DO_REG_ACCESS
" UVM_DO_REG_BIT_BASH
" UVM_DO_REG_HW_RESET
" UVM_DO_SHARED_ACCESS
" UVM_DROPPED
" UVM_EMPTY_MACROS
" UVM_ENABLE_FIELD_CHECKS
" UVM_ENDED
" UVM_END_DATA_EXTRA
" UVM_END_FUNCS
" UVM_ENUM
" UVM_EQ
" UVM_ERROR
" UVM_EXIT
" UVM_EXPORT
" UVM_FATAL
" UVM_FIELD
" UVM_FILE
" UVM_FINISHED
" UVM_FIX_REV
" UVM_FLAGS
" UVM_FLAGS_OFF
" UVM_FLAGS_ON
" UVM_FRONTDOOR
" UVM_FULL
" UVM_GT
" UVM_GTE
" UVM_HAS_X
" UVM_HEX
" UVM_HIER
" UVM_HIGH
" UVM_IMPLEMENTATION
" UVM_INFO
" UVM_IS_OK
" UVM_LARGE_STRING
" UVM_LITTLE_ENDIAN
" UVM_LITTLE_FIFO
" UVM_LOG
" UVM_LOW
" UVM_LT
" UVM_LTE
" UVM_MACRO_EXTRAS
" UVM_MACRO_NUMFLAGS
" UVM_MEDIUM
" UVM_MEM
" UVM_NE
" UVM_NOCOMPARE
" UVM_NOCOPY
" UVM_NODEFPRINT
" UVM_NONE
" UVM_NOPACK
" UVM_NOPRINT
" UVM_NORADIX
" UVM_NORECORD
" UVM_NOT_OK
" UVM_NO_ACTION
" UVM_NO_CHECK
" UVM_NO_COVERAGE
" UVM_NO_DEPRECATED
" UVM_NO_DPI
" UVM_NO_ENDIAN
" UVM_NO_HB_MODE
" UVM_NO_HIER
" UVM_NO_WAIT_FOR_NBA
" UVM_OBJECT_DO_NOT_NEED_CONSTRUCTOR
" UVM_OCT
" UVM_ONE_ACTIVE
" UVM_PACK
" UVM_PASSIVE
" UVM_PHASE_CLEANUP
" UVM_PHASE_DOMAIN
" UVM_PHASE_DONE
" UVM_PHASE_DORMANT
" UVM_PHASE_ENDED
" UVM_PHASE_EXECUTING
" UVM_PHASE_GLOBAL
" UVM_PHASE_IMP
" UVM_PHASE_JUMPING
" UVM_PHASE_NODE
" UVM_PHASE_READY_TO_END
" UVM_PHASE_SCHEDULE
" UVM_PHASE_SCHEDULED
" UVM_PHASE_STARTED
" UVM_PHASE_SYNCING
" UVM_PHASE_TERMINAL
" UVM_PHASE_UNINITIALIZED
" UVM_PHYSICAL
" UVM_PORT
" UVM_POST_BODY
" UVM_POST_START
" UVM_POUND_ZERO_COUNT
" UVM_PREDICT
" UVM_PREDICT_DIRECT
" UVM_PREDICT_READ
" UVM_PREDICT_WRITE
" UVM_PREPEND
" UVM_PRE_BODY
" UVM_PRE_START
" UVM_PRINT
" UVM_RADIX
" UVM_RAISED
" UVM_READ
" UVM_READONLY
" UVM_REAL
" UVM_REAL_DEC
" UVM_REAL_EXP
" UVM_RECORD
" UVM_REFERENCE
" UVM_REG
" UVM_REG_NO_INDIVIDUAL_FIELD_ACCESS
" UVM_REPORT_DISABLE_FILE_LINE
" UVM_RM_RECORD
" UVM_SEQ
" UVM_SEQ_ARB_FIFO
" UVM_SEQ_ARB_RANDOM
" UVM_SEQ_ARB_STRICT_FIFO
" UVM_SEQ_ARB_STRICT_RANDOM
" UVM_SEQ_ARB_TYPE
" UVM_SEQ_ARB_USER
" UVM_SEQ_ARB_WEIGHTED
" UVM_SEQ_LIB_ITEM
" UVM_SEQ_LIB_RAND
" UVM_SEQ_LIB_RANDC
" UVM_SEQ_LIB_USER
" UVM_SET
" UVM_SETINT
" UVM_SETOBJ
" UVM_SETSTR
" UVM_SHALLOW
" UVM_SMALL_STRING
" UVM_START_FUNCS
" UVM_STDOUT
" UVM_STOP
" UVM_STOPPED
" UVM_STREAMBITS
" UVM_STRING
" UVM_STR_CRC_POLYNOMIAL
" UVM_TIME
" UVM_TLM_ACCEPTED
" UVM_TLM_ADDRESS_ERROR_RESPONSE
" UVM_TLM_BURST_ERROR_RESPONSE
" UVM_TLM_BYTE_ENABLE_ERROR_RESPONSE
" UVM_TLM_COMMAND_ERROR_RESPONSE
" UVM_TLM_COMPLETED
" UVM_TLM_GENERIC_ERROR_RESPONSE
" UVM_TLM_IGNORE_COMMAND
" UVM_TLM_INCOMPLETE_RESPONSE
" UVM_TLM_OK_RESPONSE
" UVM_TLM_READ_COMMAND
" UVM_TLM_UPDATED
" UVM_TLM_WRITE_COMMAND
" UVM_UNBOUNDED_CONNECTIONS
" UVM_UNFORMAT2
" UVM_UNFORMAT4
" UVM_UNPACK
" UVM_UNSIGNED
" UVM_USE_PROCESS_STATE
" UVM_USE_RESOURCE_CONVERTER
" UVM_USE_STRING_QUEUE_STREAMING_PACK
" UVM_USE_SUSPEND_RESUME
" UVM_WARNING
" UVM_WRITE

" vim: ts=8
