pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 7.3.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_simple" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#f91ae3be#;
   pragma Export (C, u00001, "simpleB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#7ec093d3#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#a65aab7e#;
   pragma Export (C, u00005, "ada__dynamic_prioritiesB");
   u00006 : constant Version_32 := 16#38b18e33#;
   pragma Export (C, u00006, "ada__dynamic_prioritiesS");
   u00007 : constant Version_32 := 16#c2326fda#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#6e98a13f#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#4635ec04#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#4e7785b8#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#d8b13451#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#381fe17b#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#30ad09e5#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#fca7137e#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#f103f468#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#6bf6a600#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#c88a87ec#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#1b9b8546#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00024, "system__exceptionsB");
   u00025 : constant Version_32 := 16#2e5681f2#;
   pragma Export (C, u00025, "system__exceptionsS");
   u00026 : constant Version_32 := 16#843d48dc#;
   pragma Export (C, u00026, "system__exceptions__machineS");
   u00027 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00027, "system__exceptions_debugB");
   u00028 : constant Version_32 := 16#38bf15c0#;
   pragma Export (C, u00028, "system__exceptions_debugS");
   u00029 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00029, "system__img_intB");
   u00030 : constant Version_32 := 16#44ee0cc6#;
   pragma Export (C, u00030, "system__img_intS");
   u00031 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00031, "system__tracebackB");
   u00032 : constant Version_32 := 16#181732c0#;
   pragma Export (C, u00032, "system__tracebackS");
   u00033 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00033, "system__traceback_entriesB");
   u00034 : constant Version_32 := 16#466e1a74#;
   pragma Export (C, u00034, "system__traceback_entriesS");
   u00035 : constant Version_32 := 16#6fd210f2#;
   pragma Export (C, u00035, "system__traceback__symbolicB");
   u00036 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00036, "system__traceback__symbolicS");
   u00037 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00037, "ada__exceptions__tracebackB");
   u00038 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00038, "ada__exceptions__tracebackS");
   u00039 : constant Version_32 := 16#9f00b3d3#;
   pragma Export (C, u00039, "system__address_imageB");
   u00040 : constant Version_32 := 16#e7d9713e#;
   pragma Export (C, u00040, "system__address_imageS");
   u00041 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00041, "system__wch_conB");
   u00042 : constant Version_32 := 16#5d48ced6#;
   pragma Export (C, u00042, "system__wch_conS");
   u00043 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00043, "system__wch_stwB");
   u00044 : constant Version_32 := 16#7059e2d7#;
   pragma Export (C, u00044, "system__wch_stwS");
   u00045 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00045, "system__wch_cnvB");
   u00046 : constant Version_32 := 16#52ff7425#;
   pragma Export (C, u00046, "system__wch_cnvS");
   u00047 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00047, "interfacesS");
   u00048 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00048, "system__wch_jisB");
   u00049 : constant Version_32 := 16#d28f6d04#;
   pragma Export (C, u00049, "system__wch_jisS");
   u00050 : constant Version_32 := 16#08881467#;
   pragma Export (C, u00050, "system__task_primitivesS");
   u00051 : constant Version_32 := 16#decff30d#;
   pragma Export (C, u00051, "system__os_interfaceB");
   u00052 : constant Version_32 := 16#dac51a48#;
   pragma Export (C, u00052, "system__os_interfaceS");
   u00053 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00053, "interfaces__cB");
   u00054 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00054, "interfaces__cS");
   u00055 : constant Version_32 := 16#3dce974e#;
   pragma Export (C, u00055, "system__linuxS");
   u00056 : constant Version_32 := 16#69418a44#;
   pragma Export (C, u00056, "system__os_constantsS");
   u00057 : constant Version_32 := 16#72b39087#;
   pragma Export (C, u00057, "system__unsigned_typesS");
   u00058 : constant Version_32 := 16#35461298#;
   pragma Export (C, u00058, "system__task_primitives__operationsB");
   u00059 : constant Version_32 := 16#28930186#;
   pragma Export (C, u00059, "system__task_primitives__operationsS");
   u00060 : constant Version_32 := 16#e95cd909#;
   pragma Export (C, u00060, "system__bit_opsB");
   u00061 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00061, "system__bit_opsS");
   u00062 : constant Version_32 := 16#66645a25#;
   pragma Export (C, u00062, "system__interrupt_managementB");
   u00063 : constant Version_32 := 16#f8b85fd3#;
   pragma Export (C, u00063, "system__interrupt_managementS");
   u00064 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00064, "system__multiprocessorsB");
   u00065 : constant Version_32 := 16#7e997377#;
   pragma Export (C, u00065, "system__multiprocessorsS");
   u00066 : constant Version_32 := 16#d083f760#;
   pragma Export (C, u00066, "system__os_primitivesB");
   u00067 : constant Version_32 := 16#ccbafd72#;
   pragma Export (C, u00067, "system__os_primitivesS");
   u00068 : constant Version_32 := 16#375a3ef7#;
   pragma Export (C, u00068, "system__task_infoB");
   u00069 : constant Version_32 := 16#c01cd21c#;
   pragma Export (C, u00069, "system__task_infoS");
   u00070 : constant Version_32 := 16#37a60d57#;
   pragma Export (C, u00070, "system__taskingB");
   u00071 : constant Version_32 := 16#c03b1874#;
   pragma Export (C, u00071, "system__taskingS");
   u00072 : constant Version_32 := 16#118e865d#;
   pragma Export (C, u00072, "system__stack_usageB");
   u00073 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00073, "system__stack_usageS");
   u00074 : constant Version_32 := 16#36a43a0a#;
   pragma Export (C, u00074, "system__crtlS");
   u00075 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00075, "system__ioB");
   u00076 : constant Version_32 := 16#d8771b4b#;
   pragma Export (C, u00076, "system__ioS");
   u00077 : constant Version_32 := 16#e737d8df#;
   pragma Export (C, u00077, "system__tasking__debugB");
   u00078 : constant Version_32 := 16#72bfd9bc#;
   pragma Export (C, u00078, "system__tasking__debugS");
   u00079 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00079, "system__concat_2B");
   u00080 : constant Version_32 := 16#44953bd4#;
   pragma Export (C, u00080, "system__concat_2S");
   u00081 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00081, "system__concat_3B");
   u00082 : constant Version_32 := 16#4d45b0a1#;
   pragma Export (C, u00082, "system__concat_3S");
   u00083 : constant Version_32 := 16#18e0e51c#;
   pragma Export (C, u00083, "system__img_enum_newB");
   u00084 : constant Version_32 := 16#2779eac4#;
   pragma Export (C, u00084, "system__img_enum_newS");
   u00085 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00085, "system__img_lliB");
   u00086 : constant Version_32 := 16#577ab9d5#;
   pragma Export (C, u00086, "system__img_lliS");
   u00087 : constant Version_32 := 16#cbe28558#;
   pragma Export (C, u00087, "ada__task_identificationB");
   u00088 : constant Version_32 := 16#f3da1bf8#;
   pragma Export (C, u00088, "ada__task_identificationS");
   u00089 : constant Version_32 := 16#05f5974e#;
   pragma Export (C, u00089, "system__tasking__utilitiesB");
   u00090 : constant Version_32 := 16#9b15eab5#;
   pragma Export (C, u00090, "system__tasking__utilitiesS");
   u00091 : constant Version_32 := 16#3d17c74c#;
   pragma Export (C, u00091, "ada__tagsB");
   u00092 : constant Version_32 := 16#5a4e344a#;
   pragma Export (C, u00092, "ada__tagsS");
   u00093 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00093, "system__htableB");
   u00094 : constant Version_32 := 16#c2f75fee#;
   pragma Export (C, u00094, "system__htableS");
   u00095 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00095, "system__string_hashB");
   u00096 : constant Version_32 := 16#60a93490#;
   pragma Export (C, u00096, "system__string_hashS");
   u00097 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00097, "system__val_lluB");
   u00098 : constant Version_32 := 16#0841c7f5#;
   pragma Export (C, u00098, "system__val_lluS");
   u00099 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00099, "system__val_utilB");
   u00100 : constant Version_32 := 16#ea955afa#;
   pragma Export (C, u00100, "system__val_utilS");
   u00101 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00101, "system__case_utilB");
   u00102 : constant Version_32 := 16#623c85d3#;
   pragma Export (C, u00102, "system__case_utilS");
   u00103 : constant Version_32 := 16#7adc0f68#;
   pragma Export (C, u00103, "system__tasking__initializationB");
   u00104 : constant Version_32 := 16#efd25374#;
   pragma Export (C, u00104, "system__tasking__initializationS");
   u00105 : constant Version_32 := 16#8e0cce20#;
   pragma Export (C, u00105, "system__soft_links__taskingB");
   u00106 : constant Version_32 := 16#5ae92880#;
   pragma Export (C, u00106, "system__soft_links__taskingS");
   u00107 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00107, "ada__exceptions__is_null_occurrenceB");
   u00108 : constant Version_32 := 16#e1d7566f#;
   pragma Export (C, u00108, "ada__exceptions__is_null_occurrenceS");
   u00109 : constant Version_32 := 16#1b84470b#;
   pragma Export (C, u00109, "system__tasking__task_attributesB");
   u00110 : constant Version_32 := 16#6bc95a13#;
   pragma Export (C, u00110, "system__tasking__task_attributesS");
   u00111 : constant Version_32 := 16#57df25b5#;
   pragma Export (C, u00111, "system__tasking__queuingB");
   u00112 : constant Version_32 := 16#d1ba2fcb#;
   pragma Export (C, u00112, "system__tasking__queuingS");
   u00113 : constant Version_32 := 16#772f46f9#;
   pragma Export (C, u00113, "system__tasking__protected_objectsB");
   u00114 : constant Version_32 := 16#a9001c61#;
   pragma Export (C, u00114, "system__tasking__protected_objectsS");
   u00115 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00115, "system__tracesB");
   u00116 : constant Version_32 := 16#b42884ae#;
   pragma Export (C, u00116, "system__tracesS");
   u00117 : constant Version_32 := 16#eb5ad743#;
   pragma Export (C, u00117, "system__tasking__protected_objects__entriesB");
   u00118 : constant Version_32 := 16#427cf21f#;
   pragma Export (C, u00118, "system__tasking__protected_objects__entriesS");
   u00119 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00119, "system__restrictionsB");
   u00120 : constant Version_32 := 16#aab42239#;
   pragma Export (C, u00120, "system__restrictionsS");
   u00121 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00121, "ada__finalizationS");
   u00122 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00122, "ada__streamsB");
   u00123 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00123, "ada__streamsS");
   u00124 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00124, "ada__io_exceptionsS");
   u00125 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00125, "system__finalization_rootB");
   u00126 : constant Version_32 := 16#09c79f94#;
   pragma Export (C, u00126, "system__finalization_rootS");
   u00127 : constant Version_32 := 16#bd6fc52e#;
   pragma Export (C, u00127, "system__traces__taskingB");
   u00128 : constant Version_32 := 16#09f07b39#;
   pragma Export (C, u00128, "system__traces__taskingS");
   u00129 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00129, "ada__integer_text_ioB");
   u00130 : constant Version_32 := 16#b85ee1d1#;
   pragma Export (C, u00130, "ada__integer_text_ioS");
   u00131 : constant Version_32 := 16#1d1c6062#;
   pragma Export (C, u00131, "ada__text_ioB");
   u00132 : constant Version_32 := 16#e1e47390#;
   pragma Export (C, u00132, "ada__text_ioS");
   u00133 : constant Version_32 := 16#4c01b69c#;
   pragma Export (C, u00133, "interfaces__c_streamsB");
   u00134 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00134, "interfaces__c_streamsS");
   u00135 : constant Version_32 := 16#d542d957#;
   pragma Export (C, u00135, "system__file_ioB");
   u00136 : constant Version_32 := 16#e1440d61#;
   pragma Export (C, u00136, "system__file_ioS");
   u00137 : constant Version_32 := 16#957a1bdd#;
   pragma Export (C, u00137, "system__os_libB");
   u00138 : constant Version_32 := 16#5913ca02#;
   pragma Export (C, u00138, "system__os_libS");
   u00139 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00139, "system__stringsB");
   u00140 : constant Version_32 := 16#388afd62#;
   pragma Export (C, u00140, "system__stringsS");
   u00141 : constant Version_32 := 16#bbaa76ac#;
   pragma Export (C, u00141, "system__file_control_blockS");
   u00142 : constant Version_32 := 16#f6fdca1c#;
   pragma Export (C, u00142, "ada__text_io__integer_auxB");
   u00143 : constant Version_32 := 16#b9793d30#;
   pragma Export (C, u00143, "ada__text_io__integer_auxS");
   u00144 : constant Version_32 := 16#181dc502#;
   pragma Export (C, u00144, "ada__text_io__generic_auxB");
   u00145 : constant Version_32 := 16#a6c327d3#;
   pragma Export (C, u00145, "ada__text_io__generic_auxS");
   u00146 : constant Version_32 := 16#b10ba0c7#;
   pragma Export (C, u00146, "system__img_biuB");
   u00147 : constant Version_32 := 16#b49118ca#;
   pragma Export (C, u00147, "system__img_biuS");
   u00148 : constant Version_32 := 16#4e06ab0c#;
   pragma Export (C, u00148, "system__img_llbB");
   u00149 : constant Version_32 := 16#f5560834#;
   pragma Export (C, u00149, "system__img_llbS");
   u00150 : constant Version_32 := 16#a756d097#;
   pragma Export (C, u00150, "system__img_llwB");
   u00151 : constant Version_32 := 16#5c3a2ba2#;
   pragma Export (C, u00151, "system__img_llwS");
   u00152 : constant Version_32 := 16#eb55dfbb#;
   pragma Export (C, u00152, "system__img_wiuB");
   u00153 : constant Version_32 := 16#dad09f58#;
   pragma Export (C, u00153, "system__img_wiuS");
   u00154 : constant Version_32 := 16#d763507a#;
   pragma Export (C, u00154, "system__val_intB");
   u00155 : constant Version_32 := 16#0e90c63b#;
   pragma Export (C, u00155, "system__val_intS");
   u00156 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00156, "system__val_unsB");
   u00157 : constant Version_32 := 16#621b7dbc#;
   pragma Export (C, u00157, "system__val_unsS");
   u00158 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00158, "system__val_lliB");
   u00159 : constant Version_32 := 16#dc110aa4#;
   pragma Export (C, u00159, "system__val_lliS");
   u00160 : constant Version_32 := 16#ff0c338a#;
   pragma Export (C, u00160, "ada__real_timeB");
   u00161 : constant Version_32 := 16#c3d451b0#;
   pragma Export (C, u00161, "ada__real_timeS");
   u00162 : constant Version_32 := 16#9d2ee918#;
   pragma Export (C, u00162, "ada__real_time__delaysB");
   u00163 : constant Version_32 := 16#a062f703#;
   pragma Export (C, u00163, "ada__real_time__delaysS");
   u00164 : constant Version_32 := 16#abbae291#;
   pragma Export (C, u00164, "system__tasking__stagesB");
   u00165 : constant Version_32 := 16#a2ee1060#;
   pragma Export (C, u00165, "system__tasking__stagesS");
   u00166 : constant Version_32 := 16#ffdce1e2#;
   pragma Export (C, u00166, "system__tasking__rendezvousB");
   u00167 : constant Version_32 := 16#ea18a31e#;
   pragma Export (C, u00167, "system__tasking__rendezvousS");
   u00168 : constant Version_32 := 16#6724d389#;
   pragma Export (C, u00168, "system__tasking__entry_callsB");
   u00169 : constant Version_32 := 16#df420580#;
   pragma Export (C, u00169, "system__tasking__entry_callsS");
   u00170 : constant Version_32 := 16#e138c053#;
   pragma Export (C, u00170, "system__tasking__protected_objects__operationsB");
   u00171 : constant Version_32 := 16#ba36ad85#;
   pragma Export (C, u00171, "system__tasking__protected_objects__operationsS");
   u00172 : constant Version_32 := 16#a6359005#;
   pragma Export (C, u00172, "system__memoryB");
   u00173 : constant Version_32 := 16#1f488a30#;
   pragma Export (C, u00173, "system__memoryS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.wch_stw%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  ada.exceptions%s
   --  system.wch_stw%b
   --  ada.exceptions.traceback%s
   --  system.soft_links%s
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.secondary_stack%s
   --  system.address_image%s
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%s
   --  system.memory%s
   --  system.memory%b
   --  ada.exceptions.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  system.exceptions.machine%s
   --  system.secondary_stack%b
   --  system.address_image%b
   --  ada.exceptions.last_chance_handler%b
   --  system.standard_library%b
   --  ada.exceptions%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.io_exceptions%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.linux%s
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_constants%s
   --  system.os_interface%s
   --  system.os_interface%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_primitives%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.val_lli%s
   --  system.val_lli%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  system.val_int%s
   --  system.val_int%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.tasking%s
   --  system.tasking.debug%s
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.real_time.delays%s
   --  ada.real_time.delays%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  ada.task_identification%s
   --  ada.task_identification%b
   --  ada.dynamic_priorities%s
   --  ada.dynamic_priorities%b
   --  system.tasking.entry_calls%s
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.entry_calls%b
   --  system.tasking.rendezvous%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  simple%b
   --  END ELABORATION ORDER


end ada_main;
