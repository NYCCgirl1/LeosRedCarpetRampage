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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	mov	ip, #32
	mov	r2, #0
	str	ip, [r3, #8]
	mov	ip, #26624
	mov	r1, #20
	mov	r0, #1
	str	ip, [r3, #0]
	str	r2, [r3, #64]
	mov	ip, #84
	str	r2, [r3, #48]
	str	r2, [r3, #60]
	str	r2, [r3, #52]
	str	r2, [r3, #12]
	str	r2, [r3, #44]
	mov	r2, #768
	str	ip, [r3, #4]
	str	r1, [r3, #20]
	mov	ip, #50
	str	r0, [r3, #56]
	str	r0, [r3, #16]
	str	r1, [r3, #28]
	mov	r0, #60
	mov	r1, #5
	str	r2, [r3, #32]
	mov	r2, #1536
	str	ip, [r3, #68]
	str	r0, [r3, #24]
	str	r1, [r3, #40]
	str	r2, [r3, #36]
	bx	lr
.L3:
	.align	2
.L2:
	.word	leo
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initFans
	.type	initFans, %function
initFans:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L8
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldmib	r2, {r1, r3}	@ phole ldm
	sub	r7, r3, r3, asl #2
	mov	r2, #0
	ldr	r3, .L8+4
	add	r7, r7, r1
	mov	r0, #24
	mov	r6, #120
	mov	r5, #264
	mvn	r4, #1
	mov	r1, r2
	mov	lr, #1
	mov	ip, #5
.L5:
	add	r2, r2, #1
	cmp	r2, #10
	str	r2, [r3, #-12]
	str	r0, [r3, #-32]
	str	r0, [r3, #-28]
	str	r6, [r3, #-48]
	str	r5, [r3, #-44]
	str	r7, [r3, #0]
	str	r4, [r3, #-40]
	str	r1, [r3, #-36]
	str	lr, [r3, #-4]
	str	ip, [r3, #-24]
	str	r1, [r3, #-20]
	str	r1, [r3, #-16]
	str	r1, [r3, #-8]
	add	r3, r3, #52
	bne	.L5
	ldr	r3, .L8+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+12
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	rsb	r0, r3, r0
	ldr	r2, .L8+16
	add	r0, r0, #50
	str	r0, [r2, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	leo
	.word	fans+48
	.word	rand
	.word	1374389535
	.word	timeForFan
	.size	initFans, .-initFans
	.align	2
	.global	initPaps
	.type	initPaps, %function
initPaps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	stmfd	sp!, {r4, r5, r6}
	mov	r2, #11
	mov	r6, #120
	mov	r5, #272
	mvn	r4, #0
	mov	r0, #32
	mov	r1, #0
	mov	ip, #3
.L11:
	str	r2, [r3, #0]
	add	r2, r2, #1
	cmp	r2, #21
	str	r6, [r3, #-32]
	str	r5, [r3, #-28]
	str	r4, [r3, #-24]
	str	r0, [r3, #-20]
	str	r0, [r3, #-16]
	str	r1, [r3, #-12]
	str	ip, [r3, #-8]
	str	r1, [r3, #4]
	str	ip, [r3, #-4]
	add	r3, r3, #40
	bne	.L11
	ldr	r3, .L15+4
	mov	ip, #4
.L12:
	str	r2, [r3, #0]
	add	r2, r2, #1
	cmp	r2, #31
	str	r6, [r3, #-32]
	str	r5, [r3, #-28]
	str	r4, [r3, #-24]
	str	r0, [r3, #-20]
	str	r0, [r3, #-16]
	str	r1, [r3, #-12]
	str	ip, [r3, #-8]
	str	r1, [r3, #4]
	str	ip, [r3, #-4]
	add	r3, r3, #40
	bne	.L12
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L16:
	.align	2
.L15:
	.word	bendPaps+32
	.word	paps+32
	.size	initPaps, .-initPaps
	.align	2
	.global	initLives
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	stmfd	sp!, {r4, r5}
	mov	r2, #31
	mov	r1, #20
	mov	ip, #0
	mov	r0, #16
	mov	r5, #2
	mov	r4, #7
.L18:
	str	r2, [r3, #4]
	add	r2, r2, #1
	cmp	r2, #34
	str	r1, [r3, #-12]
	str	ip, [r3, #0]
	str	r0, [r3, #-8]
	str	r0, [r3, #-4]
	str	ip, [r3, #-16]
	str	r5, [r3, #12]
	str	r4, [r3, #8]
	add	r1, r1, #16
	add	r3, r3, #32
	bne	.L18
	ldmfd	sp!, {r4, r5}
	bx	lr
.L21:
	.align	2
.L20:
	.word	lives+16
	.size	initLives, .-initLives
	.align	2
	.global	initAwards
	.type	initAwards, %function
initAwards:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L25
	ldr	r7, .L25+4
	mov	r5, #35
	mov	fp, #256
	mvn	r9, #0
	mov	r6, #16
	mov	sl, #7
	mov	r8, #0
.L23:
	str	r5, [r4, #0]
	mov	lr, pc
	bx	r7
	ldr	r1, .L25+8
	smull	r3, r2, r1, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #3
	add	r0, r0, #80
	str	r0, [r4, #-32]
	str	fp, [r4, #-28]
	str	r9, [r4, #-24]
	str	r6, [r4, #-20]
	str	r6, [r4, #-16]
	mov	lr, pc
	bx	r7
	ldr	r1, .L25+12
	smull	r2, r3, r1, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, asl #1
	rsb	r3, r3, r0
	add	r5, r5, #1
	str	r3, [r4, #-8]
	cmp	r5, #50
	mov	r3, #14
	str	sl, [r4, #4]
	str	r8, [r4, #-4]
	str	r3, [r4, #-12]
	add	r4, r4, #44
	bne	.L23
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	awards+32
	.word	rand
	.word	1717986919
	.word	1431655766
	.size	initAwards, .-initAwards
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L37
	stmfd	sp!, {r3, lr}
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L37+4
	str	r3, [r2, #0]
	ldr	r2, .L37+8
	str	r3, [r2, #0]
	ldr	r2, .L37+12
	str	r3, [r2, #0]
	ldr	r2, .L37+16
	str	r3, [r2, #0]
	ldr	r2, .L37+20
	str	r3, [r2, #0]
	ldr	r2, .L37+24
	str	r3, [r2, #0]
	bl	initPlayer
	ldr	r3, .L37+28
	ldr	r3, [r3, #0]
	cmp	r3, #1
	beq	.L34
	cmp	r3, #2
	beq	.L35
	cmp	r3, #3
	beq	.L36
.L29:
	bl	initLives
	ldr	r3, .L37+32
	ldr	r2, [r3, #0]
	cmp	r2, #0
	ble	.L27
	ldr	r3, .L37+36
	mov	r1, #1
	add	r2, r3, r2, asl #5
.L32:
	str	r1, [r3, #16]
	add	r3, r3, #32
	cmp	r3, r2
	bne	.L32
.L27:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L34:
	bl	initPaps
	b	.L29
.L35:
	bl	initPaps
	bl	initFans
	b	.L29
.L36:
	bl	initPaps
	bl	initFans
	bl	initAwards
	b	.L29
.L38:
	.align	2
.L37:
	.word	timer
	.word	fanTime
	.word	countDown
	.word	awardsCollected
	.word	fanActive
	.word	papActive
	.word	awardActive
	.word	level
	.word	lifeCount
	.word	lives
	.size	initGame, .-initGame
	.align	2
	.global	collisionCheck
	.type	collisionCheck, %function
collisionCheck:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r6, .L53
	sub	sp, sp, #16
	ldr	r3, [r6, #48]
	cmp	r3, #0
	beq	.L40
	ldr	r3, .L53+4
	ldr	r0, [r3, #0]
	cmp	r0, #0
	beq	.L41
.L40:
	ldr	r4, .L53+8
	ldr	r8, .L53+12
	mov	r5, #0
	b	.L43
.L42:
	add	r5, r5, #1
	cmp	r5, #10
	add	r4, r4, #52
	beq	.L50
.L43:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	beq	.L42
	ldr	r2, [r6, #8]
	ldr	r0, [r6, #0]
	ldr	r7, [r4, #-12]
	ldr	lr, [r4, #-32]
	ldr	ip, [r4, #-28]
	ldr	sl, [r4, #-16]
	ldr	r1, [r6, #4]
	mov	r0, r0, asr #8
	str	r7, [sp, #8]
	mov	r3, r2
	str	lr, [sp, #0]
	str	ip, [sp, #4]
	str	sl, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #1
	mov	r7, r0
	bne	.L42
	mov	r2, #11008
	ldr	r0, .L53+16
	mov	r1, #11520
	add	r2, r2, #17
	mov	r3, #0
	ldr	ip, .L53+20
	mov	lr, pc
	bx	ip
	ldr	r2, .L53+24
	add	r3, r5, r5, asl #1
	ldr	ip, .L53+28
	ldr	r0, .L53+32
	ldr	r1, [r2, #0]
	add	r5, r5, r3, asl #2
	add	r5, ip, r5, asl #2
	ldr	ip, .L53+36
	ldr	r4, [r0, #0]
	sub	r1, r1, #1
	mov	r3, #0
	add	ip, ip, r1, asl #5
	sub	r4, r4, #1
	str	r3, [r5, #32]
	str	r1, [r2, #0]
	str	r3, [ip, #16]
	str	r4, [r0, #0]
	mov	r0, r7
.L41:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L50:
	ldr	r4, .L53+40
	ldr	r7, .L53
	ldr	r8, .L53+44
	mov	r5, #0
	b	.L46
.L44:
	add	r5, r5, #1
	cmp	r5, #10
	add	r4, r4, #40
	beq	.L51
.L46:
	ldr	r3, [r4, #0]
	cmp	r3, #0
	beq	.L44
	ldr	r2, [r6, #8]
	ldr	r0, [r6, #0]
	sub	ip, r4, #36
	ldmia	ip, {ip, lr}	@ phole ldm
	sub	r9, r4, #24
	ldmia	r9, {r9, sl}	@ phole ldm
	ldr	r1, [r6, #4]
	mov	r3, r2
	mov	r0, r0, asr #8
	stmia	sp, {ip, lr}	@ phole stm
	str	sl, [sp, #8]
	str	r9, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #1
	beq	.L52
	ldr	r2, [r7, #8]
	ldr	r0, [r7, #0]
	sub	ip, r4, #36
	ldmia	ip, {ip, lr}	@ phole ldm
	ldr	sl, [r4, #-24]
	ldr	r9, [r4, #-20]
	ldr	r1, [r7, #4]
	mov	r0, r0, asr #8
	mov	r3, r2
	stmia	sp, {ip, lr}	@ phole stm
	str	sl, [sp, #8]
	str	r9, [sp, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #1
	ble	.L44
	ldr	r2, .L53+24
	ldr	r0, .L53+48
	ldr	ip, .L53+52
	ldr	r1, [r2, #0]
	add	r5, r5, r5, asl #2
	ldr	r6, [r0, #0]
	add	r4, ip, r5, asl #3
	ldr	ip, .L53+36
	sub	r1, r1, #1
	mov	r3, #0
	sub	r6, r6, #1
	add	ip, ip, r1, asl #5
	str	r6, [r0, #0]
	str	r3, [r4, #36]
	str	r1, [r2, #0]
	str	r3, [ip, #16]
	mov	r0, #1
	b	.L41
.L51:
	mov	r0, #0
	b	.L41
.L52:
	ldr	r2, .L53+48
	ldr	ip, [r2, #0]
	ldr	r1, .L53+52
	sub	ip, ip, #1
	add	r5, r5, r5, asl #2
	mov	r3, #-1610612736
	str	ip, [r2, #0]
	ldr	r2, .L53
	mov	r0, #0
	add	r1, r1, r5, asl #3
	mov	r3, r3, asr #20
	str	r0, [r1, #36]
	str	r3, [r2, #12]
	b	.L41
.L54:
	.align	2
.L53:
	.word	leo
	.word	isMeryl
	.word	fans+32
	.word	collision
	.word	gasp
	.word	playSoundB
	.word	lifeCount
	.word	fans
	.word	fanActive
	.word	lives
	.word	bendPaps+36
	.word	papsCollision
	.word	papActive
	.word	bendPaps
	.size	collisionCheck, .-collisionCheck
	.global	__aeabi_idivmod
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r4, .L80
	mov	r3, #67108864
	add	r3, r3, #256
	ldr	r2, [r4, #68]
	ldrh	r1, [r3, #48]
	add	r2, r2, #1
	tst	r1, #16
	str	r2, [r4, #68]
	bne	.L56
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #8]
	add	r2, r3, r2
	cmp	r2, #239
	mov	r2, #10
	str	r2, [r4, #20]
	ble	.L76
.L57:
	ldr	r3, [r4, #44]
	ldr	r5, .L80
	cmp	r3, #0
	movne	r3, #3
	strne	r3, [r5, #64]
	bne	.L60
	ldr	r0, [r5, #68]
	ldr	r1, [r5, #20]
	ldr	r3, .L80+4
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	beq	.L77
.L60:
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #0]
	add	r2, r2, r3
	add	r3, r2, r1
	cmp	r3, #0
	str	r2, [r4, #12]
	ldrgt	r2, .L80
	movle	r3, r1
	strgt	r3, [r2, #0]
	mov	r3, r3, asr #8
	cmp	r3, #119
	movgt	r3, #0
	strgt	r3, [r4, #12]
	strgt	r3, [r4, #44]
	ldr	r3, .L80+8
	ldrh	r3, [r3, #0]
	movgt	r2, #30720
	strgt	r2, [r4, #0]
	tst	r3, #1
	beq	.L64
	ldr	r3, .L80+12
	ldrh	r3, [r3, #0]
	ands	r3, r3, #1
	beq	.L78
.L64:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r2, [r3, #48]
	tst	r2, #2
	bne	.L65
	ldrh	r3, [r3, #48]
	tst	r3, #8
	moveq	r3, #1
	streq	r3, [r4, #52]
	streq	r3, [r4, #48]
	bne	.L65
.L66:
	ldr	r2, .L80+16
	ldr	r1, .L80+20
	ldr	r2, [r2, #0]
	smull	r0, r1, r2, r1
	mov	r0, r2, asr #31
	rsb	r1, r0, r1, asr #1
	add	r1, r1, r1, asl #2
	cmp	r2, r1
	ldrne	r3, [r4, #48]
	addeq	r3, r3, #1
	streq	r3, [r4, #48]
	cmp	r3, #79
	movgt	r3, #0
	strgt	r3, [r4, #52]
	strgt	r3, [r4, #48]
	ble	.L67
	bl	collisionCheck
	cmp	r0, #1
	moveq	r3, #0
	streq	r3, [r4, #68]
	beq	.L72
.L79:
	ldr	r3, [r4, #68]
	cmp	r3, #49
	ldr	r3, .L80
	ble	.L72
	ldr	r2, [r3, #48]
	cmp	r2, #0
	streq	r2, [r3, #52]
.L55:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L65:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	bgt	.L66
.L67:
	sub	r3, r3, #60
	cmp	r3, #10
	movls	r3, #2
	strls	r3, [r4, #52]
	bl	collisionCheck
	cmp	r0, #1
	moveq	r3, #0
	streq	r3, [r4, #68]
	bne	.L79
.L72:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	ldreq	r3, .L80
	moveq	r2, #2
	streq	r2, [r3, #52]
	b	.L55
.L56:
	ldrh	r3, [r3, #48]
	tst	r3, #32
	movne	r3, #17
	strne	r3, [r4, #20]
	bne	.L57
	ldr	r3, [r4, #4]
	mov	r2, #26
	cmp	r3, #0
	str	r2, [r4, #20]
	ldrgt	r2, [r4, #16]
	rsbgt	r3, r2, r3
	strgt	r3, [r4, #4]
	b	.L57
.L78:
	ldr	r2, [r4, #0]
	mov	r2, r2, asr #8
	cmp	r2, #61
	ldr	ip, .L80
	ble	.L64
	mov	lr, #-1610612736
	mov	lr, lr, asr #20
	str	lr, [ip, #12]
	mov	r2, #11008
	mov	lr, #1
	str	lr, [ip, #44]
	ldr	r0, .L80+24
	mov	r1, #3168
	add	r2, r2, #17
	ldr	ip, .L80+28
	mov	lr, pc
	bx	ip
	b	.L64
.L77:
	ldr	r3, [r5, #64]
	cmp	r3, #1
	movgt	r3, #1
	addle	r3, r3, #1
	strgt	r3, [r5, #64]
	strle	r3, [r5, #64]
	b	.L60
.L76:
	ldr	r2, [r4, #16]
	add	r3, r2, r3
	str	r3, [r4, #4]
	b	.L57
.L81:
	.align	2
.L80:
	.word	leo
	.word	__aeabi_idivmod
	.word	oldButtons
	.word	buttons
	.word	timer
	.word	1717986919
	.word	jump
	.word	playSoundB
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateFans
	.type	updateFans, %function
updateFans:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L102
	sub	sp, sp, #12
	ldr	r3, [r4, #0]
	ldr	r5, .L102+4
	add	r3, r3, #1
	mov	r0, r3
	str	r3, [r4, #0]
	ldr	r1, [r5, #0]
	ldr	r3, .L102+8
	mov	lr, pc
	bx	r3
	subs	r3, r1, #0
	beq	.L98
	ldr	r0, .L102+12
	str	r0, [sp, #4]
.L83:
	ldr	r5, [sp, #4]
	ldr	r3, .L102+16
	ldr	fp, [r5, #0]
	ldr	r7, .L102+20
	ldr	sl, .L102+24
	add	r4, r3, #520
	mov	ip, #0
	mvn	r9, #0
	mov	r8, #1
.L85:
	ldr	r2, [r3, #0]
	cmp	r2, #0
	beq	.L87
	ldr	r2, [r3, #8]
	ldr	r1, [r3, #-28]
	ldr	r0, [r3, #16]
	add	r2, r2, #1
	cmp	r1, r0
	str	r2, [r3, #8]
	blt	.L88
	ldr	r5, [r3, #12]
	cmp	r5, #1
	beq	.L101
.L88:
	smull	r5, r6, r7, r2
	mov	r5, r2, asr #31
	add	r6, r6, r2
	rsb	r5, r5, r6, asr #2
	rsb	r5, r5, r5, asl #3
	add	r1, r1, #1
	sub	r0, r0, #1
	cmp	r2, r5
	str	r9, [r3, #-24]
	str	r1, [r3, #-28]
	str	ip, [r3, #12]
	str	r0, [r3, #16]
	ldrne	r2, [r3, #-20]
	bne	.L91
	ldr	r1, [r3, #-4]
	ldr	r2, [r3, #-20]
	cmp	r1, #0
	add	r2, r2, #1
	movgt	r1, ip
	movle	r1, r8
	str	r2, [r3, #-20]
	str	r1, [r3, #-4]
.L91:
	smull	r1, r0, sl, r2
	mov	r1, r2, asr #31
	rsb	r1, r1, r0, asr #3
	add	r1, r1, r1, asl #2
	cmp	r2, r1, asl #2
	streq	r8, [r3, #12]
	ldr	r1, [r3, #-28]
.L89:
	cmn	r1, #32
	strlt	ip, [r3, #0]
	movlt	fp, ip
.L87:
	add	r3, r3, #52
	cmp	r3, r4
	bne	.L85
	ldr	r2, [sp, #4]
	str	fp, [r2, #0]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L101:
	smull	r0, r5, r7, r2
	mov	r0, r2, asr #31
	add	r5, r5, r2
	ldr	r6, [r3, #-24]
	rsb	r0, r0, r5, asr #2
	rsb	r0, r0, r0, asl #3
	add	r1, r1, r6
	cmp	r2, r0
	str	r1, [r3, #-28]
	bne	.L89
	ldr	r2, [r3, #-4]
	cmp	r2, #2
	movne	r2, #2
	moveq	r2, #3
	str	r2, [r3, #-4]
	b	.L89
.L98:
	ldr	r1, .L102+12
	ldr	r0, [r1, #0]
	cmp	r0, #0
	str	r1, [sp, #4]
	bgt	.L83
	ldr	ip, .L102+28
	mov	r2, ip
	b	.L86
.L84:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #52
	beq	.L83
.L86:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L84
	add	r2, r3, r3, asl #1
	add	r2, r3, r2, asl #2
	add	ip, ip, r2, asl #2
	ldr	r2, [ip, #16]
	mov	r2, r2, asl #1
	mul	r3, r2, r3
	ldr	lr, .L102+32
	ldr	r2, [lr, #8]
	ldr	r6, [lr, #4]
	sub	r2, r2, r2, asl #2
	add	r2, r2, r6
	str	r2, [ip, #48]
	mvn	r2, #1
	add	lr, r3, #240
	str	r2, [ip, #8]
	mov	r3, #1
	ldr	r2, [sp, #4]
	add	r0, r0, r3
	str	r3, [ip, #44]
	str	r3, [ip, #32]
	str	r0, [r2, #0]
	ldr	r3, .L102+36
	str	lr, [ip, #4]
	str	r1, [ip, #12]
	str	r1, [r4, #0]
	mov	lr, pc
	bx	r3
	ldr	r2, .L102+40
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #4
	sub	r3, r0, r3, asl #1
	add	r3, r3, #50
	str	r3, [r5, #0]
	b	.L83
.L103:
	.align	2
.L102:
	.word	fanTime
	.word	timeForFan
	.word	__aeabi_idivmod
	.word	fanActive
	.word	fans+32
	.word	-1840700269
	.word	1717986919
	.word	fans
	.word	leo
	.word	rand
	.word	-2004318071
	.size	updateFans, .-updateFans
	.align	2
	.global	updatePaps1
	.type	updatePaps1, %function
updatePaps1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L119
	ldr	r2, [r3, #0]
	ldr	r4, .L119+4
	add	r2, r2, #1
	str	r2, [r3, #0]
	mov	r0, r2
	ldr	r3, .L119+8
	ldr	r1, [r4, #0]
	mov	lr, pc
	bx	r3
	subs	r3, r1, #0
	ldrne	r5, .L119+12
	bne	.L105
	ldr	r5, .L119+12
	ldr	r0, [r5, #0]
	cmp	r0, #1
	ble	.L117
.L105:
	ldr	r3, .L119+16
	ldr	r1, .L119+20
	ldr	r2, [r3, #68]
	smull	r6, r1, r2, r1
	mov	r3, r2, asr #31
	add	r1, r1, r2
	rsb	r1, r3, r1, asr #2
	ldr	r3, .L119+24
	rsb	r1, r1, r1, asl #3
	ldr	r4, [r5, #0]
	rsb	r1, r1, r2
	add	r0, r3, #400
	mov	r7, #1
	mov	ip, #0
.L107:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	ldreq	r2, [r3, #-4]
	beq	.L110
	ldmda	r3, {r2, r6}
	add	r2, r6, r2
	cmp	r1, #0
	str	r2, [r3, #-4]
	bne	.L110
	ldr	r6, [r3, #12]
	cmp	r6, #0
	movgt	r6, r1
	movle	r6, r7
	str	r6, [r3, #12]
.L110:
	cmn	r2, #32
	strlt	ip, [r3, #28]
	add	r3, r3, #40
	movlt	r4, ip
	cmp	r3, r0
	bne	.L107
	str	r4, [r5, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L117:
	ldr	ip, .L119+28
	mov	r2, ip
.L108:
	ldr	r1, [r2, #36]
	cmp	r1, #0
	beq	.L118
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #40
	bne	.L108
	b	.L105
.L118:
	add	r2, r3, r3, asl #2
	mov	r3, r3, asl #5
	add	ip, ip, r2, asl #3
	add	r3, r3, #240
	add	r0, r0, #1
	str	r3, [ip, #4]
	mov	r3, #1
	str	r3, [ip, #36]
	str	r0, [r5, #0]
	ldr	r3, .L119+32
	mov	lr, pc
	bx	r3
	ldr	r2, .L119+36
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #5
	add	r2, r3, r3, asl #3
	add	r3, r3, r2, asl #2
	rsb	r3, r3, r0
	add	r3, r3, #50
	str	r3, [r4, #0]
	b	.L105
.L120:
	.align	2
.L119:
	.word	timer
	.word	timeForSnap
	.word	__aeabi_idivmod
	.word	papActive
	.word	leo
	.word	-1840700269
	.word	bendPaps+8
	.word	bendPaps
	.word	rand
	.word	-580400985
	.size	updatePaps1, .-updatePaps1
	.align	2
	.global	updateAwards
	.type	updateAwards, %function
updateAwards:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r0, #432
	sub	sp, sp, #36
	add	r0, r0, #2
	ldr	r4, .L137
	ldr	r6, .L137+4
	ldr	sl, .L137+8
	ldr	r7, .L137+12
	ldr	r8, .L137+16
	ldr	r9, .L137+20
	mov	r5, #0
	str	r0, [sp, #28]
	b	.L130
.L136:
	ldr	r3, [r8, #0]
	cmp	r3, #3
	bgt	.L122
	ldr	r2, [r4, #20]
	cmp	r2, #0
	beq	.L135
.L123:
	ldr	r3, [r7, #68]
	ldr	fp, .L137+24
	smull	ip, r2, fp, r3
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #2
	rsb	r2, r2, r2, asl #3
	cmp	r3, r2
	bne	.L126
	ldr	r3, [r4, #12]
	tst	r3, #1
	addeq	r3, r3, #1
	subne	r3, r3, #1
	streq	r3, [r4, #12]
	strne	r3, [r4, #12]
.L126:
	ldr	fp, [r4, #8]
	ldmda	r4, {r3, ip}
	add	ip, ip, r3
	ldr	r2, [r7, #8]
	ldr	r0, [r7, #0]
	ldr	lr, [r4, #-8]
	str	fp, [sp, #8]
	ldr	fp, [r4, #4]
	str	ip, [r4, #-4]
	str	ip, [sp, #4]
	ldr	r1, [r7, #4]
	mov	r0, r0, asr #8
	mov	r3, r2
	str	lr, [sp, #0]
	str	fp, [sp, #12]
	ldr	ip, .L137+28
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L128
	ldr	r3, [r9, #0]
	add	r3, r3, #1
	mov	r2, #0
	cmp	r3, #9
	str	r2, [r4, #20]
	str	r3, [r9, #0]
	bgt	.L133
	ldr	r2, .L137+32
	mov	r1, r3, asr #31
.L129:
	ldr	ip, .L137+36
	smull	fp, r0, ip, r3
	rsb	r1, r1, r0, asr #2
	add	r1, r1, r1, asl #2
	sub	r3, r3, r1, asl #1
	mov	r0, #16384
	ldr	r1, [sp, #28]
	ldr	ip, [r8, #0]
	mov	r3, r3, asl #6
	add	r0, r0, #187
	strh	r0, [r2, r1]	@ movhi
	add	r3, r3, #26
	mov	r1, #436
	strh	r3, [r2, r1]	@ movhi
	sub	ip, ip, #1
	mov	r3, #432
	mov	fp, #145	@ movhi
	str	ip, [r8, #0]
	strh	fp, [r2, r3]	@ movhi
.L128:
	ldr	r3, [r4, #-4]
	cmn	r3, #32
	ldrlt	r3, [r8, #0]
	movlt	r2, #0
	sublt	r3, r3, #1
	add	r5, r5, #1
	strlt	r2, [r4, #20]
	strlt	r3, [r8, #0]
	cmp	r5, #35
	add	r4, r4, #44
	beq	.L121
.L130:
	ldr	r3, [r6, #0]
	add	r3, r3, #1
	smull	r1, r2, sl, r3
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #7
	add	r1, r2, r2, asl #3
	rsb	r2, r2, r1, asl #3
	rsb	r2, r2, r2, asl #2
	cmp	r3, r2
	str	r3, [r6, #0]
	bne	.L136
.L122:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L123
	add	r5, r5, #1
	cmp	r5, #35
	add	r4, r4, #44
	bne	.L130
.L121:
	add	sp, sp, #36
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L133:
	ldr	r0, .L137+36
	smull	r1, fp, r0, r3
	mov	r1, r3, asr #31
	ldr	r2, .L137+32
	rsb	fp, r1, fp, asr #2
	mov	r0, #440
	mov	ip, #16384
	add	r0, r0, #2
	mov	fp, fp, asl #6
	add	ip, ip, #179
	strh	ip, [r2, r0]	@ movhi
	add	fp, fp, #26
	mov	r0, #444
	strh	fp, [r2, r0]	@ movhi
	mov	r0, #440
	mov	fp, #145	@ movhi
	strh	fp, [r2, r0]	@ movhi
	b	.L129
.L135:
	add	r0, r5, r5, asl #2
	ldr	r2, .L137+40
	add	r0, r5, r0, asl #1
	add	r1, r5, #15
	add	r2, r2, r0, asl #2
	mov	r1, r1, asl #4
	str	r1, [r2, #4]
	mov	r1, #1
	str	r1, [r2, #28]
	ldr	r2, .L137+16
	add	r3, r3, #1
	str	r3, [r2, #0]
	b	.L121
.L138:
	.align	2
.L137:
	.word	awards+8
	.word	timer
	.word	-1713954085
	.word	leo
	.word	awardActive
	.word	awardsCollected
	.word	-1840700269
	.word	collision
	.word	shadowOAM
	.word	1717986919
	.word	awards
	.size	updateAwards, .-updateAwards
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L152
	ldr	r4, .L152+4
	ldr	r2, [r3, #0]
	ldr	r1, [r4, #0]
	add	r2, r2, #1
	ldr	r5, .L152+8
	add	r1, r1, #1
	str	r2, [r3, #0]
	str	r1, [r4, #0]
	bl	updatePlayer
	ldr	r3, [r5, #0]
	cmp	r3, #1
	beq	.L147
	cmp	r3, #2
	beq	.L148
.L141:
	cmp	r3, #3
	beq	.L149
.L142:
	ldr	r2, [r4, #0]
	ldr	r3, .L152+12
	smull	r1, r3, r2, r3
	mov	r1, r2, asr #31
	rsb	r3, r1, r3, asr #4
	add	r1, r3, r3, asl #1
	add	r1, r3, r1, asl #2
	add	r3, r3, r1, asl #2
	cmp	r2, r3
	ldreq	r2, .L152+16
	ldreq	r3, [r2, #0]
	addeq	r3, r3, #1
	streq	r3, [r2, #0]
	ldrne	r3, .L152+16
	ldr	r2, .L152+20
	ldrne	r3, [r3, #0]
	ldr	r2, [r2, #0]
	cmp	r2, r3
	beq	.L150
.L145:
	ldr	r3, .L152+24
	ldr	r3, [r3, #0]
	cmp	r3, #19
	ble	.L139
	ldr	r3, [r5, #0]
	cmp	r3, #3
	beq	.L151
.L139:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L151:
	ldr	r3, .L152+8
	mov	r2, #4
	str	r2, [r3, #0]
	ldr	r3, .L152+28
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L139
.L150:
	ldr	r3, .L152+32
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L145
	ldr	r3, [r5, #0]
	cmp	r3, #2
	bgt	.L145
	ldr	r2, .L152+8
	add	r3, r3, #1
	str	r3, [r2, #0]
	ldr	r3, .L152+28
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L145
.L147:
	bl	updatePaps1
	ldr	r3, [r5, #0]
	cmp	r3, #2
	bne	.L141
.L148:
	bl	updatePaps1
	bl	updateFans
	ldr	r3, [r5, #0]
	cmp	r3, #3
	bne	.L142
.L149:
	bl	updatePaps1
	bl	updateFans
	bl	updateAwards
	b	.L142
.L153:
	.align	2
.L152:
	.word	fanTime
	.word	timer
	.word	level
	.word	1296593901
	.word	countDown
	.word	timeRemain
	.word	awardsCollected
	.word	notIntrod
	.word	lifeCount
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L155
	str	r4, [sp, #-4]!
	ldr	r1, [r3, #4]
	ldr	r4, [r3, #64]
	ldr	ip, [r3, #52]
	mov	r1, r1, asl #23
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	ldr	r2, .L155+4
	mvn	r1, r1, lsr #6
	add	r3, ip, r4, asl #5
	mvn	r1, r1, lsr #17
	mov	r3, r3, asl #2
	strh	r0, [r2, #0]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L156:
	.align	2
.L155:
	.word	leo
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawFans
	.type	drawFans, %function
drawFans:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L164
	stmfd	sp!, {r4, r5, r6}
	ldr	r1, .L164+4
	add	ip, r3, #520
	b	.L160
.L163:
	ldr	r5, [r3, #4]
	ldr	r2, [r3, #24]
	ldr	r0, [r3, #36]
	ldr	r4, [r3, #28]
	mov	r5, r5, asl #23
	ldrb	r6, [r3, #0]	@ zero_extendqisi2
	mov	r0, r0, asl #3
	add	r4, r2, r4, asl #5
	mvn	r5, r5, lsr #6
	add	r3, r3, #52
	add	r2, r1, r0
	mvn	r5, r5, lsr #17
	mov	r4, r4, asl #2
	cmp	r3, ip
	strh	r6, [r1, r0]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	beq	.L162
.L160:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	bne	.L163
	ldr	r2, [r3, #36]
	add	r3, r3, #52
	mov	r2, r2, asl #3
	mov	r0, #512	@ movhi
	cmp	r3, ip
	strh	r0, [r1, r2]	@ movhi
	bne	.L160
.L162:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L165:
	.align	2
.L164:
	.word	fans
	.word	shadowOAM
	.size	drawFans, .-drawFans
	.align	2
	.global	drawPaps
	.type	drawPaps, %function
drawPaps:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L179
	stmfd	sp!, {r4, r5, r6}
	ldr	r2, .L179+4
	add	ip, r3, #400
	b	.L169
.L176:
	ldr	r5, [r3, #-16]
	ldr	r1, [r3, #8]
	ldr	r0, [r3, #12]
	ldr	r4, [r3, #0]
	mov	r5, r5, asl #23
	ldrb	r6, [r3, #-20]	@ zero_extendqisi2
	mov	r0, r0, asl #3
	add	r4, r1, r4, asl #5
	mvn	r5, r5, lsr #6
	add	r3, r3, #40
	add	r1, r2, r0
	mvn	r5, r5, lsr #17
	mov	r4, r4, asl #2
	cmp	r3, ip
	strh	r6, [r2, r0]	@ movhi
	strh	r5, [r1, #2]	@ movhi
	strh	r4, [r1, #4]	@ movhi
	beq	.L175
.L169:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	bne	.L176
	ldr	r1, [r3, #12]
	add	r3, r3, #40
	mov	r1, r1, asl #3
	mov	r0, #512	@ movhi
	cmp	r3, ip
	strh	r0, [r2, r1]	@ movhi
	bne	.L169
.L175:
	ldr	r3, .L179+8
	add	ip, r3, #400
	b	.L172
.L178:
	ldr	r5, [r3, #-16]
	ldr	r1, [r3, #8]
	ldr	r0, [r3, #12]
	ldr	r4, [r3, #0]
	mov	r5, r5, asl #23
	ldrb	r6, [r3, #-20]	@ zero_extendqisi2
	mov	r0, r0, asl #3
	add	r4, r1, r4, asl #5
	mvn	r5, r5, lsr #6
	add	r3, r3, #40
	add	r1, r2, r0
	mvn	r5, r5, lsr #17
	mov	r4, r4, asl #2
	cmp	r3, ip
	strh	r6, [r2, r0]	@ movhi
	strh	r5, [r1, #2]	@ movhi
	strh	r4, [r1, #4]	@ movhi
	beq	.L177
.L172:
	ldr	r1, [r3, #16]
	cmp	r1, #0
	bne	.L178
	ldr	r1, [r3, #12]
	add	r3, r3, #40
	mov	r1, r1, asl #3
	mov	r0, #512	@ movhi
	cmp	r3, ip
	strh	r0, [r2, r1]	@ movhi
	bne	.L172
.L177:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L180:
	.align	2
.L179:
	.word	bendPaps+20
	.word	shadowOAM
	.word	paps+20
	.size	drawPaps, .-drawPaps
	.align	2
	.global	drawLives
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L184
	ldr	r3, [r0, #20]
	ldr	r2, .L185
	mov	r3, r3, asl #3
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
.L181:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L184:
	ldr	ip, [r0, #4]
	add	r2, r0, #20
	ldmia	r2, {r2, r3, r5}	@ phole ldm
	ldr	r1, .L185
	mov	ip, ip, asl #23
	ldrb	r4, [r0, #0]	@ zero_extendqisi2
	mov	r2, r2, asl #3
	add	r0, r3, r5, asl #5
	mov	ip, ip, lsr #23
	add	r3, r1, r2
	orr	ip, ip, #16384
	mov	r0, r0, asl #2
	strh	r4, [r1, r2]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	b	.L181
.L186:
	.align	2
.L185:
	.word	shadowOAM
	.size	drawLives, .-drawLives
	.align	2
	.global	drawAwards
	.type	drawAwards, %function
drawAwards:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	ldr	r3, .L194
	ldr	ip, .L194+4
	ldr	r1, .L194+8
	b	.L190
.L193:
	ldr	r5, [r3, #-16]
	ldr	r2, [r3, #0]
	ldr	r0, [r3, #12]
	ldr	r4, [r3, #4]
	mov	r5, r5, asl #23
	ldrb	r6, [r3, #-20]	@ zero_extendqisi2
	mov	r0, r0, asl #3
	add	r4, r2, r4, asl #5
	mov	r5, r5, lsr #23
	add	r3, r3, #44
	add	r2, r1, r0
	orr	r5, r5, #16384
	mov	r4, r4, asl #1
	cmp	r3, ip
	strh	r6, [r1, r0]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	beq	.L192
.L190:
	ldr	r2, [r3, #8]
	cmp	r2, #0
	bne	.L193
	ldr	r2, [r3, #12]
	add	r3, r3, #44
	mov	r2, r2, asl #3
	mov	r0, #512	@ movhi
	cmp	r3, ip
	strh	r0, [r1, r2]	@ movhi
	bne	.L190
.L192:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L195:
	.align	2
.L194:
	.word	awards+20
	.word	awards+1560
	.word	shadowOAM
	.size	drawAwards, .-drawAwards
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L206
	ldr	r3, [r4, #0]
	cmp	r3, #1
	beq	.L203
	cmp	r3, #2
	beq	.L204
.L198:
	cmp	r3, #3
	beq	.L205
.L199:
	ldr	r5, .L206+4
	ldr	r3, [r5, #0]
	cmp	r3, #0
	blt	.L200
	ldr	r6, .L206+8
	mov	r4, #0
.L201:
	add	r0, r6, r4, asl #5
	bl	drawLives
	ldr	r3, [r5, #0]
	add	r4, r4, #1
	cmp	r3, r4
	bge	.L201
.L200:
	bl	drawPlayer
	mov	r0, #3
	ldr	r1, .L206+12
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L206+16
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L203:
	bl	drawPaps
	ldr	r3, [r4, #0]
	cmp	r3, #2
	bne	.L198
.L204:
	bl	drawFans
	bl	drawPaps
	ldr	r3, [r4, #0]
	cmp	r3, #3
	bne	.L199
.L205:
	mov	fp, #16384
	bl	drawFans
	mov	sl, fp
	bl	drawPaps
	mov	r7, fp
	bl	drawAwards
	mov	r5, fp
	ldr	r3, .L206+12
	mov	r1, fp
	mov	r9, #400
	mov	r8, #408
	mov	r6, #416
	mov	r4, #448
	mov	r2, #456
	add	r4, r4, #2
	add	r2, r2, #2
	add	r1, r1, #216
	mov	lr, #664
	add	r9, r9, #2
	add	fp, fp, #132
	add	r8, r8, #2
	add	sl, sl, #148
	add	r6, r6, #2
	add	r7, r7, #164
	add	r5, r5, #200
	strh	fp, [r3, r9]	@ movhi
	add	lr, lr, #2
	strh	sl, [r3, r8]	@ movhi
	mov	ip, #668
	strh	r7, [r3, r6]	@ movhi
	strh	r5, [r3, r4]	@ movhi
	strh	r1, [r3, r2]	@ movhi
	mov	r4, #404
	mov	r1, #145	@ movhi
	mov	r2, #400
	strh	r1, [r3, r2]	@ movhi
	strh	lr, [r3, r4]	@ movhi
	add	ip, ip, #2
	mov	r2, #408
	mov	r0, #728
	mov	lr, #420
	strh	r1, [r3, r2]	@ movhi
	strh	ip, [r3, lr]	@ movhi
	mov	r2, #412
	mov	r1, #668	@ movhi
	add	r0, r0, #2
	mov	ip, #452
	strh	r0, [r3, ip]	@ movhi
	strh	r1, [r3, r2]	@ movhi
	mov	r1, #145	@ movhi
	mov	r2, #416
	strh	r1, [r3, r2]	@ movhi
	mov	r2, #448
	strh	r1, [r3, r2]	@ movhi
	mov	r2, #456
	strh	r1, [r3, r2]	@ movhi
	mov	r2, #460
	mov	r1, #732	@ movhi
	strh	r1, [r3, r2]	@ movhi
	b	.L199
.L207:
	.align	2
.L206:
	.word	level
	.word	lifeCount
	.word	lives
	.word	shadowOAM
	.word	DMANow
	.size	drawGame, .-drawGame
	.align	2
	.global	drawScore
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r2, r0, r0, asl #29
	mov	r2, r2, asl #3
	add	r2, r2, #187
	ldr	r3, .L209
	add	r0, r0, #54
	mov	r2, r2, asl #23
	mov	r0, r0, asl #3
	mov	r2, r2, lsr #23
	add	ip, r3, r0
	orr	r2, r2, #16384
	mov	r1, r1, asl #6
	add	r1, r1, #26
	strh	r2, [ip, #2]	@ movhi
	mov	r2, #145	@ movhi
	strh	r1, [ip, #4]	@ movhi
	strh	r2, [r3, r0]	@ movhi
	bx	lr
.L210:
	.align	2
.L209:
	.word	shadowOAM
	.size	drawScore, .-drawScore
	.comm	lifeCount,4,4
	.comm	timer,4,4
	.comm	countDown,4,4
	.comm	level,4,4
	.comm	timeRemain,4,4
	.comm	isMeryl,4,4
	.comm	notIntrod,4,4
	.comm	soundA,32,4
	.comm	soundB,32,4
	.comm	vbCountA,4,4
	.comm	vbCountB,4,4
	.comm	timeForFan,4,4
	.comm	timeForPaps,4,4
	.comm	timeForSnap,4,4
	.comm	papActive,4,4
	.comm	fanActive,4,4
	.comm	awardActive,4,4
	.comm	awardsCollected,4,4
	.comm	fanTime,4,4
	.comm	leo,72,4
	.comm	fans,520,4
	.comm	bendPaps,400,4
	.comm	paps,400,4
	.comm	lives,96,4
	.comm	awards,1540,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
