	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"bonus.c"
	.text
	.align	2
	.global	initQuadLeo
	.type	initQuadLeo, %function
initQuadLeo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	mov	r1, #32
	str	r1, [r3, #8]
	mov	r1, #104
	str	r1, [r3, #0]
	mov	r1, #25
	str	r1, [r3, #4]
	mov	r1, #50
	str	r1, [r3, #36]
	mov	r1, #4
	str	r1, [r3, #32]
	mov	r1, #60
	mov	r2, #1
	str	r1, [r3, #28]
	mov	r1, #0
	str	r2, [r3, #24]
	str	r1, [r3, #20]
	str	r2, [r3, #12]
	bx	lr
.L3:
	.align	2
.L2:
	.word	leo
	.size	initQuadLeo, .-initQuadLeo
	.align	2
	.global	initRaceLeo
	.type	initRaceLeo, %function
initRaceLeo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	mov	r0, #32
	str	r0, [r3, #8]
	mov	r0, #104
	str	r0, [r3, #0]
	mov	r0, #25
	str	r0, [r3, #4]
	mov	r0, #50
	mov	r1, #0
	mov	r2, #1
	str	r0, [r3, #36]
	mov	r0, #61
	str	r1, [r3, #32]
	str	r2, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #20]
	str	r2, [r3, #12]
	bx	lr
.L6:
	.align	2
.L5:
	.word	leo
	.size	initRaceLeo, .-initRaceLeo
	.align	2
	.global	initSteve
	.type	initSteve, %function
initSteve:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	mov	r2, #0
	mov	r0, #32
	str	r0, [r3, #8]
	str	r2, [r3, #4]
	mov	r0, #104
	str	r2, [r3, #12]
	str	r2, [r3, #36]
	mov	r2, #4
	mov	r1, #1
	str	r0, [r3, #0]
	str	r2, [r3, #32]
	mov	r0, #20
	mov	r2, #62
	str	r0, [r3, #16]
	str	r1, [r3, #24]
	str	r2, [r3, #28]
	str	r1, [r3, #20]
	bx	lr
.L9:
	.align	2
.L8:
	.word	steve
	.size	initSteve, .-initSteve
	.align	2
	.global	initBonus
	.type	initBonus, %function
initBonus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L16
	mov	r3, #0
	stmfd	sp!, {r4, lr}
	str	r3, [r1, #0]
	ldr	r1, .L16+4
	ldr	r4, .L16+8
	str	r3, [r1, #0]
	ldr	r1, .L16+12
	ldr	r2, [r4, #0]
	str	r3, [r1, #0]
	ldr	r1, .L16+16
	cmp	r2, #2
	str	r3, [r1, #0]
	beq	.L14
.L11:
	cmp	r2, #3
	beq	.L15
.L10:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L15:
	bl	initQuadLeo
	ldr	r3, .L16+20
	mov	r2, #30
	str	r2, [r3, #0]
	b	.L10
.L14:
	bl	initRaceLeo
	bl	initSteve
	ldr	r3, .L16+20
	mov	r2, #20
	str	r2, [r3, #0]
	ldr	r2, [r4, #0]
	b	.L11
.L17:
	.align	2
.L16:
	.word	winner
	.word	loser
	.word	level
	.word	timer
	.word	startCol
	.word	clock
	.size	initBonus, .-initBonus
	.align	2
	.global	drawQuadLeo
	.type	drawQuadLeo, %function
drawQuadLeo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L19
	stmfd	sp!, {r4, r5}
	ldr	ip, [r3, #4]
	add	r2, r3, #28
	ldmia	r2, {r2, r5}	@ phole ldm
	ldr	r0, [r3, #20]
	ldr	r1, .L19+4
	mov	ip, ip, asl #23
	mov	r2, r2, asl #3
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	mvn	ip, ip, lsr #6
	add	r0, r0, r5, asl #5
	add	r3, r1, r2
	mvn	ip, ip, lsr #17
	mov	r0, r0, asl #2
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	ldmfd	sp!, {r4, r5}
	bx	lr
.L20:
	.align	2
.L19:
	.word	leo
	.word	shadowOAM
	.size	drawQuadLeo, .-drawQuadLeo
	.align	2
	.global	drawRaceLeo
	.type	drawRaceLeo, %function
drawRaceLeo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L22
	stmfd	sp!, {r4, r5}
	ldr	ip, [r3, #4]
	add	r2, r3, #28
	ldmia	r2, {r2, r5}	@ phole ldm
	ldr	r0, [r3, #20]
	ldr	r1, .L22+4
	mov	ip, ip, asl #23
	mov	r2, r2, asl #3
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	mvn	ip, ip, lsr #6
	add	r0, r0, r5, asl #5
	add	r3, r1, r2
	mvn	ip, ip, lsr #17
	mov	r0, r0, asl #2
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	ldmfd	sp!, {r4, r5}
	bx	lr
.L23:
	.align	2
.L22:
	.word	leo
	.word	shadowOAM
	.size	drawRaceLeo, .-drawRaceLeo
	.align	2
	.global	drawSteve
	.type	drawSteve, %function
drawSteve:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L25
	stmfd	sp!, {r4, r5}
	ldr	ip, [r3, #4]
	add	r2, r3, #28
	ldmia	r2, {r2, r5}	@ phole ldm
	ldr	r0, [r3, #20]
	ldr	r1, .L25+4
	mov	ip, ip, asl #23
	mov	r2, r2, asl #3
	ldrb	r4, [r3, #0]	@ zero_extendqisi2
	mvn	ip, ip, lsr #6
	add	r0, r0, r5, asl #5
	add	r3, r1, r2
	mvn	ip, ip, lsr #17
	mov	r0, r0, asl #2
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	ldmfd	sp!, {r4, r5}
	bx	lr
.L26:
	.align	2
.L25:
	.word	steve
	.word	shadowOAM
	.size	drawSteve, .-drawSteve
	.align	2
	.global	drawBonus
	.type	drawBonus, %function
drawBonus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L35
	ldr	r3, [r4, #0]
	cmp	r3, #2
	beq	.L33
.L28:
	cmp	r3, #3
	beq	.L34
.L29:
	ldr	r4, .L35+4
	ldr	r2, .L35+8
	ldr	r3, [r4, #0]
	mov	r1, #504
	mov	r0, #16384
	add	r1, r1, #2
	add	r0, r0, #216
	strh	r0, [r2, r1]	@ movhi
	cmp	r3, #9
	mov	ip, #504
	mov	lr, #145	@ movhi
	mov	r1, #508
	mov	r0, #796	@ movhi
	strh	lr, [r2, ip]	@ movhi
	strh	r0, [r2, r1]	@ movhi
	ldrle	r5, .L35+12
	ble	.L30
	ldr	r1, .L35+16
	smull	r2, r1, r3, r1
	mov	r3, r3, asr #31
	rsb	r1, r3, r1, asr #2
	mov	r0, #1
	ldr	r5, .L35+12
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #0]
.L30:
	ldr	r1, .L35+16
	smull	lr, r1, r3, r1
	mov	r2, r3, asr #31
	rsb	r1, r2, r1, asr #2
	add	r1, r1, r1, asl #2
	mov	r0, #0
	sub	r1, r3, r1, asl #1
	mov	lr, pc
	bx	r5
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L34:
	bl	drawQuadLeo
	b	.L29
.L33:
	bl	drawRaceLeo
	bl	drawSteve
	ldr	r3, [r4, #0]
	b	.L28
.L36:
	.align	2
.L35:
	.word	level
	.word	clock
	.word	shadowOAM
	.word	drawScore
	.word	1717986919
	.size	drawBonus, .-drawBonus
	.align	2
	.global	updateQuadLeo
	.type	updateQuadLeo, %function
updateQuadLeo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L42
	ldr	r2, .L42+4
	ldr	r1, [r3, #36]
	ldrh	r2, [r2, #0]
	add	r1, r1, #1
	tst	r2, #32
	str	r1, [r3, #36]
	beq	.L38
	ldr	r1, .L42+8
	ldrh	r1, [r1, #0]
	tst	r1, #32
	beq	.L40
.L38:
	tst	r2, #16
	bxeq	lr
.L41:
	ldr	r2, .L42+8
	ldrh	r2, [r2, #0]
	tst	r2, #16
	bxne	lr
	ldr	r3, [r3, #32]
	cmp	r3, #5
	ldr	r3, .L42
	bxeq	lr
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #12]
	add	r2, r1, r2
	mov	r1, #4
	str	r1, [r3, #32]
	str	r2, [r3, #4]
	bx	lr
.L40:
	ldr	r1, [r3, #32]
	cmp	r1, #4
	beq	.L38
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #12]
	tst	r2, #16
	add	r1, r0, r1
	mov	r0, #5
	str	r0, [r3, #32]
	str	r1, [r3, #4]
	bne	.L41
	bx	lr
.L43:
	.align	2
.L42:
	.word	leo
	.word	oldButtons
	.word	buttons
	.size	updateQuadLeo, .-updateQuadLeo
	.align	2
	.global	updateRaceLeo
	.type	updateRaceLeo, %function
updateRaceLeo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L54
	ldrh	r2, [r3, #0]
	tst	r2, #32
	beq	.L53
	ldr	r3, .L54+4
	ldrh	r3, [r3, #0]
	tst	r3, #32
	beq	.L52
.L53:
	ldr	r3, .L54+8
.L45:
	tst	r2, #16
	beq	.L47
	ldr	r2, .L54+4
	ldrh	r2, [r2, #0]
	tst	r2, #16
	bne	.L47
	ldr	r2, [r3, #32]
	cmp	r2, #3
	ldr	r1, .L54+8
	beq	.L47
	ldr	r3, .L54+12
	ldr	r2, [r1, #4]
	ldr	ip, [r1, #12]
	ldrh	r0, [r3, #0]
	add	r2, ip, r2
	cmp	r2, #0
	add	r0, r0, #1
	strh	r0, [r3, #0]	@ movhi
	ldrle	r3, .L54+16
	mov	ip, #2
	str	r2, [r1, #4]
	movle	r2, #1
	str	ip, [r1, #32]
	strle	r2, [r3, #0]
	bx	lr
.L47:
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #12]
	rsb	r2, r2, r1
	cmp	r2, #0
	mov	r1, #0
	str	r2, [r3, #4]
	str	r1, [r3, #32]
	ldrle	r3, .L54+16
	movle	r2, #1
	strle	r2, [r3, #0]
	bx	lr
.L52:
	ldr	r3, .L54+8
	ldr	r1, [r3, #32]
	cmp	r1, #2
	beq	.L45
	ldr	r2, [r3, #4]
	ldr	ip, [r3, #12]
	ldr	r1, .L54+12
	add	r2, ip, r2
	cmp	r2, #0
	ldrh	r0, [r1, #0]
	mov	ip, #3
	str	r2, [r3, #4]
	str	ip, [r3, #32]
	ldrle	r3, .L54+16
	add	r0, r0, #1
	movle	r2, #1
	strh	r0, [r1, #0]	@ movhi
	strle	r2, [r3, #0]
	bx	lr
.L55:
	.align	2
.L54:
	.word	oldButtons
	.word	buttons
	.word	leo
	.word	hOff
	.word	loser
	.size	updateRaceLeo, .-updateRaceLeo
	.align	2
	.global	updateSteve
	.type	updateSteve, %function
updateSteve:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L63
	str	r4, [sp, #-4]!
	add	r0, r3, #16
	ldmda	r0, {r0, r1}
	add	r1, r1, r0
	ldr	ip, [r3, #4]
	str	r1, [r3, #12]
	add	r0, r1, ip
	ldr	r1, .L63+4
	cmp	r0, #0
	ldr	r1, [r1, #0]
	movle	r0, ip
	ldr	ip, .L63+8
	smull	r4, ip, r1, ip
	mov	r4, r1, asr #31
	add	ip, ip, r1
	rsb	ip, r4, ip, asr #7
	add	r4, ip, ip, asl #3
	rsb	ip, ip, r4, asl #3
	rsb	ip, ip, ip, asl #2
	strgt	r0, [r3, #4]
	cmp	r1, ip
	moveq	r1, #-1610612736
	moveq	r1, r1, asr #20
	streq	r1, [r3, #12]
	ldr	r1, .L63+12
	ldr	r1, [r1, #0]
	cmp	r1, r0, asr #8
	movle	r1, r1, asl #8
	strle	r1, [r3, #4]
	ldr	r2, [r3, #36]
	movle	r1, #2
	strle	r1, [r3, #12]
	ldr	r1, .L63+16
	add	r2, r2, #1
	smull	r0, r1, r2, r1
	mov	r0, r2, asr #31
	add	r1, r1, r2
	rsb	r1, r0, r1, asr #2
	rsb	r1, r1, r1, asl #3
	cmp	r2, r1
	str	r2, [r3, #36]
	bne	.L56
	ldr	r3, [r3, #32]
	cmp	r3, #4
	ldr	r3, .L63
	moveq	r2, #5
	movne	r2, #4
	streq	r2, [r3, #32]
	strne	r2, [r3, #32]
.L56:
	ldmfd	sp!, {r4}
	bx	lr
.L64:
	.align	2
.L63:
	.word	steve
	.word	timer
	.word	-1713954085
	.word	startCol
	.word	-1840700269
	.size	updateSteve, .-updateSteve
	.align	2
	.global	updateBonus
	.type	updateBonus, %function
updateBonus:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L75
	stmfd	sp!, {r4, lr}
	ldr	r3, [r2, #0]
	ldr	r1, .L75+4
	add	r3, r3, #1
	smull	r0, r1, r3, r1
	mov	r0, r3, asr #31
	add	r1, r1, r3
	rsb	r1, r0, r1, asr #5
	rsb	r1, r1, r1, asl #4
	cmp	r3, r1, asl #2
	str	r3, [r2, #0]
	ldreq	r3, .L75+8
	ldreq	r2, [r3, #0]
	ldr	r4, .L75+12
	subeq	r2, r2, #1
	streq	r2, [r3, #0]
	ldr	r3, [r4, #0]
	cmp	r3, #2
	beq	.L73
.L67:
	cmp	r3, #3
	beq	.L74
.L65:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L74:
	bl	updateQuadLeo
	ldr	r3, .L75+8
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ldreq	r3, .L75+16
	moveq	r2, #1
	streq	r2, [r3, #0]
	ldr	r3, .L75+20
	ldmib	r3, {r2, r3}
	add	r3, r3, r2
	cmp	r3, #179
	ldrgt	r3, .L75+24
	movgt	r2, #1
	strgt	r2, [r3, #0]
	b	.L65
.L73:
	bl	updateRaceLeo
	bl	updateSteve
	ldr	r3, .L75+8
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L72
	ldr	r3, .L75+20
	ldr	r2, [r3, #4]
	ldr	r3, .L75+28
	ldr	r3, [r3, #4]
	cmp	r2, r3
	blt	.L69
	ldr	r3, .L75+24
	mov	r2, #1
	str	r2, [r3, #0]
.L72:
	ldr	r3, [r4, #0]
	b	.L67
.L69:
	ldr	r3, .L75+16
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, [r4, #0]
	b	.L67
.L76:
	.align	2
.L75:
	.word	timer
	.word	-2004318071
	.word	clock
	.word	level
	.word	loser
	.word	leo
	.word	winner
	.word	steve
	.size	updateBonus, .-updateBonus
	.comm	lifeCount,4,4
	.comm	timer,4,4
	.comm	countDown,4,4
	.comm	level,4,4
	.comm	timeRemain,4,4
	.comm	isMeryl,4,4
	.comm	notIntrod,4,4
	.comm	winner,4,4
	.comm	loser,4,4
	.comm	clock,4,4
	.comm	leo,40,4
	.comm	steve,40,4
	.comm	startCol,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
