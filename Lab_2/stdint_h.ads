pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package stdint_h is

   --  unsupported macro: INT8_MIN (-128)
   --  unsupported macro: INT16_MIN (-32767-1)
   --  unsupported macro: INT32_MIN (-2147483647-1)
   --  unsupported macro: INT64_MIN (-__INT64_C(9223372036854775807)-1)
   --  unsupported macro: INT8_MAX (127)
   --  unsupported macro: INT16_MAX (32767)
   --  unsupported macro: INT32_MAX (2147483647)
   --  unsupported macro: INT64_MAX (__INT64_C(9223372036854775807))
   --  unsupported macro: UINT8_MAX (255)
   --  unsupported macro: UINT16_MAX (65535)
   --  unsupported macro: UINT32_MAX (4294967295U)
   --  unsupported macro: UINT64_MAX (__UINT64_C(18446744073709551615))
   --  unsupported macro: INT_LEAST8_MIN (-128)
   --  unsupported macro: INT_LEAST16_MIN (-32767-1)
   --  unsupported macro: INT_LEAST32_MIN (-2147483647-1)
   --  unsupported macro: INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)
   --  unsupported macro: INT_LEAST8_MAX (127)
   --  unsupported macro: INT_LEAST16_MAX (32767)
   --  unsupported macro: INT_LEAST32_MAX (2147483647)
   --  unsupported macro: INT_LEAST64_MAX (__INT64_C(9223372036854775807))
   --  unsupported macro: UINT_LEAST8_MAX (255)
   --  unsupported macro: UINT_LEAST16_MAX (65535)
   --  unsupported macro: UINT_LEAST32_MAX (4294967295U)
   --  unsupported macro: UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))
   --  unsupported macro: INT_FAST8_MIN (-128)
   --  unsupported macro: INT_FAST16_MIN (-2147483647-1)
   --  unsupported macro: INT_FAST32_MIN (-2147483647-1)
   --  unsupported macro: INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)
   --  unsupported macro: INT_FAST8_MAX (127)
   --  unsupported macro: INT_FAST16_MAX (2147483647)
   --  unsupported macro: INT_FAST32_MAX (2147483647)
   --  unsupported macro: INT_FAST64_MAX (__INT64_C(9223372036854775807))
   --  unsupported macro: UINT_FAST8_MAX (255)
   --  unsupported macro: UINT_FAST16_MAX (4294967295U)
   --  unsupported macro: UINT_FAST32_MAX (4294967295U)
   --  unsupported macro: UINT_FAST64_MAX (__UINT64_C(18446744073709551615))
   --  unsupported macro: INTPTR_MIN (-2147483647-1)
   --  unsupported macro: INTPTR_MAX (2147483647)
   --  unsupported macro: UINTPTR_MAX (4294967295U)
   --  unsupported macro: INTMAX_MIN (-__INT64_C(9223372036854775807)-1)
   --  unsupported macro: INTMAX_MAX (__INT64_C(9223372036854775807))
   --  unsupported macro: UINTMAX_MAX (__UINT64_C(18446744073709551615))
   --  unsupported macro: PTRDIFF_MIN (-2147483647-1)
   --  unsupported macro: PTRDIFF_MAX (2147483647)
   --  unsupported macro: SIG_ATOMIC_MIN (-2147483647-1)
   --  unsupported macro: SIG_ATOMIC_MAX (2147483647)
   --  unsupported macro: SIZE_MAX (4294967295U)
   --  unsupported macro: WCHAR_MIN __WCHAR_MIN
   --  unsupported macro: WCHAR_MAX __WCHAR_MAX
   --  unsupported macro: WINT_MIN (0u)
   --  unsupported macro: WINT_MAX (4294967295u)
   --  arg-macro: procedure INT8_C c
   --    c
   --  arg-macro: procedure INT16_C c
   --    c
   --  arg-macro: procedure INT32_C c
   --    c
   --  unsupported macro: INT64_C(c) c ## LL
   --  arg-macro: procedure UINT8_C c
   --    c
   --  arg-macro: procedure UINT16_C c
   --    c
   --  unsupported macro: UINT32_C(c) c ## U
   --  unsupported macro: UINT64_C(c) c ## ULL
   --  unsupported macro: INTMAX_C(c) c ## LL
   --  unsupported macro: UINTMAX_C(c) c ## ULL
  -- Copyright (C) 1997-2016 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <http://www.gnu.org/licenses/>.   

  -- *	ISO C99: 7.18 Integer types <stdint.h>
  --  

  -- Exact integral types.   
  -- Signed.   
  -- There is some amount of overlap with <sys/types.h> as known by inet code  
   subtype int8_t is signed_char;  -- /usr/arm-linux-gnueabi/include/stdint.h:36

   subtype int16_t is short;  -- /usr/arm-linux-gnueabi/include/stdint.h:37

   subtype int32_t is int;  -- /usr/arm-linux-gnueabi/include/stdint.h:38

   subtype int64_t is Long_Long_Integer;  -- /usr/arm-linux-gnueabi/include/stdint.h:43

  -- Unsigned.   
   subtype uint8_t is unsigned_char;  -- /usr/arm-linux-gnueabi/include/stdint.h:48

   subtype uint16_t is unsigned_short;  -- /usr/arm-linux-gnueabi/include/stdint.h:49

   subtype uint32_t is unsigned;  -- /usr/arm-linux-gnueabi/include/stdint.h:51

   subtype uint64_t is Extensions.unsigned_long_long;  -- /usr/arm-linux-gnueabi/include/stdint.h:58

  -- Small types.   
  -- Signed.   
   subtype int_least8_t is signed_char;  -- /usr/arm-linux-gnueabi/include/stdint.h:65

   subtype int_least16_t is short;  -- /usr/arm-linux-gnueabi/include/stdint.h:66

   subtype int_least32_t is int;  -- /usr/arm-linux-gnueabi/include/stdint.h:67

   subtype int_least64_t is Long_Long_Integer;  -- /usr/arm-linux-gnueabi/include/stdint.h:72

  -- Unsigned.   
   subtype uint_least8_t is unsigned_char;  -- /usr/arm-linux-gnueabi/include/stdint.h:76

   subtype uint_least16_t is unsigned_short;  -- /usr/arm-linux-gnueabi/include/stdint.h:77

   subtype uint_least32_t is unsigned;  -- /usr/arm-linux-gnueabi/include/stdint.h:78

   subtype uint_least64_t is Extensions.unsigned_long_long;  -- /usr/arm-linux-gnueabi/include/stdint.h:83

  -- Fast types.   
  -- Signed.   
   subtype int_fast8_t is signed_char;  -- /usr/arm-linux-gnueabi/include/stdint.h:90

   subtype int_fast16_t is int;  -- /usr/arm-linux-gnueabi/include/stdint.h:96

   subtype int_fast32_t is int;  -- /usr/arm-linux-gnueabi/include/stdint.h:97

   subtype int_fast64_t is Long_Long_Integer;  -- /usr/arm-linux-gnueabi/include/stdint.h:99

  -- Unsigned.   
   subtype uint_fast8_t is unsigned_char;  -- /usr/arm-linux-gnueabi/include/stdint.h:103

   subtype uint_fast16_t is unsigned;  -- /usr/arm-linux-gnueabi/include/stdint.h:109

   subtype uint_fast32_t is unsigned;  -- /usr/arm-linux-gnueabi/include/stdint.h:110

   subtype uint_fast64_t is Extensions.unsigned_long_long;  -- /usr/arm-linux-gnueabi/include/stdint.h:112

  -- Types for `void *' pointers.   
   subtype intptr_t is int;  -- /usr/arm-linux-gnueabi/include/stdint.h:125

   subtype uintptr_t is unsigned;  -- /usr/arm-linux-gnueabi/include/stdint.h:128

  -- Largest integral types.   
   subtype intmax_t is Long_Long_Integer;  -- /usr/arm-linux-gnueabi/include/stdint.h:138

   subtype uintmax_t is Extensions.unsigned_long_long;  -- /usr/arm-linux-gnueabi/include/stdint.h:140

  -- Limits of integral types.   
  -- Minimum of signed integral types.   
  -- Maximum of signed integral types.   
  -- Maximum of unsigned integral types.   
  -- Minimum of signed integral types having a minimum size.   
  -- Maximum of signed integral types having a minimum size.   
  -- Maximum of unsigned integral types having a minimum size.   
  -- Minimum of fast signed integral types having a minimum size.   
  -- Maximum of fast signed integral types having a minimum size.   
  -- Maximum of fast unsigned integral types having a minimum size.   
  -- Values to test for integral types holding `void *' pointer.   
  -- Minimum for largest signed integral type.   
  -- Maximum for largest signed integral type.   
  -- Maximum for largest unsigned integral type.   
  -- Limits of other integer types.   
  -- Limits of `ptrdiff_t' type.   
  -- Limits of `sig_atomic_t'.   
  -- Limit of `size_t' type.   
  -- Limits of `wchar_t'.   
  -- These constants might also be defined in <wchar.h>.   
  -- Limits of `wint_t'.   
  -- Signed.   
  -- Unsigned.   
  -- Maximal type.   
end stdint_h;
