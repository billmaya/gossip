.section __DWARF, __debug_abbrev,regular,debug

	.byte 1,17,1,37,8,3,8,27,8,19,11,17,1,18,1,16,6,0,0,2,46,1,3,8,17,1,18,1,64,10,0,0
	.byte 3,5,0,3,8,73,19,2,10,0,0,15,5,0,3,8,73,19,2,6,0,0,4,36,0,11,11,62,11,3,8,0
	.byte 0,5,2,1,3,8,11,15,0,0,17,2,0,3,8,11,15,0,0,6,13,0,3,8,73,19,56,10,0,0,7,22
	.byte 0,3,8,73,19,0,0,8,4,1,3,8,11,15,73,19,0,0,9,40,0,3,8,28,13,0,0,10,57,1,3,8
	.byte 0,0,11,52,0,3,8,73,19,2,10,0,0,12,52,0,3,8,73,19,2,6,0,0,13,15,0,73,19,0,0,14
	.byte 16,0,73,19,0,0,16,28,0,73,19,56,10,0,0,18,46,0,3,8,17,1,18,1,0,0,0
.section __DWARF, __debug_info,regular,debug
Ldebug_info_start:

LDIFF_SYM0=Ldebug_info_end - Ldebug_info_begin
	.long LDIFF_SYM0
Ldebug_info_begin:

	.short 2
	.long 0
	.byte 4,1
	.asciz "Mono AOT Compiler 3.2.2 (mono-3-2/314dfb3 Tue Aug 13 05:12:45 EDT 2013)"
	.asciz "JITted code"
	.asciz ""

	.byte 2,0,0,0,0,0,0,0,0
LDIFF_SYM1=Ldebug_line_start - Ldebug_line_section_start
	.long LDIFF_SYM1
LDIE_I1:

	.byte 4,1,5
	.asciz "sbyte"
LDIE_U1:

	.byte 4,1,7
	.asciz "byte"
LDIE_I2:

	.byte 4,2,5
	.asciz "short"
LDIE_U2:

	.byte 4,2,7
	.asciz "ushort"
LDIE_I4:

	.byte 4,4,5
	.asciz "int"
LDIE_U4:

	.byte 4,4,7
	.asciz "uint"
LDIE_I8:

	.byte 4,8,5
	.asciz "long"
LDIE_U8:

	.byte 4,8,7
	.asciz "ulong"
LDIE_I:

	.byte 4,4,5
	.asciz "intptr"
LDIE_U:

	.byte 4,4,7
	.asciz "uintptr"
LDIE_R4:

	.byte 4,4,4
	.asciz "float"
LDIE_R8:

	.byte 4,8,4
	.asciz "double"
LDIE_BOOLEAN:

	.byte 4,1,2
	.asciz "boolean"
LDIE_CHAR:

	.byte 4,2,8
	.asciz "char"
LDIE_STRING:

	.byte 4,4,1
	.asciz "string"
LDIE_OBJECT:

	.byte 4,4,1
	.asciz "object"
LDIE_SZARRAY:

	.byte 4,4,1
	.asciz "object"
.section __DWARF, __debug_loc,regular,debug
Ldebug_loc_start:
.section __DWARF, __debug_line,regular,debug
Ldebug_line_section_start:
.section __DWARF, __debug_line,regular,debug
Ldebug_line_start:

	.long Ldebug_line_end - . -4
	.short 2
	.long Ldebug_line_header_end - . -4
	.byte 1,1,251,14,13,0,1,1,1,1,0,0,0,1,0,0,1
.section __DWARF, __debug_line,regular,debug
.section __DWARF, __debug_line,regular,debug

	.byte 0
.section __DWARF, __debug_line,regular,debug
	.asciz "xdb.il"

	.byte 0,0,0
.section __DWARF, __debug_line,regular,debug
.section __DWARF, __debug_line,regular,debug

	.byte 0
Ldebug_line_header_end:
.section __DWARF, __debug_line,regular,debug

	.byte 0,1,1
Ldebug_line_end:
.section __DWARF, __debug_frame,regular,debug
	.align 3

LDIFF_SYM2=Lcie0_end - Lcie0_start
	.long LDIFF_SYM2
Lcie0_start:

	.long -1
	.byte 3
	.asciz ""

	.byte 1,124,14
	.align 2
Lcie0_end:
.text
	.align 3
methods:
	.space 16
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1__ctor
_System_Collections_Generic_Stack_1__ctor:
.file 1 "/Developer/MonoTouch/Source/mono/mcs/class/System/System.Collections.Generic/Stack.cs"
.loc 1 52 0

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,12,208,77,226,0,0,141,229,12,208,141,226,0,1,189,232,128,128,189,232

Lme_0:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_get_Count
_System_Collections_Generic_Stack_1_get_Count:
.loc 1 154 0

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,12,208,77,226,0,0,141,229,0,0,157,229,12,0,144,229,12,208,141,226
	.byte 0,1,189,232,128,128,189,232

Lme_1:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_Pop
_System_Collections_Generic_Stack_1_Pop:
.loc 1 119 0

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,12,0,141,229,12,0,157,229,12,0,144,229,0,0,80,227
	.byte 34,0,0,10,12,0,157,229
.loc 1 122 0

	.byte 16,16,144,229,1,16,129,226,16,16,128,229,12,0,157,229
.loc 1 123 0

	.byte 8,0,144,229,12,32,157,229,12,16,146,229,1,16,65,226,1,48,160,225,4,16,141,229,12,48,130,229,12,32,144,229
	.byte 1,0,82,225,23,0,0,155,1,17,160,225,1,0,128,224,16,0,128,226,0,0,144,229,0,0,141,229,12,0,157,229
.loc 1 125 0

	.byte 8,48,144,229,12,0,157,229,12,16,144,229,0,0,160,227,8,0,141,229,3,0,160,225,0,32,160,227,0,48,147,229
	.byte 15,224,160,225,48,240,147,229,0,0,157,229
.loc 1 126 0

	.byte 20,208,141,226,0,1,189,232,128,128,189,232
.loc 1 120 0

	.byte 97,0,0,227,0,2,64,227
bl _mono_create_corlib_exception_0
bl _p_1

	.byte 14,16,160,225,0,0,159,229
bl _p_2

	.byte 91,0,0,2

Lme_2:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_Push_T
_System_Collections_Generic_Stack_1_Push_T:
.loc 1 131 0

	.byte 128,64,45,233,13,112,160,225,16,1,45,233,16,208,77,226,8,0,141,229,12,16,141,229,8,0,157,229,8,0,144,229
	.byte 0,0,80,227,6,0,0,10,8,0,157,229,12,0,144,229,8,16,157,229,8,16,145,229,12,16,145,229,1,0,80,225
	.byte 20,0,0,26,8,0,157,229
.loc 1 132 0

	.byte 0,0,80,227,37,0,0,11,8,16,128,226,8,0,157,229,12,0,144,229,4,16,141,229,0,0,80,227,1,0,0,26
	.byte 16,64,160,227,2,0,0,234,8,0,157,229,12,0,144,229,128,64,160,225,8,0,157,229,0,0,144,229
bl _p_3

	.byte 0,128,160,225,4,0,157,229,4,16,160,225
bl _p_4

	.byte 8,0,157,229
.loc 1 134 0

	.byte 16,16,144,229,1,16,129,226,16,16,128,229,8,0,157,229
.loc 1 136 0

	.byte 8,48,144,229,8,0,157,229,12,16,144,229,1,32,160,225,0,16,141,229,1,32,130,226,12,32,128,229,3,0,160,225
	.byte 12,32,157,229,0,48,147,229,15,224,160,225,48,240,147,229,16,208,141,226,16,1,189,232,128,128,189,232,14,16,160,225
	.byte 0,0,159,229
bl _p_2

	.byte 119,0,0,2

Lme_3:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_GetEnumerator
_System_Collections_Generic_Stack_1_GetEnumerator:
.loc 1 179 0

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,44,208,77,226,0,16,141,229,28,0,141,229,28,0,157,229,32,0,141,229
	.byte 28,0,157,229,0,0,144,229
bl _p_5

	.byte 0,32,160,225,32,16,157,229,0,0,160,227,4,0,141,229,0,0,160,227,8,0,141,229,0,0,160,227,12,0,141,229
	.byte 4,0,141,226,2,128,160,225
bl _p_6

	.byte 4,0,157,229,16,0,141,229,8,0,157,229,20,0,141,229,12,0,157,229,24,0,141,229,0,0,157,229,16,16,157,229
	.byte 0,16,128,229,20,16,157,229,4,16,128,229,24,16,157,229,8,16,128,229,44,208,141,226,0,1,189,232,128,128,189,232

Lme_4:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_System_Collections_Generic_IEnumerable_T_GetEnumerator
_System_Collections_Generic_Stack_1_System_Collections_Generic_IEnumerable_T_GetEnumerator:
.loc 1 184 0

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,20,208,77,226,12,0,141,229,12,0,157,229,13,16,160,225
bl _System_Collections_Generic_Stack_1_GetEnumerator

	.byte 12,0,157,229,0,0,144,229
bl _p_7
bl _p_8

	.byte 8,16,128,226,0,32,157,229,0,32,129,229,4,32,157,229,4,32,129,229,8,32,157,229,8,32,129,229,20,208,141,226
	.byte 0,1,189,232,128,128,189,232

Lme_5:
.text
ut_6:

	.byte 8,0,128,226
	b _System_Collections_Generic_Stack_1_Enumerator__ctor_System_Collections_Generic_Stack_1_T

.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_Enumerator__ctor_System_Collections_Generic_Stack_1_T
_System_Collections_Generic_Stack_1_Enumerator__ctor_System_Collections_Generic_Stack_1_T:
.loc 1 206 0

	.byte 128,64,45,233,13,112,160,225,64,1,45,233,8,208,77,226,0,128,141,229,0,96,160,225,4,16,141,229,4,0,157,229
	.byte 0,0,134,229,1,16,224,227
.loc 1 207 0

	.byte 4,16,134,229
.loc 1 208 0

	.byte 16,0,144,229,8,0,134,229,8,208,141,226,64,1,189,232,128,128,189,232

Lme_6:
.text
ut_7:

	.byte 8,0,128,226
	b _System_Collections_Generic_Stack_1_Enumerator_get_Current

.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_Enumerator_get_Current
_System_Collections_Generic_Stack_1_Enumerator_get_Current:
.loc 1 232 0

	.byte 128,64,45,233,13,112,160,225,0,5,45,233,8,208,77,226,0,128,141,229,0,160,160,225,4,0,154,229,0,0,80,227
	.byte 12,0,0,186
.loc 1 235 0

	.byte 0,0,154,229,8,0,144,229,4,16,154,229,12,32,144,229,1,0,82,225,10,0,0,155,1,17,160,225,1,0,128,224
	.byte 16,0,128,226,0,0,144,229,8,208,141,226,0,5,189,232,128,128,189,232
.loc 1 233 0

	.byte 97,0,0,227,0,2,64,227
bl _mono_create_corlib_exception_0
bl _p_1

	.byte 14,16,160,225,0,0,159,229
bl _p_2

	.byte 91,0,0,2

Lme_7:
.text
ut_8:

	.byte 8,0,128,226
	b _System_Collections_Generic_Stack_1_Enumerator_Dispose

.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_Enumerator_Dispose
_System_Collections_Generic_Stack_1_Enumerator_Dispose:
.loc 1 216 0

	.byte 128,64,45,233,13,112,160,225,0,1,45,233,12,208,77,226,0,128,141,229,4,0,141,229,4,0,157,229,0,16,224,227
	.byte 4,16,128,229,12,208,141,226,0,1,189,232,128,128,189,232

Lme_8:
.text
ut_9:

	.byte 8,0,128,226
	b _System_Collections_Generic_Stack_1_Enumerator_MoveNext

.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_Enumerator_MoveNext
_System_Collections_Generic_Stack_1_Enumerator_MoveNext:
.loc 1 221 0

	.byte 128,64,45,233,13,112,160,225,32,5,45,233,12,208,77,226,4,128,141,229,0,160,160,225,8,0,154,229,0,16,154,229
	.byte 16,16,145,229,1,0,80,225,28,0,0,26
.loc 1 224 0

	.byte 4,0,154,229,1,16,224,227,1,0,80,225,2,0,0,26
.loc 1 225 0

	.byte 0,0,154,229,12,0,144,229,4,0,138,229
.loc 1 227 0

	.byte 4,0,154,229,0,16,224,227,1,0,80,225,12,0,0,10,4,0,154,229,1,0,64,226,0,16,160,225,0,0,141,229
	.byte 4,16,138,229,0,16,224,227,1,0,80,225,0,0,160,19,1,0,160,3,0,0,80,227,0,80,160,19,1,80,160,3
	.byte 0,0,0,234,0,80,160,227,5,0,160,225,12,208,141,226,32,5,189,232,128,128,189,232
.loc 1 222 0

	.byte 97,0,0,227,0,2,64,227
bl _mono_create_corlib_exception_0
bl _p_1

Lme_9:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1__0__ctor
_System_Collections_Generic_Stack_1__0__ctor:
.loc 1 52 0

	.byte 128,64,45,233,13,112,160,225,0,9,45,233,16,208,77,226,13,176,160,225,8,0,139,229,8,0,155,229,0,0,144,229
bl _p_9

	.byte 0,0,139,229,0,0,144,229,0,0,160,227,4,0,139,229,16,208,139,226,0,9,189,232,128,128,189,232

Lme_b:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1__0_get_Count
_System_Collections_Generic_Stack_1__0_get_Count:
.loc 1 154 0

	.byte 128,64,45,233,13,112,160,225,0,13,45,233,12,208,77,226,13,176,160,225,4,0,139,229,4,0,155,229,0,0,144,229
bl _p_10

	.byte 0,160,160,225,0,0,154,229,0,0,160,227,0,0,139,229,4,0,155,229,4,16,154,229,1,0,128,224,0,0,144,229
	.byte 12,208,139,226,0,13,189,232,128,128,189,232

Lme_c:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1__0_Pop
_System_Collections_Generic_Stack_1__0_Pop:
.loc 1 119 0

	.byte 128,64,45,233,13,112,160,225,96,9,45,233,24,208,77,226,13,176,160,225,0,16,139,229,8,0,139,229,8,0,155,229
	.byte 0,0,144,229
bl _p_11

	.byte 0,96,160,225,0,0,150,229,7,80,128,226,7,80,197,227,5,208,77,224,0,80,141,226,32,0,150,229,0,0,133,224
	.byte 20,16,150,229,24,32,150,229,50,255,47,225,36,16,150,229,5,0,160,225,1,0,128,224,20,16,150,229,24,32,150,229
	.byte 50,255,47,225,8,0,155,229,4,16,150,229,1,0,128,224,0,0,144,229,0,0,80,227,80,0,0,10,8,16,155,229
.loc 1 122 0

	.byte 1,0,160,225,8,32,150,229,2,16,129,224,0,16,145,229,1,16,129,226,8,32,150,229,2,0,128,224,0,16,128,229
	.byte 8,0,155,229
.loc 1 123 0

	.byte 12,16,150,229,1,0,128,224,0,0,144,229,8,16,155,229,1,32,160,225,4,48,150,229,3,16,129,224,0,16,145,229
	.byte 1,16,65,226,1,48,160,225,4,16,139,229,4,192,150,229,12,32,130,224,0,48,130,229,12,32,144,229,1,0,82,225
	.byte 57,0,0,155,16,32,150,229,146,1,1,224,1,0,128,224,16,16,128,226,32,0,150,229,0,0,133,224,20,32,150,229
	.byte 28,48,150,229,51,255,47,225,8,0,155,229
.loc 1 125 0

	.byte 12,16,150,229,1,0,128,224,0,0,144,229,16,0,139,229,8,0,155,229,4,16,150,229,1,0,128,224,0,0,144,229
	.byte 20,0,139,229,36,0,150,229,0,0,133,224,20,16,150,229,24,32,150,229,50,255,47,225,36,0,150,229,0,16,133,224
	.byte 40,0,150,229,0,0,133,224,20,32,150,229,28,48,150,229,51,255,47,225,16,0,155,229,20,16,155,229,12,32,144,229
	.byte 1,0,82,225,21,0,0,155,16,32,150,229,146,1,1,224,1,0,128,224,16,0,128,226,40,16,150,229,1,16,133,224
	.byte 20,32,150,229,28,48,150,229,51,255,47,225,32,0,150,229,0,16,133,224,0,0,155,229,20,32,150,229,28,48,150,229
	.byte 51,255,47,225
.loc 1 126 0

	.byte 24,208,139,226,96,9,189,232,128,128,189,232
.loc 1 120 0

	.byte 97,0,0,227,0,2,64,227
bl _mono_create_corlib_exception_0
bl _p_1

	.byte 14,16,160,225,0,0,159,229
bl _p_2

	.byte 91,0,0,2

Lme_d:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1__0_Push__0
_System_Collections_Generic_Stack_1__0_Push__0:
.loc 1 131 0

	.byte 128,64,45,233,13,112,160,225,0,13,45,233,28,208,77,226,13,176,160,225,16,0,139,229,20,16,139,229,16,0,155,229
	.byte 0,0,144,229
bl _p_12

	.byte 0,160,160,225,0,0,154,229,0,0,160,227,4,0,139,229,16,0,155,229,4,16,154,229,1,0,128,224,0,0,144,229
	.byte 0,0,80,227,10,0,0,10,16,0,155,229,8,16,154,229,1,0,128,224,0,0,144,229,16,16,155,229,4,32,154,229
	.byte 2,16,129,224,0,16,145,229,12,16,145,229,1,0,80,225,27,0,0,26,16,0,155,229
.loc 1 132 0

	.byte 0,0,80,227,67,0,0,11,4,16,154,229,1,16,128,224,16,0,155,229,8,32,154,229,2,0,128,224,0,0,144,229
	.byte 8,16,139,229,0,0,80,227,2,0,0,26,16,0,160,227,12,0,139,229,5,0,0,234,16,0,155,229,8,16,154,229
	.byte 1,0,128,224,0,0,144,229,128,0,160,225,12,0,139,229,16,0,155,229,0,0,144,229
bl _p_13

	.byte 0,128,160,225,8,0,155,229,12,16,155,229
bl _p_14

	.byte 16,16,155,229
.loc 1 134 0

	.byte 1,0,160,225,12,32,154,229,2,16,129,224,0,16,145,229,1,16,129,226,12,32,154,229,2,0,128,224,0,16,128,229
	.byte 16,0,155,229
.loc 1 136 0

	.byte 4,16,154,229,1,0,128,224,0,0,144,229,16,16,155,229,1,32,160,225,8,48,154,229,3,16,129,224,0,16,145,229
	.byte 1,48,160,225,0,16,139,229,1,48,131,226,8,192,154,229,12,32,130,224,0,48,130,229,12,32,144,229,1,0,82,225
	.byte 11,0,0,155,16,32,154,229,146,1,1,224,1,0,128,224,16,0,128,226,4,16,155,229,20,16,155,229,20,32,154,229
	.byte 24,48,154,229,51,255,47,225,28,208,139,226,0,13,189,232,128,128,189,232,14,16,160,225,0,0,159,229
bl _p_2

	.byte 91,0,0,2,14,16,160,225,0,0,159,229
bl _p_2

	.byte 119,0,0,2

Lme_e:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1__0_GetEnumerator
_System_Collections_Generic_Stack_1__0_GetEnumerator:
.loc 1 179 0

	.byte 128,64,45,233,13,112,160,225,96,9,45,233,24,208,77,226,13,176,160,225,0,16,139,229,4,0,139,229,4,0,155,229
	.byte 0,0,144,229
bl _p_15

	.byte 0,96,160,225,0,0,150,229,7,80,128,226,7,80,197,227,5,208,77,224,0,80,141,226,4,0,155,229,12,0,139,229
	.byte 4,0,155,229,0,0,144,229
bl _p_16

	.byte 16,0,139,229,16,16,150,229,5,0,160,225,1,0,128,224,4,16,150,229,8,32,150,229,50,255,47,225,16,16,150,229
	.byte 5,0,160,225,1,0,128,224,8,0,139,229,4,0,155,229,0,0,144,229
bl _p_17

	.byte 0,32,160,225,8,0,155,229,12,16,155,229,16,48,155,229,3,128,160,225,50,255,47,225,16,16,150,229,5,0,160,225
	.byte 1,16,128,224,20,32,150,229,5,0,160,225,2,0,128,224,4,32,150,229,12,48,150,229,51,255,47,225,20,16,150,229
	.byte 5,0,160,225,1,16,128,224,0,0,155,229,4,32,150,229,12,48,150,229,51,255,47,225,24,208,139,226,96,9,189,232
	.byte 128,128,189,232

Lme_f:
.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1__0_System_Collections_Generic_IEnumerable_T_GetEnumerator
_System_Collections_Generic_Stack_1__0_System_Collections_Generic_IEnumerable_T_GetEnumerator:
.loc 1 184 0

	.byte 128,64,45,233,13,112,160,225,112,13,45,233,16,208,77,226,13,176,160,225,0,0,139,229,0,0,155,229,0,0,144,229
bl _p_18

	.byte 0,160,160,225,0,0,154,229,7,96,128,226,7,96,198,227,6,208,77,224,0,96,141,226,0,0,155,229,8,0,139,229
	.byte 0,0,155,229,0,0,144,229
bl _p_19

	.byte 0,32,160,225,8,0,155,229,20,48,154,229,6,16,160,225,3,16,129,224,50,255,47,225,4,80,154,229,1,0,85,227
	.byte 15,0,0,10,2,0,85,227,17,0,0,10,0,0,155,229,0,0,144,229
bl _p_20
bl _p_8

	.byte 20,16,154,229,1,16,134,224,8,0,139,229,8,0,128,226,12,32,154,229,16,48,154,229,51,255,47,225,8,0,155,229
	.byte 0,64,160,225,8,0,0,234,20,0,154,229,0,0,134,224,0,64,144,229,4,0,0,234,8,16,154,229,20,0,154,229
	.byte 0,0,134,224,49,255,47,225,0,64,160,225,4,0,160,225,16,208,139,226,112,13,189,232,128,128,189,232

Lme_10:
.text
ut_17:

	.byte 8,0,128,226
	b _System_Collections_Generic_Stack_1_Enumerator__0__ctor_System_Collections_Generic_Stack_1__0

.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_Enumerator__0__ctor_System_Collections_Generic_Stack_1__0
_System_Collections_Generic_Stack_1_Enumerator__0__ctor_System_Collections_Generic_Stack_1__0:
.loc 1 206 0

	.byte 128,64,45,233,13,112,160,225,96,9,45,233,16,208,77,226,13,176,160,225,0,128,139,229,0,96,160,225,8,16,139,229
	.byte 0,0,155,229
bl _p_21

	.byte 0,80,160,225,0,0,149,229,0,0,160,227,4,0,139,229,4,0,149,229,0,16,134,224,8,0,155,229,0,0,129,229
.loc 1 207 0

	.byte 8,16,149,229,1,16,134,224,1,32,224,227,0,32,129,229
.loc 1 208 0

	.byte 12,16,149,229,1,0,128,224,0,16,144,229,16,0,149,229,0,0,134,224,0,16,128,229,16,208,139,226,96,9,189,232
	.byte 128,128,189,232

Lme_11:
.text
ut_18:

	.byte 8,0,128,226
	b _System_Collections_Generic_Stack_1_Enumerator__0_get_Current

.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_Enumerator__0_get_Current
_System_Collections_Generic_Stack_1_Enumerator__0_get_Current:
.loc 1 232 0

	.byte 128,64,45,233,13,112,160,225,112,9,45,233,12,208,77,226,13,176,160,225,4,128,139,229,0,16,139,229,0,96,160,225
	.byte 4,0,155,229
bl _p_22

	.byte 0,80,160,225,0,0,149,229,7,64,128,226,7,64,196,227,4,208,77,224,0,64,141,226,4,0,149,229,0,0,134,224
	.byte 0,0,144,229,0,0,80,227,29,0,0,186
.loc 1 235 0

	.byte 8,0,149,229,0,0,134,224,0,0,144,229,12,16,149,229,1,0,128,224,0,0,144,229,4,16,149,229,1,16,134,224
	.byte 0,16,145,229,12,32,144,229,1,0,82,225,21,0,0,155,16,32,149,229,146,1,1,224,1,0,128,224,16,16,128,226
	.byte 28,0,149,229,0,0,132,224,20,32,149,229,24,48,149,229,51,255,47,225,28,0,149,229,0,16,132,224,0,0,155,229
	.byte 20,32,149,229,24,48,149,229,51,255,47,225,12,208,139,226,112,9,189,232,128,128,189,232
.loc 1 233 0

	.byte 97,0,0,227,0,2,64,227
bl _mono_create_corlib_exception_0
bl _p_1

	.byte 14,16,160,225,0,0,159,229
bl _p_2

	.byte 91,0,0,2

Lme_12:
.text
ut_19:

	.byte 8,0,128,226
	b _System_Collections_Generic_Stack_1_Enumerator__0_Dispose

.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_Enumerator__0_Dispose
_System_Collections_Generic_Stack_1_Enumerator__0_Dispose:
.loc 1 216 0

	.byte 128,64,45,233,13,112,160,225,64,9,45,233,20,208,77,226,13,176,160,225,0,128,139,229,8,0,139,229,0,0,155,229
bl _p_23

	.byte 0,96,160,225,0,0,150,229,0,0,160,227,4,0,139,229,4,16,150,229,8,0,155,229,1,0,128,224,0,16,224,227
	.byte 0,16,128,229,20,208,139,226,64,9,189,232,128,128,189,232

Lme_13:
.text
ut_20:

	.byte 8,0,128,226
	b _System_Collections_Generic_Stack_1_Enumerator__0_MoveNext

.text
	.align 2
	.no_dead_strip _System_Collections_Generic_Stack_1_Enumerator__0_MoveNext
_System_Collections_Generic_Stack_1_Enumerator__0_MoveNext:
.loc 1 221 0

	.byte 128,64,45,233,13,112,160,225,80,13,45,233,20,208,77,226,13,176,160,225,4,128,139,229,0,160,160,225,4,0,155,229
bl _p_24

	.byte 0,96,160,225,0,0,150,229,0,0,160,227,8,0,139,229,4,0,150,229,0,0,138,224,0,0,144,229,8,16,150,229
	.byte 1,16,138,224,0,16,145,229,12,32,150,229,2,16,129,224,0,16,145,229,1,0,80,225,42,0,0,26
.loc 1 224 0

	.byte 16,0,150,229,0,0,138,224,0,0,144,229,1,16,224,227,1,0,80,225,8,0,0,26
.loc 1 225 0

	.byte 8,0,150,229,0,0,138,224,0,0,144,229,20,16,150,229,1,0,128,224,0,16,144,229,16,0,150,229,0,0,138,224
	.byte 0,16,128,229
.loc 1 227 0

	.byte 16,0,150,229,0,0,138,224,0,0,144,229,0,16,224,227,1,0,80,225,16,0,0,10,16,0,150,229,0,0,138,224
	.byte 0,0,144,229,1,0,64,226,0,32,160,225,0,0,139,229,16,16,150,229,1,16,138,224,0,32,129,229,0,16,224,227
	.byte 1,0,80,225,0,0,160,19,1,0,160,3,0,0,80,227,0,64,160,19,1,64,160,3,0,0,0,234,0,64,160,227
	.byte 4,0,160,225,20,208,139,226,80,13,189,232,128,128,189,232
.loc 1 222 0

	.byte 97,0,0,227,0,2,64,227
bl _mono_create_corlib_exception_0
bl _p_1

Lme_14:
.text
	.align 3
methods_end:

	.long 0
.text
	.align 3
method_addresses:
	.no_dead_strip method_addresses
	bl _System_Collections_Generic_Stack_1__ctor
	bl _System_Collections_Generic_Stack_1_get_Count
	bl _System_Collections_Generic_Stack_1_Pop
	bl _System_Collections_Generic_Stack_1_Push_T
	bl _System_Collections_Generic_Stack_1_GetEnumerator
	bl _System_Collections_Generic_Stack_1_System_Collections_Generic_IEnumerable_T_GetEnumerator
	bl _System_Collections_Generic_Stack_1_Enumerator__ctor_System_Collections_Generic_Stack_1_T
	bl _System_Collections_Generic_Stack_1_Enumerator_get_Current
	bl _System_Collections_Generic_Stack_1_Enumerator_Dispose
	bl _System_Collections_Generic_Stack_1_Enumerator_MoveNext
	bl method_addresses
	bl _System_Collections_Generic_Stack_1__0__ctor
	bl _System_Collections_Generic_Stack_1__0_get_Count
	bl _System_Collections_Generic_Stack_1__0_Pop
	bl _System_Collections_Generic_Stack_1__0_Push__0
	bl _System_Collections_Generic_Stack_1__0_GetEnumerator
	bl _System_Collections_Generic_Stack_1__0_System_Collections_Generic_IEnumerable_T_GetEnumerator
	bl _System_Collections_Generic_Stack_1_Enumerator__0__ctor_System_Collections_Generic_Stack_1__0
	bl _System_Collections_Generic_Stack_1_Enumerator__0_get_Current
	bl _System_Collections_Generic_Stack_1_Enumerator__0_Dispose
	bl _System_Collections_Generic_Stack_1_Enumerator__0_MoveNext
method_addresses_end:
.section __TEXT, __const
	.align 3
code_offsets:

	.long 0

.text
	.align 3
unbox_trampolines:

	.long 6

	bl ut_6

	.long 7

	bl ut_7

	.long 8

	bl ut_8

	.long 9

	bl ut_9

	.long 17

	bl ut_17

	.long 18

	bl ut_18

	.long 19

	bl ut_19

	.long 20

	bl ut_20
unbox_trampolines_end:
.section __TEXT, __const
	.align 3
method_info_offsets:

	.long 21,10,3,2
	.short 0, 10, 20
	.byte 1,2,2,2,2,2,2,2,2,2,0,21,2,2,2,2,2,2,2,2,39
.section __TEXT, __const
	.align 3
extra_method_table:

	.long 19,0,0,0,0,0,0,0
	.long 0,0,0,0,0,100,14,0
	.long 132,16,19,154,17,0,171,18
	.long 0,188,19,0,0,0,0,0
	.long 0,0,84,13,0,0,0,0
	.long 0,0,0,52,11,0,68,12
	.long 0,0,0,0,116,15,0,0
	.long 0,0,205,20,0
.section __TEXT, __const
	.align 3
extra_method_info_offsets:

	.long 10,11,52,12,68,13,84,14
	.long 100,15,116,16,132,17,154,18
	.long 171,19,188,20,205
.section __TEXT, __const
	.align 3
class_name_table:

	.short 11, 1, 11, 3, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 2
	.short 0
.section __TEXT, __const
	.align 3
got_info_offsets:

	.long 4,10,1,2
	.short 0
	.byte 128,222,2,1,1
.section __TEXT, __const
	.align 3
ex_info_offsets:

	.long 21,10,3,2
	.short 0, 11, 22
	.byte 132,134,25,25,25,25,25,32,25,25,25,0,133,135,28,28,28,28,28,28,29,29,134,134
.section __TEXT, __const
	.align 3
unwind_info:

	.byte 18,12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,24,18,12,13,0,72,14,8,135,2,68,14,12,136
	.byte 3,142,1,68,14,32,20,12,13,0,72,14,8,135,2,68,14,16,132,4,136,3,142,1,68,14,32,18,12,13,0,72
	.byte 14,8,135,2,68,14,12,136,3,142,1,68,14,56,20,12,13,0,72,14,8,135,2,68,14,16,134,4,136,3,142,1
	.byte 68,14,24,20,12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,68,14,24,22,12,13,0,72,14,8,135
	.byte 2,68,14,20,133,5,136,4,138,3,142,1,68,14,32,23,12,13,0,72,14,8,135,2,68,14,16,136,4,139,3,142
	.byte 1,68,14,32,68,13,11,25,12,13,0,72,14,8,135,2,68,14,20,136,5,138,4,139,3,142,1,68,14,32,68,13
	.byte 11,27,12,13,0,72,14,8,135,2,68,14,24,133,6,134,5,136,4,139,3,142,1,68,14,48,68,13,11,25,12,13
	.byte 0,72,14,8,135,2,68,14,20,136,5,138,4,139,3,142,1,68,14,48,68,13,11,31,12,13,0,72,14,8,135,2
	.byte 68,14,32,132,8,133,7,134,6,136,5,138,4,139,3,142,1,68,14,48,68,13,11,27,12,13,0,72,14,8,135,2
	.byte 68,14,24,133,6,134,5,136,4,139,3,142,1,68,14,40,68,13,11,29,12,13,0,72,14,8,135,2,68,14,28,132
	.byte 7,133,6,134,5,136,4,139,3,142,1,68,14,40,68,13,11,25,12,13,0,72,14,8,135,2,68,14,20,134,5,136
	.byte 4,139,3,142,1,68,14,40,68,13,11,29,12,13,0,72,14,8,135,2,68,14,28,132,7,134,6,136,5,138,4,139
	.byte 3,142,1,68,14,48,68,13,11
.section __TEXT, __const
	.align 3
class_info_offsets:

	.long 3,10,1,2
	.short 0
	.byte 134,163,7,5

.text
	.align 4
plt:
_mono_aot_System_plt:
	.no_dead_strip plt__jit_icall_mono_arch_throw_exception
plt__jit_icall_mono_arch_throw_exception:
_p_1:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 16,227
	.no_dead_strip plt__jit_icall_mono_arch_throw_corlib_exception
plt__jit_icall_mono_arch_throw_corlib_exception:
_p_2:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 20,255
	.no_dead_strip plt__rgctx_fetch_0
plt__rgctx_fetch_0:
_p_3:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 24,314
	.no_dead_strip plt_System_Array_Resize_T_T____int
plt_System_Array_Resize_T_T____int:
_p_4:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 28,337
	.no_dead_strip plt__rgctx_fetch_1
plt__rgctx_fetch_1:
_p_5:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 32,380
	.no_dead_strip plt_System_Collections_Generic_Stack_1_Enumerator_T__ctor_System_Collections_Generic_Stack_1_T
plt_System_Collections_Generic_Stack_1_Enumerator_T__ctor_System_Collections_Generic_Stack_1_T:
_p_6:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 36,388
	.no_dead_strip plt__rgctx_fetch_2
plt__rgctx_fetch_2:
_p_7:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 40,424
	.no_dead_strip plt__jit_icall_mono_object_new_specific
plt__jit_icall_mono_object_new_specific:
_p_8:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 44,432
	.no_dead_strip plt__rgctx_fetch_3
plt__rgctx_fetch_3:
_p_9:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 48,475
	.no_dead_strip plt__rgctx_fetch_4
plt__rgctx_fetch_4:
_p_10:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 52,515
	.no_dead_strip plt__rgctx_fetch_5
plt__rgctx_fetch_5:
_p_11:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 56,559
	.no_dead_strip plt__rgctx_fetch_6
plt__rgctx_fetch_6:
_p_12:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 60,632
	.no_dead_strip plt__rgctx_fetch_7
plt__rgctx_fetch_7:
_p_13:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 64,677
	.no_dead_strip plt_System_Array_Resize__0__0____int
plt_System_Array_Resize__0__0____int:
_p_14:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 68,699
	.no_dead_strip plt__rgctx_fetch_8
plt__rgctx_fetch_8:
_p_15:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 72,733
	.no_dead_strip plt__rgctx_fetch_9
plt__rgctx_fetch_9:
_p_16:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 76,777
	.no_dead_strip plt__rgctx_fetch_10
plt__rgctx_fetch_10:
_p_17:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 80,785
	.no_dead_strip plt__rgctx_fetch_11
plt__rgctx_fetch_11:
_p_18:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 84,834
	.no_dead_strip plt__rgctx_fetch_12
plt__rgctx_fetch_12:
_p_19:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 88,878
	.no_dead_strip plt__rgctx_fetch_13
plt__rgctx_fetch_13:
_p_20:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 92,909
	.no_dead_strip plt__rgctx_fetch_14
plt__rgctx_fetch_14:
_p_21:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 96,934
	.no_dead_strip plt__rgctx_fetch_15
plt__rgctx_fetch_15:
_p_22:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 100,995
	.no_dead_strip plt__rgctx_fetch_16
plt__rgctx_fetch_16:
_p_23:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 104,1063
	.no_dead_strip plt__rgctx_fetch_17
plt__rgctx_fetch_17:
_p_24:

	.byte 0,192,159,229,12,240,159,231
	.long _mono_aot_System_got - . + 108,1110
plt_end:
.section __TEXT, __const
	.align 3
image_table:

	.long 2
	.asciz "System"
	.asciz "65C41339-F76B-4538-8723-3F5970D5CEBF"
	.asciz ""
	.asciz "7cec85d7bea7798e"
	.align 3

	.long 1,2,0,5,0
	.asciz "mscorlib"
	.asciz "10599FF9-5543-4AA5-BF3F-02197C7342D1"
	.asciz ""
	.asciz "7cec85d7bea7798e"
	.align 3

	.long 1,2,0,5,0
.data
	.align 3
_mono_aot_System_got:
	.space 116
got_end:
.section __TEXT, __const
	.align 2
assembly_guid:
	.asciz "65C41339-F76B-4538-8723-3F5970D5CEBF"
.section __TEXT, __const
	.align 2
runtime_version:
	.asciz ""
.section __TEXT, __const
	.align 2
assembly_name:
	.asciz "System"
.data
	.align 3
_mono_aot_file_info:

	.long 90,0
	.align 2
	.long _mono_aot_System_got
	.align 2
	.long methods
	.align 2
	.long 0
	.align 2
	.long blob
	.align 2
	.long class_name_table
	.align 2
	.long class_info_offsets
	.align 2
	.long method_info_offsets
	.align 2
	.long ex_info_offsets
	.align 2
	.long code_offsets
	.align 2
	.long method_addresses
	.align 2
	.long extra_method_info_offsets
	.align 2
	.long extra_method_table
	.align 2
	.long got_info_offsets
	.align 2
	.long methods_end
	.align 2
	.long unwind_info
	.align 2
	.long mem_end
	.align 2
	.long image_table
	.align 2
	.long plt
	.align 2
	.long plt_end
	.align 2
	.long assembly_guid
	.align 2
	.long runtime_version
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long 0
	.align 2
	.long globals
	.align 2
	.long assembly_name
	.align 2
	.long unbox_trampolines
	.align 2
	.long unbox_trampolines_end

	.long 4,116,25,21,10,118565375,0,1716
	.long 0,0,0,0,0,0,0,0
	.long 0,0,0,0,128,4,4
	.globl _mono_aot_module_System_info
_mono_aot_module_System_info:
	.align 2
	.long _mono_aot_file_info
.section __TEXT, __const
	.align 3
blob:

	.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.byte 0,0,0,0,0,0,0,0,0,5,19,0,0,1,4,1,2,1,7,41,255,253,0,0,0,7,46,0,198,0,0,1
	.byte 1,7,41,0,255,253,0,0,0,7,46,0,198,0,0,2,1,7,41,0,255,253,0,0,0,7,46,0,198,0,0,3
	.byte 1,7,41,0,255,253,0,0,0,7,46,0,198,0,0,4,1,7,41,0,255,253,0,0,0,7,46,0,198,0,0,5
	.byte 1,7,41,0,255,253,0,0,0,7,46,0,198,0,0,6,1,7,41,0,4,1,3,1,7,41,255,253,0,0,0,7
	.byte 128,148,0,198,0,0,7,1,7,41,0,255,253,0,0,0,7,128,148,0,198,0,0,8,1,7,41,0,255,253,0,0
	.byte 0,7,128,148,0,198,0,0,9,1,7,41,0,255,253,0,0,0,7,128,148,0,198,0,0,10,1,7,41,0,12,0
	.byte 39,42,47,7,25,109,111,110,111,95,97,114,99,104,95,116,104,114,111,119,95,101,120,99,101,112,116,105,111,110,0,7
	.byte 32,109,111,110,111,95,97,114,99,104,95,116,104,114,111,119,95,99,111,114,108,105,98,95,101,120,99,101,112,116,105,111
	.byte 110,0,5,19,0,1,0,1,2,255,253,0,0,0,1,2,0,198,0,0,4,1,7,129,34,0,35,129,41,140,16,255
	.byte 253,0,0,0,2,30,1,1,198,0,0,172,0,1,7,129,34,3,255,253,0,0,0,2,30,1,1,198,0,0,172,0
	.byte 1,7,129,34,255,253,0,0,0,1,2,0,198,0,0,5,1,7,129,34,0,4,1,3,1,7,129,34,35,129,100,150
	.byte 4,7,129,117,3,255,253,0,0,0,7,129,117,0,198,0,0,7,1,7,129,34,0,255,253,0,0,0,1,2,0,198
	.byte 0,0,6,1,7,129,34,0,35,129,151,150,4,7,129,117,7,24,109,111,110,111,95,111,98,106,101,99,116,95,110,101
	.byte 119,95,115,112,101,99,105,102,105,99,0,255,253,0,0,0,7,46,0,198,0,0,1,1,7,41,0,35,129,203,192,0
	.byte 92,40,255,253,0,0,0,7,46,0,198,0,0,1,1,7,41,0,0,255,253,0,0,0,7,46,0,198,0,0,2,1
	.byte 7,41,0,35,129,243,192,0,92,40,255,253,0,0,0,7,46,0,198,0,0,2,1,7,41,0,1,15,7,46,2,255
	.byte 253,0,0,0,7,46,0,198,0,0,3,1,7,41,0,35,130,31,192,0,92,40,255,253,0,0,0,7,46,0,198,0
	.byte 0,3,1,7,41,0,10,15,7,46,2,15,7,46,3,15,7,46,1,13,7,41,14,7,41,23,7,41,22,7,41,21
	.byte 7,41,21,7,41,21,7,41,255,253,0,0,0,7,46,0,198,0,0,4,1,7,41,0,35,130,104,192,0,92,40,255
	.byte 253,0,0,0,7,46,0,198,0,0,4,1,7,41,0,6,15,7,46,1,15,7,46,2,15,7,46,3,13,7,41,14
	.byte 7,41,22,7,41,35,130,104,140,16,255,253,0,0,0,2,30,1,1,198,0,0,172,0,1,7,41,3,255,253,0,0
	.byte 0,2,30,1,1,198,0,0,172,0,1,7,41,255,253,0,0,0,7,46,0,198,0,0,5,1,7,41,0,35,130,205
	.byte 192,0,92,40,255,253,0,0,0,7,46,0,198,0,0,5,1,7,41,0,5,14,7,128,148,23,7,128,148,22,7,128
	.byte 148,21,7,128,148,21,7,128,148,35,130,205,150,4,7,128,148,35,130,205,192,0,90,32,32,1,1,21,1,2,1,7
	.byte 41,255,253,0,0,0,7,128,148,0,198,0,0,7,1,7,41,0,255,253,0,0,0,7,46,0,198,0,0,6,1,7
	.byte 41,0,35,131,50,192,0,92,40,255,253,0,0,0,7,46,0,198,0,0,6,1,7,41,0,5,19,7,128,148,24,7
	.byte 128,148,14,7,128,148,22,7,128,148,21,7,128,148,35,131,50,192,0,90,32,32,0,21,1,3,1,7,41,255,253,0
	.byte 0,0,7,46,0,198,0,0,5,1,7,41,0,35,131,50,150,4,7,128,148,255,253,0,0,0,7,128,148,0,198,0
	.byte 0,7,1,7,41,0,35,131,149,192,0,92,40,255,253,0,0,0,7,128,148,0,198,0,0,7,1,7,41,0,4,15
	.byte 7,128,148,4,15,7,128,148,5,15,7,46,3,15,7,128,148,6,255,253,0,0,0,7,128,148,0,198,0,0,8,1
	.byte 7,41,0,35,131,210,192,0,92,40,255,253,0,0,0,7,128,148,0,198,0,0,8,1,7,41,0,7,15,7,128,148
	.byte 5,15,7,128,148,4,15,7,46,1,13,7,41,14,7,41,22,7,41,21,7,41,255,253,0,0,0,7,128,148,0,198
	.byte 0,0,9,1,7,41,0,35,132,22,192,0,92,40,255,253,0,0,0,7,128,148,0,198,0,0,9,1,7,41,0,1
	.byte 15,7,128,148,5,255,253,0,0,0,7,128,148,0,198,0,0,10,1,7,41,0,35,132,69,192,0,92,40,255,253,0
	.byte 0,0,7,128,148,0,198,0,0,10,1,7,41,0,5,15,7,128,148,6,15,7,128,148,4,15,7,46,3,15,7,128
	.byte 148,5,15,7,46,2,3,0,0,1,13,0,255,253,0,0,0,1,2,0,198,0,0,1,1,7,129,34,0,0,0,3
	.byte 0,0,1,13,0,255,253,0,0,0,1,2,0,198,0,0,2,1,7,129,34,0,0,0,3,19,0,1,13,12,255,253
	.byte 0,0,0,1,2,0,198,0,0,3,1,7,129,34,0,0,0,3,38,0,1,13,8,255,253,0,0,0,1,2,0,198
	.byte 0,0,4,1,7,129,34,0,0,0,3,59,0,1,13,28,255,253,0,0,0,1,2,0,198,0,0,5,1,7,129,34
	.byte 0,0,0,3,19,0,1,13,12,255,253,0,0,0,1,2,0,198,0,0,6,1,7,129,34,0,0,0,5,19,0,1
	.byte 0,1,3,3,78,0,1,13,0,255,253,0,0,0,1,3,0,198,0,0,7,1,7,133,28,0,0,0,3,99,0,1
	.byte 13,0,255,253,0,0,0,1,3,0,198,0,0,8,1,7,133,28,0,0,0,3,0,0,1,13,0,255,253,0,0,0
	.byte 1,3,0,198,0,0,9,1,7,133,28,0,0,0,3,120,0,1,13,4,255,253,0,0,0,1,3,0,198,0,0,10
	.byte 1,7,133,28,0,0,0,3,128,143,0,1,11,8,255,253,0,0,0,7,46,0,198,0,0,1,1,7,41,0,1,1
	.byte 1,0,0,3,128,167,0,1,11,4,255,253,0,0,0,7,46,0,198,0,0,2,1,7,41,0,1,1,1,0,0,3
	.byte 128,193,0,1,11,8,255,253,0,0,0,7,46,0,198,0,0,3,1,7,41,0,1,1,1,0,0,3,128,221,0,1
	.byte 11,16,255,253,0,0,0,7,46,0,198,0,0,4,1,7,41,0,1,1,1,0,0,3,128,193,0,1,11,4,255,253
	.byte 0,0,0,7,46,0,198,0,0,5,1,7,41,0,1,1,1,0,0,3,128,247,0,1,11,0,255,253,0,0,0,7
	.byte 46,0,198,0,0,6,1,7,41,0,1,1,1,0,0,3,129,23,0,1,11,0,255,253,0,0,0,7,128,148,0,198
	.byte 0,0,7,1,7,41,0,1,1,1,0,0,3,129,51,0,1,11,4,255,253,0,0,0,7,128,148,0,198,0,0,8
	.byte 1,7,41,0,1,1,1,0,0,3,129,81,0,1,11,0,255,253,0,0,0,7,128,148,0,198,0,0,9,1,7,41
	.byte 0,1,1,1,0,0,3,129,107,0,1,11,4,255,253,0,0,0,7,128,148,0,198,0,0,10,1,7,41,0,1,1
	.byte 1,0,0,0,128,144,8,0,0,1,255,255,255,255,255,255,255,255,255,255,98,111,101,104,109,0
.section __TEXT, __const
	.align 3
Lglobals_hash:

	.short 11, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0, 0
	.short 0, 0, 0, 0, 0, 0, 0
.data
	.align 3
globals:
	.align 2
	.long Lglobals_hash

	.long 0,0
.section __DWARF, __debug_info,regular,debug
LTDIE_1:

	.byte 17
	.asciz "System_Object"

	.byte 8,7
	.asciz "System_Object"

LDIFF_SYM3=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM3
LTDIE_1_POINTER:

	.byte 13
LDIFF_SYM4=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM4
LTDIE_1_REFERENCE:

	.byte 14
LDIFF_SYM5=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM5
LTDIE_3:

	.byte 5
	.asciz "System_ValueType"

	.byte 8,16
LDIFF_SYM6=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM6
	.byte 2,35,0,0,7
	.asciz "System_ValueType"

LDIFF_SYM7=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM7
LTDIE_3_POINTER:

	.byte 13
LDIFF_SYM8=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM8
LTDIE_3_REFERENCE:

	.byte 14
LDIFF_SYM9=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM9
LTDIE_2:

	.byte 5
	.asciz "System_Int32"

	.byte 12,16
LDIFF_SYM10=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM10
	.byte 2,35,0,6
	.asciz "m_value"

LDIFF_SYM11=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM11
	.byte 2,35,8,0,7
	.asciz "System_Int32"

LDIFF_SYM12=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM12
LTDIE_2_POINTER:

	.byte 13
LDIFF_SYM13=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM13
LTDIE_2_REFERENCE:

	.byte 14
LDIFF_SYM14=LTDIE_2 - Ldebug_info_start
	.long LDIFF_SYM14
LTDIE_0:

	.byte 5
	.asciz "System_Collections_Generic_Stack`1"

	.byte 20,16
LDIFF_SYM15=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM15
	.byte 2,35,0,6
	.asciz "_array"

LDIFF_SYM16=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM16
	.byte 2,35,8,6
	.asciz "_size"

LDIFF_SYM17=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM17
	.byte 2,35,12,6
	.asciz "_version"

LDIFF_SYM18=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM18
	.byte 2,35,16,0,7
	.asciz "System_Collections_Generic_Stack`1"

LDIFF_SYM19=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM19
LTDIE_0_POINTER:

	.byte 13
LDIFF_SYM20=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM20
LTDIE_0_REFERENCE:

	.byte 14
LDIFF_SYM21=LTDIE_0 - Ldebug_info_start
	.long LDIFF_SYM21
	.byte 2
	.asciz "System.Collections.Generic.Stack`1:.ctor"
	.long _System_Collections_Generic_Stack_1__ctor
	.long Lme_0

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM22=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM22
	.byte 2,125,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM23=Lfde0_end - Lfde0_start
	.long LDIFF_SYM23
Lfde0_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1__ctor

LDIFF_SYM24=Lme_0 - _System_Collections_Generic_Stack_1__ctor
	.long LDIFF_SYM24
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,24
	.align 2
Lfde0_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1:get_Count"
	.long _System_Collections_Generic_Stack_1_get_Count
	.long Lme_1

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM25=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM25
	.byte 2,125,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM26=Lfde1_end - Lfde1_start
	.long LDIFF_SYM26
Lfde1_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_get_Count

LDIFF_SYM27=Lme_1 - _System_Collections_Generic_Stack_1_get_Count
	.long LDIFF_SYM27
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,24
	.align 2
Lfde1_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1:Pop"
	.long _System_Collections_Generic_Stack_1_Pop
	.long Lme_2

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM28=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM28
	.byte 2,125,12,11
	.asciz "popped"

LDIFF_SYM29=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM29
	.byte 2,125,0,11
	.asciz ""

LDIFF_SYM30=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM30
	.byte 2,125,4,11
	.asciz ""

LDIFF_SYM31=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM31
	.byte 2,125,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM32=Lfde2_end - Lfde2_start
	.long LDIFF_SYM32
Lfde2_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_Pop

LDIFF_SYM33=Lme_2 - _System_Collections_Generic_Stack_1_Pop
	.long LDIFF_SYM33
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde2_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1:Push"
	.long _System_Collections_Generic_Stack_1_Push_T
	.long Lme_3

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM34=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM34
	.byte 2,125,8,3
	.asciz "item"

LDIFF_SYM35=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM35
	.byte 2,125,12,11
	.asciz ""

LDIFF_SYM36=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM36
	.byte 2,125,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM37=Lfde3_end - Lfde3_start
	.long LDIFF_SYM37
Lfde3_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_Push_T

LDIFF_SYM38=Lme_3 - _System_Collections_Generic_Stack_1_Push_T
	.long LDIFF_SYM38
	.byte 12,13,0,72,14,8,135,2,68,14,16,132,4,136,3,142,1,68,14,32
	.align 2
Lfde3_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1:GetEnumerator"
	.long _System_Collections_Generic_Stack_1_GetEnumerator
	.long Lme_4

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM39=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM39
	.byte 2,125,28,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM40=Lfde4_end - Lfde4_start
	.long LDIFF_SYM40
Lfde4_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_GetEnumerator

LDIFF_SYM41=Lme_4 - _System_Collections_Generic_Stack_1_GetEnumerator
	.long LDIFF_SYM41
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,56
	.align 2
Lfde4_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1:System.Collections.Generic.IEnumerable<T>.GetEnumerator"
	.long _System_Collections_Generic_Stack_1_System_Collections_Generic_IEnumerable_T_GetEnumerator
	.long Lme_5

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM42=LTDIE_0_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM42
	.byte 2,125,12,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM43=Lfde5_end - Lfde5_start
	.long LDIFF_SYM43
Lfde5_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_System_Collections_Generic_IEnumerable_T_GetEnumerator

LDIFF_SYM44=Lme_5 - _System_Collections_Generic_Stack_1_System_Collections_Generic_IEnumerable_T_GetEnumerator
	.long LDIFF_SYM44
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,32
	.align 2
Lfde5_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_5:

	.byte 5
	.asciz "System_Collections_Generic_Stack`1"

	.byte 20,16
LDIFF_SYM45=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM45
	.byte 2,35,0,6
	.asciz "_array"

LDIFF_SYM46=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM46
	.byte 2,35,8,6
	.asciz "_size"

LDIFF_SYM47=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM47
	.byte 2,35,12,6
	.asciz "_version"

LDIFF_SYM48=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM48
	.byte 2,35,16,0,7
	.asciz "System_Collections_Generic_Stack`1"

LDIFF_SYM49=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM49
LTDIE_5_POINTER:

	.byte 13
LDIFF_SYM50=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM50
LTDIE_5_REFERENCE:

	.byte 14
LDIFF_SYM51=LTDIE_5 - Ldebug_info_start
	.long LDIFF_SYM51
LTDIE_4:

	.byte 5
	.asciz "_Enumerator"

	.byte 20,16
LDIFF_SYM52=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM52
	.byte 2,35,0,6
	.asciz "parent"

LDIFF_SYM53=LTDIE_5_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM53
	.byte 2,35,0,6
	.asciz "idx"

LDIFF_SYM54=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM54
	.byte 2,35,4,6
	.asciz "_version"

LDIFF_SYM55=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM55
	.byte 2,35,8,0,7
	.asciz "_Enumerator"

LDIFF_SYM56=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM56
LTDIE_4_POINTER:

	.byte 13
LDIFF_SYM57=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM57
LTDIE_4_REFERENCE:

	.byte 14
LDIFF_SYM58=LTDIE_4 - Ldebug_info_start
	.long LDIFF_SYM58
	.byte 2
	.asciz "System.Collections.Generic.Stack`1/Enumerator:.ctor"
	.long _System_Collections_Generic_Stack_1_Enumerator__ctor_System_Collections_Generic_Stack_1_T
	.long Lme_6

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM59=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM59
	.byte 1,86,3
	.asciz "t"

LDIFF_SYM60=LTDIE_5_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM60
	.byte 2,125,4,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM61=Lfde6_end - Lfde6_start
	.long LDIFF_SYM61
Lfde6_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_Enumerator__ctor_System_Collections_Generic_Stack_1_T

LDIFF_SYM62=Lme_6 - _System_Collections_Generic_Stack_1_Enumerator__ctor_System_Collections_Generic_Stack_1_T
	.long LDIFF_SYM62
	.byte 12,13,0,72,14,8,135,2,68,14,16,134,4,136,3,142,1,68,14,24
	.align 2
Lfde6_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1/Enumerator:get_Current"
	.long _System_Collections_Generic_Stack_1_Enumerator_get_Current
	.long Lme_7

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM63=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM63
	.byte 1,90,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM64=Lfde7_end - Lfde7_start
	.long LDIFF_SYM64
Lfde7_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_Enumerator_get_Current

LDIFF_SYM65=Lme_7 - _System_Collections_Generic_Stack_1_Enumerator_get_Current
	.long LDIFF_SYM65
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,138,3,142,1,68,14,24
	.align 2
Lfde7_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1/Enumerator:Dispose"
	.long _System_Collections_Generic_Stack_1_Enumerator_Dispose
	.long Lme_8

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM66=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM66
	.byte 2,125,4,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM67=Lfde8_end - Lfde8_start
	.long LDIFF_SYM67
Lfde8_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_Enumerator_Dispose

LDIFF_SYM68=Lme_8 - _System_Collections_Generic_Stack_1_Enumerator_Dispose
	.long LDIFF_SYM68
	.byte 12,13,0,72,14,8,135,2,68,14,12,136,3,142,1,68,14,24
	.align 2
Lfde8_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1/Enumerator:MoveNext"
	.long _System_Collections_Generic_Stack_1_Enumerator_MoveNext
	.long Lme_9

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM69=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM69
	.byte 1,90,11
	.asciz ""

LDIFF_SYM70=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM70
	.byte 2,125,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM71=Lfde9_end - Lfde9_start
	.long LDIFF_SYM71
Lfde9_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_Enumerator_MoveNext

LDIFF_SYM72=Lme_9 - _System_Collections_Generic_Stack_1_Enumerator_MoveNext
	.long LDIFF_SYM72
	.byte 12,13,0,72,14,8,135,2,68,14,20,133,5,136,4,138,3,142,1,68,14,32
	.align 2
Lfde9_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_6:

	.byte 5
	.asciz "System_Collections_Generic_Stack`1"

	.byte 20,16
LDIFF_SYM73=LTDIE_1 - Ldebug_info_start
	.long LDIFF_SYM73
	.byte 2,35,0,6
	.asciz "_array"

LDIFF_SYM74=LDIE_SZARRAY - Ldebug_info_start
	.long LDIFF_SYM74
	.byte 2,35,8,6
	.asciz "_size"

LDIFF_SYM75=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM75
	.byte 2,35,12,6
	.asciz "_version"

LDIFF_SYM76=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM76
	.byte 2,35,16,0,7
	.asciz "System_Collections_Generic_Stack`1"

LDIFF_SYM77=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM77
LTDIE_6_POINTER:

	.byte 13
LDIFF_SYM78=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM78
LTDIE_6_REFERENCE:

	.byte 14
LDIFF_SYM79=LTDIE_6 - Ldebug_info_start
	.long LDIFF_SYM79
	.byte 2
	.asciz "System.Collections.Generic.Stack`1<!0>:.ctor"
	.long _System_Collections_Generic_Stack_1__0__ctor
	.long Lme_b

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM80=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM80
	.byte 2,123,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM81=Lfde10_end - Lfde10_start
	.long LDIFF_SYM81
Lfde10_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1__0__ctor

LDIFF_SYM82=Lme_b - _System_Collections_Generic_Stack_1__0__ctor
	.long LDIFF_SYM82
	.byte 12,13,0,72,14,8,135,2,68,14,16,136,4,139,3,142,1,68,14,32,68,13,11
	.align 2
Lfde10_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1<!0>:get_Count"
	.long _System_Collections_Generic_Stack_1__0_get_Count
	.long Lme_c

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM83=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM83
	.byte 2,123,4,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM84=Lfde11_end - Lfde11_start
	.long LDIFF_SYM84
Lfde11_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1__0_get_Count

LDIFF_SYM85=Lme_c - _System_Collections_Generic_Stack_1__0_get_Count
	.long LDIFF_SYM85
	.byte 12,13,0,72,14,8,135,2,68,14,20,136,5,138,4,139,3,142,1,68,14,32,68,13,11
	.align 2
Lfde11_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1<!0>:Pop"
	.long _System_Collections_Generic_Stack_1__0_Pop
	.long Lme_d

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM86=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM86
	.byte 2,123,8,11
	.asciz "popped"

LDIFF_SYM87=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM87
	.byte 1,80,11
	.asciz ""

LDIFF_SYM88=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM88
	.byte 2,123,4,11
	.asciz ""

LDIFF_SYM89=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM89
	.byte 1,80,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM90=Lfde12_end - Lfde12_start
	.long LDIFF_SYM90
Lfde12_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1__0_Pop

LDIFF_SYM91=Lme_d - _System_Collections_Generic_Stack_1__0_Pop
	.long LDIFF_SYM91
	.byte 12,13,0,72,14,8,135,2,68,14,24,133,6,134,5,136,4,139,3,142,1,68,14,48,68,13,11
	.align 2
Lfde12_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1<!0>:Push"
	.long _System_Collections_Generic_Stack_1__0_Push__0
	.long Lme_e

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM92=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM92
	.byte 2,123,16,3
	.asciz "item"

LDIFF_SYM93=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM93
	.byte 1,80,11
	.asciz ""

LDIFF_SYM94=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM94
	.byte 2,123,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM95=Lfde13_end - Lfde13_start
	.long LDIFF_SYM95
Lfde13_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1__0_Push__0

LDIFF_SYM96=Lme_e - _System_Collections_Generic_Stack_1__0_Push__0
	.long LDIFF_SYM96
	.byte 12,13,0,72,14,8,135,2,68,14,20,136,5,138,4,139,3,142,1,68,14,48,68,13,11
	.align 2
Lfde13_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1<!0>:GetEnumerator"
	.long _System_Collections_Generic_Stack_1__0_GetEnumerator
	.long Lme_f

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM97=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM97
	.byte 2,123,4,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM98=Lfde14_end - Lfde14_start
	.long LDIFF_SYM98
Lfde14_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1__0_GetEnumerator

LDIFF_SYM99=Lme_f - _System_Collections_Generic_Stack_1__0_GetEnumerator
	.long LDIFF_SYM99
	.byte 12,13,0,72,14,8,135,2,68,14,24,133,6,134,5,136,4,139,3,142,1,68,14,48,68,13,11
	.align 2
Lfde14_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1<!0>:System.Collections.Generic.IEnumerable<T>.GetEnumerator"
	.long _System_Collections_Generic_Stack_1__0_System_Collections_Generic_IEnumerable_T_GetEnumerator
	.long Lme_10

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM100=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM100
	.byte 2,123,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM101=Lfde15_end - Lfde15_start
	.long LDIFF_SYM101
Lfde15_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1__0_System_Collections_Generic_IEnumerable_T_GetEnumerator

LDIFF_SYM102=Lme_10 - _System_Collections_Generic_Stack_1__0_System_Collections_Generic_IEnumerable_T_GetEnumerator
	.long LDIFF_SYM102
	.byte 12,13,0,72,14,8,135,2,68,14,32,132,8,133,7,134,6,136,5,138,4,139,3,142,1,68,14,48,68,13,11
	.align 2
Lfde15_end:

.section __DWARF, __debug_info,regular,debug
LTDIE_7:

	.byte 5
	.asciz "_Enumerator"

	.byte 20,16
LDIFF_SYM103=LTDIE_3 - Ldebug_info_start
	.long LDIFF_SYM103
	.byte 2,35,0,6
	.asciz "parent"

LDIFF_SYM104=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM104
	.byte 2,35,8,6
	.asciz "idx"

LDIFF_SYM105=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM105
	.byte 2,35,12,6
	.asciz "_version"

LDIFF_SYM106=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM106
	.byte 2,35,16,0,7
	.asciz "_Enumerator"

LDIFF_SYM107=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM107
LTDIE_7_POINTER:

	.byte 13
LDIFF_SYM108=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM108
LTDIE_7_REFERENCE:

	.byte 14
LDIFF_SYM109=LTDIE_7 - Ldebug_info_start
	.long LDIFF_SYM109
	.byte 2
	.asciz "System.Collections.Generic.Stack`1/Enumerator<!0>:.ctor"
	.long _System_Collections_Generic_Stack_1_Enumerator__0__ctor_System_Collections_Generic_Stack_1__0
	.long Lme_11

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM110=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM110
	.byte 1,86,3
	.asciz "t"

LDIFF_SYM111=LTDIE_6_REFERENCE - Ldebug_info_start
	.long LDIFF_SYM111
	.byte 2,123,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM112=Lfde16_end - Lfde16_start
	.long LDIFF_SYM112
Lfde16_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_Enumerator__0__ctor_System_Collections_Generic_Stack_1__0

LDIFF_SYM113=Lme_11 - _System_Collections_Generic_Stack_1_Enumerator__0__ctor_System_Collections_Generic_Stack_1__0
	.long LDIFF_SYM113
	.byte 12,13,0,72,14,8,135,2,68,14,24,133,6,134,5,136,4,139,3,142,1,68,14,40,68,13,11
	.align 2
Lfde16_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1/Enumerator<!0>:get_Current"
	.long _System_Collections_Generic_Stack_1_Enumerator__0_get_Current
	.long Lme_12

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM114=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM114
	.byte 1,86,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM115=Lfde17_end - Lfde17_start
	.long LDIFF_SYM115
Lfde17_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_Enumerator__0_get_Current

LDIFF_SYM116=Lme_12 - _System_Collections_Generic_Stack_1_Enumerator__0_get_Current
	.long LDIFF_SYM116
	.byte 12,13,0,72,14,8,135,2,68,14,28,132,7,133,6,134,5,136,4,139,3,142,1,68,14,40,68,13,11
	.align 2
Lfde17_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1/Enumerator<!0>:Dispose"
	.long _System_Collections_Generic_Stack_1_Enumerator__0_Dispose
	.long Lme_13

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM117=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM117
	.byte 2,123,8,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM118=Lfde18_end - Lfde18_start
	.long LDIFF_SYM118
Lfde18_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_Enumerator__0_Dispose

LDIFF_SYM119=Lme_13 - _System_Collections_Generic_Stack_1_Enumerator__0_Dispose
	.long LDIFF_SYM119
	.byte 12,13,0,72,14,8,135,2,68,14,20,134,5,136,4,139,3,142,1,68,14,40,68,13,11
	.align 2
Lfde18_end:

.section __DWARF, __debug_info,regular,debug

	.byte 2
	.asciz "System.Collections.Generic.Stack`1/Enumerator<!0>:MoveNext"
	.long _System_Collections_Generic_Stack_1_Enumerator__0_MoveNext
	.long Lme_14

	.byte 2,118,16,3
	.asciz "this"

LDIFF_SYM120=LDIE_I - Ldebug_info_start
	.long LDIFF_SYM120
	.byte 1,90,11
	.asciz ""

LDIFF_SYM121=LDIE_I4 - Ldebug_info_start
	.long LDIFF_SYM121
	.byte 2,123,0,0

.section __DWARF, __debug_frame,regular,debug

LDIFF_SYM122=Lfde19_end - Lfde19_start
	.long LDIFF_SYM122
Lfde19_start:

	.long 0
	.align 2
	.long _System_Collections_Generic_Stack_1_Enumerator__0_MoveNext

LDIFF_SYM123=Lme_14 - _System_Collections_Generic_Stack_1_Enumerator__0_MoveNext
	.long LDIFF_SYM123
	.byte 12,13,0,72,14,8,135,2,68,14,28,132,7,134,6,136,5,138,4,139,3,142,1,68,14,48,68,13,11
	.align 2
Lfde19_end:

.section __DWARF, __debug_info,regular,debug

	.byte 0
Ldebug_info_end:
.text
	.align 3
mem_end:
