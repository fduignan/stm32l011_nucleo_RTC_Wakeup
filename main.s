	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"main.c"
	.text
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	mov	r0, r0	@ nop
.L2:
	ldr	r3, [fp, #-8]
	sub	r2, r3, #1
	str	r2, [fp, #-8]
	cmp	r3, #0
	bne	.L2
	mov	r0, r0	@ nop
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	initClockHSI16
	.type	initClockHSI16, %function
initClockHSI16:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L5
	ldr	r3, .L5
	ldr	r3, [r3]
	bic	r3, r3, #16777216
	str	r3, [r2]
	ldr	r2, .L5
	ldr	r3, .L5
	ldr	r3, [r3]
	orr	r3, r3, #1
	str	r3, [r2]
	mov	r0, r0	@ nop
.L4:
	ldr	r3, .L5
	ldr	r3, [r3]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L4
	ldr	r2, .L5+4
	ldr	r3, .L5+4
	ldr	r3, [r3]
	orr	r3, r3, #1
	str	r3, [r2]
	mov	r0, r0	@ nop
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	1073876992
	.word	1073877004
	.size	initClockHSI16, .-initClockHSI16
	.align	2
	.global	configPins
	.type	configPins, %function
configPins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L8
	ldr	r3, .L8
	ldr	r3, [r3]
	orr	r3, r3, #2
	str	r3, [r2]
	ldr	r2, .L8+4
	ldr	r3, .L8+4
	ldr	r3, [r3]
	orr	r3, r3, #64
	str	r3, [r2]
	ldr	r2, .L8+4
	ldr	r3, .L8+4
	ldr	r3, [r3]
	bic	r3, r3, #128
	str	r3, [r2]
	mov	r0, r0	@ nop
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	1073877036
	.word	1342178304
	.size	configPins, .-configPins
	.align	2
	.global	RTCISR
	.type	RTCISR, %function
RTCISR:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L11
	ldr	r3, .L11
	ldr	r3, [r3]
	bic	r3, r3, #256
	str	r3, [r2]
	ldr	r2, .L11+4
	ldr	r3, .L11+4
	ldr	r3, [r3]
	orr	r3, r3, #131072
	str	r3, [r2]
	mov	r0, r0	@ nop
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	1073752076
	.word	1073808404
	.size	RTCISR, .-RTCISR
	.align	2
	.global	initRTC
	.type	initRTC, %function
initRTC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L16
	ldr	r3, .L16
	ldr	r3, [r3]
	orr	r3, r3, #268435456
	str	r3, [r2]
	ldr	r2, .L16+4
	ldr	r3, .L16+4
	ldr	r3, [r3]
	orr	r3, r3, #256
	str	r3, [r2]
	ldr	r2, .L16+8
	ldr	r3, .L16+8
	ldr	r3, [r3]
	orr	r3, r3, #1
	str	r3, [r2]
	mov	r0, r0	@ nop
.L14:
	ldr	r3, .L16+8
	ldr	r3, [r3]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L14
	ldr	r2, .L16+8
	ldr	r3, .L16+8
	ldr	r3, [r3]
	orr	r3, r3, #524288
	str	r3, [r2]
	ldr	r2, .L16+8
	ldr	r3, .L16+8
	ldr	r3, [r3]
	bic	r3, r3, #524288
	str	r3, [r2]
	ldr	r2, .L16+8
	ldr	r3, .L16+8
	ldr	r3, [r3]
	orr	r3, r3, #131072
	str	r3, [r2]
	ldr	r2, .L16+8
	ldr	r3, .L16+8
	ldr	r3, [r3]
	bic	r3, r3, #65536
	str	r3, [r2]
	ldr	r2, .L16+8
	ldr	r3, .L16+8
	ldr	r3, [r3]
	orr	r3, r3, #262144
	str	r3, [r2]
	ldr	r3, .L16+12
	mov	r2, #202
	str	r2, [r3]
	ldr	r3, .L16+12
	mov	r2, #83
	str	r2, [r3]
	ldr	r2, .L16+16
	ldr	r3, .L16+16
	ldr	r3, [r3]
	orr	r3, r3, #128
	str	r3, [r2]
	mov	r0, r0	@ nop
.L15:
	ldr	r3, .L16+16
	ldr	r3, [r3]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L15
	ldr	r2, .L16+20
	ldr	r3, .L16+20
	ldr	r3, [r3]
	orr	r3, r3, #4
	str	r3, [r2]
	ldr	r3, .L16+24
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L16+28
	ldr	r2, .L16+32
	str	r2, [r3]
	ldr	r3, .L16+36
	mov	r2, #251658240
	str	r2, [r3]
	ldr	r2, .L16+24
	ldr	r3, .L16+24
	ldr	r3, [r3]
	orr	r3, r3, #4352
	str	r3, [r2]
	ldr	r2, .L16+16
	ldr	r3, .L16+16
	ldr	r3, [r3]
	bic	r3, r3, #128
	str	r3, [r2]
	ldr	r2, .L16+40
	ldr	r3, .L16+40
	ldr	r3, [r3]
	orr	r3, r3, #131072
	str	r3, [r2]
	ldr	r2, .L16+44
	ldr	r3, .L16+44
	ldr	r3, [r3]
	orr	r3, r3, #131072
	str	r3, [r2]
	mov	r0, r0	@ nop
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L17:
	.align	2
.L16:
	.word	1073877048
	.word	1073770496
	.word	1073877072
	.word	1073752100
	.word	1073752076
	.word	-536813312
	.word	1073752072
	.word	1073752092
	.word	-2139062144
	.word	1073752132
	.word	1073808384
	.word	1073808392
	.size	initRTC, .-initRTC
	.align	2
	.global	initADC
	.type	initADC, %function
initADC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L20
	ldr	r3, .L20
	ldr	r3, [r3]
	orr	r3, r3, #2
	str	r3, [r2]
	ldr	r2, .L20+4
	ldr	r3, .L20+4
	ldr	r3, [r3]
	orr	r3, r3, #512
	str	r3, [r2]
	mov	r2, #1342177280
	mov	r3, #1342177280
	ldr	r3, [r3]
	orr	r3, r3, #3
	str	r3, [r2]
	ldr	r3, .L20+8
	mov	r2, #-2147483648
	str	r2, [r3]
	mov	r0, r0	@ nop
.L19:
	ldr	r3, .L20+8
	ldr	r3, [r3]
	cmp	r3, #0
	blt	.L19
	ldr	r2, .L20+12
	ldr	r3, .L20+12
	ldr	r3, [r3]
	orr	r3, r3, #1
	str	r3, [r2]
	ldr	r2, .L20+16
	ldr	r3, .L20+16
	ldr	r3, [r3]
	orr	r3, r3, #4194304
	str	r3, [r2]
	ldr	r2, .L20+8
	ldr	r3, .L20+8
	ldr	r3, [r3]
	orr	r3, r3, #1
	str	r3, [r2]
	mov	r0, r0	@ nop
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L21:
	.align	2
.L20:
	.word	1073877036
	.word	1073877044
	.word	1073816584
	.word	1073816616
	.word	1073817352
	.size	initADC, .-initADC
	.align	2
	.global	haltADC
	.type	haltADC, %function
haltADC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L23
	mov	r2, #0
	str	r2, [r3]
	ldr	r2, .L23+4
	ldr	r3, .L23+4
	ldr	r3, [r3]
	bic	r3, r3, #4194304
	str	r3, [r2]
	ldr	r2, .L23+8
	ldr	r3, .L23+8
	ldr	r3, [r3]
	orr	r3, r3, #2
	str	r3, [r2]
	ldr	r2, .L23+12
	ldr	r3, .L23+12
	ldr	r3, [r3]
	bic	r3, r3, #512
	str	r3, [r2]
	mov	r0, r0	@ nop
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L24:
	.align	2
.L23:
	.word	1073816616
	.word	1073817352
	.word	1073816584
	.word	1073877044
	.size	haltADC, .-haltADC
	.align	2
	.global	resumeADC
	.type	resumeADC, %function
resumeADC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L26
	ldr	r3, .L26
	ldr	r3, [r3]
	orr	r3, r3, #131072
	str	r3, [r2]
	ldr	r2, .L26+4
	ldr	r3, .L26+4
	ldr	r3, [r3]
	orr	r3, r3, #512
	str	r3, [r2]
	mov	r2, #1342177280
	mov	r3, #1342177280
	ldr	r3, [r3]
	orr	r3, r3, #3
	str	r3, [r2]
	ldr	r2, .L26+8
	ldr	r3, .L26+8
	ldr	r3, [r3]
	orr	r3, r3, #1
	str	r3, [r2]
	ldr	r2, .L26+12
	ldr	r3, .L26+12
	ldr	r3, [r3]
	orr	r3, r3, #4194304
	str	r3, [r2]
	ldr	r2, .L26+16
	ldr	r3, .L26+16
	ldr	r3, [r3]
	orr	r3, r3, #1
	str	r3, [r2]
	mov	r0, r0	@ nop
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L27:
	.align	2
.L26:
	.word	1073877040
	.word	1073877044
	.word	1073816616
	.word	1073817352
	.word	1073816584
	.size	resumeADC, .-resumeADC
	.align	2
	.global	readADC
	.type	readADC, %function
readADC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r2, .L31
	ldr	r3, .L31
	ldr	r3, [r3]
	orr	r3, r3, #4
	str	r3, [r2]
	mov	r0, r0	@ nop
.L29:
	ldr	r3, .L31
	ldr	r3, [r3]
	and	r3, r3, #4
	cmp	r3, #0
	bne	.L29
	ldr	r3, .L31+4
	ldr	r3, [r3]
	mov	r0, r3
	sub	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L32:
	.align	2
.L31:
	.word	1073816584
	.word	1073816640
	.size	readADC, .-readADC
	.section	.rodata
	.align	2
.LC0:
	.ascii	"ADC: \000"
	.align	2
.LC1:
	.ascii	"\015\012\000"
	.text
	.align	2
	.global	testADC
	.type	testADC, %function
testADC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r0, .L34
	bl	eputs
	bl	readADC
	mov	r3, r0
	mov	r0, r3
	bl	printHex
	ldr	r0, .L34+4
	bl	eputs
	mov	r0, r0	@ nop
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LC0
	.word	.LC1
	.size	testADC, .-testADC
	.align	2
	.global	low_power_mode
	.type	low_power_mode, %function
low_power_mode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	ldr	r2, .L37
	ldr	r3, .L37
	ldr	r3, [r3]
	bic	r3, r3, #3
	str	r3, [r2]
	bl	haltADC
	ldr	r2, .L37+4
	ldr	r3, .L37+4
	ldr	r3, [r3]
	orr	r3, r3, #240
	str	r3, [r2]
	ldr	r2, .L37+8
	ldr	r3, .L37+8
	ldr	r3, [r3]
	orr	r3, r3, #1
	str	r3, [r2]
	ldr	r2, .L37+12
	ldr	r3, .L37+12
	ldr	r3, [r3]
	orr	r3, r3, #4
	str	r3, [r2]
	.syntax divided
@ 163 "main.c" 1
	 wfi 
@ 0 "" 2
	.arm
	.syntax divided
	mov	r0, r0	@ nop
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	1073877036
	.word	1073877004
	.word	1073770496
	.word	-536810224
	.size	low_power_mode, .-low_power_mode
	.align	2
	.global	resume_from_low_power
	.type	resume_from_low_power, %function
resume_from_low_power:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	bl	initClockHSI16
	ldr	r2, .L40
	ldr	r3, .L40
	ldr	r3, [r3]
	bic	r3, r3, #240
	str	r3, [r2]
	ldr	r2, .L40+4
	ldr	r3, .L40+4
	ldr	r3, [r3]
	orr	r3, r3, #3
	str	r3, [r2]
	bl	resumeADC
	mov	r0, r0	@ nop
	sub	sp, fp, #4
	@ sp needed
	ldmfd	sp!, {fp, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	1073877004
	.word	1073877036
	.size	resume_from_low_power, .-resume_from_low_power
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-8]
	bl	initClockHSI16
	bl	configPins
	mov	r0, #9600
	bl	initUART
	bl	initRTC
	bl	initADC
	.syntax divided
@ 182 "main.c" 1
	 cpsie i 
@ 0 "" 2
	.arm
	.syntax divided
.L43:
	bl	resume_from_low_power
	bl	testADC
	bl	drain
	bl	low_power_mode
	b	.L43
	.size	main, .-main
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.3.1 20160307 (release) [ARM/embedded-5-branch revision 234589]"
