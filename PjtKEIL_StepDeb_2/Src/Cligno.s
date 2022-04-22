	PRESERVE8
	THUMB   
		

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly
	include ./Driver/DriverJeuLaser.inc

;Section RAM (read write):
	area    maram,data,readwrite
		
flagcligno dcd 0
	
; ===============================================================================================
	


		
;Section ROM code (read only) :		
	area    moncode,code,readonly
; écrire le code ici
	export flagcligno 
	export timer_callback

timer_callback proc
	mov r0,#1 ;
	ldr r1,=flagcligno 
	mov r2,#0
	cmp r1,r0
	beq toto
	str r0,[r1] 
	push {lr}
	bl GPIOB_Set
	pop {lr}
	bx lr
toto
	push {lr}
	str r2,[r1]
	bl GPIOB_Clear
	pop {lr}
	bx lr
	endp
	
	END	