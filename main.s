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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L2
	mov	lr, pc
	bx	r3
	ldr	r0, .L2+4
	ldr	r3, .L2+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L2+12
	mov	r0, #3
	ldr	r1, .L2+16
	mov	r2, #100663296
	mov	r3, #14656
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L2+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #8064	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L2+24
	mov	r2, #0
	str	r2, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	waitForVBlank
	.word	startScreenPal
	.word	loadPalette
	.word	DMANow
	.word	startScreenTiles
	.word	startScreenMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #1024
	mov	r2, #67108864
	add	r3, r3, #4
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, .L5
	ldr	r3, .L5+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L5+8
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, .L5+12
	mov	r2, #5
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	instructionsPal
	.word	loadPalette
	.word	.LANCHOR0
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	mov	r6, #100663296
	ldr	r0, .L8+4
	ldr	r3, .L8+8
	ldr	r4, .L8+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L8+16
	mov	r2, r6
	mov	r3, #2752
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L8+20
	add	r2, r6, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #4672
	mov	r0, #3
	ldr	r1, .L8+24
	add	r2, r6, #32768
	add	r3, r3, #32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L8+28
	add	r2, r6, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+32
	ldrh	r7, [r3, #4]
	ldr	r3, .L8+36
	mov	ip, #6912
	ldrh	lr, [r3, #0]
	mov	r5, #67108864
	add	ip, ip, #8
	mov	r2, #83886080
	mov	r8, #7680	@ movhi
	strh	r8, [r5, #10]	@ movhi
	mov	r0, #3
	strh	ip, [r5, #8]	@ movhi
	ldr	r1, .L8+40
	add	r2, r2, #512
	mov	r3, #256
	strh	r7, [r5, #16]	@ movhi
	strh	lr, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L8+44
	add	r2, r6, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+48
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L8+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+56
	mov	r2, #1
	str	r2, [r3, #0]
	mov	r3, #4864	@ movhi
	strh	r3, [r5, #0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	waitForVBlank
	.word	redcarpetPal
	.word	loadPalette
	.word	DMANow
	.word	hollywoodTiles
	.word	hollywoodMap
	.word	redcarpetTiles
	.word	redcarpetMap
	.word	.LANCHOR0
	.word	vOff
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L18
	ldr	r1, [r4, #0]
	ldr	r3, .L18+4
	add	r1, r1, r1, asl #2
	rsb	r1, r1, r1, asl #4
	add	r1, r3, r1, asl #9
	ldr	r3, .L18+8
	mov	r0, #3
	ldr	r2, [r3, #0]
	ldr	ip, .L18+12
	mov	r3, #19200
	mov	lr, pc
	bx	ip
	ldr	r5, .L18+16
	ldr	r3, .L18+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+24
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5, #0]
	tst	r3, #16
	beq	.L11
	ldr	r2, .L18+28
	ldrh	r2, [r2, #0]
	tst	r2, #16
	beq	.L15
.L11:
	tst	r3, #8
	beq	.L12
	ldr	r2, .L18+28
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L16
.L12:
	tst	r3, #4
	beq	.L10
	ldr	r3, .L18+28
	ldrh	r0, [r3, #0]
	ands	r4, r0, #4
	beq	.L17
.L10:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L15:
	ldr	r2, [r4, #0]
	cmp	r2, #1
	addle	r2, r2, #1
	strle	r2, [r4, #0]
	b	.L11
.L17:
	ldr	r3, .L18+32
	mov	lr, pc
	bx	r3
	mov	r0, r4
	ldr	r3, .L18+36
	mov	lr, pc
	bx	r3
	mov	r1, #495616
	add	r1, r1, #3824
	mov	r2, #11008
	ldr	r0, .L18+40
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L18+44
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToStart
.L16:
	ldr	r3, .L18+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+48
	mov	r4, #1
	str	r4, [r3, #0]
	ldr	r3, .L18+52
	str	r4, [r3, #0]
	ldr	r3, .L18+56
	mov	lr, pc
	bx	r3
	bl	goToGame
	mov	r1, #368640
	add	r1, r1, #2000
	mov	r2, #11008
	mov	r3, r4
	ldr	r0, .L18+60
	add	r1, r1, #6
	add	r2, r2, #17
	ldr	ip, .L18+44
	mov	lr, pc
	bx	ip
	ldrh	r3, [r5, #0]
	b	.L12
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.word	instructionsBitmap
	.word	videoBuffer
	.word	DMANow
	.word	oldButtons
	.word	flipPage
	.word	waitForVBlank
	.word	buttons
	.word	stopSound
	.word	fillScreen4
	.word	startSong
	.word	playSoundA
	.word	level
	.word	lifeCount
	.word	initGame
	.word	gameSong
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	ldr	r0, .L21+4
	ldr	r3, .L21+8
	mov	lr, pc
	bx	r3
	mov	r3, #18176
	mov	r0, #3
	ldr	r1, .L21+12
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L21+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L21+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #8064	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, .L21+24
	mov	r1, #2
	str	r1, [r2, #0]
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	waitForVBlank
	.word	pauseScreenPal
	.word	loadPalette
	.word	pauseScreenTiles
	.word	DMANow
	.word	pauseScreenMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0	@ movhi
	stmfd	sp!, {r4, lr}
	strh	r2, [r3, #16]	@ movhi
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L24
	ldr	r2, .L28+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L26
.L24:
	tst	r3, #4
	beq	.L23
	ldr	r3, .L28+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L27
.L23:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L27:
	ldr	r3, .L28+12
	mov	lr, pc
	bx	r3
	bl	goToStart
	mov	r1, #495616
	add	r1, r1, #3824
	mov	r2, #11008
	ldr	r0, .L28+16
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L28+20
	mov	lr, pc
	bx	ip
	b	.L23
.L26:
	ldr	r3, .L28+24
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L29:
	.align	2
.L28:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	startSong
	.word	playSoundA
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L31
	mov	lr, pc
	bx	r3
	ldr	r0, .L31+4
	ldr	r3, .L31+8
	mov	lr, pc
	bx	r3
	mov	r3, #18432
	mov	r0, #3
	ldr	r1, .L31+12
	mov	r2, #100663296
	add	r3, r3, #96
	ldr	r4, .L31+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L31+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #8064	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L31+24
	mov	r2, #0
	mov	r0, #4
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
	.word	waitForVBlank
	.word	loseScreenPal
	.word	loadPalette
	.word	loseScreenTiles
	.word	DMANow
	.word	loseScreenMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L38
	ldr	r3, .L38+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #0]
	tst	r3, #8
	beq	.L34
	ldr	r2, .L38+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L36
.L34:
	tst	r3, #4
	beq	.L33
	ldr	r3, .L38+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L37
.L33:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L37:
	ldr	r3, .L38+12
	mov	lr, pc
	bx	r3
	ldr	r2, .L38+16
	mov	r3, #1
	str	r3, [r2, #0]
	ldr	r2, .L38+20
	str	r3, [r2, #0]
	ldr	r3, .L38+24
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L36:
	ldr	r3, .L38+12
	mov	lr, pc
	bx	r3
	bl	goToStart
	mov	r1, #495616
	add	r1, r1, #3824
	mov	r2, #11008
	mov	r3, #1
	ldr	r0, .L38+28
	add	r1, r1, #3
	add	r2, r2, #17
	ldr	ip, .L38+32
	mov	lr, pc
	bx	ip
	ldrh	r3, [r4, #0]
	b	.L34
.L39:
	.align	2
.L38:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	stopSound
	.word	level
	.word	lifeCount
	.word	initGame
	.word	startSong
	.word	playSoundA
	.size	lose, .-lose
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L41
	mov	lr, pc
	bx	r3
	ldr	r0, .L41+4
	ldr	r3, .L41+8
	mov	lr, pc
	bx	r3
	mov	r3, #16640
	mov	r0, #3
	ldr	r1, .L41+12
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L41+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L41+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #8064	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L41+24
	mov	r2, #0
	mov	r0, #3
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	waitForVBlank
	.word	winScreenPal
	.word	loadPalette
	.word	winScreenTiles
	.word	DMANow
	.word	winScreenMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L46
	mov	lr, pc
	bx	r3
	ldr	r3, .L46+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	ldr	r3, .L46+8
	mov	r2, #0
	str	r2, [r3, #0]
	beq	.L43
	ldr	r3, .L46+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L45
.L43:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L45:
	ldr	r3, .L46+16
	mov	lr, pc
	bx	r3
	bl	goToStart
	mov	r1, #495616
	add	r1, r1, #3824
	mov	r2, #11008
	ldr	r0, .L46+20
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L46+24
	mov	lr, pc
	bx	ip
	b	.L43
.L47:
	.align	2
.L46:
	.word	waitForVBlank
	.word	oldButtons
	.word	notIntrod
	.word	buttons
	.word	stopSound
	.word	startSong
	.word	playSoundA
	.size	win, .-win
	.align	2
	.global	goToLevel2
	.type	goToLevel2, %function
goToLevel2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L49
	mov	lr, pc
	bx	r3
	ldr	r0, .L49+4
	ldr	r3, .L49+8
	mov	lr, pc
	bx	r3
	mov	r3, #18944
	mov	r0, #3
	ldr	r1, .L49+12
	mov	r2, #100663296
	add	r3, r3, #224
	ldr	r4, .L49+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L49+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #8064	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L49+24
	mov	r2, #0
	mov	r0, #6
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	level2Pal
	.word	loadPalette
	.word	level2Tiles
	.word	DMANow
	.word	level2Map
	.word	state
	.size	goToLevel2, .-goToLevel2
	.align	2
	.global	level2
	.type	level2, %function
level2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L54
	mov	lr, pc
	bx	r3
	ldr	r3, .L54+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	ldr	r3, .L54+8
	mov	r2, #0
	str	r2, [r3, #0]
	beq	.L51
	ldr	r3, .L54+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L53
.L51:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L53:
	ldr	r3, .L54+16
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L54+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	mov	r1, #368640
	add	r1, r1, #2000
	mov	r2, #11008
	ldr	r0, .L54+24
	add	r1, r1, #6
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L54+28
	mov	lr, pc
	bx	ip
	b	.L51
.L55:
	.align	2
.L54:
	.word	waitForVBlank
	.word	oldButtons
	.word	notIntrod
	.word	buttons
	.word	lifeCount
	.word	initGame
	.word	gameSong
	.word	playSoundA
	.size	level2, .-level2
	.align	2
	.global	goToLevel3
	.type	goToLevel3, %function
goToLevel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r0, .L57+4
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	mov	r3, #19200
	mov	r0, #3
	ldr	r1, .L57+12
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L57+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L57+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #8064	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L57+24
	mov	r2, #0
	mov	r0, #7
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	waitForVBlank
	.word	level3Pal
	.word	loadPalette
	.word	level3Tiles
	.word	DMANow
	.word	level3Map
	.word	state
	.size	goToLevel3, .-goToLevel3
	.align	2
	.global	level3
	.type	level3, %function
level3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L62
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	ldr	r3, .L62+8
	mov	r2, #0
	str	r2, [r3, #0]
	beq	.L59
	ldr	r3, .L62+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L61
.L59:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L61:
	ldr	r3, .L62+16
	ldr	r2, [r3, #0]
	add	r2, r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L62+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	mov	r1, #368640
	add	r1, r1, #2000
	mov	r2, #11008
	ldr	r0, .L62+24
	add	r1, r1, #6
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L62+28
	mov	lr, pc
	bx	ip
	b	.L59
.L63:
	.align	2
.L62:
	.word	waitForVBlank
	.word	oldButtons
	.word	notIntrod
	.word	buttons
	.word	lifeCount
	.word	initGame
	.word	gameSong
	.word	playSoundA
	.size	level3, .-level3
	.align	2
	.global	goToBonus1Intro
	.type	goToBonus1Intro, %function
goToBonus1Intro:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L65
	mov	lr, pc
	bx	r3
	ldr	r0, .L65+4
	ldr	r3, .L65+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L65+12
	mov	r0, #3
	ldr	r1, .L65+16
	mov	r2, #100663296
	mov	r3, #10880
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L65+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #8064	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L65+24
	mov	r2, #0
	mov	r0, #10
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	waitForVBlank
	.word	steveBGPal
	.word	loadPalette
	.word	DMANow
	.word	steveBGTiles
	.word	steveBGMap
	.word	state
	.size	goToBonus1Intro, .-goToBonus1Intro
	.align	2
	.global	goToBonus2Intro
	.type	goToBonus2Intro, %function
goToBonus2Intro:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L68
	mov	lr, pc
	bx	r3
	ldr	r0, .L68+4
	ldr	r3, .L68+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L68+12
	mov	r0, #3
	ldr	r1, .L68+16
	mov	r2, #100663296
	mov	r3, #13376
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L68+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #8064	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L68+24
	mov	r2, #0
	mov	r0, #11
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	waitForVBlank
	.word	qualudeBGPal
	.word	loadPalette
	.word	DMANow
	.word	qualudeBGTiles
	.word	qualudeBGMap
	.word	state
	.size	goToBonus2Intro, .-goToBonus2Intro
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L81
	ldrh	r3, [r4, #4]
	add	r3, r3, #1
	strh	r3, [r4, #4]	@ movhi
	ldr	r3, .L81+4
	mov	lr, pc
	bx	r3
	ldrh	r2, [r4, #4]
	mov	r3, #67108864
	mov	r1, r2, lsr #1
	strh	r2, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	ldr	r3, .L81+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+16
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L71
	ldr	r3, .L81+20
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L76
.L71:
	ldr	r3, .L81+24
	ldr	r3, [r3, #0]
	cmp	r3, #2
	beq	.L77
	cmp	r3, #3
	beq	.L78
	cmp	r3, #4
	bne	.L73
	ldr	r3, .L81+28
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L79
.L73:
	ldr	r3, .L81+32
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L80
.L70:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L78:
	ldr	r3, .L81+28
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L73
	ldmfd	sp!, {r4, lr}
	b	goToBonus2Intro
.L77:
	ldr	r3, .L81+28
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L73
	ldmfd	sp!, {r4, lr}
	b	goToBonus1Intro
.L76:
	ldr	r3, .L81+36
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L80:
	ldr	r3, .L81+40
	mov	lr, pc
	bx	r3
	bl	goToLose
	mov	r1, #954368
	add	r1, r1, #1872
	mov	r2, #11008
	ldr	r0, .L81+44
	add	r1, r1, #10
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L81+48
	mov	lr, pc
	bx	ip
	b	.L70
.L79:
	ldr	r3, .L81+40
	mov	lr, pc
	bx	r3
	bl	goToWin
	mov	r1, #577536
	add	r1, r1, #2320
	mov	r2, #11008
	ldr	r0, .L81+52
	add	r1, r1, #1
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L81+48
	mov	lr, pc
	bx	ip
	b	.L70
.L82:
	.align	2
.L81:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	level
	.word	notIntrod
	.word	lifeCount
	.word	pauseSound
	.word	stopSound
	.word	loseSong
	.word	playSoundA
	.word	winSong
	.size	game, .-game
	.align	2
	.global	goToBonus1
	.type	goToBonus1, %function
goToBonus1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	mov	r6, #100663296
	ldr	r0, .L84+4
	ldr	r3, .L84+8
	ldr	r4, .L84+12
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L84+16
	mov	r2, r6
	mov	r3, #2752
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L84+20
	add	r2, r6, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #4672
	mov	r0, #3
	ldr	r1, .L84+24
	add	r2, r6, #32768
	add	r3, r3, #32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L84+28
	add	r2, r6, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L84+32
	ldrh	r7, [r3, #4]
	ldr	r3, .L84+36
	mov	ip, #6912
	ldrh	lr, [r3, #0]
	mov	r5, #67108864
	add	ip, ip, #8
	mov	r2, #83886080
	mov	r8, #7680	@ movhi
	strh	r8, [r5, #10]	@ movhi
	mov	r0, #3
	strh	ip, [r5, #8]	@ movhi
	ldr	r1, .L84+40
	add	r2, r2, #512
	mov	r3, #256
	strh	r7, [r5, #16]	@ movhi
	strh	lr, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L84+44
	add	r2, r6, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L84+48
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L84+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L84+56
	mov	r2, #8
	str	r2, [r3, #0]
	mov	r3, #4864	@ movhi
	strh	r3, [r5, #0]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	waitForVBlank
	.word	redcarpetPal
	.word	loadPalette
	.word	DMANow
	.word	hollywoodTiles
	.word	hollywoodMap
	.word	redcarpetTiles
	.word	redcarpetMap
	.word	.LANCHOR0
	.word	vOff
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToBonus1, .-goToBonus1
	.align	2
	.global	enterBonus1
	.type	enterBonus1, %function
enterBonus1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L91
	ldr	r3, .L91+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #0]
	tst	r3, #8
	beq	.L87
	ldr	r2, .L91+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L89
.L87:
	tst	r3, #4
	beq	.L86
	ldr	r3, .L91+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L90
.L86:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L90:
	ldr	r3, .L91+12
	mov	r2, #30
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	b	goToLevel2
.L89:
	ldr	r3, .L91+16
	mov	lr, pc
	bx	r3
	bl	goToBonus1
	ldrh	r3, [r4, #0]
	b	.L87
.L92:
	.align	2
.L91:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	timeRemain
	.word	initBonus
	.size	enterBonus1, .-enterBonus1
	.align	2
	.global	goToBonus2
	.type	goToBonus2, %function
goToBonus2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L94
	mov	lr, pc
	bx	r3
	ldr	r0, .L94+4
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	mov	r2, #100663296
	mov	r3, #4992
	ldr	r4, .L94+12
	mov	r5, r2
	mov	r0, #3
	ldr	r1, .L94+16
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L94+20
	add	r2, r5, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	ip, #67108864
	mov	lr, #4352	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	r2, #83886080
	mov	lr, #7936	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L94+24
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L94+28
	add	r2, r5, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L94+32
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L94+36
	mov	lr, pc
	bx	r4
	ldr	r3, .L94+40
	mov	r2, #9
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L95:
	.align	2
.L94:
	.word	waitForVBlank
	.word	qualudePal
	.word	loadPalette
	.word	DMANow
	.word	qualudeTiles
	.word	qualudeMap
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToBonus2, .-goToBonus2
	.align	2
	.global	enterBonus2
	.type	enterBonus2, %function
enterBonus2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L101
	ldr	r3, .L101+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #0]
	tst	r3, #8
	beq	.L97
	ldr	r2, .L101+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L99
.L97:
	tst	r3, #4
	beq	.L96
	ldr	r3, .L101+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L100
.L96:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L100:
	ldmfd	sp!, {r4, lr}
	b	goToLevel3
.L99:
	ldr	r3, .L101+12
	mov	lr, pc
	bx	r3
	bl	goToBonus2
	ldrh	r3, [r4, #0]
	b	.L97
.L102:
	.align	2
.L101:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	initBonus
	.size	enterBonus2, .-enterBonus2
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L110
	ldr	r3, .L110+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4, #0]
	tst	r3, #8
	beq	.L104
	ldr	r2, .L110+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L107
.L104:
	tst	r3, #16
	beq	.L105
	ldr	r2, .L110+8
	ldrh	r2, [r2, #0]
	tst	r2, #16
	beq	.L108
.L105:
	tst	r3, #4
	beq	.L103
	ldr	r3, .L110+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L109
.L103:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L109:
	ldr	r3, .L110+12
	mov	lr, pc
	bx	r3
	bl	goToInstructions
	mov	r1, #171008
	add	r1, r1, #588
	mov	r2, #11008
	ldr	r0, .L110+16
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L110+20
	mov	lr, pc
	bx	ip
	b	.L103
.L108:
	ldr	r3, .L110+24
	mov	r2, #3
	str	r2, [r3, #0]
	bl	goToBonus2
	ldrh	r3, [r4, #0]
	b	.L105
.L107:
	ldr	r3, .L110+24
	mov	r5, #1
	str	r5, [r3, #0]
	ldr	r3, .L110+28
	str	r5, [r3, #0]
	ldr	r3, .L110+32
	mov	r2, #30
	str	r2, [r3, #0]
	ldr	r3, .L110+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L110+36
	mov	lr, pc
	bx	r3
	bl	goToGame
	mov	r1, #368640
	add	r1, r1, #2000
	mov	r2, #11008
	mov	r3, r5
	ldr	r0, .L110+40
	add	r1, r1, #6
	add	r2, r2, #17
	ldr	ip, .L110+20
	mov	lr, pc
	bx	ip
	ldrh	r3, [r4, #0]
	b	.L104
.L111:
	.align	2
.L110:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	stopSound
	.word	instructionsSong
	.word	playSoundA
	.word	level
	.word	lifeCount
	.word	timeRemain
	.word	initGame
	.word	gameSong
	.size	start, .-start
	.align	2
	.global	goToBonusWin1
	.type	goToBonusWin1, %function
goToBonusWin1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L113
	mov	lr, pc
	bx	r3
	ldr	r0, .L113+4
	ldr	r3, .L113+8
	mov	lr, pc
	bx	r3
	mov	r3, #18688
	mov	r0, #3
	ldr	r1, .L113+12
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L113+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L113+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #8064	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L113+24
	mov	r2, #0
	mov	r0, #12
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L114:
	.align	2
.L113:
	.word	waitForVBlank
	.word	bonuswin1Pal
	.word	loadPalette
	.word	bonuswin1Tiles
	.word	DMANow
	.word	bonuswin1Map
	.word	state
	.size	goToBonusWin1, .-goToBonusWin1
	.align	2
	.global	bonusWin1
	.type	bonusWin1, %function
bonusWin1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L118
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L118+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L115
	ldr	r3, .L118+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L117
.L115:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L117:
	ldmfd	sp!, {r4, lr}
	b	goToLevel2
.L119:
	.align	2
.L118:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	bonusWin1, .-bonusWin1
	.align	2
	.global	goToBonusWin2
	.type	goToBonusWin2, %function
goToBonusWin2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L121
	mov	lr, pc
	bx	r3
	ldr	r0, .L121+4
	ldr	r3, .L121+8
	mov	lr, pc
	bx	r3
	mov	r3, #18944
	mov	r0, #3
	ldr	r1, .L121+12
	mov	r2, #100663296
	add	r3, r3, #192
	ldr	r4, .L121+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L121+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #8064	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L121+24
	mov	r2, #0
	mov	r0, #13
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L122:
	.align	2
.L121:
	.word	waitForVBlank
	.word	bonuswin2Pal
	.word	loadPalette
	.word	bonuswin2Tiles
	.word	DMANow
	.word	bonuswin2Map
	.word	state
	.size	goToBonusWin2, .-goToBonusWin2
	.align	2
	.global	bonusWin2
	.type	bonusWin2, %function
bonusWin2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L126
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L123
	ldr	r3, .L126+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L125
.L123:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L125:
	ldmfd	sp!, {r4, lr}
	b	goToLevel3
.L127:
	.align	2
.L126:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	bonusWin2, .-bonusWin2
	.align	2
	.global	goToBonusLose
	.type	goToBonusLose, %function
goToBonusLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L129
	mov	lr, pc
	bx	r3
	ldr	r0, .L129+4
	ldr	r3, .L129+8
	mov	lr, pc
	bx	r3
	mov	r3, #17408
	mov	r0, #3
	ldr	r1, .L129+12
	mov	r2, #100663296
	add	r3, r3, #96
	ldr	r4, .L129+16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L129+20
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #8064	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r1, .L129+24
	mov	r2, #0
	mov	r0, #14
	str	r0, [r1, #0]
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L130:
	.align	2
.L129:
	.word	waitForVBlank
	.word	bonuslosePal
	.word	loadPalette
	.word	bonusloseTiles
	.word	DMANow
	.word	bonusloseMap
	.word	state
	.size	goToBonusLose, .-goToBonusLose
	.align	2
	.global	bonus2
	.type	bonus2, %function
bonus2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L136
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L136+12
	ldr	r4, [r3, #0]
	cmp	r4, #1
	beq	.L134
.L132:
	ldr	r3, .L136+16
	ldr	r3, [r3, #0]
	cmp	r3, #1
	beq	.L135
.L131:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L135:
	bl	goToBonusLose
	ldr	r3, .L136+20
	mov	r2, #0
	str	r2, [r3, #0]
	b	.L131
.L134:
	bl	goToBonusWin2
	ldr	r3, .L136+20
	str	r4, [r3, #0]
	b	.L132
.L137:
	.align	2
.L136:
	.word	waitForVBlank
	.word	updateBonus
	.word	drawBonus
	.word	winner
	.word	loser
	.word	isMeryl
	.size	bonus2, .-bonus2
	.align	2
	.global	bonus1
	.type	bonus1, %function
bonus1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L143
	ldrh	r3, [r4, #4]
	add	r3, r3, #1
	strh	r3, [r4, #4]	@ movhi
	ldr	r3, .L143+4
	mov	lr, pc
	bx	r3
	ldrh	r2, [r4, #4]
	mov	r3, #67108864
	mov	r1, r2, lsr #1
	strh	r2, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	ldr	r3, .L143+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+16
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L141
.L139:
	ldr	r3, .L143+20
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L142
	ldmfd	sp!, {r4, lr}
	bx	lr
.L142:
	ldr	r3, .L143+24
	mov	r2, #30
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	b	goToBonusLose
.L141:
	ldr	r3, .L143+24
	mov	r2, #25
	str	r2, [r3, #0]
	bl	goToBonusWin1
	b	.L139
.L144:
	.align	2
.L143:
	.word	.LANCHOR0
	.word	waitForVBlank
	.word	updateBonus
	.word	drawBonus
	.word	winner
	.word	loser
	.word	timeRemain
	.size	bonus1, .-bonus1
	.align	2
	.global	bonusLose
	.type	bonusLose, %function
bonusLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L150
	mov	lr, pc
	bx	r3
	ldr	r3, .L150+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L145
	ldr	r3, .L150+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	bne	.L145
	ldr	r3, .L150+12
	ldr	r3, [r3, #0]
	cmp	r3, #2
	beq	.L149
	bl	goToLevel3
.L148:
	ldr	r3, .L150+16
	mov	lr, pc
	bx	r3
.L145:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L149:
	bl	goToLevel2
	b	.L148
.L151:
	.align	2
.L150:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	level
	.word	stopSound
	.size	bonusLose, .-bonusLose
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	goToStart
	ldr	r3, .L174
	mov	lr, pc
	bx	r3
	ldr	r3, .L174+4
	mov	lr, pc
	bx	r3
	mov	r1, #495616
	add	r1, r1, #3824
	mov	r2, #11008
	ldr	r0, .L174+8
	add	r1, r1, #3
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L174+12
	mov	lr, pc
	bx	ip
	mov	r5, #67108864
	ldr	r4, .L174+16
	ldr	r7, .L174+20
	ldr	r6, .L174+24
	add	r5, r5, #256
.L173:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L154:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #14
	ldrls	pc, [pc, r2, asl #2]
	b	.L154
.L170:
	.word	.L155
	.word	.L156
	.word	.L157
	.word	.L158
	.word	.L159
	.word	.L160
	.word	.L161
	.word	.L162
	.word	.L163
	.word	.L164
	.word	.L165
	.word	.L166
	.word	.L167
	.word	.L168
	.word	.L169
.L169:
	bl	bonusLose
	b	.L173
.L168:
	bl	bonusWin2
	b	.L173
.L167:
	bl	bonusWin1
	b	.L173
.L166:
	bl	enterBonus2
	b	.L173
.L165:
	bl	enterBonus1
	b	.L173
.L164:
	bl	bonus2
	b	.L173
.L163:
	bl	bonus1
	b	.L173
.L162:
	bl	level3
	b	.L173
.L161:
	bl	level2
	b	.L173
.L160:
	bl	instructions
	b	.L173
.L159:
	bl	lose
	b	.L173
.L158:
	bl	win
	b	.L173
.L157:
	bl	pause
	b	.L173
.L156:
	bl	game
	b	.L173
.L155:
	bl	start
	b	.L173
.L175:
	.align	2
.L174:
	.word	setupSound
	.word	setupInterrupts
	.word	startSong
	.word	playSoundA
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.global	hOff
	.global	currentInstruction
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	lifeCount,4,4
	.comm	timer,4,4
	.comm	countDown,4,4
	.comm	level,4,4
	.comm	timeRemain,4,4
	.comm	isMeryl,4,4
	.comm	notIntrod,4,4
	.comm	vOff,2,2
	.comm	winner,4,4
	.comm	loser,4,4
	.comm	clock,4,4
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	vbCountA,4,4
	.comm	vbCountB,4,4
	.comm	state,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	currentInstruction, %object
	.size	currentInstruction, 4
currentInstruction:
	.space	4
	.type	hOff, %object
	.size	hOff, 2
hOff:
	.space	2
	.ident	"GCC: (devkitARM release 31) 4.5.0"
