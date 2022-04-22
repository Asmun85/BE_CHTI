	PRESERVE8
	THUMB   
		

; ====================== zone de réservation de données,  ======================================
;Section RAM (read only) :
	area    mesdata,data,readonly

;Section RAM (read write):
	area    maram,data,readwrite
		
	 
	
; ===============================================================================================
	
OS_SIZE equ 2
Max_ech equ 5512
SortieSon dcd 1	
Index dcd 0	
;Section ROM code (read only) :		
	area    moncode,code,readonly
	extern Son 
	export CallBackSon
	export Index
	export SortieSon

; écrire le code ici		

CallBackSon proc
	
	push {lr}
	ldr r0,=SortieSon ; r0 = &SortieSon
	ldr r1,=Son ; r1 = &son
	ldr r2,=Index ; r2 = &index
	ldr r3,[r2] ; r3 = index
	
	ldrsh r12,[r1,r3] ; r12=son[index]
	
	mov r3,#91
	sdiv r12,r3
	mov r3,#320
	add r12,r3
	
	str r12,[r0]
	
	ldr r12,=Max_ech
	ldr r3,[r2]
	cmp r3,r12
	it lt
	addlt r3,#OS_SIZE
	str r3,[r2] ; r2 = r3 (nouvel index)
	pop {lr}
	bx lr
	endp
		
	END	
