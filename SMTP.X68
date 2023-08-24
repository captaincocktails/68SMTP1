*-----------------------------------------------------------
* Title      :SMTP
* Written by :88M       
* Date       :27.11.2021
* Description:
*-----------------------------------------------------------
    ORG	    $0 
    
    DC.L $00FFFFF8      0 ” ¿«¿“≈À‹ —“≈ ¿
    DC.L START          1 —“¿–“Œ¬€… ¿ƒ–≈— œ–Œ√–¿ÃÃ€
    DC.L INT            2 Œÿ»¡ ¿ ÿ»Õ€
    DC.L INT            3 Œÿ»¡ ¿ ¿ƒ–≈—¿
    DC.L ILLEGALINT     4 Õ≈œ–¿¬»À‹Õ¿ﬂ »Õ—“–” ÷»ﬂ
    DC.L DIVIDE0        5 ƒ≈À≈Õ»≈ Õ¿ ÕŒÀ‹
    DC.L INT            6 CHK exception
    DC.L INT            7 TRAPV TRAP ON OVERFLOW
    DC.L INT            8 Õ¿–”ÿ≈Õ»≈ œ–¿¬
    DC.L INT            9 TRACE EXEPTION
    DC.L INT           10 LINE-A EMULATION
    DC.L INT           11 LINE-F EMULATION
    DC.L INT           12 REVERSED
    DC.L INT           13 REVERSED
    DC.L INT           14 FORMAT ERROR
    DC.L INT           15 Õ≈»—œŒÀ‹«”≈Ã€… ¬≈ “Œ– œ–≈–€¬¿Õ»…
    DC.L INT           16 REVERSED
    DC.L INT           17 REVERSED
    DC.L INT           18 REVERSED
    DC.L INT           19 REVERSED
    DC.L INT           20 REVERSED 
    DC.L INT           21 REVERSED
    DC.L INT           22 REVERSED
    DC.L INT           23 REVERSED  
    DC.L INT           24 SPURIUS INT
    DC.L INT           25 1 LEVEL INT
    DC.L INT           26 2 LEVEL INT 
    DC.L INT           27 3 LEVEL INT
    DC.L VIDEOINTH     28 4 LEVEL INT √Œ–»«ŒÕ“¿À‹ÕŒ≈ œ–≈–€¬¿Õ»≈ VDP
    DC.L INT           29 5 LEVEL INT 
    DC.L VIDEOINTV     30 6 LEVEL INT ¬≈–“» ¿À‹ÕŒ≈ œ–≈–€¬¿Õ»≈ VDP
            
    ;*¡‡Î‡ÒÚ Á‡·ËÚ˚È ÙÛÌÍˆËˇÏË        
RTBLOGOTILEMAP
    INCBIN "tilemap\res\RTBLOGOTILEMAP.BIN"    
    
VBLANKEND *Œ∆»ƒ¿Õ»≈ Õ¿◊¿À¿ ¬≈–“» ¿À‹ÕŒ… —»Õ’–ŒÕ»«¿÷»»
    MOVE.L D0,-(A7)
.L  MOVE.W VDPCONTROL,D0
    AND.W #%0000000000001000,D0
    BNE .L
    MOVE.L (A7)+,D0
    RTS
    
VBLANKSTART *Œ∆»ƒ¿Õ»≈  ŒÕ÷¿ ¬≈–“» ¿À‹ÕŒ… —»Õ’–ŒÕ»«¿÷»»
    MOVE.L D0,-(A7)
.L
    MOVE.W VDPCONTROL,D0
    AND.W #%0000000000001000,D0
    BEQ .L  
    MOVE.L (A7)+,D0  
    RTS
    
HBLANKSTART
    MOVE.W VDPCONTROL,D0
    AND.W #%0000000000000100,D0
    BEQ HBLANKSTART
    RTS
    
DMAWAIT
    MOVE.W VDPCONTROL,D5
    AND.W #%0000000000000010,D5  
    BNE DMAWAIT
    move.w #$8F02,VDPCONTROL
    RTS
PREPVRAM *¬€◊»—À≈Õ»≈ ¿ƒ–≈—¿ ¬»ƒ≈Œœ¿Ãﬂ“» ¬ D6 » œ≈–≈ÕŒ— ≈√Œ ¬ ”œ–¿¬ÀﬂﬁŸ»… œŒ–“ VDP
    MOVEM.L D0-D7/A0-A7,-(A7)
    MOVE.L D6,D0
    AND.W #%1100000000000000,D0
    ROL.W #2,D0
    
    AND.L #%0011111111111111,D6
    ROL.L #8,D6
    ROL.L #8,D6
    

    OR.L D0,D6
    OR.L #$40000000,D6
    
    MOVE.L D6,(VDPCONTROL)
    MOVEM.L (A7)+,D0-D7/A0-A7
    RTS
    
    DC.L '    '
    DC.B '  '
    
    
    
    
    
;*================================================================================================================    
    DC.B 'SEGA MEGA DRIVE ' ;“»œ —»—“≈Ã€
    DC.B 'CL RTB 2022.XXX '  ; Œœ»À≈‘“
    DC.B 'SEGA MEGA TOUHOU PROJECT                        ' ;Õ¿«¬¿Õ»≈ Ã≈—“ÕŒ≈
    DC.B 'SEGA MEGA TOUHOU PROJECT                        ' ;Õ¿«¬¿Õ»≈ «¿–”¡≈∆ÕŒ≈
    DC.B 'GM 88888888-88' ;—≈–»…Õ€… ÕŒÃ≈–
    DC.B '00' ; ŒÕ“–ŒÀ‹Õ¿ﬂ —”ÃÃ¿
    DC.B '6               ' ;œŒƒƒ≈–∆ ¿  ŒÕ“–ŒÀÀ≈–Œ¬
    DC.L $000000    ¿ƒ–≈— œ«” Õ¿◊¿ÀŒ
    DC.L $3FFFFF     ŒÕ≈÷ œ«”
    DC.L $FF0000    ¿ƒ–≈— Œ«” Õ¿◊¿ÀŒ
    DC.L $FFFFFF     ŒÕ≈÷ Œ«”
    ORG $1B0
    DC.L ' ' ƒŒœ œ¿Ãﬂ“‹
    ORG $1BC
    DC.L ' ' ÃŒƒ≈Ã
    ORG $1C8
    DC.L ' ' –≈«≈–¬
    ORG $1F0
    DC.B 'E' –≈√»ŒÕ
*==================================================================
*                               Z80
*   Z80RAM equ $A00000 Õ¿◊¿ÀŒ œ¿Ãﬂ“» Z80
* ŒÕ≈÷ Œ«” $A0FFFF
*   Z80RES equ $A11200 —¡–Œ— Z80 #$000 WORD
*==================================================================
*                               VDP
VDPCONTROL equ $C00004      ”œ–¿¬ÀﬂﬁŸ»… œŒ–“
VDPDATA    equ $C00000      œŒ–“ ƒÀﬂ ƒ¿ÕÕ€’
VDPHV      equ $C00008      —Œ—“ŒﬂÕ»≈ –¿«¬®–“ »
VRAM       equ $40000000    ¬»ƒ≈Œœ¿Ãﬂ“‹
CRAM       equ $C0000000    œ¿À»“–Œœ¿Ãﬂ“‹ 
VSRAM      equ $40000010    ¬≈–“» ¿À‹Õ€… — –ŒÀÀ œ¿Ãﬂ“‹ 4=«‡ÔËÒ¸/0=◊ÚÂÌËÂ 
TILEA      equ $40000003    “¿…ÀÃ¿œ ¿
TILEB      equ $60000003    “¿…ÀÃ¿œ ¬
WINDOWTILE equ $70000003    “¿…ÀÃ¿œ Œ Õ¿
*                           VRAM ADDRESS
VRAMTILES    equ $0000 *-BFFF ¿ƒ–≈— “¿…ÀŒ¬ 
VRAMTILEMAPA equ $C000 *-D7FF “¿…ÀÃ¿œ ¿
VRAMSPRITE   equ $D800 *-DFFF ¿“–»¡”“€ —œ–¿…“Œ¬
VRAMTILEMAPB equ $E000 *-EFFF “¿…ÀÃ¿œ ¬
VRAMWINDOW   equ $F000 *-FBFF “¿…ÀÃ¿œ Œ Õ¿
VRAMHSCROLL  equ $DC00 * — –ŒÀÀ √Œ–»«ŒÕ“¿À‹Õ€…
   
*==================================================================
*                        68K
RAM     equ $FF0000 
* ŒÕ≈÷ œ¿Ãﬂ“» $FFFFFF
*=================================================================                        
    
    ORG	    $0200        
    
START 
    
*    MOVE.L #VRAMTILES+15,D6
*    JSR PREPVRAMREAD  ÓÚÎ‡‰Ó˜Ì‡ˇ ÙÛÌÍˆËˇ ‰Îˇ ÂÏÓÌÚ‡ prevram
*CHECK:    
*   CMPI.W #$100, (Z80BUS) œ–Œ¬≈– ¿ ÿ»Õ€
*    BNE.S CHECK


    
   * MOVE.W #$100,Z80BUS «¿œ–¿ÿ»¬¿≈Ã ÿ»Õ” Z80
   * MOVE.W #$000,Z80RES ”—“¿Õ¿¬À»¬≈Ã —¡–Œ— Z80




    
    
*Õ¿—“–¿»¬¿≈Ã VDP
    MOVE.W #$8000,D2  ”—Œ  ƒ¿ÕÕ€’ –≈√»—“–Œ¬ 
    MOVEQ #24,D1 ƒÀ»ÕÕ¿ VDPSETUP            
    LEA VDPSETUP,A0 «¿√–”« ¿ ¿ƒ–≈—¿ VDPSETUP
    MOVE.W (VDPCONTROL),D0 ◊»“¿≈Ã —Œ—“ŒﬂÕ»≈ VDP
    
LOOP0    
    MOVE.B (A0)+,D2 ¡≈–®Ã  ”—Œ  ƒ¿ÕÕ€’ œŒ ¿ƒ–≈—” A0 »  À¿ƒ®Ã ¬ D2 ¿ƒ–≈— ”¬≈À»◊»¬¿≈Ã Õ¿ 1 ¡¿…“
    MOVE.W D2,(VDPCONTROL) ¡≈–®Ã D2 œ≈–≈—€À¿≈Ã ¬ ”œ–¿¬À≈Õ»≈ VDP
    
    ADD.W #$0100,D2 ƒŒ¡¿¬Àﬂ≈Ã 100 ◊“Œ¡ œŒÀ”◊»“‹ —À≈ƒ”ﬁŸ»… –≈√»—“– VDP
    DBRA D1,LOOP0 ÷» À»Ã—ﬂ œŒ ¿ ¬ ƒÀ»ÕÕ≈ D1 Õ≈ ¡”ƒ≈“ 0
    
*------------------------------------------------------------------------------------------------------    
   


    
*===================================================================================       
    
*LOOP * Œƒ ƒÀﬂ œ–Œ¬≈– » Õ¿∆¿“»ﬂ  ÕŒœŒ  ƒÀﬂ ¬€«Œ¬¿ ÕŒ–Ã¿À‹ÕŒ√Œ ÃŒÕ»“Œ–¿
*    LEA LOOP,A6 —Œ’–¿Õ»Ã ¿ƒ–≈— ¬Œ«¬–¿“¿   
*    JSR VBLANKSTART ∆‰∏Ï Ì‡˜‡Î‡ ‚ÂÚËÍ‡Î¸ÌÓÈ ÒËÌıÓÌËÁ‡ˆËË    
*    JSR Player_ReadControlsDual —◊»“€¬¿≈Ã ƒ∆Œ…—“» 
*    CMP.L #$FFFFFD7F,D0 —–¿¬Õ»¬¿≈Ã  ŒÃ¡»Õ¿÷»ﬁ X+START    
*    BEQ MONITOR ≈—À» —Œ¬œ¿ƒ≈Õ»≈ œ≈–≈’Œƒ»Ã ¬ ÃŒÕ»“Œ–    
*    JSR VBLANKEND Ê‰∏Ï ÍÓÌÂˆ ‚ÂÚËÍ‡Î¸ÌÓÈ ÒËÌıÓÌËÁ‡ˆËË
*    JMP LOOP 
*===================================================================================
    MOVE.W #$8F01,(VDPCONTROL) ”—“¿Õ¿¬À»¬¿≈Ã ¿¬“Œ —ÀŒ∆≈Õ»≈ ¬ VDP Õ¿ 1, 16 ¡»“ÕŒ≈ —ÀŒ¬Œ
    *JSR CLEARTILEMAPA
    *JSR CLEARTILES
    *JSR CLEARTILEMAPB
    JSR MEMINIT
    
    MOVE.W #$8F02,(VDPCONTROL) ◊»—“»Ã œ¿Ãﬂ“‹ Õ¿ ¬—ﬂ »… —À”◊¿… =)


    PEA sampbank
    PEA seqbank
    PEA envbank
    PEA patchbank


    PEA RTBLOGO

    JMP gemsinit


    *bra RTBLOGO *œ–Œ√–¿ÃÃ¿ ÀŒ√Œ“»œ¿
    

    
    

*==========================================================================================


    
    
VDPSETUP
    DC.B $04 00  MODE REGISTER 1
    DC.B $5C 01  MODE REGISTER 2 $44 (5C)
    DC.B $30 02  SCROLL A $C000
	DC.B $3C 03  SCROLL WINDOW $F000
	DC.B $07 04  SCROLL B $E000
	DC.B $6C 05  SPRITE ATRIBUTE $D800
	DC.B $00 06  Õ≈ »—œŒÀ‹«”≈“—ﬂ										
	DC.B $00 07  BACKGROUND COLOR
	DC.B $00 08  Õ≈ »—œŒÀ‹«”≈“—ﬂ	
	DC.B $00 09  Õ≈ »—œŒÀ‹«”≈“—ﬂ	
	DC.B $F0 10  H INT
	DC.B $00 11  MODE REGISTER 3
	DC.B $81 12  MODE REGISTER 4 $81
	DC.B $37 13  H SCROLL
	DC.B $00 14  Õ≈ »—œŒÀ‹«”≈“—ﬂ	
	DC.B $02 15  AUTO INC
	DC.B $01 16  SCROLL SIZE
	DC.B $00 17  WINDOW H POSITION
	DC.B $00 18  WINDOW V POSITION
	DC.B $FF 19  œƒœ ƒÀ»ÕÕ¿ Õ¿◊¿ÀŒ
	DC.B $FF 20  œƒœ ƒÀ»ÕÕ¿  ŒÕ≈÷
	DC.B $00 21  œƒœ Œ“ ”ƒ¿ ¿ƒ–≈— Õ»∆Õ»… ¡¿…“
	DC.B $00 22  œƒœ Œ“ ”ƒ¿ ¿ƒ–≈— —–≈ƒÕ»… ¡¿…“
	DC.B $80 23  œƒœ Œ“ ”ƒ¿ ¿ƒ–≈— ¬≈–’Õ»… ¡¿…“+”œ–¿¬ÀﬂﬁŸ»≈ ¡¿…“€
	
INT *«¿“€◊ ¿ œ–≈–€¬¿Õ»…
    RTE	

VIDEOINTH
    JMP (A5) Œ¡–¿¡Œ“◊»  ¬»ƒ≈Œœ–≈–€¬¿Õ»… √Œ–»«ŒÕ“¿À‹Õ€’
VIDEOINTV
    JMP (A4) Œ¡–¿¡Œ“◊»  ¬»ƒ≈Œœ–≈–€¬¿Õ»… ¬≈–“» ¿À‹Õ€’
    
PREPVRAMREAD *¬€◊»—À≈Õ»≈ ¿ƒ–≈—¿ ¬»ƒ≈Œœ¿Ãﬂ“» ¬ D6 ƒÀﬂ ◊“≈Õ»ﬂ
    MOVEM.L D0-D7/A0-A7,-(A7)
    MOVE.L D6,D0
    AND.W #%1100000000000000,D0
    ROL.W #2,D0
    
    AND.L #%0011111111111111,D6
    ROL.L #8,D6
    ROL.L #8,D6
    
    OR.L D0,D6
    OR.L #$00000000,D6
    
    MOVE.L D6,(VDPCONTROL)
    MOVEM.L (A7)+,D0-D7/A0-A7
    RTS
MEMINIT
    LEA RAM,A0
    LEA VDPCONTROL,A1
    LEA VDPDATA,A2
    MOVE.W #$3FFB,D0
    CLR.L D1

    move.w #$8F01,(A1)
    move.w #$93FF,(A1)
    move.w #$94FF,(A1)
    move.w #$9780,(A1)
    move.l #$40000080,(A1)
    move.w #$0000,(A2) *«¿◊»—“ ¿ ¬»ƒ≈Œœ¿Ãﬂ“»
.L    
    CLR.L (A0)+
    DBRA D0,.L          *«¿◊»—“ ¿ RAM
    JSR DMAWAIT
    MOVE.L #$40000010,(A1)  *«¿◊»—“ ¿ VSRAM
    MOVE.W #19,D0
.L2    
    MOVE.L D1,(A2)
    DBRA D0,.L2
    MOVE.W #31,D0
    MOVE.L #$C0000000,(A1)  *«¿◊»—“ ¿ CRAM 
.L3
    MOVE.L D1,(A2)
    DBRA D0,.L3
    
    RTS
CLEARTILES
    MOVEM.L D0-D7/A0-A7,-(A7) —Œ’–¿Õﬂ≈Ã –≈√»—“–€ ¬ —“¿ 
*    MOVE.W #$8F01,(VDPCONTROL) ”—“¿Õ¿¬À»¬¿≈Ã ¿¬“Œ —ÀŒ∆≈Õ»≈ ¬ VDP Õ¿ 1, 16 ¡»“ÕŒ≈ —ÀŒ¬Œ
.L    
    MOVE.W VDPCONTROL,D0
    BTST #1,D0
    BNE .L
    
    MOVE.W #$9300+(($01FE>>1)&$FF),(VDPCONTROL)  ^Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $0xxx 1ff max
    MOVE.W #$9400+((($17F00>>1)&$FF00)>>8),(VDPCONTROL) ¿ƒ–≈—¿ ƒÀ»ÕÕ€ DMA ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $xx00
    
    MOVE.W #$9780,(VDPCONTROL) “»œ DMA
    MOVE.L #$40000080+(($0000&$3FFF)<<16)+(($0000&$C000)>>14),(VDPCONTROL) ¿ƒ–≈— Õ¿«Õ¿◊≈Õ»ﬂ $XXXX&$3FFF) - ($XXXX&$C000)
    
    MOVE.W #$0000,(VDPDATA) «Õ¿◊≈Õ»≈ ƒÀﬂ «¿œŒÀÕ≈Õ»ﬂ #$yy00
    MOVEM.L (A7)+,D0-D7/A0-A7 ¬Œ«¬–¿Ÿ¿≈Ã –≈√»—“–€ »« —“¿ ¿
*    MOVE.W #$8F02,(VDPCONTROL) ¬Œ«¬–¿Ÿ¿≈Ã ¿¬“Œ—ÀŒ∆≈Õ»≈ Õ¿ 2, 32’ ¡»“ÕŒ≈ —ÀŒ¬Œ
    RTS 
    
CLEARTILEMAPA  *Œ“◊»—“ ¿ “¿…ÀÃ¿œ¿ ¿
    MOVEM.L D0-D7/A0-A7,-(A7) —Œ’–¿Õﬂ≈Ã –≈√»—“–€ ¬ —“¿ 
*    MOVE.W #$8F01,(VDPCONTROL) ”—“¿Õ¿¬À»¬¿≈Ã ¿¬“Œ —ÀŒ∆≈Õ»≈ ¬ VDP Õ¿ 1, 16 ¡»“ÕŒ≈ —ÀŒ¬Œ
.L    
    MOVE.W VDPCONTROL,D0
    BTST #1,D0
    BNE .L
    
    MOVE.W #$9300+(($01FE>>1)&$FF),(VDPCONTROL)  ^Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $0xxx 1ff max
    MOVE.W #$9400+((($1F00>>1)&$FF00)>>8),(VDPCONTROL) ¿ƒ–≈—¿ ƒÀ»ÕÕ€ DMA ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $xx00
    
    MOVE.W #$9780,(VDPCONTROL) “»œ DMA
    MOVE.L #$40000080+(($C000&$3FFF)<<16)+(($C000&$C000)>>14),(VDPCONTROL) ¿ƒ–≈— Õ¿«Õ¿◊≈Õ»ﬂ $C000&$3FFF) - ($D7FF&$C000)
    
    MOVE.W #$0000,(VDPDATA) «Õ¿◊≈Õ»≈ ƒÀﬂ «¿œŒÀÕ≈Õ»ﬂ #$yy00 «¿œ”— ¿≈Ã DMA
    MOVEM.L (A7)+,D0-D7/A0-A7 ¬Œ«¬–¿Ÿ¿≈Ã –≈√»—“–€ »« —“¿ ¿
*    MOVE.W #$8F02,(VDPCONTROL) ¬Œ«¬–¿Ÿ¿≈Ã ¿¬“Œ—ÀŒ∆≈Õ»≈ Õ¿ 2, 32’ ¡»“ÕŒ≈ —ÀŒ¬Œ
    RTS   
    

CLEARTILEMAPB         *Œ“◊»—“ ¿ “¿…ÀÃ¿œ¿ ¬
    MOVEM.L D0-D7/A0-A7,-(A7) —Œ’–¿Õﬂ≈Ã –≈√»—“–€ ¬ —“¿ 
*   MOVE.W #$8F01,(VDPCONTROL) ”—“¿Õ¿¬À»¬¿≈Ã ¿¬“Œ —ÀŒ∆≈Õ»≈ ¬ VDP Õ¿ 1, 16 ¡»“ÕŒ≈ —ÀŒ¬Œ
.L    
    MOVE.W VDPCONTROL,D0
    BTST #1,D0
    BNE .L
    
    MOVE.W #$9300+(($01FC>>1)&$FF),(VDPCONTROL)  ^Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $0xxx 1ff max
    MOVE.W #$9400+((($1F00>>1)&$FF00)>>8),(VDPCONTROL) ¿ƒ–≈—¿ ƒÀ»ÕÕ€ DMA ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $xx00
    
    MOVE.W #$9780,(VDPCONTROL) “»œ DMA
    MOVE.L #$40000080+(($E000&$3FFF)<<16)+(($E000&$C000)>>14),(VDPCONTROL) ¿ƒ–≈— Õ¿«Õ¿◊≈Õ»ﬂ $C000&$3FFF) - ($D7FF&$C000)
    
    MOVE.W #$0000,(VDPDATA) «Õ¿◊≈Õ»≈ ƒÀﬂ «¿œŒÀÕ≈Õ»ﬂ #$yy00
    MOVEM.L (A7)+,D0-D7/A0-A7 ¬Œ«¬–¿Ÿ¿≈Ã –≈√»—“–€ »« —“¿ ¿
*    MOVE.W #$8F02,(VDPCONTROL) ¬Œ«¬–¿Ÿ¿≈Ã ¿¬“Œ—ÀŒ∆≈Õ»≈ Õ¿ 2, 32’ ¡»“ÕŒ≈ —ÀŒ¬Œ
    RTS 
    
STOP
    JMP STOP

Player_ReadControlsDual:		;D0=1up D1=2up ---7654S321RLDU 
*0 ·ËÚ UP
*1 ·ËÚ DOWN
*2 ·ËÚ LEFT
*3 ·ËÚ RIGHT

*4 ·ËÚ A
*5 ·ËÚ B
*6 ·ËÚ C
*7 ·ËÚ START

*8 ·ËÚ Y
*9 ·ËÚ X
*10 ·ËÚ MODE
*11 ·ËÚ Z
	
*	move.b #%01000000,($A1000B)	; Set direction IOIIIIII (I=In O=Out)
*	move.l #$A10005,a0			;RW port for player 2
*	jsr Player_ReadOne			;Read buttons
	
	move.l d0,-(sp)
		move.b #%01000000,($A10009)	; Set direction IOIIIIII (I=In O=Out)
		move.l #$A10003,a0		;RW port for player 1
		jsr Player_ReadOne		;Read buttons
	move.l (sp)+,d1
	
KeyboardScanner_AllowJoysticks:
	rts
	
Player_ReadOne:			;Read in and reformat a players buttons
	move.b  #$40,(a0)	; TH = 1
	nop		;Delay
	nop
	move.b  (a0),d2		; d0.b = --CBRLDU	Store in D2
	
	move.b	#$0,(a0)	; TH = 0
	nop		;Delay
	nop
	move.b	(a0),d1		; d1.b = --SA--DU	Store in D1
	
	move.b  #$40,(a0)	; TH = 1
	nop		;Delay
	nop
	move.b	#$0,(a0)	; TH = 0
	nop		;Delay
	nop
	move.b  #$40,(a0)	; TH = 1
	nop		;Delay
	nop
	move.b	(a0),d3		; d1.b = --CBXYZM	Store in D3
	move.b	#$0,(a0)	; TH = 0
	
	clr.l d0			;Clear buildup byte
	roxr.b #1,d2
	roxr.b #1,d0			;U
	roxr.b #1,d2
	roxr.b #1,d0			;D
	roxr.b #1,d2
	roxr.b #1,d0			;L
	roxr.b #1,d2
	roxr.b #1,d0			;R
	roxr.b #5,d1
	roxr.b #1,d0			;A
	roxr.b #1,d2
	roxr.b #1,d0			;B
	roxr.b #1,d2
	roxr.b #1,d0			;C
	roxr.b #1,d1
	roxr.b #1,d0			;S
	
	move.l d3,d1
	roxl.l #7,d1		;XYZ
	and.l #%0000011100000000,d1
	or.l d1,d0			
	
	move.l d3,d1
	roxl.l #8,d1		;M
	roxl.l #3,d1		
	and.l #%0000100000000000,d1
	or.l d1,d0
	
	or.l #$FFFFF000,d0	;Set unused bits to 1
	rts

*===========================================================================================================
FONT INCBIN "tilemap\res\fonttilesnemesis.bin"
MENUBGTILES INCBIN "tilemap\res\menubgtiles.bin" 
MENUBGTILEMAP INCBIN "tilemap\res\menubgtilemap.bin"
*===========================================================================================================








; ---------------------------------------------------------------------------
; Nemesis decompression subroutine, decompresses art directly to VRAM
; Inputs:
; a0 = art address
; a VDP command to write to the destination VRAM address must be issued
; before calling this routine
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================


Nem_Decomp:
		movem.l	d0-a1/a3-a5,-(sp)
		lea	Nem_PCD_WriteRowToVDP,a3
		lea	VDPDATA,a4	; write all rows to the VDP data port
		bra.s	Nem_Decomp_Main
; End of function Nem_Decomp

; ---------------------------------------------------------------------------
; Nemesis decompression subroutine, decompresses art to RAM
; Inputs:
; a0 = art address
; a4 = destination RAM address
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================


Nem_Decomp_To_RAM:
		movem.l	d0-a1/a3-a5,-(sp)
		lea	Nem_PCD_WriteRowToRAM,a3
; End of function Nem_Decomp_To_RAM

; ---------------------------------------------------------------------------
; Main Nemesis decompression subroutine
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================


Nem_Decomp_Main:
		lea	$FFA000,a1 *nemcodetable ¿ƒ–≈—  ŒƒŒ¬Œ… “¿¡À»÷€ ¬ RAM
		move.w	(a0)+,d2	; get number of patterns
		lsl.w	#1,d2
		bcc.s	PLUS	 *branch if the sign bit isn't set
		adda.w	#Nem_PCD_WriteRowToVDP_XOR-Nem_PCD_WriteRowToVDP,a3	; otherwise the file uses XOR mode
PLUS
		lsl.w	#2,d2	; get number of 8-pixel rows in the uncompressed data
		movea.w	d2,a5	; and store it in a5 because there aren't any spare data registers
		moveq	#8,d3	; 8 pixels in a pattern row
		moveq	#0,d2
		moveq	#0,d4
		bsr.w	Nem_Build_Code_Table
		move.b	(a0)+,d5	; get first byte of compressed data
		asl.w	#8,d5	; shift up by a byte
		move.b	(a0)+,d5	; get second byte of compressed data
		move.w	#$10,d6	; set initial shift value
		bsr.s	Nem_Process_Compressed_Data
		movem.l	(sp)+,d0-a1/a3-a5
		rts
; End of function Nem_Decomp_Main

; ---------------------------------------------------------------------------
; Part of the Nemesis decompressor, processes the actual compressed data
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

; PCD is used throughout this subroutine as an initialism for Process_Compressed_Data
Nem_Process_Compressed_Data:
		move.w	d6,d7
		subq.w	#8,d7	; get shift value
		move.w	d5,d1
		lsr.w	d7,d1	; shift so that high bit of the code is in bit position 7
		cmpi.b	#%11111100,d1	; are the high 6 bits set?
		bcc.s	Nem_PCD_InlineData	; if they are, it signifies inline data
		andi.w	#$FF,d1
		add.w	d1,d1
		move.b	(a1,d1.w),d0	; get the length of the code in bits
		ext.w	d0
		sub.w	d0,d6	; subtract from shift value so that the next code is read next time around
		cmpi.w	#9,d6	; does a new byte need to be read?
		bcc.s	PLUS2	; if not, branch
		addq.w	#8,d6
		asl.w	#8,d5
		move.b	(a0)+,d5	; read next byte
PLUS2
		move.b	1(a1,d1.w),d1
		move.w	d1,d0
		andi.w	#$F,d1	; get palette index for pixel
		andi.w	#$F0,d0

Nem_PCD_GetRepeatCount:
		lsr.w	#4,d0	; get repeat count

Nem_PCD_WritePixel:
		lsl.l	#4,d4	; shift up by a nybble
		or.b	d1,d4	; write pixel
		subq.w	#1,d3	; has an entire 8-pixel row been written?
		bne.s	Nem_PCD_WritePixel_Loop	; if not, loop
		jmp	(a3)	; otherwise, write the row to its destination
; ---------------------------------------------------------------------------

Nem_PCD_NewRow:
		moveq	#0,d4	; reset row
		moveq	#8,d3	; reset nybble counter

Nem_PCD_WritePixel_Loop:
		dbf	d0,Nem_PCD_WritePixel
		bra.s	Nem_Process_Compressed_Data
; ---------------------------------------------------------------------------

Nem_PCD_InlineData:
		subq.w	#6,d6	; 6 bits needed to signal inline data
		cmpi.w	#9,d6
		bcc.s	PLUS3
		addq.w	#8,d6
		asl.w	#8,d5
		move.b	(a0)+,d5
PLUS3
		subq.w	#7,d6	; and 7 bits needed for the inline data itself
		move.w	d5,d1
		lsr.w	d6,d1	; shift so that low bit of the code is in bit position 0
		move.w	d1,d0
		andi.w	#$F,d1	; get palette index for pixel
		andi.w	#$70,d0	; high nybble is repeat count for pixel
		cmpi.w	#9,d6
		bcc.s	Nem_PCD_GetRepeatCount
		addq.w	#8,d6
		asl.w	#8,d5
		move.b	(a0)+,d5
		bra.s	Nem_PCD_GetRepeatCount
; ---------------------------------------------------------------------------

Nem_PCD_WriteRowToVDP:
		move.l	d4,(a4)	; write 8-pixel row
		subq.w	#1,a5
		move.w	a5,d4	; have all the 8-pixel rows been written?
		bne.s	Nem_PCD_NewRow	; if not, branch
		rts	; otherwise the decompression is finished
; ---------------------------------------------------------------------------

Nem_PCD_WriteRowToVDP_XOR:
		eor.l	d4,d2	; XOR the previous row by the current row
		move.l	d2,(a4)	; and write the result
		subq.w	#1,a5
		move.w	a5,d4
		bne.s	Nem_PCD_NewRow
		rts
; ---------------------------------------------------------------------------

Nem_PCD_WriteRowToRAM:
		move.l	d4,(a4)+
		subq.w	#1,a5
		move.w	a5,d4
		bne.s	Nem_PCD_NewRow
		rts
; ---------------------------------------------------------------------------

Nem_PCD_WriteRowToRAM_XOR:
		eor.l	d4,d2
		move.l	d2,(a4)+
		subq.w	#1,a5
		move.w	a5,d4
		bne.s	Nem_PCD_NewRow
		rts
; End of function Nem_Process_Compressed_Data

; ---------------------------------------------------------------------------
; Part of the Nemesis decompressor, builds the code table (in RAM)
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================

; BCT is used throughout this subroutine as an initialism for Build_Code_Table
Nem_Build_Code_Table:
		move.b	(a0)+,d0	; read first byte

Nem_BCT_ChkEnd:
		cmpi.b	#$FF,d0	; has the end of the code table description been reached?
		bne.s	Nem_BCT_NewPalIndex	; if not, branch
		rts	; otherwise, this subroutine's work is done
; ---------------------------------------------------------------------------

Nem_BCT_NewPalIndex:
		move.w	d0,d7

Nem_BCT_Loop:
		move.b	(a0)+,d0	; read next byte
		cmpi.b	#$80,d0	; sign bit being set signifies a new palette index
		bcc.s	Nem_BCT_ChkEnd	; a bmi could have been used instead of a compare and bcc
		move.b	d0,d1
		andi.w	#$F,d7	; get palette index
		andi.w	#$70,d1	; get repeat count for palette index
		or.w	d1,d7	; combine the two
		andi.w	#$F,d0	; get the length of the code in bits
		move.b	d0,d1
		lsl.w	#8,d1
		or.w	d1,d7	; combine with palette index and repeat count to form code table entry
		moveq	#8,d1
		sub.w	d0,d1	; is the code 8 bits long?
		bne.s	Nem_BCT_ShortCode	; if not, a bit of extra processing is needed
		move.b	(a0)+,d0	; get code
		add.w	d0,d0	; each code gets a word-sized entry in the table
		move.w	d7,(a1,d0.w)	; store the entry for the code
		bra.s	Nem_BCT_Loop	; repeat
; ---------------------------------------------------------------------------

; the Nemesis decompressor uses prefix-free codes (no valid code is a prefix of a longer code)
; e.g. if 10 is a valid 2-bit code, 110 is a valid 3-bit code but 100 isn't
; also, when the actual compressed data is processed the high bit of each code is in bit position 7
; so the code needs to be bit-shifted appropriately over here before being used as a code table index
; additionally, the code needs multiple entries in the table because no masking is done during compressed data processing
; so if 11000 is a valid code then all indices of the form 11000XXX need to have the same entry
Nem_BCT_ShortCode:
		move.b	(a0)+,d0	; get code
		lsl.w	d1,d0	; shift so that high bit is in bit position 7
		add.w	d0,d0	; get index into code table
		moveq	#1,d5
		lsl.w	d1,d5
		subq.w	#1,d5	; d5 = 2^d1 - 1

Nem_BCT_ShortCode_Loop:
		move.w	d7,(a1,d0.w)	; store entry
		addq.w	#2,d0	; increment index
		dbf	d5,Nem_BCT_ShortCode_Loop	; repeat for required number of entries
		bra.s	Nem_BCT_Loop
; End of function Nem_Build_Code_Table     
	
; ---------------------------------------------------------------------------





*ENIGMA
; FUNCTION:
; 	EniDec
;
; DESCRIPTION
; 	Enigma Decompressor
;
; INPUT:
; 	d0	Starting pattern name (added to each 8x8 before writing to destination)
; 	a0	Source address
; 	a1	Destination address
; ---------------------------------------------------------------------------

flip_x              equ $800     
flip_y              equ $1000      (1<<12)
palette_line_1      equ $2000      (1<<13)
palette_line_2      equ $4000      (2<<13)
high_priority       equ $8000      (1<<15)

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||
; ---------------------------------------------------------------------------
EniDec:
	movem.l	d0-d7/a1-a5,-(sp)
	movea.w	d0,a3			; store starting art tile
	move.b	(a0)+,d0
	ext.w	d0
	movea.w	d0,a5			; store first byte, extended to word
	move.b	(a0)+,d4		; store second byte
	lsl.b	#3,d4			; multiply by 8
	movea.w	(a0)+,a2		; store third and fourth byte
	adda.w	a3,a2			; add starting art tile
	movea.w	(a0)+,a4		; store fifth and sixth byte
	adda.w	a3,a4			; add starting art tile
	move.b	(a0)+,d5		; store seventh byte
	asl.w	#8,d5			; shift up by a byte
	move.b	(a0)+,d5		; store eighth byte in lower register byte
	moveq	#16,d6			; 16 bits = 2 bytes

EniDec_Loop:
	moveq	#7,d0			; process 7 bits at a time
	move.w	d6,d7
	sub.w	d0,d7
	move.w	d5,d1
	lsr.w	d7,d1
	andi.w	#$7F,d1			; keep only lower 7 bits
	move.w	d1,d2
	cmpi.w	#$40,d1			; is bit 6 set?
	bhs.s	.got_field		; if it is, branch
	moveq	#6,d0			; if not, process 6 bits instead of 7
	lsr.w	#1,d2			; bitfield now becomes TTSSSS instead of TTTSSSS

.got_field:
	bsr.w	EniDec_ChkGetNextByte
	andi.w	#$F,d2			; keep only lower nybble
	lsr.w	#4,d1			; store upper nybble (max value = 7)
	add.w	d1,d1
	jmp	EniDec_JmpTable(pc,d1.w)
; ---------------------------------------------------------------------------
EniDec_Sub0:
	move.w	a2,(a1)+		; write to destination
	addq.w	#1,a2			; increment
	dbra	d2,EniDec_Sub0		; repeat
	bra.s	EniDec_Loop
; ---------------------------------------------------------------------------
EniDec_Sub4:
	move.w	a4,(a1)+		; write to destination
	dbra	d2,EniDec_Sub4		; repeat
	bra.s	EniDec_Loop
; ---------------------------------------------------------------------------
EniDec_Sub8:
	bsr.w	EniDec_GetInlineCopyVal

.loop:
	move.w	d1,(a1)+
	dbra	d2,.loop

	bra.s	EniDec_Loop
; ---------------------------------------------------------------------------
EniDec_SubA:
	bsr.w	EniDec_GetInlineCopyVal

.loop:
	move.w	d1,(a1)+
	addq.w	#1,d1
	dbra	d2,.loop

	bra.s	EniDec_Loop
; ---------------------------------------------------------------------------
EniDec_SubC:
	bsr.w	EniDec_GetInlineCopyVal

.loop:
	move.w	d1,(a1)+
	subq.w	#1,d1
	dbra	d2,.loop

	bra.s	EniDec_Loop
; ---------------------------------------------------------------------------
EniDec_SubE:
	cmpi.w	#$F,d2
	beq.s	EniDec_End

.loop:
	bsr.w	EniDec_GetInlineCopyVal
	move.w	d1,(a1)+
	dbra	d2,.loop

	bra.s	EniDec_Loop
; ---------------------------------------------------------------------------
; Enigma_JmpTable:
EniDec_JmpTable:
	bra.s	EniDec_Sub0
	bra.s	EniDec_Sub0
	bra.s	EniDec_Sub4
	bra.s	EniDec_Sub4
	bra.s	EniDec_Sub8
	bra.s	EniDec_SubA
	bra.s	EniDec_SubC
	bra.s	EniDec_SubE
; ---------------------------------------------------------------------------
EniDec_End:
	subq.w	#1,a0
	cmpi.w	#16,d6		; were we going to start on a completely new byte?
	bne.s	.got_byte	; if not, branch
	subq.w	#1,a0

.got_byte:
	move.w	a0,d0
	lsr.w	#1,d0		; are we on an odd byte?
	bhs.s	.even_loc	; if not, branch
	addq.w	#1,a0		; ensure we're on an even byte

.even_loc:
	movem.l	(sp)+,d0-d7/a1-a5
	rts
; End of function EniDec
; ===========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||
; ---------------------------------------------------------------------------
EniDec_GetInlineCopyVal:
	move.w	a3,d3		; store starting art tile
	move.b	d4,d1
	add.b	d1,d1
	bhs.s	.skip_pri	; if d4 was < $80
	subq.w	#1,d6		; get next bit number
	btst	d6,d5		; is the bit set?
	beq.s	.skip_pri	; if not, branch
	ori.w	#high_priority,d3	; set high priority bit

.skip_pri:
	add.b	d1,d1
	bhs.s	skip_pal2	; if d4 was < $40
	subq.w	#1,d6		; get next bit number
	btst	d6,d5
	beq.s	skip_pal2
	addi.w	#palette_line_2,d3	; set second palette line bit

skip_pal2:
	add.b	d1,d1
	bhs.s	.skip_pal1	; if d4 was < $20
	subq.w	#1,d6		; get next bit number
	btst	d6,d5
	beq.s	.skip_pal1
	addi.w	#palette_line_1,d3	; set first palette line bit

.skip_pal1:
	add.b	d1,d1
	bhs.s	.skip_flipy	; if d4 was < $10
	subq.w	#1,d6		; get next bit number
	btst	d6,d5
	beq.s	.skip_flipy
	ori.w	#flip_y,d3	; set Y-flip bit

.skip_flipy:
	add.b	d1,d1
	bhs.s	.skip_flipx	; if d4 was < 8
	subq.w	#1,d6
	btst	d6,d5
	beq.s	.skip_flipx
	ori.w	#flip_x,d3	; set X-flip bit

.skip_flipx:
	move.w	d5,d1
	move.w	d6,d7		; get remaining bits
	sub.w	a5,d7		; subtract minimum bit number
	bhs.s	.got_enough	; if we're beyond that, branch
	move.w	d7,d6
	addi.w	#16,d6		; 16 bits = 2 bytes
	neg.w	d7			; calculate bit deficit
	lsl.w	d7,d1		; make space for this many bits
	move.b	(a0),d5		; get next byte
	rol.b	d7,d5		; make the upper X bits the lower X bits
	add.w	d7,d7
	and.w	EniDec_AndVals-2(pc,d7.w),d5	; only keep X lower bits
	add.w	d5,d1		; compensate for the bit deficit

.got_field:
	move.w	a5,d0
	add.w	d0,d0
	and.w	EniDec_AndVals-2(pc,d0.w),d1	; only keep as many bits as required
	add.w	d3,d1		; add starting art tile
	move.b	(a0)+,d5	; get current byte, move onto next byte
	lsl.w	#8,d5		; shift up by a byte
	move.b	(a0)+,d5	; store next byte in lower register byte
	rts
; ---------------------------------------------------------------------------
.got_enough:
	beq.s	.got_exact	; if the exact number of bits are leftover, branch
	lsr.w	d7,d1		; remove unneeded bits
	move.w	a5,d0
	add.w	d0,d0
	and.w	EniDec_AndVals-2(pc,d0.w),d1	; only keep as many bits as required
	add.w	d3,d1		; add starting art tile
	move.w	a5,d0		; store number of bits used up by inline copy
	bra.s	EniDec_ChkGetNextByte	; move onto next byte
; ---------------------------------------------------------------------------
.got_exact:
	moveq	#16,d6		; 16 bits = 2 bytes
	bra.s	.got_field
; ---------------------------------------------------------------------------
EniDec_AndVals:
	dc.w	 1,    3,    7,   $F
	dc.w   $1F,  $3F,  $7F,  $FF
	dc.w  $1FF, $3FF, $7FF, $FFF
	dc.w $1FFF,$3FFF,$7FFF,$FFFF
; End of function EniDec_GetInlineCopyVal
; ===========================================================================

; ||||||||||||||| S U B R O U T I N E |||||||||||||||||||||||||||||||||||||||
; ---------------------------------------------------------------------------
EniDec_ChkGetNextByte:
	sub.w	d0,d6
	cmpi.w	#9,d6
	bhs.s	.done
	addq.w	#8,d6		; 8 bits = 1 byte
	asl.w	#8,d5		; shift up by a byte
	move.b	(a0)+,d5	; store next byte in lower register byte

.done:
	rts
; End of function EniDec_ChkGetNextByte
; ===========================================================================

; ---------------------------------------------------------------------------
; Kosinski decompression subroutine
; Inputs:
; a0 = compressed data location
; a1 = destination
; ---------------------------------------------------------------------------

; =============== S U B R O U T I N E =======================================


Kos_Decomp:
		subq.l	#2,sp	; make space for two bytes on the stack
		move.b	(a0)+,1(sp)
		move.b	(a0)+,(sp)
		move.w	(sp),d5	; copy first description field
		moveq	#$F,d4	; 16 bits in a byte

Kos_Decomp_Loop:
		lsr.w	#1,d5	; bit which is shifted out goes into C flag
		move	sr,d6
		dbf	d4,Kos_Decomp_ChkBit
		move.b	(a0)+,1(sp)
		move.b	(a0)+,(sp)
		move.w	(sp),d5	; get next description field if needed
		moveq	#$F,d4	; reset bit counter

Kos_Decomp_ChkBit:
		move	d6,ccr	; was the bit set?
		bcc.s	Kos_Decomp_Match	; if not, branch (C flag clear means bit was clear)
		move.b	(a0)+,(a1)+	; otherwise, copy byte as-is
		bra.s	Kos_Decomp_Loop
; ---------------------------------------------------------------------------

Kos_Decomp_Match:
		moveq	#0,d3
		lsr.w	#1,d5	; get next bit
		move	sr,d6
		dbf	d4,Kos_Decomp_ChkBit2
		move.b	(a0)+,1(sp)
		move.b	(a0)+,(sp)
		move.w	(sp),d5
		moveq	#$F,d4

Kos_Decomp_ChkBit2:
		move	d6,ccr	; was the bit set?
		bcs.s	Kos_Decomp_FullMatch	; if it was, branch
		lsr.w	#1,d5	; bit which is shifted out goes into X flag
		dbf	d4,.LOOP
		move.b	(a0)+,1(sp)
		move.b	(a0)+,(sp)
		move.w	(sp),d5
		moveq	#$F,d4
.LOOP
		roxl.w	#1,d3	; get high repeat count bit (shift X flag in)
		lsr.w	#1,d5
		dbf	d4,.LOOP2
		move.b	(a0)+,1(sp)
		move.b	(a0)+,(sp)
		move.w	(sp),d5
		moveq	#$F,d4
.LOOP2
		roxl.w	#1,d3	; get low repeat count bit
		addq.w	#1,d3	; increment repeat count
		moveq	#-1,d2
		move.b	(a0)+,d2	; calculate offset
		bra.s	Kos_Decomp_MatchLoop
; ---------------------------------------------------------------------------

Kos_Decomp_FullMatch:
		move.b	(a0)+,d0	; get first byte
		move.b	(a0)+,d1	; get second byte
		moveq	#-1,d2
		move.b	d1,d2
		lsl.w	#5,d2
		move.b	d0,d2	; calculate offset
		andi.w	#7,d1	; does a third byte need to be read?
		beq.s	Kos_Decomp_FullMatch2	; if it does, branch
		move.b	d1,d3	; copy repeat count
		addq.w	#1,d3	; and increment it

Kos_Decomp_MatchLoop:
		move.b	(a1,d2.w),d0
		move.b	d0,(a1)+	; copy appropriate byte
		dbf	d3,Kos_Decomp_MatchLoop	; and repeat the copying
		bra.s	Kos_Decomp_Loop
; ---------------------------------------------------------------------------

Kos_Decomp_FullMatch2:
		move.b	(a0)+,d1
		beq.s	Kos_Decomp_Done	; 0 indicates end of compressed data
		cmpi.b	#1,d1
		beq.w	Kos_Decomp_Loop	; 1 indicates a new description needs to be read
		move.b	d1,d3	; otherwise, copy repeat count
		bra.s	Kos_Decomp_MatchLoop
; ---------------------------------------------------------------------------

Kos_Decomp_Done:
		addq.l	#2,sp	; restore stack pointer to original state
		rts
; End of function Kos_Decomp


*-----------------------------------------------------------
* Title      :LOGO
* Written by :88M
* Date       :06.02.2022
* Description:ÀŒ√Œ“»œ RTB
*-----------------------------------------------------------
    
* 888888             888888888          88888888888       888888888  
* 888888            88888888888        888888888888      88888888888 
* 888888            88888888888       8888888888888      88888888888 
* 888888           888 88888 888     88888888888888     888 88888 888
* 888888           88 8888888 88     88888888888888     88 8888888 88
* 888888           88 8888888 88     88888888888888     88 8888888 88
* 888888           88 88   88 88     88888              88 88   88 88
* 888888           88 88   88 88     88888 88888888     88 88   88 88
* 888888           88 88   88 88     88888 88888888     88 88   88 88
* 888888           88 88   88 88     88888 88888888     88 88   88 88
* 888888           88 88   88 88     88888 88888 88     88 88   88 88
* 888888           88 88   88 88     88888 88888 88     88 88   88 88
* 888888           88 88   88 88     88888 88888 88     88 88   88 88
* 8888888888888    88 8888888 88     88888888888 88     88 8888888 88
* 8888888888888    88 8888888 88     88888888888 88     88 8888888 88
*  888888888888    888 88888 888     88888888888 88     888 88888 888
*  888888888888     88888888888       8888888888888      88888888888 
*   88888888888     88888888888        888888888888      88888888888 
*     888888888      888888888          88888888888       888888888  

    

RTBLOGO
    
    LEA $10(A7),A7       *‰ÓÔÓÎÌÂÌËÂ ÓÚ ÒÂ·ˇ ˜ÚÓ ·˚ ‚ÓÒÒÚ‡ÌÓ‚ËÚ¸ ÒÚÂÍ ÔÓÒÎÂ gemsinit
    MOVE.B #0,(A7)
    JSR gemsstartsong    *«‡ÔÛÒÍ‡ÂÏ ÏÂÎÓ‰Ë˛ ÏÂÌ˛

    

    
*    MOVE.L #$C0020000,D6 ¿ƒ–≈— Õ¿◊¿À¿ œ¿À»“–€ ÀŒ√Œ
*    JSR PREPVRAM √Œ“Œ¬»Ã ¬»ƒ≈Œœ¿Ãﬂ“‹
MENUSKIP            *ƒÎˇ ÔÓÔÛÒÍ‡ ÏÂÌ˛ ‰Îˇ ƒÂ·‡„‡
    *JMP LEVEL0 
   
    
    LEA RAM,A0
    
    MOVE.W #$0000,(A0)+
    MOVE.L #$0EEE0A00,(A0)+   «¿ »ƒ€¬¿≈Ã œ¿À»“–” ÀŒ√Œ 
    MOVE.L #$0E800E60,(A0)+
    MOVE.L #$0E400E20,(A0)+
    MOVE.L #$0E000000,(A0)+
    
    LEA RTBLOGOTILES,A0 ” ¿«€¬¿≈Ã ¿ƒ–≈— “¿…ÀŒ¬
    MOVEQ #32,D6    ” ¿«€¬¿≈Ã ¿ƒ–≈— ¬ ¬»ƒ≈Œœ¿Ãﬂ“»  ”ƒ¿ — À¿ƒ€¬¿“‹
    
    JSR PREPVRAM
    JSR Nem_Decomp –¿—œ¿ Œ¬€¬¿≈Ã “¿…À€
    
    MOVEQ #$1,D0 —ƒ¬»√ œŒ “¿…À¿Ã
    LEA RTBLOGOTILEMAP,A0 »—’ŒƒÕ€… —∆¿“€… “¿…ÀÃ¿œ
    LEA $FFA000,A1 ¿ƒ–≈— ¬ Œœ≈–¿“»¬ÕŒ… œ¿Ãﬂ“»
    
    JSR EniDec ƒ≈ ŒÃœ–≈——»ﬂ
    
    MOVE.L #VRAMTILEMAPB+1694,D6 Õ¿◊¿À‹Õ€… ¿ƒ–≈—  ”ƒ¿ ¡”ƒ≈Ã œ≈–≈ À¿ƒ€¬¿“‹ 1664 ÿ»–»Õ¿
    MOVEQ #4,D0
    MOVEQ #4,D1
    JSR PREPVRAM
    
.LOOP    
    MOVE.L (A1)+,VDPDATA  
    DBRA D0,.LOOP
    
    ADD.L #128,D6
    JSR PREPVRAM
    MOVEQ #4,D0
    DBRA D1,.LOOP ÷» À ƒÀﬂ œ≈–≈√–”« » “¿…ÀÃ¿œ¿ »« Œœ≈–¿“»¬ÕŒ… œ¿Ãﬂ“» ¬ ¬»ƒ≈Œœ¿Ãﬂ“‹ (Œ“Õ»Ã¿“‹ Õ¿ƒŒ #$222 Œ“ œ¿À»“–€)
    
    



    MOVEQ #11,D5 œ≈–≈Ã≈ÕÕ¿ﬂ ƒÀﬂ ¬–¿Ÿ≈Õ»ﬂ
    MOVEQ #100,D6

       
    LEA .PRELOOP,A6
    
    JMP FADETOPAL
.PRELOOP    
    MOVE.L #$0A000E80,D1   Œ¡ÕŒ¬Àﬂ≈Ã ¬–¿Ÿ¿≈Ã”ﬁ œ¿À»“–”
    MOVE.L #$0E600E40,D2
    MOVE.L #$0E200E00,D3
.LOOPROT
       
    SWAP D1 Ã≈Õﬂ≈Ã Ã≈—“¿Ã» 16¡»“Õ€≈ œŒÀŒ¬»Õ » –≈√»—“–¿
    SWAP D2
    SWAP D3
    
    MOVE.W D1,-(A7) Œ“œ–¿¬Àﬂ≈Ã ÃÀ¿ƒÿ”ﬁ ◊¿—“‹ ¬ —“¿ 
    MOVE.W D2,-(A7)
    MOVE.W D3,-(A7)
    
    MOVE.W (A7)+,D2 ƒŒ—“¿®Ã ÃÀ¿ƒÿ”ﬁ ◊¿—“‹ »« —“¿ ¿ ¬ ƒ–”√ŒÃ œŒ–ﬂƒ ≈
    MOVE.W (A7)+,D1
    MOVE.W (A7)+,D3
    
    
    JSR VBLANKSTART —»Õ’–ŒÕ»«»–”≈Ã—ﬂ
    MOVE.L #$C0040000,VDPCONTROL —“¿¬»Ã œ≈–¬€… ÷¬≈“ Õ¿ ¬€¡Œ– ”
    MOVE.L D1,VDPDATA ¬€—€À¿≈Ã —ƒ¬»Õ”“”ﬁ œ¿À»“–”
    MOVE.L D2,VDPDATA
    MOVE.L D3,VDPDATA
    JSR VBLANKEND
    JSR VBLANKSTART
    JSR VBLANKEND
    JSR VBLANKSTART
    JSR VBLANKEND
    JSR VBLANKSTART «¿ƒ≈–∆ ¿ 3  ¿ƒ–¿
    JSR VBLANKEND



    DBRA D5,.LOOPROT
    
    
    
    LEA MENU,A6
    JMP GLOBALFADE
    
    
   

.DMA
    MOVE.W #$9300+(($0010>>1)&$FF),(VDPCONTROL)  ^Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $0xxx 1ff max
    MOVE.W #$9400+((($0000>>1)&$FF00)>>8),(VDPCONTROL) ¿ƒ–≈—¿ ƒÀ»ÕÕ€ DMA ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $xx00
    
   move.w #$9500+(($58>>1)&$FF),(VDPCONTROL) Õ»∆Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9600+((($0000>>1)&$FF00)>>8),(VDPCONTROL) —–≈ƒÕ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9700+((($FF0000>>1)&$7F0000)>>16),(VDPCONTROL) ¬€—ÿ»… ¿ƒ–≈— »—“Œ◊Õ» ¿

*    to CRAM:    

    move.l #$C0000080+($02<<16),(VDPCONTROL)
    RTS
    
.DMA2
    MOVE.W #$9300+(($0010>>1)&$FF),(VDPCONTROL)  ^Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $0xxx 1ff max
    MOVE.W #$9400+((($0000>>1)&$FF00)>>8),(VDPCONTROL) ¿ƒ–≈—¿ ƒÀ»ÕÕ€ DMA ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $xx00
    
   move.w #$9500+(($00>>1)&$FF),(VDPCONTROL) Õ»∆Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9600+((($0000>>1)&$FF00)>>8),(VDPCONTROL) —–≈ƒÕ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9700+((($FF0000>>1)&$7F0000)>>16),(VDPCONTROL) ¬€—ÿ»… ¿ƒ–≈— »—“Œ◊Õ» ¿

*    to CRAM:    

    move.l #$C0000080+($02<<16),(VDPCONTROL)
    RTS
*========================================================================================================================
GLOBALFADE *√ÀŒ¡¿À‹ÕŒ≈ «¿“”’¿Õ»≈ œ¿À»“–€ » ¬Œ«¬–¿“ œŒ ¿ƒ–≈—” (A6)
    LEA RAM,A1  ¡≈–®Ã ¿ƒ–≈— œ¿Ãﬂ“»
    MOVEQ #31,D2 œ≈–≈Ã≈ÕÕ¿ﬂ ƒÀﬂ —◊»“€¬¿Õ»ﬂ ÷¬≈“Œ¬Œ… œ¿Ãﬂ“» ÷» ÀŒ“–ŒÕ
    MOVEQ #63,D5 œ≈–≈Ã≈ÕÕ¿ﬂ ƒÀﬂ ŒƒÕŒ… Œ¡–¿¡Œ“ » ¬—≈’ ﬂ◊≈≈  ÷¬≈“¿ 
    MOVEQ #10,D3 œ≈–≈Ã≈ÕÕ¿ﬂ ƒÀﬂ Œ¡Ÿ»’ œ–Œ’ŒƒŒ¬+DMA 
    MOVE.L #$00000020,VDPCONTROL ¬€—“¿¬Àﬂ≈Ã ¬»ƒ≈Œ(÷¬≈“Œ¬”ﬁ)œ¿Ãﬂ“‹ Õ¿ ◊“≈Õ»≈
    
.LOOP
    MOVE.L VDPDATA,(A1)+ ◊»“¿≈Ã » — À¿ƒ€¬¿≈Ã ¬ RAM — œŒ—“»Õ –»Ã≈Õ“ŒÃ ¿1
        
    DBRA D2,.LOOP ÷» ÀŒ“–ŒÕ œŒ ¿ Õ≈ —◊»“¿≈Ã ¬—ﬁ ¬»ƒ≈Œ(÷¬≈“Œ¬”ﬁ)œ¿Ãﬂ“‹
    
.LOOP2
    LEA RAM,A1 ¬Œ——“¿Õ¿¬À»¬¿≈Ã ¿ƒ–≈— RAM
    


    MOVE.W (A1),D1 ◊»“¿≈Ã œ≈–¬”ﬁ ﬂ◊≈… ” ÷¬≈“¿
    
.RED    
    BTST.L #1,D1 “≈—“»–”≈Ã ¡»“ 1,2,3
    BNE .REDMINUS ≈—À» ¬ ¡»“¿’ ◊“Œ “Œ ≈—“‹ »ƒ®Ã Œ“Õ»Ã¿“‹ ÷¬≈“
    
    BTST.L #2,D1
    BNE .REDMINUS
    
    BTST.L #3,D1
    BNE .REDMINUS
    
.GREEN

    BTST.L #5,D1
    BNE .GREENMINUS
    
    BTST.L #6,D1
    BNE .GREENMINUS
    
    BTST.L #7,D1
    BNE .GREENMINUS
        
.BLUE
    
    BTST.L #9,D1
    BNE .BLUEMINUS
    
    BTST.L #10,D1
    BNE .BLUEMINUS
    
    BTST.L #11,D1
    BNE .BLUEMINUS
    
.NEXT    
    MOVE.W D1,(A1)+ ¬  ŒÕ÷≈ ¬—≈’ ¬€◊»—À≈Õ»… ﬂ◊≈… ” ¬Œ«¬–¿Ÿ¿≈Ã Œ¡–¿“ÕŒ ¬ RAM » œ–»¡¿¬Àﬂ≈Ã —À≈ƒ ¿ƒ–≈—
    
    MOVE.W (A1),D1 œŒÀ”◊¿≈Ã ÕŒ¬”ﬁ ÷¬≈“Œ¬”ﬁ ﬂ◊≈… ”
           
   
    DBRA D5,.RED ÷» ÀŒ“–ŒÕ » Õ¿◊»Õ¿≈Ã —ÕŒ¬¿ Œ¡—◊»“€¬¿“‹ ÕŒ¬”ﬁ ÷¬≈“Œ¬”ﬁ ﬂ◊≈… ”
    
    JSR VBLANKSTART ¡ÀŒ  DMA » «¿ƒ≈–∆≈ 
    JSR VBLANKEND

    JSR VBLANKSTART
    JSR .DMA2    
    MOVEQ #63,D5
    JSR VBLANKEND
    JSR VBLANKSTART
    JSR VBLANKEND
    JSR VBLANKSTART
    JSR VBLANKEND
 


    
    DBRA D3,.LOOP2 Œ¡Ÿ»… ÷» ÀŒ“–ŒÕ ”√¿—¿Õ»ﬂ œ¿À»“–€
    
        
    JMP (A6)  
    
.REDMINUS    
    SUB.B #$02,D1
    JMP .GREEN
.GREENMINUS
    SUB.B #$20,D1
    JMP .BLUE
.BLUEMINUS
    SUB.W #$0200,D1
    JMP .NEXT    

.DMA2
    MOVE.W #$9300+(($0080>>1)&$FF),(VDPCONTROL)  ^Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $0xxx 1ff max
    MOVE.W #$9400+((($0000>>1)&$FF00)>>8),(VDPCONTROL) ¿ƒ–≈—¿ ƒÀ»ÕÕ€ DMA ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $xx00
    
   move.w #$9500+(($00>>1)&$FF),(VDPCONTROL) Õ»∆Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9600+((($0000>>1)&$FF00)>>8),(VDPCONTROL) —–≈ƒÕ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9700+((($FF0000>>1)&$7F0000)>>16),(VDPCONTROL) ¬€—ÿ»… ¿ƒ–≈— »—“Œ◊Õ» ¿

*    to CRAM:    

    move.l #$C0000080+($00<<16),(VDPCONTROL)
    RTS    
    
*=================================================================================================================    
FADETOPAL *¬ Õ¿◊¿ÀŒ RAM «¿√–”∆¿≈“—ﬂ œ¿À»“–¿ ¬  Œ“Œ–”ﬁ Õ”∆ÕŒ ¬Œ«¬≈—“»—‹ ¬Œ«¬–¿“ ¬ ¿6 «¿√–”« ¿ œ¿À»“–€ ¬ Õ¿◊¿ÀŒ RAM
	*MOVE.W #$0EEE,(RAM)  ƒ≈¡¿√
	MOVEM.L D0-D7/A0-A6,-(A7)			*—œ¿—¿≈Ã –≈√»—“–€
    MOVEQ #63,D2	 	*ƒÀﬂ ÷» ÀŒ“–ŒÕ¿
    LEA RAM,A0 			*” ¿«¿“≈À‹ Œœ≈–¿“»¬ÕŒ…
    LEA RAM+136,A1 		*” ¿«¿“≈À‹ Œœ≈–¿“»¬ÕŒ… ƒÀﬂ “–¿Õ—‘Œ–Ã¿÷»…
    MOVEQ #6,D1 		*ƒÀﬂ ÷» ÀŒ“–ŒÕ¿
    CLR D7				
	MOVE.L #2,D0		*ƒÀﬂ ÷» –ÀŒ“–ŒÕ¿
.L
	
	CLR D3				*◊»—“»Ã –¿¡Œ◊»≈ –≈√»—“–€
	CLR D4
	CLR D5
	CLR D6
	
    MOVE.W (A0)+,D3  *»—’ŒƒÕ€…   
    MOVE.W (A1),D4 	*œ≈–≈Ã≈ÕÕ€…		ƒŒ¡€¬¿≈Ã 2 ÷¬≈“¿ »—’ŒƒÕ€… » œ≈–≈Ã≈ÕÕ€…  Œ“Œ–€… ¡”ƒ≈Ã “–¿Õ—‘Œ–Ã»–Œ¬¿“‹
	
	LSL.W #3,D3			*œ≈–¬€… —ƒ¬»√ — ”ƒ¿À≈Õ»≈Ã À»ÿÕ»’ Õ”À≈…
	LSL.W #3,D4
	
.L2	
	LSL.W #1,D3
	LSL.W #1,D4
	
	LSL.W #1,D3		*¬“Œ–Œ… “Œ◊Õ€… —ƒ¬»√
	ROXL.W #1,D5	*»—’ŒƒÕ€…
	
	LSL.W #1,D4		
	ROXL.W #1,D6		*œ≈–≈Ã≈ÕÕ€…
	
	LSL.W #1,D3			
	ROXL.W #1,D5
	
	LSL.W #1,D4
	ROXL.W #1,D6
	
	LSL.W #1,D3			
	ROXL.W #1,D5
	
	LSL.W #1,D4
	ROXL.W #1,D6		*Õ¿◊»Õ¿≈Ã —”ƒŒ–Œ∆ÕŒ œ≈–≈¡»–¿“‹ ◊“Œ ¡€ œ–»¬≈—“»   ”ƒŒ¡ÕŒÃ” ƒÀﬂ œ–Œ÷≈——Œ–¿ ¬»ƒ”
	
	CMP.W D5,D6			*—–¿¬Õ»¬¿≈Ã œŒ 1 ÷¬≈“”
	BNE .COLORADD		*≈—À» Ã¿ÀŒ ƒŒ¡¿¬»“‹
	BEQ .COLSHIFT		*≈—À» –¿¬ÕŒ «¿ƒ¬»√¿≈Ã » »ƒ®Ã ƒ¿À‹ÿ≈
.COLJMP	
	
	
	DBRA D0,.L2
	
	MOVE.W D7,(A1)+ 	*≈—À» œ–ŒÿÀ»—‹ œŒ ÷¬≈“” «¿—€À¿≈Ã “–¿Õ—‘Œ–Ã»–Œ¬¿ÕÕ€… ¬¿–»¿Õ“ ¬ œ¿Ãﬂ“‹ » »ƒ®Ã ƒ¿À‹ÿ≈
    MOVE.L #2,D0
	
    DBRA D2,.L  
    
    
    
    JSR VBLANKSTART
    
    JSR .DMA			*Œ“—€À ¿ ¬–≈Ã≈ÕÕŒ… “–¿Õ—‘Œ–Ã¿÷»» ¬ ¬»ƒ≈Œ◊»œ
    MOVEQ #63,D2
    LEA RAM,A0
    LEA RAM+136,A1
    
    
    JSR VBLANKEND    
    JSR VBLANKSTART
    JSR VBLANKEND
    
    JSR VBLANKSTART
    JSR VBLANKEND
    JSR VBLANKSTART
    JSR VBLANKEND


 
    
    DBRA D1,.L
    *JSR VBLANKSTART
    *JSR .DMA2   
    MOVEM.L (A7)+,D0-D7/A0-A6
	
    JMP (A6)

.COLORADD
	ADDQ #1,D6
	
.COLSHIFT	*œŒ—À≈ƒÕﬂﬂ “–¿Õ—‘Œ–Ã¿÷»ﬂ ƒÀﬂ ¬Œ«¬–¿Ÿ≈Õ»ﬂ ¬ ‘Œ–Ã¿“ ¬»ƒ≈Œ◊»œ¿ —≈√»
	LSL.B #6,D6
	ROXL.W #1,D7
	LSL.B #1,D6
	ROXL.W #1,D7
	LSL.B #1,D6
	ROXL.W #1,D7
	LSL.W #1,D7
	
	CLR D5
	CLR D6
	
	JMP .COLJMP
   
.DMA *œ≈–≈¡–Œ— ¿ ¬–≈Ã≈ÕÕŒ… œ¿À»“–€
    MOVE.W #$9300+(($0080>>1)&$FF),(VDPCONTROL)  ^Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $0xxx 1ff max
    MOVE.W #$9400+((($0000>>1)&$FF00)>>8),(VDPCONTROL) ¿ƒ–≈—¿ ƒÀ»ÕÕ€ DMA ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $xx00
    
   move.w #$9500+(($88>>1)&$FF),(VDPCONTROL) Õ»∆Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9600+((($0000>>1)&$FF00)>>8),(VDPCONTROL) —–≈ƒÕ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9700+((($FF0000>>1)&$7F0000)>>16),(VDPCONTROL) ¬€—ÿ»… ¿ƒ–≈— »—“Œ◊Õ» ¿

*    to CRAM:    

    move.l #$C0000080+($00<<16),(VDPCONTROL)
    RTS    
        
*.DMA2 *œ≈–≈¡–Œ— ¿ Œ–»√»Õ¿À‹ÕŒ… œ¿À»“–€
*    MOVE.W #$9300+(($0080>>1)&$FF),(VDPCONTROL)  ^Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $0xxx 1ff max
*    MOVE.W #$9400+((($0000>>1)&$FF00)>>8),(VDPCONTROL) ¿ƒ–≈—¿ ƒÀ»ÕÕ€ DMA ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $xx00
    
*   move.w #$9500+(($00>>1)&$FF),(VDPCONTROL) Õ»∆Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
*    move.w #$9600+((($0000>>1)&$FF00)>>8),(VDPCONTROL) —–≈ƒÕ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
*    move.w #$9700+((($FF0000>>1)&$7F0000)>>16),(VDPCONTROL) ¬€—ÿ»… ¿ƒ–≈— »—“Œ◊Õ» ¿

*    to CRAM:    

*    move.l #$C0000080+($00<<16),(VDPCONTROL)
*    RTS    
*===================================================================================================================
*           8888     8888            888888888888 8888888888888    888 888  888 888
*          888888   888888          8888888888888 88888888888888   888 888  888 888
*         88888888 88888888        88888888888888 888888888888888  888 888  888 888
*         888  888 888  888       8888                        8888 888 888  888 888
*         88888888888888 888     8888  8888888888 88888888888  888 888 888  888 888
*        888 88 88888 88 888     888  88888888888 888888888888 888 888 888  888 888
*        888 88888888 888888     888 888888888888 888888888888 888 888 888  888 888
*       88888888 88888888 888    888 888          888 888  888 888 888 888  888 888
*       888 8888 888 8888 888    888 8888888888   888 888  888 888 888 888  888 888
*       888 88888888 88888888    888 8888888888   888 888  888 888 888 888  888 888
*      888 888888 8 888888 888   888 8888888888   888 888  888 888 888 888  888 888
*      888 888888 8 888888 888   888              888 888  888 888 888 888  888 888
*      888 888 88888888 8888888  888 8888888888   888 888  888 888 888 888  888 888
*     888 888  888 888  888 888  888 8888888888   888 888  888 888 888 888  888 888
*     888 888  8888888  888 888  888 8888888888   888 888  888 888 888 888  888 888
*     8888888   88888    888 888 888 888          888 888  888 888 888 888  888 888
*    888 888    88888    888 888 888 888888888888 888 888  888 888 888 88888888 888
*    888 888     8888    888 888 888  88888888888 888 888  888 888 888 88888888 888
*    8888888     888      888 8888888  8888888888 888 888  888 888 888  888888  888
*    88 888      888      888 888 8888            888 888  888 888  888        888 
*    88 888       88      888 888  88888888888888 888 888  888 888  88888888888888 
*    888888       8        888 888  8888888888888 888 888  888 888   888888888888  
*    8 888        8        888 888   888888888888 888 888  888 888    8888888888   
MENU
    MOVE.W #$9003,VDPCONTROL *—Ã≈Õ¿ –≈∆»Ã¿ 32X128
    LEA MENUBGTILES,A0 «¿√–”« ¿ “¿…ÀŒ¬ ¬ ¿0
    MOVE.L #VRAM,D6 «¿√–”« ¿ ¿ƒ–≈—¿ ¬»ƒ≈Œœ¿Ãﬂ“»
    JSR PREPVRAM œŒƒ√Œ“Œ¬ ¿ ¬»ƒ≈Œœ¿Ãﬂ“»
    JSR Nem_Decomp –¿—œ¿ Œ¬ ¿ “¿…ÀŒ¬
    
    LEA $FFA000,A1 Ã≈—“Œ  ”ƒ¿ ¡”ƒ≈Ã — À¿ƒ€¬¿“‹ “¿…ÀÃ¿œ
    LEA MENUBGTILEMAP,A0 «¿√–”∆¿≈Ã ¿ƒ–≈— “¿…ÀÃ¿œ¿
    MOVEQ #0,D0 —ƒ¬»√ œŒ “¿…À¿Ã
    JSR EniDec –¿—œ¿ Œ¬ ¿ “¿…ÀÃ¿œ¿
    
    
    move.w #$9300+(($11F>>1)&$FF),VDPCONTROL Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€
    move.w #$9400+((($1500>>1)&$FF00)>>8),VDPCONTROL ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€
    move.w #$9500+(($00>>1)&$FF),VDPCONTROL Õ»∆Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9600+((($A000>>1)&$FF00)>>8),VDPCONTROL —–≈ƒÕ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9700+((($FF0000>>1)&$7F0000)>>16),VDPCONTROL ¬≈–’Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    
    move.l #$40000080+(($E000&$3FFF)<<16)+(($E000&$C000)>>14),VDPCONTROL ¿ƒ–≈— Õ¿«Õ¿◊≈Õ»ﬂ+«¿œ”—  DMA
    
    MOVE.W #$8B03,VDPCONTROL
    

    
    LEA $FFA000,A0 «¿√–”« ¿ œ¿Ãﬂ“» —ƒ¬»√Œ¬Œ… “¿¡À»÷€ ¬ ¿0
    
    MOVE.L #$0,(A0)+ «¿œŒÀÕ≈Õ»≈ œ≈–¬€’ Õ≈–¿¡Œ◊»’ —ÀŒ¬
    
    MOVE.W #$0000,D1
    MOVE.W #$01FF,D2
    MOVE.W #173,D3
.L
    MOVE.W D1,(A0)+ — –ŒÀ»Õ√ “¿…ÀÃ¿œ¿ ¿=0
    MOVE.W D2,(A0)+ — –ŒÀ»Õ√ “¿…ÀÃ¿œ¿ ¬=Õ¿◊¿À‹Õ¿ﬂ œŒ«»÷»ﬂ
    
    DBRA D3,.L ÷» ÀŒ“–ŒÕ

    JSR .DMA                         
    MOVE.L #CRAM,VDPCONTROL –¿¡Œ“¿ — œ¿À»“–Œ…
    LEA VDPDATA,A0
    MOVE.L #$00000006,(A0)    
    MOVE.L #$000A002C,(A0)  
    MOVE.W #$0EEE,(A0)
    

    LEA $FFA004,A0 «¿√–”« ¿ Õ¿◊¿À‹ÕŒ√Œ ¿ƒ–≈—¿ “¿¡À»÷€
    MOVE.W #$01FF,D3 «¿√–”« ¿ œ≈–≈Ã≈ÕÕŒ… ƒÀﬂ —ƒ¬»√¿
    MOVE.W #$01FF,D4  1FF
    MOVE.W #$01FF,D5
    MOVE.W #550,D6
    
    MOVE.W #86,D7
    
    MOVE.W #$8228,VDPCONTROL »«Ã≈Õ≈Õ»≈ ¿ƒ–≈—¿ “¿…ÀÃ¿œ¿ ¿
    
.L2 
    CMP #0,D2 œ–Œ¬≈–ﬂ≈Ã D2
    BNE .D2MIN ≈—À» Õ≈ ÕŒÀ‹ Œ“Õ»Ã¿≈Ã
.L3    
    CMP #$0400,D3 œ–Œ¬≈–ﬂ≈Ã D3 
    BLT .D3PLU  ≈—À» Õ≈ 400 œ–»¡¿¬Àﬂ≈Ã
.L4
    
    MOVE.W D1,(A0)+ ¬€ À¿ƒ€¬¿≈Ã –≈√»—“–€ ¬ œ¿Ãﬂ“‹
    MOVE.W D2,(A0)+
    MOVE.W D1,(A0)+
    MOVE.W D3,(A0)+
        
    DBRA D7,.L2 ÷» ÀŒ“–ŒÕ —À≈ƒ —“–¿Õ»÷¿ œ¿Ãﬂ“»
    
    

    JSR VBLANKSTART ∆ƒ®Ã  ŒÕ÷¿  ¿ƒ–¿
    JSR .DMA        
    LEA $FFA004,A0  ¬Œ——“¿ÕŒ¬À≈Õ»≈ ¿ƒ–≈—¿ “¿¡À»÷€ ¬–¿Ÿ≈Õ»ﬂ
    MOVE.W #86,D7  ¬Œ——“¿Õ¿¬À»¬¿≈Ã ÷» ÀŒ“–ŒÕ
    
    CMP #0,D4
    BNE .D4MIN 
.L6 
    CMP #$0400,D5
    BLT .D5PLU 
.L7    
    
    MOVE.W D4,D2 
    MOVE.W D5,D3
    
    DBRA D6,.L2 ÷» ÀŒ“–ŒÕ
    
    MOVE.W #$24C0,D6 Õ¿◊¿À‹Õ€… ¿ƒ–≈— “¿…ÀŒ¬ ¬ ¬»ƒ≈Œœ¿Ãﬂ“»
    JSR PREPVRAM
    
    MOVE.W #MENUWINDOWTILES,A0
    JSR Nem_Decomp  –¿—œ¿ Œ¬ ¿ “¿…ÀÃ¿œ¿ Œ Õ¿
    
    MOVE.W #$126,D0 ƒŒ¡¿¬ ¿ œŒ “¿…ÀÃ¿œ”
    
    
    MOVE.W #MENUWINDOWTILEMAP,A0 
    
    JSR EniDec –¿—œ¿ Œ¬ ¿ “¿…ÀÃ¿œ¿ ¬ RAM
    
    MOVE.L #VRAMTILEMAPB+4380,D6 Õ¿◊¿À‹Õ€… ¿ƒ–≈— “¿…ÀÃ¿œ¿ Œ Õ¿
    JSR PREPVRAM
    
    
    
    MOVEQ #11,D7 ÷» À ƒÀﬂ œ≈–≈ÕŒ—¿ —“–Œ◊ » œ≈–≈Ã≈ÕÕ¿ﬂ
    MOVEQ #8,D2 œ≈–≈Ã≈ÕÕ¿ﬂ ƒÀﬂ œ≈–≈ÕŒ—¿ Õ¿ —À≈ƒ —“–Œ ”
    
.G
    MOVE.W (A1)+,D1 ¡≈–®Ã  ”—Œ  “¿…ÀÃ¿œ¿
    MOVE.W D1,VDPDATA  À¿ƒ®Ã
    

    DBRA D7,.G ÷» ÀŒ“–ŒÕ œŒ ¿ Õ≈ ¬€¬≈ƒ≈Ã ¬—≈ —“–Œ »
    
    MOVEQ #11,D7 ¬Œ——“¿Õ¿¬À»¬¿≈Ã ÷» ÀŒ“–ŒÕ —“–Œ 
    ADD.W #256,D6 ƒŒ¡¿¬Àﬂ≈Ã ¿ƒ–≈— ¬»ƒ≈Œœ¿Ãﬂ“» ƒŒ —À≈ƒ —“–Œ »
    JSR PREPVRAM √Œ“Œ¬»Ã œ¿Ãﬂ“‹
    JSR VBLANKEND
    JSR VBLANKSTART
    DBRA D2,.G ÷» À ¬€¬Œƒ¿ ¬—≈’ —“–Œ 
    
    MOVE.W #FONT,A0 «¿√–”« ¿ ÿ–»‘“¿
    MOVE.W #$4000,D6 œŒ«»÷»ﬂ ÿ–»‘“¿ ¬ œ¿Ãﬂ“»
    JSR PREPVRAM
    
    JSR Nem_Decomp
    
    MOVE.L #$C01A0000,VDPCONTROL «¿œŒÀÕ≈Õ»≈ ﬂ◊≈≈  ÷¬≈“¿ ÿ–»‘“¿
    MOVE.W #$0828,VDPDATA
    MOVE.L #$06260424,VDPDATA
    
    MOVE.L #$C03A0000,VDPCONTROL «¿œŒÀÕ≈Õ»≈ ﬂ◊≈≈  ÷¬≈“¿ ƒÀﬂ ¬€ƒ≈À≈Õ»ﬂ
    MOVE.W #$0AAA,VDPDATA
    MOVE.L #$08880666,VDPDATA
    
    JSR VBLANKSTART
    MOVE.L #$FF9FFF,A4  «¿ÕŒ—»Ã ¬ ¿ƒ–≈—Õ€… –≈√»—“–
    MOVE.B #$1,$FF9FFF   œ≈–≈Ã≈ÕÕ¿ﬂ ¬ RAM ƒÀﬂ –¿¡Œ“€ Ã≈Õﬁ
    MOVE.W #$8B00,VDPCONTROL ¬Œ——“¿ÕŒ¬À≈Õ»≈ — –ŒÀ»Õ√¿ › –¿Õ¿        
.TEXTSTART
    MOVE.W #VRAMTILEMAPB+4896,D6 ”—“¿ÕŒ¬ ¿ ¿ƒ–≈—¿ Õ¿ƒœ»—»
    JSR PREPVRAM
    
    MOVE.W #$200,D2 œŒ—“ŒﬂÕÕ¿ﬂ ƒÀﬂ “¿…ÀÃ¿œ¿
    MOVE.W #MENUTEXT,A2  ’–¿Õ»À»Ÿ≈ “≈ —“¿
    MOVEQ #4,D1  œ≈–≈Ã≈ÕÕ¿ﬂ ƒÀﬂ ÷» ÀŒ“–ŒÕ¿
    MOVE.L #VDPDATA,A3
.start          *¬€¬Œƒ START
    MOVE.B (A2)+,D2 «¿ »ƒ€¬¿≈Ã »« ‘¿…À¿ “≈ —“
    MOVE.W D2,(A3)   œ≈–≈ »ƒ€¬¿≈Ã ¬ ¬»ƒ≈Œ◊»œ
    DBRA D1,.start ÷» ÀŒ“–ŒÕ œŒ ¿ Õ≈ ¬€¬≈ƒ≈Ã ¬—≈ ¡” ¬€ Õ¿ —“–Œ ≈
    
    ADD.W #256,D6 ƒŒ¡¿¬Àﬂ≈Ã ¿ƒ–≈— ¬»ƒ≈Œœ¿Ãﬂ“» ƒŒ —À≈ƒ —“–Œ »
    JSR PREPVRAM √Œ“Œ¬»Ã ¬»ƒ≈Œœ¿Ãﬂ“‹
    MOVEQ #7,D1 ƒŒ¡¿¬Àﬂ≈Ã ƒÀﬂ ÕŒ¬Œ√Œ ÷» ÀŒ“–ŒÕ¿ » ƒ¿À‹ÿ≈
.continue    *¬€¬Œƒ CONTINUE
    MOVE.B (A2)+,D2
    MOVE.W D2,(A3)
    
    DBRA D1,.continue
    
    ADD.W #256,D6
    JSR PREPVRAM
    MOVEQ #5,D1
.option     *¬€¬Œƒ OPTION
    MOVE.B (A2)+,D2
    MOVE.W D2,(A3)
    
    DBRA D1,.option
    ADD.W #256,D6
    JSR PREPVRAM
    MOVEQ #3,D1
.quit       *¬€¬Œƒ QUIT
    MOVE.B (A2)+,D2
    MOVE.W D2,(A3)
    
    DBRA D1,.quit
    ADD.W #1024,D6
    JSR PREPVRAM
    MOVEQ #3,D1
 
    
.1996
    MOVE.B (A2)+,D2
    MOVE.W D2,(A3)
    
    DBRA D1,.1996
    MOVEQ #2,D1
    
    MOVE.W #0,VDPDATA
    
.zun
    MOVE.B (A2)+,D2
    MOVE.W D2,(A3)
    
    DBRA D1,.zun   * ŒÕ≈÷ ÕŒ–Ã¿À‹ÕŒ… Œ“–»—Œ¬ »



    CMP.B #1,(A4) *—–¿¬Õ»¬¿≈Ã «Õ¿◊≈Õ»≈ ¬ œ≈–≈Ã≈ÕÕŒ… —◊®“◊» ¿ ¬€ƒ≈À≈Õ»ﬂ
    BEQ .DRAWSTARTMENU      
    
    CMP.B #2,(A4)
    BEQ .DRAWCONTMENU
        
    CMP.B #3,(A4)
    BEQ .DRAWOPTIONMENU    
    
    CMP.B #4,(A4)
    BEQ .DRAWQUITMENU
    

.JOYCHECKTRAP *ÀŒ¬”ÿ ¿ ƒ∆Œ…—“» ¿ ƒÀﬂ «¿Ÿ»“€ Œ“ «¿À»œ¿Õ»ﬂ » Œ“ ƒ¬Œ…ÕŒ√Œ —–¿¡¿“€¬¿Õ»ﬂ
    JSR VBLANKEND     *  «¿ƒ≈–∆ ¿
    JSR Player_ReadControlsDual *—◊»“€¬¿≈Ã ƒ∆Œ…—“» 
    CMP.W #$FFFF,D0 *≈—À»  ÕŒœ » Õ≈ Õ¿∆¿“€
    BEQ .EXIT       
                    *¬€’Œƒ»Ã » Œ¡ÕŒ¬Àﬂ≈Ã—ﬂ
    
                    *≈—À»  ÕŒœ ¿ Õ¿∆¿“¿
    MOVE.W D0,D5    *œ≈–≈ƒ¿®Ã Õ¿ ¬–≈Ã≈ÕÕŒ≈ ’–¿Õ≈Õ»≈ ¬ ƒ–”√Œ… –≈√»—“–
    BNE .TRAP2      
                    *œ≈–≈’Œƒ»Ã ¬ “–¿œ2
    
.DOWN
    CMP.B #4,(A4) ≈—À» ¬ —◊®“◊» ≈ 4 œ–Œœ”— ¿≈Ã
    BEQ .UP           
    CMP.W #$FFFD,D5 ≈—À» Õ¿∆¿“Œ ¬Õ»«  /BNE ≈—À» Õ≈ ¬Õ»« »ƒ®Ã ƒ¿À‹ÿ≈
    BNE .UP
    ADD.B #1,(A4)
.UP
    CMP.B #1,(A4) ≈—À» ¬ —◊®“◊» ≈ 1 œ–Œœ”— ¿≈Ã Œ¡–¿¡Œ“ ”  ÕŒœ » ¬¬≈–’
    BEQ .EXIT
    CMP.W #$FFFE,D5 ≈—À» Õ¿∆¿“Œ ¬¬≈–’
    BNE .EXIT
    SUB.B #1,(A4) 
    
    
.EXIT
    JSR VBLANKSTART         *«¿ƒ≈–∆ ¿
    CMP.B #4,(A4)           *≈—À» Ã≈Õﬁ Õ¿ ◊≈“¬®–“Œ… œŒ«»÷»»
    BNE .ST
              
                            *≈—À» Õ≈ –¿¬ÕŒ ¬€’Œƒ»Ã
    CMP.W #$FF7F,D5         *≈—À» Ã≈Õﬁ Õ¿ ◊≈“¬®–“Œ… œŒ«»÷»» œ–Œ¬≈–ﬂ≈Ã  ÕŒœ ” —“¿–“
    BEQ MONITOR
.ST    
    CMP.B #1,(A4)       *≈—À» Ã≈Õﬁ Õ¿ œ≈–¬Œ… œŒ«»÷»»
    BNE .TEXTSTART
                        *≈—À» Õ≈“ ¬€’Œƒ
    CMP.W #$FF7F,D5     *∆ƒ®Ã —“¿–“ » œ≈–≈’Œƒ»Ã
    BEQ .MENUCLEAR
                            *≈—À» Õ¿∆¿“Œ œ≈–≈’Œƒ»Ã
    jmp .TEXTSTART          
                            *≈—À» Õ≈ Õ¿∆¿“Œ ¬€’Œƒ»Ã
    
.TRAP2      *¬—œŒÃŒ√¿“≈À‹Õ€… ÃŒƒ”À‹ ÀŒ¬”ÿ »
    JSR VBLANKEND    
    JSR VBLANKSTART
    JSR Player_ReadControlsDual *—◊»“€¬¿≈Ã ƒ∆Œ…—“» 
    CMP #$FFFF,D0
    BNE .TRAP2
    
    JMP .DOWN
    
.D2MIN
    SUBQ #1,D2
    JMP .L3

.D3PLU    
    ADDQ #1,D3
    JMP .L4
    
.D4MIN
    SUBQ #1,D4
    JMP .L6
.D5PLU
    ADDQ #1,D5
    JMP .L7
    
.DRAWSTARTMENU *¬€ƒ≈À≈Õ»≈  ”–—Œ–ŒÃ œ”Õ “Œ¬ Ã≈Õﬁ
    MOVE.W #VRAMTILEMAPB+4896,D6 *«Õ¿◊≈Õ»≈ START
    JSR PREPVRAM
    MOVE.W #$2200,D2
    MOVEQ #4,D0
    MOVE.L #MENUTEXT,A2
.T
    
    MOVE.B (A2)+,D2
    MOVE.W D2,(A3)
    DBRA D0,.T

    
    
    JMP .JOYCHECKTRAP
    
.DRAWCONTMENU
    MOVE.W #VRAMTILEMAPB+5152,D6
    JSR PREPVRAM
    MOVE.W #$2200,D2
    MOVEQ #7,D0    
    MOVE.L #MENUTEXT+5,A2
.T2
    MOVE.B (A2)+,D2
    MOVE.W D2,(A3)
    DBRA D0,.T  

    JMP .JOYCHECKTRAP
    
    
.DRAWOPTIONMENU
    MOVE.W #VRAMTILEMAPB+5408,D6
    JSR PREPVRAM
    MOVE.W #$2200,D2
    MOVEQ #5,D0    
    MOVE.L #MENUTEXT+13,A2
.T3
    MOVE.B (A2)+,D2
    MOVE.W D2,(A3)
    DBRA D0,.T  

    JMP .JOYCHECKTRAP
 
.DRAWQUITMENU
    MOVE.W #VRAMTILEMAPB+5664,D6
    JSR PREPVRAM
    MOVE.W #$2200,D2
    MOVEQ #3,D0    
    MOVE.L #MENUTEXT+19,A2
.T4
    MOVE.B (A2)+,D2
    MOVE.W D2,(A3)
    DBRA D0,.T  

    JMP .JOYCHECKTRAP       
    
    

.DMA
    move.w #$9300+(($BC>>1)&$FF),VDPCONTROL Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€
    move.w #$9400+((($0300>>1)&$FF00)>>8),VDPCONTROL ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€
    move.w #$9500+(($00>>1)&$FF),VDPCONTROL Õ»∆Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9600+((($A000>>1)&$FF00)>>8),VDPCONTROL —–≈ƒÕ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    move.w #$9700+((($FF0000>>1)&$7F0000)>>16),VDPCONTROL ¬≈–’Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    
    move.l #$40000080+(($DC00&$3FFF)<<16)+(($DC00&$C000)>>14),VDPCONTROL ¿ƒ–≈— Õ¿«Õ¿◊≈Õ»ﬂ+«¿œ”—  DMA
    
    RTS
    
.MENUCLEAR *œŒ—À≈ Õ¿∆¿“»ﬂ —“¿–“ Õ¿ 1 œ”Õ “≈ Ã≈Õﬁ (◊»—“»Ã Ã≈Õﬁ » œ¿–¿À≈À‹ÕŒ ◊“Œ Õ»¡”ƒ‹ –¿—œ¿ Œ¬€¬¿≈Ã)
    *ÓÚÎ‡‰Ó˜Ì‡ˇ Ô‡ÎËÚ‡
    LEA .MENUCLEAR2,A6
    JMP GLOBALFADE

    
    
    
.MENUCLEAR2
    MOVE.W #$8F01,(VDPCONTROL) ¿¬“Œ—ÀŒ∆≈Õ»≈ Õ¿ 1
    MOVE.W #$9300+(($005F>>1)&$FF),(VDPCONTROL)  ^Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $0xxx 1ff max
    MOVE.W #$9400+((($3400>>1)&$FF00)>>8),(VDPCONTROL) ¿ƒ–≈—¿ ƒÀ»ÕÕ€ DMA ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€ $xx00
    
    MOVE.W #$9780,(VDPCONTROL) “»œ DMA
    MOVE.L #$40000080+(($E000&$3FFF)<<16)+(($E000&$C000)>>14),(VDPCONTROL) ¿ƒ–≈— Õ¿«Õ¿◊≈Õ»ﬂ $C000&$3FFF) - ($D7FF&$C000)
    
    MOVE.W #$0000,(VDPDATA) «Õ¿◊≈Õ»≈ ƒÀﬂ «¿œŒÀÕ≈Õ»ﬂ #$yy00
    JSR DMAWAIT *∆ƒ®Ã DMA ≈—À» Œœ≈–≈ƒ»À»
    
    
    
    MOVE.W #$8F02,VDPCONTROL *¬Œ«¬–¿Ÿ¿≈Ã ¿¬“Œ—ÀŒ∆≈Õ»≈ Õ¿ 2
    MOVE.W #$9001,VDPCONTROL *¬Œ«¬–¿Ÿ¿≈Ã –¿«Ã≈– »√–Œ¬Œ√Œ œŒÀﬂ Õ¿ 32 ¬≈–“» ¿À‹ÕŒ≈ » 64 √Œ–»«ŒÕ“¿À‹ÕŒ≈
    MOVE.W #$8230,VDPCONTROL *¬Œ«¬–¿Ÿ¿≈Ã “¿…ÀÃ¿œ ¿ Õ¿ C000
    
    JMP LEVEL0

      



LOADTORAMLEVEL0TILEMAP *«¿√–”« ¿ “¿…ÀŒ¬ ¡› √–¿”Õƒ¿   1 ”–Œ¬Õﬁ ¬ œ¿Ãﬂ“‹
; INPUT:
; 	d0	Starting pattern name (added to each 8x8 before writing to destination)
; 	a0	Source address
; 	a1	Destination address

   MOVEQ #1,D0
   MOVE.L #LEVEL0BTILEMAP,A0
   MOVE.L #$FFA000,A1

   JSR EniDec
    
    
    
    RTS   
FRAMECOUNT *œŒƒ—◊®“  ¿ƒ–Œ¬
    ADDQ #1,D7 
    CMP.B #50,D7
    BLT .L
    MOVEQ #0,D7
.L    
    RTS
    
 


MIKU						*Œ¡–¿¡Œ“ ¿ —œ–¿…“¿ –≈Ã”
						*—ÚÂÍ ÃËÌÛÒ 64 «¿Õﬂ“ ƒÀﬂ œŒƒ ¿“¿
					
    LEA VDPCONTROL,A3   *¿ƒ–≈—  ŒÕ“–ŒÀﬂ ¬»ƒ≈Œ◊»œ¿
	MOVE.L #$18040003,(A3) *”—“¿ÕŒ¬ ¿ ¿ƒ–≈—¿ —œ–¿…“Œ¬Œ… œŒ«»÷»» ¬ ¬»ƒ≈Œ◊»œ≈ ƒÀﬂ ◊“≈Õ»ﬂ (58040003 «¿œ»—‹)
    LEA VDPDATA,A4      *¿ƒ–≈— ƒ¿ÕÕ€’ ƒÀﬂ ¬»ƒ≈Œ◊»œ¿
    MOVE.L #$58040003,A6   *¿ƒ–≈— «¿œ»—» —œ–¿…“¿
    MOVE.L #$FF9FFE,A5  *¿ƒ–≈— ‘À¿√¿ —œ–¿…“¿ ¬ RAM
	MOVE.L #$FF9FFD,A2  *¿ƒ–≈— —Œ—“ŒﬂÕ»ﬂ œŒƒ ¿“¿
	*MOVE.L #$FF9FFC,A1  *¿ƒ–≈— —Œ—“ŒﬂÕ»ﬂ œ–Œ –”“ » √Œ’≈ﬂ ¬ (Õ≈ ”¡»–¿“‹  ŒÃ≈Õ“€ »Õ¿◊≈ Œ“–»—Œ¬ ¿ œŒÀŒÃ¿≈“—ﬂ)
    MOVE.L (A4),D1      *◊»“¿≈Ã œŒÀŒ∆≈Õ»≈ —œ–¿…“¿ »« ¬»ƒ≈Œœ¿Ãﬂ“»
    MOVE.W D1,$FF9FE6   *«¿œ»—‹ œŒÀŒ∆≈Õ»ﬂ —œ–¿…“¿ –≈…Ã” ¬ œ¿Ãﬂ“‹ ƒÀﬂ ƒ–”√»’ œ–Œ√–¿ÃÃ
	
	CMP.B #0,$FF9FFA   *œ–Œ¬≈– ¿ —¿À‹“Œ
	BNE .SALTO
	
	CMP.B #0,$FF9FFC	*œ–Œ¬≈– ¿ ¬«Ã¿’¿ √Œ’≈≈Ã
	BNE .GOHEISWIPE
	
	
	CMP.B #0,(A2)   *œ–Œ¬≈–ﬂ≈Ã œ–Œ»—’Œƒ»“ À» —≈…◊¿— œŒƒ ¿“
	BLT	.SLIDEL
    BGT .SLIDER
	
    CMP.B #1,$FF9FFB	*œ–Œ¬≈–ﬂ≈Ã ‘À¿√ ”ƒ≈–∆¿Õ»ﬂ B ƒÀﬂ √Œ’≈ﬂ
	BEQ	.GOHEIBUT
    

    CMP.W #$FFDB,D0		*œ–Œ¬≈–ﬂÃ —Œ◊»“¿Õ»≈ œŒƒ ¿“¿ ¬À≈¬Œ
	BEQ .SLIDEL 
	CMP.W #$FFD7,D0
	BEQ .SLIDER
	
.SLIDEJUMP	
	CMP.W #$FFFF,D0     *œ–Œ¬≈–ﬂ≈Ã ≈—À»  ÕŒœ » Õ≈ Õ¿∆¿“€
    BEQ .SPRITE1 			 *“Œ ƒ≈À¿≈Ã Œ¡€◊Õ€… —œ–¿…“   
	
    BTST #2,D0     *œ–Œ¬≈–ﬂ≈Ã ¬À≈¬Œ
    BEQ .LEFT
    BTST #3,D0     *œ–Œ¬≈–ﬂ≈Ã ¬œ–¿¬Œ
    BEQ .RIGHT
	
	
	CMP.B #1,$FF9FFB	*œ–Œ¬≈–ﬂ≈Ã ‘À¿√ ”ƒ≈–∆¿Õ»ﬂ B ƒÀﬂ √Œ’≈ﬂ
	BEQ	.SPRITE1
	BTST #5,D0 		*œ–Œ¬≈–ﬂ≈Ã  ÕŒœ ” !B! Œ“ƒ≈À‹ÕŒ
	BEQ .GOHEISWIPE	
    JMP .SPRITE1

.GOHEIBUT				*‘”Õ ÷»ﬂ ƒÀﬂ —¡–Œ—¿ ‘À¿√¿ Õ¿∆¿“»ﬂ  ÕŒœ »
	BTST #5,D0 		*œ–Œ¬≈–ﬂ≈Ã  ÕŒœ ” !B! Œ“ƒ≈À‹ÕŒ
	BEQ .SLIDEJUMP
	MOVE.B #0,$FF9FFB	*Œ¡Õ”Àﬂ≈Ã ‘À¿√ ≈—À»  ÕŒœ ¿ Œ“œ”Ÿ≈ÕÕ¿
	JMP .SLIDEJUMP
	
.GOHEISWIPE				*‘”Õ ÷»ﬂ ¬«Ã¿’¿ √Œ’≈≈Ã
	MOVE.B	$FF9FFC,D5	*œ≈–≈ÕŒ—»Ã ƒ¿ÕÕ€≈ »« œ¿Ãﬂ“» ¬ –≈√»—“– ¬–≈Ã≈ÕÕ€… ƒÀﬂ › ŒÕŒÃ»» œ¿Ãﬂ“»
	ADDQ #2,D5			*ƒŒ¡¿¬Àﬂ≈Ã   —◊®“◊» ”
	
	
						
	LEA MIKUTILE14,A0	*√–”«»Ã —œ–¿…“
	MOVE.B D5,$FF9FFC	*«¿ƒ¬»√¿≈Ã —◊®“◊»  Œ¡–¿“ÕŒ ¬ œ¿Ãﬂ“‹
	CMP.B #6,D5			*—–¿¬Õ»¬¿≈Ã  ¿ƒ–€
	BEQ .SPRITEDRAW		*–»—”≈Ã —œ–¿…“
	LEA MIKUTILE15,A0
	CMP.B #12,D5
	BEQ .SPRITEDRAW	
	CMP.B #36,D5
	BEQ .SPRITEDRAW	
	LEA MIKUTILE16,A0
	CMP.B #18,D5
	BEQ .SPRITEDRAW
	CMP.B #42,D5
	BEQ .SPRITEDRAW		
	LEA MIKUTILE17,A0
	CMP.B #24,D5
	BEQ .SPRITEDRAW	
	CMP.B #48,D5
	BEQ .SPRITEDRAW	
	CMP.B #30,D5  
	BEQ .SPFLIP
	CMP.B #54,D5
	BEQ .GOHEICLEAR	
	
	
	
	RTS
.SALTOREPEAT *‘”Õ ÷»ﬂ ƒÀﬂ œŒ¬“Œ–¿ —¿À‹“Œ
	CMP.B #0,$FF9FF8	*—–¿¬Õ»¬¿≈Ã  ŒÀ»◊≈—“¬Œ Œ—“¿¬ÿ»’—ﬂ —¿À‹“Œ
	BLE	.SALTOB			*≈—À»  ŒÕ◊»À»—‹ “Œ ¬€œ–€√»¬¿≈Ã
	BTST.L #6,D0		*≈—À» Õ≈“ “Œ œ–Œ¬≈–ﬂ≈Ã —
	BEQ	.SALTORESET		*≈—À» Õ¿∆¿“¿ —¡–¿—€¬¿≈Ã » œŒ¬“Œ–ﬂ≈Ã —¿À‹“Œ
	JMP	.SALTOB			*≈—À» Õ≈ Õ¿∆¿“¿ ƒ≈À¿≈Ã ≈Ÿ®  –”√
.SALTOTRAP				*ÀŒ¬”ÿ ¿ ƒÀﬂ «¿Ÿ»“€ Œ“ «¿∆¿“»ﬂ  ÕŒœ »
	BTST.L #6,D0		
	BNE .SALTOB
	CLR.B $FF9FF8
	JMP .SALTOB
.SALTORESET				*—¡–Œ— —¿À‹“Œ
	CLR.B $FF9FFA		*—¡–Œ— —Œ—“ŒﬂÕ»ﬂ —¿À‹“Œ
	SUB.B #1,$FF9FF8	*¬€◊»“¿Õ»≈  ŒÀ»◊≈—“¬¿ Œ—“¿¬ÿ»’—ﬂ —¿À‹“Œ
.SALTO						*Œ—ÕŒ¬ÕŒ… ÷» À —¿À‹“Œ
	MOVE.L A6,(A3) 		*œŒƒ√Œ“Œ¬ ¿   «¿œ»—» ¬ ¬»ƒ≈Œ◊»œ 
	CLR.L D3			*◊»—“»Ã Õ¿ ¬—ﬂ »… —À”◊¿… –≈√»—“– ¬–≈Ã≈ÕÕŒ√Œ ’–¿Õ≈Õ»ﬂ
	MOVE.B	$FF9FFA,D5	*œ≈–≈ÕŒ—»Ã ƒ¿ÕÕ€≈ »« œ¿Ãﬂ“» ¬ –≈√»—“– ¬–≈Ã≈ÕÕ€… ƒÀﬂ › ŒÕŒÃ»» œ¿Ãﬂ“»
	ADDQ #1,D5			*ƒŒ¡¿¬Àﬂ≈Ã   —◊®“◊» ”
	MOVE.B #6,D4		*«¿Õ»Ã¿≈Ã –≈√»—“– ƒÀﬂ › ŒÕŒÃ»» œ¿Ãﬂ“»
	
	
	MOVE.B $FF9FF7,D3		*œ≈–≈Ã≈Ÿ¿≈Ã ƒ¿ÕÕ€≈ ƒÀﬂ ƒ¬»∆≈Õ»ﬂ
	BTST.L #27,D1		*œ–Œ¬≈–ﬂ≈Ã  ”ƒ¿ œŒ¬®–Õ”“ —œ–¿…“
	BEQ	.LEFTSA
.RIGHTSA	
	CMP.W #$01A7,D1         *œ–Œ¬≈–ﬂ≈Ã Õ≈ ”œ®–À»—‹ À» ¬  –¿… › –¿Õ¿
    BGT .SALTOJUMP
	ADD.W D3,D1              *¬€◊»“¿≈Ã «Õ¿◊≈Õ»≈ ƒ¬»∆≈Õ»ﬂ
	JMP .SALTOJUMP
.LEFTSA	
	CMP.W #$0079,D1         *œ–Œ¬≈–ﬂ≈Ã Õ≈ ”œ®–À»—‹ À» ¬  –¿… › –¿Õ¿
    BLE .SALTOJUMP
	SUB.W D3,D1              *¬€◊»“¿≈Ã «Õ¿◊≈Õ»≈ ƒ¬»∆≈Õ»ﬂ

.SALTOJUMP	
	LEA MIKUTILE9,A0	*√–”«»Ã —œ–¿…“
	MOVE.L D1,(A4)		*Œ“œ–¿¬Àﬂ≈Ã ƒ¬»∆≈Õ»≈ —œ–¿…“¿ ¬ ¬»ƒ≈Œ◊»œ
	MOVE.B D5,$FF9FFA	*«¿ƒ¬»√¿≈Ã —◊®“◊»  Œ¡–¿“ÕŒ ¬ œ¿Ãﬂ“‹
	CMP.B D4,D5			*—–¿¬Õ»¬¿≈Ã  ¿ƒ–€
	BEQ .SPRITEDRAW		*–»—”≈Ã —œ–¿…“
	ADDQ #6,D4			*ƒŒ¡¿¬Àﬂ≈Ã ƒŒ —À≈ƒ”ﬁŸ≈… œ–Œ¬≈– »
	
	
	LEA MIKUTILE10,A0	*√–”«»Ã —œ–¿…“
	CMP.B D4,D5			*—–¿¬Õ»¬¿≈Ã  ¿ƒ–€
	BEQ .SPRITEDRAW		*–»—”≈Ã —œ–¿…“
	
	CMP.B #20,D5
	BEQ .SALTOTRAP
	
	ADDQ #6,D4
	LEA MIKUTILE11,A0	*√–”«»Ã —œ–¿…“
	CMP.B D4,D5			*—–¿¬Õ»¬¿≈Ã  ¿ƒ–€
	BEQ .SPRITEDRAW		*–»—”≈Ã —œ–¿…“
	ADDQ #6,D4
	LEA MIKUTILE12,A0	*√–”«»Ã —œ–¿…“
	CMP.B D4,D5		    *—–¿¬Õ»¬¿≈Ã  ¿ƒ–€
	BEQ .SPRITEDRAW		*–»—”≈Ã —œ–¿…“
	ADDQ #6,D4
	LEA MIKUTILE13,A0	*√–”«»Ã —œ–¿…“
	
	CMP.B D4,D5			*—–¿¬Õ»¬¿≈Ã  ¿ƒ–€
	BEQ .SPRITEDRAW		*–»—”≈Ã —œ–¿…“
	CMP.B #20,D5
	BEQ .SALTOTRAP
	CMP.B #29,D5
	BGT	.SALTOREPEAT	
		
.SALTOB				*‘”Õ ÷»ﬂ ƒÀﬂ œ≈–≈— Œ ¿
	ADD.B #9,D4
	CMP.B D4,D5
	BEQ .GOHEICLEAR
	
	RTS
.GOHEICLEAR				*◊»—“ ¿ √Œ’≈ﬂ
	CLR.B (A5)			*Œ“◊»—“»Ã ‘À¿√ —œ–¿…“¿ ◊“Œ¡ œ≈–¬€… –¿« Œ¡ÕŒ¬»À—ﬂ œ–¿¬»À‹ÕŒ —œ–¿…“
	CLR.B $FF9FFC		*—¡–Œ—»Ã √Œ’≈…
	MOVE.B #1,$FF9FFB	*«¿ÕŒ—»Ã ‘À¿√ ”ƒ≈–∆¿Õ»ﬂ  ÕŒœ »
	CLR.B $FF9FFA		*◊»—“ ¿ —¿À‹“Œ
	CLR.B $FF9FF7		*◊»—“ ¿ ƒ¬»∆≈Õ»ﬂ ¬ —¿À‹“Œ
	SUB.L #64,A7			*Œ—¬Œ¡Œ∆ƒ¿≈Ã Ã≈—“Œ ¬ —“≈ ≈
	MOVE.W #0,(A7)
	ADD.L #64,A7
	CLR.B (A2)			*◊»—“ ¿ œŒƒ ¿“¿
	CLR.B $FF9FF9		*◊»—“ ¿ “¿…Ã»Õ√¿ —¿À‹“Œ
	JMP .SPRITE1		*Œ“–»—”≈Ã —“Œﬂ◊»… —œ–¿…“

.SPFLIP						*‘”Õ ÷»ﬂ ƒÀﬂ Œ“–¿∆≈Õ»ﬂ —œ–¿…“¿ –¿¡Œ“¿≈“ — √Œ’≈≈Ã
	MOVE.L A6,(A3)          *¬€—“¿¬Àﬂ≈Ã Œ◊≈–≈ƒ Õ¿ «¿œ»—‹ ¬ ¬»ƒ≈Œ◊»œ ¿“–»¡”“€ —œ–¿…“¿ 
	BCHG #27,D1             *–¿«¬Œ–¿◊»¬¿≈Ã —œ–¿…“
	LEA	MIKUTILE14,A0 		*√–”«»Ã —À≈ƒ”ﬁŸ»… —œ–¿…“ ◊“Œ ¡€ Õ≈ “≈–ﬂ“‹ —»Õ’–ŒÕ»«¿÷»ﬁ
	MOVE.L D1,(A4)          *œ≈–≈ÕŒ—»Ã ¿“–»¡”“€ —œ–¿…“¿ ¬ ¬»ƒ≈Œ◊»œ („‡ÌËˆ‡ ÎÂ‚‡ˇ 0079)
	JMP .SPRITEDRAW	
.SLIDER				*œŒƒ ¿“ ¬œ–¿¬Œ »—œŒÀ‹«”≈Ã Œƒ»Õ¿ Œ¬€≈ ‘À¿√» 
	MOVE.L A6,(A3)          *¬€—“¿¬Àﬂ≈Ã Œ◊≈–≈ƒ Õ¿ «¿œ»—‹ ¬ ¬»ƒ≈Œ◊»œ ¿“–»¡”“€ —œ–¿…“¿ 
	ADD.B #1,(A2)		*œ–»¡¿¬Àﬂ≈Ã —Œ—“ŒﬂÕ»≈ œŒƒ ¿“¿

	CMP.B #$B,(A2)		*“¿…Ã»Õ√ ƒÀﬂ —¿À‹“Œ
	BLT .SALTOPREP		*œ–Œ¬≈–ﬂ≈Ã ¬–≈Ãﬂ œŒƒ ¿“¿ »  ÕŒœ » —ŒŒ“¬≈“—“¬≈ÕÕŒ
						*≈—À» ◊“Œ “Œ œŒ ¬–≈Ã≈Õ» Õ≈ —Œ¬œ¿ƒ¿≈“ ¡ÀŒ »–”≈Ã œŒƒ ¿“ ÷≈À» ŒÃ
	CMP.B #$10,(A2)
	BLT .SALTOPREP2
.SRSKIP	
	CMP.B #$12,(A2)    	*œ–Œ¬≈–ﬂ≈Ã Õ≈ «¿ ŒÕ◊»ÀŒ—‹ À» Œ¡Ÿ≈≈ ¬–≈Ãﬂ œŒƒ ¿“¿
	BGT .SLIDECLEAR		*≈—À» «¿ ŒÕ◊»ÀŒ—‹  œ≈–≈«¿√–”∆¿≈Ã —»—“≈Ã” œŒƒ ¿“¿
	CMP.B #$10,(A2)		*œ–Œ¬≈–ﬂ≈Ã «¿ ŒÕ◊»ÀŒ—‹ À» ¬–≈Ãﬂ Œ—ÕŒ¬ÕŒ√Œ œŒƒ ¿“¿
	BGT .SLIDEJUMP      *¬€œ–€√»¬¿≈Ã Õ¿«¿ƒ ≈—À» «¿ ŒÕ◊»ÀŒ—‹
	
	CMP.W #$01A7,D1         *œ–Œ¬≈–ﬂ≈Ã Õ≈ ”œ®–À»—‹ À» ¬  –¿… › –¿Õ¿
    BGT .SRS
	ADDQ #4,D1              *¬€◊»“¿≈Ã «Õ¿◊≈Õ»≈ ƒ¬»∆≈Õ»ﬂ	
.SRS	
	BSET #27,D1             *–¿«¬Œ–¿◊»¬¿≈Ã —œ–¿…“
	SUB.L #64,A7			*Œ—¬Œ¡Œ∆ƒ¿≈Ã Ã≈—“Œ ¬ —“≈ ≈
	MOVE.L D1,(A4)          *œ≈–≈ÕŒ—»Ã ¿“–»¡”“€ —œ–¿…“¿ ¬ ¬»ƒ≈Œ◊»œ („‡ÌËˆ‡ ÎÂ‚‡ˇ 0079)
	CMP.B #13,(A7)			*—–¿¬Õ»¬¿≈Ã ÕŒÃ≈– «¿ŸŸ®À ” ƒÀﬂ œŒƒ ¿“¿ — ÕŒ√Œ…
	BEQ .SLIDEUPFOOT
	
	BTST #5,D0             *œ–Œ¬≈–ﬂ≈Ã Õ¿∆»Ã¿Õ»≈  ÕŒœ » B
							*≈—À» Õ≈ Õ¿∆¿“¿ SK
	BNE .SK
	CMP.B #11,(A7)			*—–¿¬Õ»¬¿≈Ã œ≈–¬ŒÕ¿◊¿À‹Õ”ﬁ «¿Ÿ®À ”
	BEQ .SLIDEUPR		*≈—À» ŒÕ¿ ≈—“‹ «¿ƒ»–¿≈Ã ÕŒ√”
	ADD.L #64,A7			*≈—À» Õ≈“” “Œ ¬Œ«¬–¿Ÿ¿≈Ã —“≈  Õ¿ Ã≈—“Œ
	
	JMP .OPTSL
.SALTOPREP				*œ≈–¬»◊Õ¿ﬂ œ–Œ¬≈– ¿ œŒƒ ¿“¿
	BTST.L #6,D0		*œ–Œ¬≈– ¿  ÕŒœ » Õ¿ Õ¿∆¿“»≈
	SEQ.B $FF9FF9		*≈—À» Õ¿∆¿“¿ ¡ÀŒ »–”≈Ã ƒ¿À‹Õ≈…ÿ»… œŒƒ ¿“ (»À» —¡–¿—€¬¿≈Ã ÀŒ∆Õ€… ‘À¿√)
	BEQ .JUMPCHECK			*≈—À» Õ¿∆¿“¿ “Œ »ƒ®“ ƒ¿À‹ÿ≈ œŒ œ–Œ¬≈– ¿Ã
	
	MOVE.B #8,$FF9FF9	*≈—À»  ÕŒœ ¿ Õ≈ Õ¿∆¿“¿ «¿ »ƒ€¬¿≈Ã ‘À¿√ ƒÀﬂ ¬“Œ–»◊ÕŒ… œ–Œ¬≈– »
	JMP .JUMPCHECK			*»ƒ®Ã ƒ¿À‹ÿ≈

.SALTOMOVE
	MOVE.B #2,$FF9FF7	*— Œ–Œ—“‹ ƒ¬»∆≈Õ»ﬂ ¬ —¿À‹“Œ
	JMP .SALTOPREPP
.SALTOPREP2				*¬“Œ–»◊Õ¿ﬂ œ–Œ¬≈– ¿ “¿…Ã»Õ√¿ œŒƒ ¿“¿
	CMP.B #8,$FF9FF9	*œ–Œ¬≈– ¿ œ≈–¬»◊ÕŒ√Œ ‘À¿√¿
	BNE .JUMPCHECK			*≈—À» ‘À¿√ Õ≈ —Œ¬œ¿ƒ¿≈“ »ƒ®Ã ƒ¿À‹ÿ≈ œŒ œŒƒ ¿“”
	MOVE.B #2,$FF9FF8	*«¿ÕŒ—»Ã 2 œŒƒ ¿“¿ «¿–¿Õ≈≈
	BTST.L #2,D0		*œ–Œ¬≈– ¿ Õ¿œ–¿¬À≈Õ»… ƒÀﬂ ƒ¬»∆≈Õ»ﬂ ¬ —¿À‹“Œ
	BEQ .SALTOMOVE
	BTST.L #3,D0
	BEQ .SALTOMOVE
.SALTOPREPP	
	BTST.L #6,D0		*≈—À» ‘À¿√ —Œ¬œ¿À œ–Œ¬≈–ﬂ≈Ã  ÕŒœ ”
	BEQ .SALTO			*≈—À»  ÕŒœ ¿ —Œ¬œ¿À¿ ƒ≈À¿≈Ã —¿À‹“Œ
	JMP .JUMPCHECK			*≈—À»  ÕŒœ ¿ Õ≈ —Œ¬œ¿À¿ »ƒ®Ã ƒ¿À‹ÿ≈
	
.JUMPCHECK			*‘”Õ ÷»ﬂ ƒÀﬂ œ–¿¬»À‹ÕŒ√Œ ¬€œ–€√»¬¿Õ»ﬂ
	CMP.B #$0,(A2)	*œ–Œ¬≈–ﬂ≈Ã ¬  ¿ ”ﬁ —“Œ–ŒÕ” œŒƒ ¿“
	BGT	.SRSKIP		*≈—À» ¡ŒÀ‹ÿ≈ 0 œ–ŒƒŒÀ∆¿≈Ã œ–¿¬€… œŒƒ ¿“
	BLT	.SLNE		*≈—À» Ã≈Õ‹ÿ≈ 0 œ–ŒƒŒÀ∆¿≈Ã À≈¬€… œŒƒ ¿“
.SLIDEL				*œŒƒ ¿“ ¬À≈¬Œ  ‘À¿√ —œ–¿…“¿ 20 » 21 23
	MOVE.L A6,(A3)          *¬€—“¿¬Àﬂ≈Ã Œ◊≈–≈ƒ Õ¿ «¿œ»—‹ ¬ ¬»ƒ≈Œ◊»œ ¿“–»¡”“€ —œ–¿…“¿ 
	
	SUB.B #1,(A2)		*Œ“Õ»Ã¿≈Ã —Œ—“ŒﬂÕ»≈ œŒƒ ¿“¿
	
	CMP.B #$F5,(A2)		*“¿…Ã»Õ√ ƒÀﬂ —¿À‹“Œ
	BGT .SALTOPREP		*œ–Œ¬≈–ﬂ≈Ã ¬–≈Ãﬂ œŒƒ ¿“¿ »  ÕŒœ » —ŒŒ“¬≈“—“¬≈ÕÕŒ
						*≈—À» ◊“Œ “Œ œŒ ¬–≈Ã≈Õ» Õ≈ —Œ¬œ¿ƒ¿≈“ ¡ÀŒ »–”≈Ã œŒƒ ¿“ ÷≈À» ŒÃ
	CMP.B #$F0,(A2)
	BGT .SALTOPREP2
	
.SLNE
	CMP.B #$EE,(A2)    	*œ–Œ¬≈–ﬂ≈Ã Õ≈ «¿ ŒÕ◊»ÀŒ—‹ À» Œ¡Ÿ≈≈ ¬–≈Ãﬂ œŒƒ ¿“¿
	BLT .SLIDECLEAR		*≈—À» «¿ ŒÕ◊»ÀŒ—‹  œ≈–≈«¿√–”∆¿≈Ã —»—“≈Ã” œŒƒ ¿“¿
	CMP.B #$F0,(A2)		*œ–Œ¬≈–ﬂ≈Ã «¿ ŒÕ◊»ÀŒ—‹ À» ¬–≈Ãﬂ Œ—ÕŒ¬ÕŒ√Œ œŒƒ ¿“¿
	BLT .SLIDEJUMP      *¬€œ–€√»¬¿≈Ã Õ¿«¿ƒ ≈—À» «¿ ŒÕ◊»ÀŒ—‹
	
	CMP.W #$0079,D1         *œ–Œ¬≈–ﬂ≈Ã Õ≈ ”œ®–À»—‹ À» ¬  –¿… › –¿Õ¿
    BLE .SLS
	SUBQ #4,D1              *¬€◊»“¿≈Ã «Õ¿◊≈Õ»≈ ƒ¬»∆≈Õ»ﬂ
	
.SLS		
	BCLR #27,D1             *–¿«¬Œ–¿◊»¬¿≈Ã —œ–¿…“
	MOVE.L D1,(A4)          *œ≈–≈ÕŒ—»Ã ¿“–»¡”“€ —œ–¿…“¿ ¬ ¬»ƒ≈Œ◊»œ („‡ÌËˆ‡ ÎÂ‚‡ˇ 0079)
.STSLIDE	
	SUB.L #64,A7			*Œ—¬Œ¡Œ∆ƒ¿≈Ã Ã≈—“Œ ¬ —“≈ ≈
	
	CMP.B #13,(A7)			*—–¿¬Õ»¬¿≈Ã ÕŒÃ≈– «¿ŸŸ®À ” ƒÀﬂ œŒƒ ¿“¿ — ÕŒ√Œ…
	BEQ .SLIDEUPFOOT
	
	BTST #5,D0             *œ–Œ¬≈–ﬂ≈Ã Õ¿∆»Ã¿Õ»≈  ÕŒœ » B
							*≈—À» Õ≈ Õ¿∆¿“¿ SK
	BNE .SK
	CMP.B #11,(A7)			*—–¿¬Õ»¬¿≈Ã œ≈–¬ŒÕ¿◊¿À‹Õ”ﬁ «¿Ÿ®À ”
	BEQ .SLIDEUPPREP		*≈—À» ŒÕ¿ ≈—“‹ «¿ƒ»–¿≈Ã ÕŒ√”
.NZ	
	ADD.L #64,A7			*≈—À» Õ≈“” “Œ ¬Œ«¬–¿Ÿ¿≈Ã —“≈  Õ¿ Ã≈—“Œ
	JMP .OPTSL				*»ƒ®Ã ƒ¿À‹ÿ≈ œŒ —¬Œ»Ã ƒ≈À¿Ã
.SK							*‘”Õ ÷»ﬂ ƒÀﬂ Œ–√¿Õ»«¿÷»» «¿Ÿ®À »
	MOVE.B #11,(A7)			*”—“¿Õ¿¬À»¬¿≈Ã ‘À¿√ ¬ —“≈ 
	
	JMP .NZ					*ƒ≈À¿≈Ã œŒÀ” –”√ ƒÀﬂ ¬Œ——“¿ÕŒ¬À≈Õ»ﬂ —“≈ ¿

.OPTSL
	
	
	BTST #2,D7              *œ–Œ¬≈–ﬂÃ  ¿ Œ… —≈…◊¿—  ¿ƒ–
	BEQ .SLIDEL2
	
	CMP.B #20,(A5)           *œ–Œ¬≈–ﬂ≈Ã ‘À¿√ —œ–¿…“¿
    BEQ .RETURN 

    MOVE.B #20,(A5)         *”—“¿Õ¿¬À»¬¿≈Ã ‘À¿√ —œ–¿…“¿
	
	LEA MIKUTILE6,A0		*«¿√–”« ¿ —œ–¿…“¿ œŒƒ ¿“¿ ¬À≈¬Œ
	
	JMP .SPRITEDRAW

.SLIDEL2  	*¬“Œ–Œ… ¬¿–»¿Õ“ — ŒÀ‹∆≈Õ»ﬂ
	
	CMP.B #21,(A5)           *œ–Œ¬≈–ﬂ≈Ã ‘À¿√ —œ–¿…“¿
    BEQ .RETURN 

    MOVE.B #21,(A5)         *”—“¿Õ¿¬À»¬¿≈Ã ‘À¿√ —œ–¿…“¿
	
	LEA MIKUTILE7,A0
	JMP .SPRITEDRAW
.SLIDEUPPREP					*ƒŒ¡¿¬Àﬂ≈Ã ¬–≈Ãﬂ œŒƒ ¿“¿ — ÕŒ√Œ…
	CLR.B $FF9FF7	*”ƒ¿Àﬂ≈Ã —À≈ƒ€ œ–≈ƒ¬¿–»“≈À‹Õ€’ ¬€◊»—À≈Õ»… ƒ¬»∆≈Õ»ﬂ — œ–ŒÿÀŒ√Œ œŒƒ ¿“¿
	MOVE.B #$FF,(A2)
	BRA .SLIDEUPFOOT
.SLIDEUPR			*ƒŒ¡¿¬ ¿ œŒƒ ¿“¿ ƒÀﬂ ¬œ–¿¬Œ
	CLR.B $FF9FF7	*”ƒ¿Àﬂ≈Ã —À≈ƒ€ œ–≈ƒ¬¿–»“≈À‹Õ€’ ¬€◊»—À≈Õ»… ƒ¬»∆≈Õ»ﬂ — œ–ŒÿÀŒ√Œ œŒƒ ¿“¿
	MOVE.B #$1,(A2)
		
.SLIDEUPFOOT
	MOVE.B #13,(A7)		*ƒ¬»√¿≈Ã œŒÀÕ”ﬁ «¿Ÿ®À ” ¬ —“≈ 
    SWAP D7
    BSET #0,D7
    SWAP D7
	ADD.L #64,A7		*¬Œ«¬–¿Ÿ¿≈Ã —“≈  Õ¿ Ã≈—“Œ
*	BTST.L #6,D0			*œ–Œ¬≈–ﬂ≈Ã Õ¿∆¿“»≈ C » √Œ“Œ¬»Ã—ﬂ   —¿À‹“Œ
*	BEQ	.SALTO
	CMP.B #23,(A5)		*–¿¡Œ“¿≈Ã — ‘À¿√ŒÃ —œ–¿…“¿ ÕŒ√»
	BEQ .RETURN
	
	MOVE.B #23,(A5)
	
	
		
	LEA MIKUTILE8,A0
	JMP .SPRITEDRAW
	
	
.SLIDECLEAR				*‘”Õ ÷»ﬂ ƒÀﬂ œ≈–≈«¿√–”« » œŒƒ ¿“¿ 
	SUB.L #64,A7			*Œ—¬Œ¡Œ∆ƒ¿≈Ã Ã≈—“Œ ¬ —“≈ ≈
	MOVE.W #0,(A7)
	ADD.L #64,A7
	MOVE.B #0,(A2)		*◊»—“»Ã ﬂ◊≈… ” œŒƒ ¿“¿ ¬ RAM 
	CLR.B $FF9FF9		*◊»—“ ¿ ﬂ◊≈… » ƒÀﬂ “¿…Ã»Õ√¿ œŒƒ ¿“¿
	JMP .SLIDEJUMP		*¬€œ–€√»¬¿≈Ã Õ¿«¿ƒ » œ–Œ¬≈–ﬂ≈Ã ”œ–¿¬À≈Õ»≈

.RIGHT   				*¬œ–¿¬Œ ‘À¿√ —œ–¿…“¿ 22 » 33
	MOVE.L A6,(A3)          *¬€—“¿¬Àﬂ≈Ã Œ◊≈–≈ƒ Õ¿ «¿œ»—‹ ¬ ¬»ƒ≈Œ◊»œ ¿“–»¡”“€ —œ–¿…“¿      
    CMP.W #$01A7,D1         *œ–Œ¬≈–ﬂ≈Ã Õ≈ ”œ®–À»—‹ À» ¬  –¿… › –¿Õ¿
    BGE .SR
                      
    ADDQ #2,D1              *¬€◊»“¿≈Ã «Õ¿◊≈Õ»≈ ƒ¬»∆≈Õ»ﬂ  
.SR    
    BSET #27,D1             *œ≈–≈¬Œ–¿◊»¬¿≈Ã —œ–¿…“
        
    MOVE.L D1,(A4)          *œ≈–≈ÕŒ—»Ã ¿“–»¡”“€ —œ–¿…“¿ ¬ ¬»ƒ≈Œ◊»œ („‡ÌËˆ‡ Ô‡‚‡ˇ 01A7)
    
    
    BTST #3,D7              *œ–Œ¬≈–ﬂÃ  ¿ Œ… —≈…◊¿—  ¿ƒ–
    BEQ .RIGHTSP2
    
    CMP.B #22,(A5)           *œ–Œ¬≈–ﬂ≈Ã ‘À¿√ —œ–¿…“¿
    BEQ .RETURN 

    MOVE.B #22,(A5)         *”—“¿Õ¿¬À»¬¿≈Ã ‘À¿√ —œ–¿…“¿
    LEA MIKUTILE2,A0
    JMP .SPRITEDRAW

.RIGHTSP2
    CMP.B #33,(A5)           *œ–Œ¬≈–ﬂ≈Ã ‘À¿√ —œ–¿…“¿
    BEQ .RETURN 
    
    MOVE.B #33,(A5)         *—“¿¬»Ã ‘À¿√
    LEA MIKUTILE3,A0
    JMP .SPRITEDRAW
    
                        
.LEFT			*‘À¿√ —œ–¿…“¿ 2 » 3
   * CMP.B #2,(A5)
   * BEQ .RETURN
    MOVE.L A6,(A3)          *¬€—“¿¬Àﬂ≈Ã Œ◊≈–≈ƒ Õ¿ «¿œ»—‹ ¬ ¬»ƒ≈Œ◊»œ ¿“–»¡”“€ —œ–¿…“¿      
    
    CMP.W #$0079,D1         *œ–Œ¬≈–ﬂ≈Ã Õ≈ ”œ®–À»—‹ À» ¬  –¿… › –¿Õ¿
    BLE .LS
    
	SUBQ #2,D1              *¬€◊»“¿≈Ã «Õ¿◊≈Õ»≈ ƒ¬»∆≈Õ»ﬂ                         	
                      
    
.LS    
    BCLR #27,D1             *–¿«¬Œ–¿◊»¬¿≈Ã —œ–¿…“
    
    MOVE.L D1,(A4)          *œ≈–≈ÕŒ—»Ã ¿“–»¡”“€ —œ–¿…“¿ ¬ ¬»ƒ≈Œ◊»œ („‡ÌËˆ‡ ÎÂ‚‡ˇ 0079)
    BTST #3,D7              *œ–Œ¬≈–ﬂÃ  ¿ Œ… —≈…◊¿—  ¿ƒ–
    BEQ .LEFTSP2
                            *ƒ≈À»Ã œ–»Ã≈–ÕŒ Õ¿ 4 ¬–≈Ãﬂ » ¬€¡»–¿≈Ã –¿«Õ€… Õ¿¡Œ– —œ–¿…“¿
    CMP.B #2,(A5)           *œ–Œ¬≈–ﬂ≈Ã ‘À¿√ —œ–¿…“¿
    BEQ .RETURN 
                            *≈—À» —œ–¿…“ “Œ“ ∆≈ —¿Ã€… Õ≈ œ≈–≈–»—Œ¬€¬¿≈Ã
    LEA MIKUTILE2,A0        *«¿√–”∆¿≈Ã ¿ƒ–≈— —œ–¿…“¿
    MOVE.B #2,(A5)          *¬€—“¿¬Àﬂ≈Ã ‘À¿√ —œ–¿…“¿
    
    JMP .SPRITEDRAW         
                            *œ–€∆Œ  Õ¿ –¿—œ¿ Œ¬ ” —œ–¿…“¿
.LEFTSP2                *2ﬂ ¬¿–»¿÷»ﬂ ¡≈√¿ ¬À≈¬Œ
    CMP.B #3,(A5)
    BEQ .RETURN
       
    LEA MIKUTILE3,A0        *«¿√–”∆¿≈Ã ¿ƒ–≈— —œ–¿…“¿
    MOVE.B #3,(A5)          *¬€—“¿¬Àﬂ≈Ã ‘À¿√ —œ–¿…“¿
    
    JMP .SPRITEDRAW         
                            *œ–€∆Œ  Õ¿ –¿—œ¿ Œ¬ ” —œ–¿…“¿
                    
                            
.SPRITE1                *Œ¡€◊Õ€… —œ–¿…“
    CMP.B #1,(A5)       *—–¿¬Õ»¬¿≈Ã ‘À¿√ —œ–¿…“¿
    BEQ .RETURN
                        *≈—À» “¿ Œ… —œ–¿…“ ”∆≈ ¬€¬Œƒ»À» “Œ Õ≈ œ≈–≈–»—Œ¬€¬¿≈Ã  
    LEA MIKUTILE1,A0    *«¿ÕŒ—»Ã ¿ƒ–≈— Œ¡€◊ÕŒ√Œ —œ–¿…“¿
    MOVE.B #1,(A5)      *«¿ÕŒ—»Ã ‘À¿√ —œ–¿…“¿
   
.SPRITEDRAW *œ≈–≈ƒ ›“»Ã «¿Õ≈—“» ¿ƒ–≈— —œ–¿…“¿ ¬ ¿0
    MOVE.L #$FFA000,A1  *«¿√–”« ¿ ¿ƒ–≈—¿ ¬–≈Ã≈ÕÕŒ… –¿—œ¿ Œ¬ » ¬ RAM   
    MOVE.L A1,A2        * Œœ»–Œ¬¿Õ»≈ ¿ƒ–≈—¿ œ¿Ãﬂ“»
    
    JSR Kos_Decomp      *–¿—œ¿ Œ¬ ¿ —œ–¿…“¿ ¬ RAM
    MOVE.L #$70000002,(A3) *«¿√–”« ¿ ¿ƒ–≈—¿ —œ–¿…“¿ ¬  ŒÕ“–ŒÀ‹Õ€… –≈√»—“– ¬»ƒ≈Œ◊»œ¿
.L
    MOVE.L (A2)+,(A4)       *  Œœ»–Œ¬¿Õ»≈ —œ–¿…“¿ »« RAM ¬ ¬»ƒ≈Œ◊»œ
    
    CMP.L A2,A1
    BNE .L
    
    
.RETURN   
   RTS 
     
   *—∆¿“€≈ —œ–¿…“€ KOS
MIKUTILE1 INCBIN "tilemap\res\mikutiles1.bin"  *Œ·˚˜Ì˚È ÒÔ‡ÈÚ
MIKUTILE2 INCBIN "tilemap\res\mikutiles2.bin"  *¡Â„ ‚ÎÂ‚Ó 1

MIKUTILE3 INCBIN "tilemap\res\mikutiles3.bin"  *¡Â„ ‚ÎÂ‚Ó 2
MIKUTILE4 INCBIN "tilemap\res\mikutiles4.bin"  *¬˚ÒÚÂÎ
MIKUTILE5 INCBIN "tilemap\res\mikutiles5.bin"  *—ÏÂÚ

MIKUTILE6 INCBIN "tilemap\res\mikutiles6.bin"  *œÓ‰Í‡Ú ‚ÎÂ‚Ó 1 
MIKUTILE7 INCBIN "tilemap\res\mikutiles7.bin"  *œÓ‰Í‡Ú ‚ÎÂ‚Ó 2
MIKUTILE8 INCBIN "tilemap\res\mikutiles8.bin"  *œÓ‰Í‡Ú ‚ÎÂ‚Ó Ò ÔÓ‰ÌˇÚÓÈ ÌÓ„ÓÈ

MIKUTILE9 INCBIN "tilemap\res\mikutiles9.bin"   *œÂ‚˚È Í‡‰ Ò‡Î¸ÚÓ
MIKUTILE10 INCBIN "tilemap\res\mikutiles10.bin" *¬ÚÓÓÈ Í‡‰ Ò‡Î¸ÚÓ
MIKUTILE11 INCBIN "tilemap\res\mikutiles11.bin" *“ÂÚËÈ Í‡‰ Ò‡Î¸ÚÓ

MIKUTILE12 INCBIN "tilemap\res\mikutiles12.bin" *◊ÂÚ‚∏Ú˚È Í‡‰ Ò‡Î¸ÚÓ
MIKUTILE13 INCBIN "tilemap\res\mikutiles13.bin" *œÓÒÎÂ‰ÌËÈ Í‡‰ Ò‡Î¸ÚÓ ÔËÁÂÏÎÂÌËÂ
MIKUTILE14 INCBIN "tilemap\res\mikutiles14.bin" *œÂ‚˚È Í‡‰ ‚ÁÏ‡ı‡

MIKUTILE15 INCBIN "tilemap\res\mikutiles15.bin" *¬ÚÓÓÈ Í‡‰ ‚ÁÏ‡ı‡
MIKUTILE16 INCBIN "tilemap\res\mikutiles16.bin" *“ÂÚËÈ Í‡‰ ‚ÁÏ‡ı‡
MIKUTILE17 INCBIN "tilemap\res\mikutiles17.bin" *œÓÒÎÂ‰ÌËÈ Í‡‰ ‚ÁÏ‡ı‡

BALLSP INCBIN	"tilemap\res\BALLSP.bin" 	*—œ–¿…“ ÿ¿–Œ¬   

MIKUSETUP   

	MOVE.L #VDPCONTROL,A4
	MOVE.L #VDPDATA,A3
	MOVE.L #RAM+66,A0	
    MOVE.L #$0EEE0888,(A0)+  (œ¿À»“–¿ MIKU)
    MOVE.L #$000E0008,(A0)+
    MOVE.L #$0CAA08EE,(A0)  ***

    MOVE.L #$58000003,(A4) *”—“¿Õ¿¬À»¬¿≈Ã ¿ƒ–≈— –≈…Ã” ¬ —œ–¿…“Œ¬Œ… “¿¡À»÷≈ ¬»ƒ≈Œ◊»œ¿
    
    MOVE.L #$01500F01,(A3) (Õ¿◊¿À‹Õ€… ¿“–»¡”“ —œ–¿…“¿)
    MOVE.L #$45800110,(A3) *–≈…Ã”
	LEA MIKUTILE1,A0    *«¿ÕŒ—»Ã ¿ƒ–≈— Œ¡€◊ÕŒ√Œ —œ–¿…“¿
     
		*œ≈–≈ƒ ›“»Ã «¿Õ≈—“» ¿ƒ–≈— —œ–¿…“¿ ¬ ¿0
    MOVE.L #$FFA000,A1  *«¿√–”« ¿ ¿ƒ–≈—¿ ¬–≈Ã≈ÕÕŒ… –¿—œ¿ Œ¬ » ¬ RAM   
    MOVE.L A1,A2        * Œœ»–Œ¬¿Õ»≈ ¿ƒ–≈—¿ œ¿Ãﬂ“»
    
    BSR Kos_Decomp      *–¿—œ¿ Œ¬ ¿ —œ–¿…“¿ ¬ RAM
    MOVE.L #$70000002,(A4) *«¿√–”« ¿ ¿ƒ–≈—¿ —œ–¿…“¿ ¬  ŒÕ“–ŒÀ‹Õ€… –≈√»—“– ¬»ƒ≈Œ◊»œ¿
.L
    MOVE.L (A2)+,(A3)       *  Œœ»–Œ¬¿Õ»≈ —œ–¿…“¿ »« RAM ¬ ¬»ƒ≈Œ◊»œ
    
    CMP.L A2,A1
    BNE .L
   

BALLINIT	*—”¡–”“»Õ¿ ƒÀﬂ «¿√–”« » ÿ¿–Œ¬				ƒ¿“¿ 29.08.2022
	MOVE.L #$58080003,(A4) *¿ƒ–≈— ƒÀﬂ «¿œ»—» —œ–¿…“¿ ¬ “¿¡À»÷”
    MOVE.L #$FF9FEE,A5       *«¿Õﬂ“€ ¿ƒ–≈—¿ FF9FEE>FF9FF6 œŒƒ “¿¡À»÷” —œ–¿…“Œ¬

    MOVE.W #$00D0,(A5)+     *¿ƒ–≈—¿ ƒÀﬂ œŒÀŒ∆≈Õ»ﬂ ÿ¿–¿ Y  D0
    MOVE.W #$0502,(A5)+       *À»Õ  » –¿«Ã≈– —œ–¿…“¿
    MOVE.W #$C590,(A5)+      *¿ƒ–≈— ƒÀﬂ –¿«¬Œ–Œ“¿ —œ–¿…“¿ 4
    MOVE.W #$0180,(A5)     *¿ƒ–≈—¿ ƒÀﬂ œŒÀŒ∆≈Õ»ﬂ ÿ¿–¿ X  180 (1B0 œ–¿¬€…  –¿…) (80ÎÂ‚˚È Í‡È)
    
	SUBQ #6,A5

	MOVE.L (A5)+,(A3)
	MOVE.L (A5),(A3) *Õ¿◊¿À‹Õ€≈ œ¿–¿Ã≈“–€ ÿ¿–¿
	
	LEA BALLSP,A0		*«¿ƒ¬»√¿≈Ã ¿ƒ–≈— “¿…ÀŒ¬
	MOVE.L #$70000003,(A4)	*«¿ƒ¬»√¿≈Ã ¿ƒ–≈— Œ Õ¿ VDP ◊“Œ¡ “¿Ã ’–¿Õ»“‹ –¿—œ¿ Œ¬¿ÕÕ€≈ “¿…À€ ÿ¿–Œ¬
	BSR.W Nem_Decomp		*–¿—œ¿ Œ¬ ¿ 
 	
	MOVE.W #$8F01,(A4)	*¿¬“Œ—ÀŒ∆≈Õ»≈       *DMA ‰Îˇ Ì‡˜‡Î¸ÌÓ„Ó Á‡ÔÓÎÌÂÌËˇ ÒÔ‡ÈÚÓ‚ÓÈ Ú‡·ÎËˆ˚ ¯‡‡
	MOVE.W #$9380,(A4)	*ƒÀ»ÕÕ¿
	MOVE.W #$9400,(A4)
	
	MOVE.W #$9500,(A4)	*¿ƒ–≈— »—“Œ◊Õ» ¿
	MOVE.W #$96F0,(A4)
	MOVE.W #$97C0,(A4)	*“»œ Œœ≈–¿÷»»
    CLR.W $FF9FEC   *ÓÚ˜ËÒÚÍ‡ ‰Îˇ √–¿¬»“¿÷»» ÿ¿–¿
    CLR.W $FF9FEA   *ÓÚ˜ËÒÚÍ‡ ÛÒÍÓÂÌËˇ Ò‚Ó·Ó‰ÌÓ„Ó Ô‡‰ÂÌËˇ Ë ÔÓ‰˙∏Ï‡
    CLR.W $FF9FE8   *Œ“◊»—“ ¿ ÿ¿–¿ œŒ √Œ–»«ŒÕ“¿À»
    *CLR.B $
	
	MOVE.L #$720000C2,(A4)	*¿ƒ–≈— ¬€’ŒƒÕŒ…+—“¿–“
	
	
	
	MOVE.B #$F0,$FF9FE8 *Õ¿◊¿À‹Õ€… «¿œ”—  ÿ¿–¿ ƒÀﬂ ƒ≈¡¿√¿
	*JMP STOP
	RTS
BALLMATH            *Œ¡–¿¡Œ“ ¿ ƒ¬»∆≈Õ»ﬂ ÿ¿–¿ 
    MOVE.L #$FF9FE9,A5 *¿ƒ–≈— ƒÀﬂ Õ¿œ–¿¬À≈Õ»ﬂ ƒ¬»∆≈Õ»ﬂ ÿ¿–¿ œŒ √Œ–»«ŒÕ“¿À»
    MOVE.L #$FF9FE8,A6 *¿ƒ–≈— ƒÀﬂ ”— Œ–≈Õ»ﬂ ƒ¬»∆≈Õ»ﬂ œŒ √Œ–»«ŒÕ“¿À»
    JSR .ballrotate    *Œ¡–¿¡Œ“ ¿ ¬–¿Ÿ≈Õ»ﬂ ÿ¿–¿
    MOVE.L #$FF9FEE,A0 *¿ƒ–≈— ÿ¿–¿ Y ¬≈–“» ¿À‹Õ€… 
    MOVE.L #$FF9FEC,A1 *ﬂ◊≈… ¿ ƒÀﬂ ¬≈–’Õ≈… “Œ◊ » √–¿¬»“¿÷»»
    MOVE.L #$FF9FEB,A2 *ﬂ◊≈… ¿ ƒÀﬂ ”— Œ–≈Õ»ﬂ —¬Œ¡ŒƒÕŒ√Œ œ¿ƒ≈Õ»ﬂ  
    MOVE.L #$FF9FEA,A3 *ﬂ◊≈… ¿ ƒÀﬂ ”— Œ–≈Õ»ﬂ œŒƒ⁄®Ã¿ ÿ¿–¿
    MOVE.L #$FF9FF4,A4 *¿ƒ–≈— ÿ¿–¿ X √Œ–»«ŒÕ“¿À‹Õ€…

    

   * CMP.B #0,$FF9FE5   *œ–Œ¬≈–ﬂ≈Ã ≈—“‹ À» ‘À¿√ ◊“Œ Ãﬂ◊ —“ŒÀ Õ”À—ﬂ     
   * BNE .ADDBALL

    CMP.W #$0132,(A0)    *œ–Œ¬≈–ﬂ≈Ã Õ¿’Œƒ»“—ﬂ À» ÿ¿– ¬ «ŒÕ≈ (œŒ“≈Õ÷»¿À‹ÕŒ√Œ œŒœ¿ƒ¿Õ»ﬂ –≈Ã”...(ƒÀﬂ › ŒÕŒÃ»» œ–Œ÷≈——Œ–ÕŒ√Œ ¬–≈Ã≈Õ»))      (ƒ¿“¿ 28 Œ “ 2022)
    BGE .BALLVSREMUHITBOX
    *BRA .BALLNEXT                            *¬€◊»—À≈Õ»ﬂ ÿ¿–¿ œŒ √Œ–»«ŒÕ“¿À»
*.ADDBALL                *“≈—“»–”≈Ã “¿…Ã≈–  ¿ƒ–Œ¬ ≈—À» “¿…Ã≈– œ”—“Œ… Œ“◊»Ÿ¿≈Ã ‘À¿√ ≈—À» “¿…Ã≈– —◊»“¿≈“ œ–Œœ”— ¿≈Ã
 *   CMP.B #0,D7
  *  BNE .BALLNEXT
  *  CLR.B $FF9FE5 

.BALLNEXT
    MOVE.W (A4),D1     *«¿–¿Õ≈≈ œ–≈‘≈◊ ƒ¿ÕÕ€’ ƒÀﬂ √Œ–»«ŒÕ“¿À»
    CLR.L D0
    CMP.W #$0080,D1     *œ–Œ¬≈–ﬂ≈Ã  Œ—Õ”À—ﬂ »À» ¬€ÿ≈À À» «¿ œ–≈ƒ≈À€ ÿ¿–
    BLE .HORPL
    CMP.W #$01B0,D1
    BGE .HORPL
    
    BRA.B .HORIZONTAL   *≈—À» Õ≈ ¬€ÿ≈À Õ¿◊»Õ¿≈Ã √Œ–»«ŒÕ“¿À‹Õ”ﬁ Œ¡–¿¡Œ“ ”
.HORPL
    BCHG #0,(A5)        *≈—À» ¬€ÿ≈À »«Ã≈Õﬂ≈Ã Õ¿œ–¿¬À≈Õ»≈ ƒ¬»∆≈Õ»ﬂ » Õ¿◊»Õ¿≈Ã √Œ–»«ŒÕ“¿À‹Õ”ﬁ Œ¡–¿¡Œ“ ” (ƒ¿“¿ 5 Œ “ﬂ¡–ﬂ 2022)
    ADD.B #5,(A6)       *œ–≈ƒŒ“¬–¿Ÿ≈Õ»≈ «¿À»œ¿Õ»ﬂ — –¿ﬁ › –¿Õ¿

.HORIZONTAL
    MOVE.B (A6),D0      *œ–Œ¬≈–ﬂ≈Ã Õ¿ƒŒ À» ƒ≈À¿“‹ ¬€◊»—À≈Õ»ﬂ ƒÀﬂ ƒ¬»∆≈Õ»ﬂ œŒ √Œ–»«ŒÕ“¿À» +œ–≈ƒ«¿√–”∆¿≈Ã ƒ¿ÕÕ€≈ ≈—À» œŒ“–≈¡”≈“—ﬂ
    BEQ .VERT           *≈—À» Õ≈ “–≈¡”≈“—ﬂ Õ¿◊»Õ¿≈Ã ¬€◊»—À≈Õ»ﬂ œŒ ¬≈–“» ¿À»

    CMP.B #$30,D0       *œ–Œ¬≈–ﬂ≈Ã — Œ–Œ—“‹
    BLO .HSKIP          *≈—À» ƒŒ—“»√À» Ã¿ÀŒ√Œ ”–Œ¬Õﬂ — Œ–Œ—“» œ≈–≈—“¿®“ ƒ≈…—“¬Œ¬¿“‹ √–¿¬»“¿÷»ﬂ
    SUBQ #1,D0          *Œ“Õ»Ã¿≈Ã ”— Œ–≈Õ»≈  ¿  »— ”—“¬≈ÕÕ¿ﬂ √–¿¬»“¿÷»ﬂ
.HSKIP  
    MOVE.B D0,(A6)      *«¿ƒ¬»√¿≈Ã “Œ ◊“Œ Œ“ÕﬂÀ» Œ¡–¿“ÕŒ ¬ œ¿Ãﬂ“‹ ƒÀﬂ —À≈ƒ”ﬁŸ≈√Œ  ¿ƒ–¿
    LSR.B #4,D0         *—ƒ¬»√¿≈Ã ƒÀﬂ œÀ¿¬ÕŒ√Œ “Œ–ÃŒ∆≈Õ»ﬂ
    BTST.B #0,(A5)      *œ–Œ¬≈–ﬂ≈Ã ¬  ¿ ”ﬁ —“Œ–ŒÕ” ƒ¬»∆≈“—ﬂ ÿ¿–
    BNE .HPLUS          *¬€¡»–¿≈Ã Õ¿œ–¿¬À≈Õ»≈

    SUB.W D0,(A4)       *¬€◊»“¿≈Ã ƒ¬»√¿≈Ã—ﬂ ¬À≈¬Œ
    BRA.B .VERT         *”’Œƒ»Ã Õ¿ ¬≈–“» ¿À‹Õ”ﬁ Œ¡–¿¡Œ“ ”
.HPLUS    
    ADD.W D0,(A4)       *≈—À» ¡»“ »«Ã≈Õ»À—ﬂ œ–»¡¿¬Àﬂ≈Ã ƒ¬»√¿≈Ã ÿ¿– ¬œ–¿¬Œ

.VERT                   *¬€◊»—À≈Õ»ﬂ œŒ ¬≈–“» ¿À»
    MOVE.W (A0),D0      *¬€◊»—Àﬂ≈Ã œŒÀŒ∆≈Õ»≈ œŒ ¬€—Œ“≈
    MOVE.W #$015E,D1    *œ–Œ¬≈– ¿ Õ≈ ”À≈“≈À» À» Ã€ — ¬Œ«‹ œŒÀ
    CMP.W D1,D0         
    BGT .POL            *≈—À» ¬€À≈“≈À» —◊»“¿≈Ã œŒÀ
    SUB.W D0,D1         *¬ D1 À≈∆»“ ¬€—Œ“¿ ÿ¿–¿ ¬ ƒ¿ÕÕ€… ÃŒÃ≈Õ“ (¬€◊»—À≈Õ»≈ ¬€—Œ“€ ÿ¿–¿)

    
    
    CMP.W (A1),D1       *—–¿¬Õ»¬¿≈Ã ¬Ã“ ÿ¿–¿ — “≈Ã ◊“Œ ≈—“‹ —≈…◊¿—
    BLT .GS             *≈—À» ÿ¿– Õ»∆≈ ¬Ã“ “Œ œ–Œœ”— ¿≈Ã
    MOVE.W D1,(A1)      *≈—À» ÿ¿– ¬€ÿ≈ ¬Ã“ “Œ «¿œ»—€¬¿≈Ã ÕŒ¬”ﬁ ¬Ã“

    
.GS 
    CLR.L D2            *Œ“◊»—“ ¿ –≈√»—“–Œ¬
    CLR.L D3           
    ADD.B #1,(A2)       *ƒŒ¡¿¬Àﬂ≈Ã ”— Œ–≈Õ»ﬂ —¬Œ¡ŒƒÕŒ√Œ œ¿ƒ≈Õ»ﬂ ◊“Œ ¡€ œ≈–≈—»À»“‹ —»À” ”— Œ–≈Õ»ﬂ ¬ 2 –¿«¿

    BTST #2,D7          *œ–Œ¬≈– ¿ —◊®“◊» ¿  ¿ƒ–Œ¬
    BEQ .GS2            *≈—À» œŒœ¿À» œ–€∆Œ 
    ADD.B #1,(A2)       *≈—À» Õ≈ œŒœ¿À» ƒŒ¡¿¬Àﬂ≈Ã ”— Œ–≈Õ»ﬂ œ¿ƒ≈Õ»ﬂ

   * MOVE.W #$BA,D1
   * CMP.W (A1),D1
   * BGT .GS
   * CLR.W (A1)

.GS2
    MOVE.B (A2),D2      *«¿√–”∆¿≈Ã —¬Œ¡ŒƒÕŒ≈ œ¿ƒ≈Õ»≈ » œŒƒ⁄®Ã ÿ¿–¿
    MOVE.B (A3),D3
    TST.B D3            *œ–Œ¬≈–ﬂ≈Ã D3 Õ≈ «¿ ŒÕ◊»ÀŒ—‹ À» ”— Œ–≈Õ»≈
    BEQ .S1             *≈—À» «¿ ŒÕ◊»ÀŒ—‹ œ–Œœ”— ¿≈Ã
    SUBQ #1,D3          *≈—À» ≈Ÿ® ≈—“‹ Œ“Õ»Ã¿≈Ã 
    CMP.W #$DC,D1       *œ–Œ¬≈–ﬂ≈Ã ¬€—Œ“” ÿ¿–¿
    BGT .S2           *≈—À» ”ƒ¿–»À»—‹ Œ¡ œŒ“ŒÀŒ 

 *   CMP.W #$5A,D1       *œ–Œ¬≈–ﬂ≈Ã ¬€—Œ“” ÿ¿–¿
 *   BLT .S1             
 *   SUBQ #1,D3       *≈—À» œ–»¬€—»À» ¬€—Œ“” “Œ —Õ»∆¿≈Ã ”— Œ–≈Õ»≈ ¬¬≈–’
    BRA .S1
    
.S2             *Œ“◊»—“ ¿ ¬ —À”◊¿≈ ≈—À» Ã€ ”ƒ¿–»À»—‹ Œ¡ œŒ“ŒÀŒ 
    CLR.W (A1)
    CLR.B (A3)
    RTS

.S1
    MOVE.B D3,(A3)      *«¿œ»—€¬¿≈Ã ÕŒ¬Œ≈ ”— Œ–≈Õ»≈ À»¡Œ 0
    LSR.B #3,D2         *ƒ¬»√¿≈Ã –≈√»—“–€ Õ¿ 3
    LSR.B #3,D3
    ADD.W D2,(A0)       *ƒŒ¡¿¬Àﬂ≈Ã —¬Œ¡ŒƒÕŒ√Œ œ¿ƒ≈Õ»ﬂ 

    SUB.W D3,(A0)       *¬€◊»“¿≈Ã ”— Œ–≈Õ»≈  «¿ ŒÕ◊»À¿—‹ Œ¡–¿¡Œ“ ¿ ÿ¿–¿ œŒ ¬€—Œ“≈

    
   
.SKIP   
    RTS
.SKIPBALLFIX        *œ–Œœ”—  ƒ≈À≈Õ»ﬂ » ‘» —¿÷»ﬂ Ãﬂ◊¿
    CLR.B (A3)      *»—œ–¿¬À≈Õ»≈ ¡¿√¿ — œ–»À»œ¿ﬁŸ»Ã ÿ¿–ŒÃ
    MOVE.W #$0160,(A0)
    
    RTS

.POL        *Œ¡–¿¡Œ“ ¿  ¿—¿Õ»ﬂ Œ¡ œŒÀ
    CMP.W #0,(A1)      *“≈—“»–”≈Ã Õ¿ —”Ÿ≈—“¬Œ¬¿Õ»≈ ¬Ã“ » ¡”ƒ≈“ À» ›Õ≈–√»ﬂ Œ“ œ¿ƒ≈Õ»ﬂ
    BEQ .SKIPBALLFIX    *≈—À» Õ≈“” ¬Ã“ ƒ≈À¿≈Ã –≈ÃŒÕ“ œŒÀŒ∆≈Õ»ﬂ » œ–Œœ”— ¿≈Ã ƒ≈À≈Õ»≈
    CLR.L D0        *◊»—“»Ã –≈√»—“– ◊“Œ ¡€ —À≈ƒ”ﬁŸ≈≈ ƒ≈À≈Õ»≈ œ–ŒÿÀŒ ”—œ≈ÿÕŒ
    MOVE.W (A1),D0  *«¿√–”∆¿≈Ã ¬≈–’Õﬁﬁ “Œ◊ ” ÿ¿–¿
     
    LSR.W #1,D0    *ƒ≈À»Ã ¬≈–’Õﬁﬁ “Œ◊ ” Õ¿ 2 
    CMP.W #$50,D0    *œ–Œ¬≈– ¿ Õ≈ œ–≈¬€—»À» Ã€ ¬≈–’Õﬁﬁ “Œ◊ ”   C0
    BGT .POL2          *≈—À» œ–»¬€—»À» —–≈«¿≈Ã ƒŒ ¡≈«Œœ¿—“ÕŒ√Œ —Œ—“ŒﬂÕ»ﬂ
.POL3 
    CLR.B (A2)      *Œ¡Õ”Àﬂ≈Ã ”— Œ–≈Õ»≈ —¬Œ¡ŒƒÕŒ√Œ œ¿ƒ≈Õ»ﬂ
    SUBQ #2,D0
    MOVE.B D0,(A3)  *”— Œ–≈Õ»≈ œŒƒ⁄®Ã¿  Œ“Œ–Œ≈ œŒÀ”◊»À» œ–» ƒ≈À≈Õ»» ¬Ã“
    LSR.B #2,D0     *—ƒ¬»√¿≈Ã D0
    SUB.W D0,(A0)   *» ƒŒ¡¿¬Àﬂ≈Ã ÿ¿–” ◊“Œ¡ Õ≈ œ–Œœ”— ¿“‹ À»ÿÕ»…  ¿ƒ–
    CLR.W (A1)      *◊»—“»Ã ¬≈–’Õﬁﬁ “Œ◊ ” √–¿¬»“¿÷»» 


    RTS
.POL2               *—–≈«¿Õ»≈ ¬Ã“ ƒŒ ¡≈«Œœ¿—“ÕŒ…
    MOVE.W #$49,D0      *BA
    BRA .POL3

.BALLVSREMUHITBOX
    MOVE.W $FF9FE6,D0       *«¿√–”« ¿ œŒÀŒ∆≈Õ»ﬂ  √Œ–»«ŒÕ“¿À» –≈Ã” (œŒ ¬≈–“» ¿À» —“¿“»◊ÕŒ≈ #$0150)
    MOVE.W #$0160,D1        *«¿√–”« ¿ œŒ—“ŒﬂÕÕŒ… ¬≈–“» ¿À» –≈Ã” (ƒÀﬂ —–¿¬Õ≈Õ»…) 160 ƒÎˇ ÛÍ‡Á‡ÌËˇ Ì‡ ÌËÊÌ˛˛ ˜‡ÒÚ¸ ÒÔ‡ÈÚ‡ 5 Nov 2022
    MOVE.W (A4),D2          *«¿√–”« ¿ ÿ¿–¿ √Œ–»«ŒÕ“¿À‹Õ¿ﬂ
    MOVE.W (A0),D3          *«¿√–”« ¿ ÿ¿–¿ ¬≈–“» ¿À‹Õ¿ﬂ

    SUB.W #7,D2             *¬€◊»“¿≈Ã »« —œ–¿…“¿ ÿ¿–¿ ƒÀﬂ ¡ŒÀ≈≈ “Œ◊ÕŒ… œŒƒ√ŒÕ » œŒ ÷≈Õ“–” –≈…Ã”
    *¬≈–“» ¿À‹Õ¿ﬂ œ–Œ¬≈– ¿ ÿ¿–¿ Õ¿ƒ –≈…Ã”
    SUB.W #15,D1            *¬€◊»“¿≈Ã œ» —≈À» ◊“Œ¡ Õ¿…“» ¬≈–’Õﬁﬁ “Œ◊ ” —œ–¿…“≈ –≈Ã”
    ADD.W #8,D3            *œ–»¡¿¬Àﬂ≈Ã œ» —≈À» ƒÀﬂ Õ»∆Õ≈… “Œ◊ » ÿ¿–¿

    CMP.W D1,D3             *—–¿¬Õ»¬¿≈Ã ÿ¿– œŒ ¬≈–“» ¿À» (ƒŒ—“»√À» À» Ã€ —œ–¿…“¿ –≈…Ã”)
    BLT .BALLNEXT           *≈—À» Õ≈ ƒŒ—“»√À» ¬€œ–€√»¬¿≈Ã Õ¿«¿ƒ (› ŒÕŒÃ»“ œ¿–” ÷» ÀŒ¬)
    
    SUB.W #10,D2            *¬€◊»—Àﬂ≈Ã  –¿… ÿ¿–¿ À≈¬€…
    ADD.W #8,D0             *¬€◊»—Àﬂ≈Ã  –¿… –≈Ã” œ–¿¬€…
    CMP.W D0,D2             *œ–Œ¬≈–ﬂ≈Ã ◊“Œ ÿ¿– ƒ¿À‹ÿ≈ ◊≈Ã  –¿… –≈…Ã”
    BGT .BALLNEXT           *≈—À» ƒ¿À‹ÿ≈ ¬Œ«¬–¿Ÿ¿≈Ã Œ¡–¿¡Œ“ ” ÿ¿–¿ ƒ¿À‹ÿ≈
                            *≈—À» Ã≈Õ‹ÿ≈ œ–Œ¬≈–ﬂ≈Ã ƒ–”√”ﬁ —“Œ–ŒÕ”
    ADD.W #20,D2            *ƒŒ¡¿¬Àﬂ≈Ã   ÿ¿–” ¬ 2 –¿«¿ ¡ŒÀ‹ÿ≈
    SUB.W #16,D0            *ƒŒ¡¿¬Àﬂ≈Ã   –≈…Ã” ¬ 2 –¿«¿ ¡ŒÀ‹ÿ≈                            
    CMP.W D0,D2             *—–¿¬Õ»¬¿≈Ã Õ¿’Œƒ»“—ﬂ À» ÿ¿– —À≈¬¿ Œ“ –≈…Ã”
    BLT .BALLNEXT           *≈—À» ƒ¿ “Œ Œ¡–¿¡¿“€¬¿≈Ã ÿ¿– ƒ¿À‹ÿ≈
    MOVE.L #$18040003,VDPCONTROL    *«¿–¿Õ≈≈ √Œ“Œ¬»Ã—ﬂ   «¿¡Œ–” ƒ¿ÕÕ€’ »« ¬»ƒ≈Œ◊»œ¿

.BALLREIMUHIT               *–≈¿ ÷»ﬂ Õ¿  ¿—¿Õ»≈ ÿ¿–¿ Œ¡ –≈…Ã”


    MOVE.L #72,D5         *œŒƒ⁄®Ã ƒÀﬂ œŒƒ ¿“¿ — ÕŒ√»                Õ¿—“–Œ… ¿ œŒƒ¡–Œ—¿ ÿ¿–¿ ¬ œŒƒ ¿“≈ √ƒ≈ “Œ “”“ 
    MOVE.L #100,D6        *œŒƒ⁄®Ã √Œ–»«ŒÕ“¿À‹ÕŒ≈ ”— Œ–≈Õ»≈ ƒÀﬂ œŒƒ ¿“¿ — ÕŒ√Œ…

    SUB.L #64,A7			*Œ—¬Œ¡Œ∆ƒ¿≈Ã Ã≈—“Œ ¬ —“≈ ≈
    MOVE.B (A7),D0
    ADD.L #64,A7            *¬Œ«¬–¿Ÿ≈Õ»≈ —“≈ ¿ Õ¿ Ã≈—“Œ
	CMP.B #13,D0			*—–¿¬Õ»¬¿≈Ã ÕŒÃ≈– «¿ŸŸ®À ” ƒÀﬂ œŒƒ ¿“¿ — ÕŒ√Œ…
	BEQ .HIT1
    *MOVE.L #70,D5         *œŒƒ⁄®Ã ƒÀﬂ œŒƒ ¿“¿ — — ŒÀ‹∆≈Õ»≈Ã
    MOVE.L #35,D6        *œŒƒ⁄®Ã √Œ–»«ŒÕ“¿À‹ÕŒ≈ ”— Œ–≈Õ»≈ ƒÀﬂ œŒƒ ¿“¿ — — ŒÀ‹∆≈Õ»≈Ã
   
    CMP.B #0,$FF9FFC	*œ–Œ¬≈– ¿ ¬«Ã¿’¿ √Œ’≈≈Ã
    BNE .HIT1

    CMP.B #0,$FF9FFD        *œ–Œ¬≈–ﬂ≈Ã Õ¿’Œƒ»Ã—ﬂ À» Ã€ ¬ œŒƒ ¿“≈
    BNE .HIT1                *≈—À» Õ≈“ œ–Œœ”— ¿≈Ã

    BRA .BALLNEXT           *¬Œ«¬–¿“   Œ¡–¿¡Œ“ ≈ ÿ¿–¿

.HIT1
    CMP.B #20,(A3)      *—–¿¬Õ»¬¿≈Ã ”— Œ–≈Õ»≈ œŒƒ⁄≈Ã¿ ÿ¿–¿
    BGT .BALLNEXT       *≈—À» ”∆≈ ≈—“‹ ”— Œ–≈Õ»≈ Õ≈ ƒŒ¡¿¬Àﬂ≈Ã

    CLR.L D1            *◊»—“»Ã –≈√»—“– ƒÀﬂ —–¿¬Õ≈Õ»…
    MOVE.W VDPDATA,D0       *—◊»“€¬¿≈Ã ƒ¿ÕÕ€≈ –≈…Ã”
    
    
    ROL.W #5,D0             *œ–Œ –”◊»¬¿≈Ã ¡»“€ ◊“Œ¡ ¡»“ œŒ¬Œ–Œ“¿ ¬—“¿À Õ¿ œ≈–¬”ﬁ œŒ«»÷»ﬁ

    BTST D1,D0          *“≈—“»–”≈Ã Õ”À≈¬Œ… ¡»“ ¬ D0 (›“Œ –¿«¬Œ–Œ“ –≈…Ã”)
    MOVE SR,D2          *«¿ƒ¬»√¿≈Ã –≈«”À‹“¿“ “≈—“¿ ¬ D2
    BTST D1,(A5)        *“≈—“»–”≈Ã Õ”À≈¬Œ… ¡»“ ¬ A5 (–¿«¬Œ–Œ“ Ãﬂ◊¿)
    MOVE SR,D3          *«¿ƒ¬»√¿≈Ã –≈«”À‹“¿“ “≈—“¿ ¬ D3

    CMP.B D2,D3         *—–¿¬Õ»¬¿≈Ã –≈«”À‹“¿“ “≈—“»–Œ¬¿Õ»ﬂ ƒ¬”’ ¡»“Œ¬


    *CMP.B (A5),D0           *ƒ≈À¿≈Ã —–¿¬Õ≈Õ»≈ Õ¿œ–¿¬À≈Õ»ﬂ ƒ¬»∆≈Õ»ﬂ Ãﬂ◊¿ » –≈Ã”
    BEQ .NHIT               *≈—À» Õ¿œ–¿¬À≈Õ»ﬂ —Œ¬œ¿ƒ¿ﬁ“ »ƒ®Ã ƒ¿À‹ÿ≈
    BCHG #0,(A5)            *≈—À» Õ¿œ–¿¬À≈Õ»ﬂ Õ≈ —Œ¬œ¿ƒ¿ﬁ“ Ã≈Õﬂ≈Ã Õ¿œ–¿¬À≈Õ»≈ ÿ¿–¿
.NHIT       
    *CMP.B #0,$FF9FFC	*”ƒ¿– Ãﬂ◊¿ √Œ’≈≈Ã
    MOVE.B $FF9FFC,D0   *«¿ƒ¬»√¿≈Ã ¬«Ã¿’ ¬ DO » «¿ ŒƒÕŒ œ–Œ¬≈–ﬂ≈Ã
    BEQ .NHIT1          *≈—À» Õ≈“ ¬«Ã¿’¿ »ƒ®Ã ƒ¿À‹ÿ≈ ≈—À» ≈—“‹ »—œŒÀÕﬂ≈Ã  Œƒ Õ»∆≈      24 œËÍ ‚ÁÏ‡ı‡
    MOVE.B #24,D1       *œ»  ¬«Ã¿’¿ √Œ’≈≈Ã
    CMP.B #30,D0        *—–¿¬Õ»¬¿≈Ã œŒÀŒ¬»Õ” ¬«Ã¿’¿
    BLT .NEGJUMP1       *≈—À» ≈Ÿ® œ≈–¬€… ¬«Ã¿’ Õ≈ œ–Œÿ®À “Œ œ–€√¿≈Ã ƒ¿À‹ÿ≈
    SUB.B #30,D0        *≈—À» œ≈–¬€… ¬«Ã¿’ œ–Œÿ®À Œ“Õ»Ã¿≈Ã —◊®“◊»  ◊“Œ ¡€ Õ≈ œ”“¿“‹—ﬂ » Œ¡Ÿ»≈ ¬€◊»—À≈Õ»ﬂ —ƒ≈À¿“‹ 
    
.NEGJUMP1
                   
    SUB.B D0,D1         *Ã€ Œ“ œŒ—“ŒﬂÕÕŒ… 24 ¬Ã“ —œ–¿…“¿ –≈…Ã” Œ“Õ»Ã¿≈Ã ƒ≈…—“¬»“≈À‹ÕŒ≈ —Œ—“ŒﬂÕ»≈ œ–ﬂÃ —≈…◊¿—    
    BPL .NEGJUMP        *≈—À» –≈«”À‹“¿“ œŒÀ”◊»À—ﬂ œŒÀŒ∆»“≈À‹Õ€… “Œ œ–€√¿≈Ã ƒ¿À‹ÿ≈
    NEG.B D1            *≈—À» –≈«”À‹“¿“ Œ“–»÷¿“≈À‹Õ€… ƒ≈À¿≈Ã –≈¬≈–— Õ≈√
    

.NEGJUMP                *¬€◊»—À≈Õ»ﬂ œ–» √Œ’≈≈
    MOVE.B #80,D0       *«¿ƒ¬»√¿≈Ã Ã¿ —»Ã¿À‹Õ”ﬁ ¬€—Œ“” ”ƒ¿–¿
    LSL.B #1,D1         *”ÃÕŒ∆¿≈Ã Õ¿ 2 «Õ¿◊≈Õ»≈ –¿«Õ»÷€ »« .NEGJUM1
   * SUBQ #8,D0         *Œ“Õ»Ã¿≈Ã ¬«Ã¿’ ƒÀﬂ ¡¿À¿Õ—¿
    SUB.B D1,D0         *¬€◊»“¿≈Ã »« Ã¿ —»Ã¿À‹ÕŒ… ¬€—Œ“€ ”ÃÕŒ∆≈ÕÕ”ﬁ –¿«Õ»÷”
  
    MOVE.B D0,D5        *«¿ƒ¬»√¿≈Ã ¬€—Œ“” œŒƒ¡–Œ—¿ ÿ¿–¿
    LSR.B #1,D0         *ƒ≈À»Ã Õ¿ 2 ¬€—Œ“” œŒƒ¡–Œ—¿ 
    CLR.W (A1)          *¬€—“¿¬Àﬂ≈Ã ¬Ã“ ◊“Œ ¡€ Œ¡Œ…“»  Œ≈  ¿ »≈ ¡¿√»
    ADD.B D0,D6         *ƒŒ¡¿¬Àﬂ≈Ã √Œ–»«ŒÕ“¿À‹ÕŒ≈
    
    BRA .NHIT2          *œ–€∆Œ  ƒ¿À‹ÿ≈
    *JMP STOP

.NHIT1
    CLR D0          *Œ“◊»—“ ¿ ƒ0 Õ¿ ¬—ﬂ »… —À”◊¿…
    MOVE.B $FF9FFA,D0   *«¿√–”« ¿ »Õ‘Œ–Ã¿÷»» Œ œŒÀŒ∆≈Õ»» —¿À‹“Œ
    CMP.B #0,D0   *œ–Œ¬≈– ¿ —¿À‹“Œ
    
    BEQ .NHIT3         *≈—À» —≈…◊¿— ¬ —¿À‹“Œ »—œŒÀÕﬂ≈Ã  Œƒ Õ»∆≈ ≈—À» Õ≈ ¬ —¿À‹“Œ »ƒ®Ã ƒ¿À‹ÿ≈
    MOVE.L #30,D5         *Õ¿◊¿À‹Õ€… œŒƒ⁄®Ã ƒÀﬂ —¿À‹“Œ
    MOVE.L #40,D6        *Õ¿◊¿À‹ÕŒ≈ √Œ–»«ŒÕ“¿À‹ÕŒ≈ ”— Œ–≈Õ»≈ ƒÀﬂ —¿À‹“Œ

    ADDQ #8,D0      *ƒŒ¡¿¬Àﬂ≈Ã ≈Ÿ®   œŒÀŒ∆≈Õ»ﬁ —¿À‹“Œ ƒÀﬂ ¡ŒÀ≈≈ —“¿¡»À‹ÕŒ√Œ –≈«”À‹“¿“¿
    LSR.B #4,D0     *—ƒ¬»√¿≈Ã œŒ—À≈ƒÕ»… ¡¿…“ — ¡€—“–€Ã «Õ¿◊≈Õ»≈Ã

    LSL.B D0,D5     *”ÃÕŒ∆¿≈Ã Õ¿ÿ≈ ”— Œ–≈Õ»≈ œŒƒ⁄®Ã¿ Õ¿ œŒÀŒ∆≈Õ»≈ —¿À‹“Œ
    LSL.B D0,D6     *”ÃÕŒ∆¿≈Ã ”— Œ–≈Õ»≈ √Œ–»«ŒÕ“¿À‹ÕŒ≈ Õ¿ œŒÀŒ∆≈Õ»≈ —¿À‹“Œ

    CMP.B #0,$FF9FF7    *œ–Œ¬≈– ¿ ƒ¬»√¿≈Ã—ﬂ À» Ã€ ¬Œ ¬–≈Ãﬂ —¿À‹“Œ
    BNE .NHIT3          *≈—À» ƒ¬»√¿≈Ã—ﬂ  »ƒ®Ã ƒ¿À‹ÿ≈
    *JMP STOP
    CLR.B (A6)          *≈—À» —“Œ»Ã ◊»—“»Ã — Œ–Œ—“‹ Ãﬂ◊¿
    CLR.L D6            *◊»—“»Ã ”— Œ–≈Õ»≈ ¿ ”Ã”À»“»¬ÕŒ≈
    *LSL.L #1,D5

    *JMP STOP
    
    *MOVE.B #2,$FF9FF7	*— Œ–Œ—“‹ ƒ¬»∆≈Õ»ﬂ ¬ —¿À‹“Œ
    
    
.NHIT3      

    * MOVE.W #$155,D1         *«¿ƒ¬»√¿≈Ã Õ»∆Õ»… œŒ“ŒÀŒ  
    CMP.W #$8,(A1)        *ƒŒ¡¿¬ ¿ ¬Ã“ ≈—À» Ãﬂ◊ À≈∆»“ Õ¿ œŒÀ”
    BGE .NHIT2
    
   * ADD.W #16,(A1)
    *ADDQ #1,D3
    *ADD.W #12,D1
    *MOVE.B #0,(A2)
    
    ADD.W #100,(A1)         *ƒŒ¡¿¬ ¿ ≈—À» Ãﬂ◊ Õ¿ œŒÀ” ƒŒ¡¿¬ ¿   ¬Ã“
    *ADD.B #50,(A3)
.NHIT2
    *SUB.W (A0),D1           *Œ“Õ»Ã¿≈Ã œŒÀŒ∆≈Õ»≈ ÿ¿–¿ Œ“ œŒÀ¿
    *LSL.W #1,D1             *”ÃÕŒ∆¿≈Ã –≈«”À‹“¿“ 

    *MOVE.B (A3),D0          *«¿ƒ¬»√¿≈Ã ”— Œ–≈Õ»≈ œŒƒ⁄≈Ã¿
    
    *ADD.W #16,(A1)          *«¿ƒ¬»√¿≈Ã ÕŒ¬”ﬁ Ã®–“¬”ﬁ “Œ◊ ” ◊“Œ¡ –¿« À»Õ»“‹ Ãﬂ◊ ≈—À» ŒÕ ”œ¿À Õ¿ œŒÀ
    *MOVE.B (A2),D0
    *LSR.B #1,D0
    CLR.B (A2)              *Œ“◊»Ÿ¿≈Ã ”— Œ–≈Õ»≈ œ¿ƒ≈Õ»ﬂ
    ADD.W #30,(A1)
    *ADD.B #80,(A6)
    *ADD.B D1,D0             *ƒŒ¡¿¬Àﬂ≈Ã œŒÀŒ∆≈Õ»≈ ÿ¿–¿ Œ“ÕŒ—»“≈À‹ÕŒ œŒÀ¿   ”— Œ–≈Õ»ﬁ œ¿ƒ≈Õ»ﬂ
    ADD.B D5,(A3)          *ƒŒ¡¿¬ ¿   ”— Œ–≈Õ»ﬁ œŒƒ⁄≈Ã¿
    ADD.B D6,(A6)         *ƒŒ¡¿¬ ¿ ”— Œ–≈Õ»ﬂ √Œ–»«ŒÕ“¿À‹ÕŒ√Œ
   
    
    
    BRA .BALLNEXT
    *BRA STOP   
.ballrotate
                    *‡‰ÂÒ‡ ‰Îˇ DMA FF9FE1 FF9FE2 FF9FE4
    
    *MOVE.L #$FF9FDE,A2      *¿ƒ–≈— ƒÀﬂ ’–¿Õ≈Õ»ﬂ «¿Ÿ®À »2
    MOVE.L #$FF9FE0,A3      *¿ƒ–≈— ƒÀﬂ ’–¿Õ≈Õ»ﬂ —◊≈“◊» ¿ Ãﬂ◊¿
    

    MOVEQ #7,D1     *¡¿À¿—“ »«  Œ“Œ–Œ√Œ ¡”ƒ≈Ã ¬€◊»“¿“‹ — Œ–Œ—“‹ ◊“Œ ¡€ œŒÀ”◊»“‹ —Ã≈Ÿ≈Õ»≈ œŒ ¡»“¿Ã                
    ADDQ.B #1,(A3)   *ƒŒ¡¿¬Àﬂ≈Ã   —◊®“◊» ” Ãﬂ◊¿             
    MOVE.B (A6),D0      *¡≈–®Ã — Œ–Œ—“‹ ÿ¿–¿
    BEQ .BALLRTS    *≈—À» — Œ–Œ—“‹ 0 “Œ œ–Œœ”— ¿≈Ã Œ¡–¿¡Œ“ ” ¬–¿Ÿ≈Õ»ﬂ “≈Ã —¿Ã€Ã Ãﬂ◊ —“Œ»“ Õ¿ Ã≈—“≈
    LSR.B #5,D0     *ƒ≈À¿≈Ã ƒ≈À≈Õ»ﬂ ƒÀﬂ »«¡¿¬À≈Õ»ﬂ Œ“ ÃÀ¿ƒÿ≈√Œ ¡¿…“¿ — Œ–Œ—“» Ãﬂ◊¿

    SUB.B D0,D1     *¬€◊»“¿≈Ã ◊“Œ ¡€ œŒÀ”◊»“‹ —Ã≈Ÿ≈Õ»≈ œŒ ¡»“¿Ã
    BLE .ballnextrotation     *≈—À» œŒÀ”◊»À—ﬂ ÕŒÀ‹ »À» Ã»Õ”— FF œ–€√¿≈Ã ƒ¿À‹ÿ≈
    LSR.B #1,D1     *ƒ≈À»Ã Õ¿ 2 —Ã≈Ÿ≈Õ»≈ »Õ¿◊≈ »Õ“≈–¬¿À —À»ÿ ŒÃ ¡ŒÀ‹ÿŒ…
    BEQ .ballnextrotation       *≈—À» œ–» —ƒ¬»√≈ œŒÀ”◊»À—ﬂ 0 œ–€√¿≈Ã ƒ¿À‹ÿ≈
    SUBQ.B #1,D1    *¬€◊»“¿≈Ã ≈Ÿ® 1 ◊“Œ ¡€ ”Ã≈Õ‹ÿ»“‹ »Õ“≈–¬¿À ≈Ÿ® 
    *MOVE.B D1,(A3)
.ballnextrotation
    
    BTST D1,(A3)      *—–¿¬Õ»¬¿≈Ã —Ã≈Ÿ≈Õ»≈ œŒ — Œ–Œ—“»
    BNE .ballrotatenext     *≈—À» —◊®“◊»  ƒŒ¡–¿À—ﬂ ƒŒ Õ”∆ÕŒ√Œ ¡»“¿ »ƒ®Ã ¬–¿Ÿ¿“‹ ÿ¿– » —¡–¿—€¬¿“‹ —◊®“◊» 
.BALLRTS    
    RTS         *¬€œ–€√»¬¿≈Ã Õ¿«¿ƒ ¡≈« ¬–¿Ÿ≈Õ»ﬂ


.ballrotatenext
    CLR.B (A3)      *Œ“◊»—“ ¿ —◊®“◊» ¿ Ãﬂ◊¿ 

    MOVE.L #$FF9FE1,A0      *—◊®“◊»  œŒÀŒ∆≈Õ»… 8 ¡»“
    MOVE.L #$FF9FE2,A1      *¿ƒ–≈— ÃÀ¿ƒÿ»… ƒÀﬂ DMA 16 ¡»“
    *MOVE.L #$FF9FE4,A2      *¿ƒ–≈— —“¿–ÿ»… ƒÀﬂ DMA 16 ¡»“
    

    MOVE.B (A0),D0          *«¿√–”∆¿≈Ã —◊®“◊»  œŒÀŒ∆≈Õ»… Ãﬂ◊¿
    BTST #0,(A5)            *—–¿¬Õ»¬¿≈Ã Õ¿œ–¿¬À≈Õ»≈ ƒ¬»∆≈Õ»ﬂ
    BNE .1                  *ƒŒ¡¿¬Àﬂ≈Ã —◊®“◊» 
    BEQ .0                 *”Ã≈Õ‹ÿ¿≈Ã —◊®“◊» 
.1
    ADD.B #$20,D0      *ƒŒ¡¿¬Àﬂ≈Ã   —◊®“◊» ”
    
    BRA .2              *œ–€∆Œ  ƒ¿À‹ÿ≈
.0
    SUB.B #$20,D0      *¬€◊»“¿≈Ã »« —◊®“◊» ¿
    
.2
    MOVE.L #$FF9FF2,A2  *¿ƒ–≈— ƒÀﬂ –¿«¬Œ–Œ“¿ Ãﬂ◊¿ ¬ RAM Ú¿¡À»÷≈ 
    BSET.B #0,$FF9FDF   *”—“¿Õ¿¬À»¬¿≈Ã ‘À¿√ ƒÀﬂ DMA
    MOVE.B D0,(A0)  *«¿ƒ¬»√¿≈Ã —◊®“◊»  Œ¡–¿“ÕŒ ¬ œ¿Ãﬂ“‹ Œ¡–¿«≈÷ —◊®“◊» ¿ 00-20-40-60-80-A0-C0-E0 *FF9FDF ‘À¿√ ƒÀﬂ DMA ÿ¿–¿
    BEQ .ballrotatezero     *œ–Œ¬≈– ¿ (≈—À» œŒÀŒ∆≈Õ»≈ 0 œ≈–≈’Œƒ»Ã ¬ —œ≈÷ Ã≈—“Œ)

    BCLR #11,(A2)    *ÒÏÂÌ‡ ÙÎ‡„‡ ‡Á‚ÓÓÚ‡ Ïˇ˜‡ ÔÓ „ÓËÁÓÌÚ‡ÎË
    BCLR #12,(A2)    *ÒÏÂÌ‡ ÙÎ‡„‡ ‡Á‚ÓÓÚ‡ Ïˇ˜‡ ÔÓ „ÓËÁÓÌÚ‡ÎË
    CLR.L D3            *Œ“◊»Ÿ¿≈Ã D3 ◊“Œ ¡€ ¬—≈ ¬€◊»—À≈Õ»ﬂ ¡€À» “Œ◊Õ€Ã» — 20
    MOVEQ #1,D4         *ƒÀﬂ ÷» ÀŒ“–ŒÕ¿ 
    

    CMP.B #$80,D0           *≈—À» ÿ¿– œ–Œ –”“»À—ﬂ Ã≈Õ‹ÿ≈ ◊≈Ã Õ¿ œŒÀŒ¬»Õ” 
    BLS .ballrotatenextloop    *œ–€√¿≈Ã ƒ¿À‹ÿ≈
    
    BSET #11,(A2)        *»— ”—“¬≈ÕÕŒ Œ“–¿∆¿≈Ã ÿ¿– œŒ √Œ–»«ŒÕ“¿À» » ¬≈–“» ¿À»
    BSET #12,(A2) 


.ballrotatenextloop
    MOVE.W #$9500,D1    *≈—À» Õ≈ –¿¬≈Õ ”—“¿Õ¿¬À»¬¿≈Ã «Õ¿◊≈Õ»ﬂ ƒÀﬂ ƒÃ¿
    MOVE.W #$96F0,D2 
    ADD.W #$20,D3       *ƒŒ¡¿¬Àﬂ≈Ã ƒÀﬂ —À≈ƒ”ﬁŸ≈√Œ  ¿ƒ–¿ —–¿¬Õ≈Õ»ﬂ

    CMP.B D3,D0         *—–¿¬Õ»¬¿≈Ã —◊®“◊»  Ãﬂ◊¿
    BEQ .ballrotateend  *≈—À» –¿¬≈Õ «¿ ¿Õ◊»¬¿≈Ã —–¿¬Õ≈Õ»≈
    ADD.W #$80,D1
    ADD.W #$20,D3

    CMP.B D3,D0
    BEQ .ballrotateend
    SUB.W #$80,D1
    ADD.W #$1,D2
    ADD.W #$20,D3

    CMP.B D3,D0
    BEQ .ballrotateend
    ADD.W #$80,D1
    ADD.W #$20,D3
                            *Õ¿ƒŒ œ≈–≈ƒ≈À¿“‹ ¿À√Œ–»“Ã ¬€¡Œ–¿  ¿ƒ–¿ » ƒŒ¡¿¬»“‹ –¿«¬Œ–Œ“
    CMP.B D3,D0
    BEQ .ballrotateend
    
    
    DBRA D4,.ballrotatenextloop     *ƒ≈À¿≈Ã 2 œ–Œ’Œƒ¿
    *CMP.B #4,D7
    *BEQ STOP 
.ballrotateend
    MOVEM.W D1-D2,(A1)        *«¿ƒ¬»√¿≈Ã œ–ŒÃ≈∆”“Œ◊Õ€≈ ¬€◊»—À≈Õ»ﬂ ¬ œ¿Ãﬂ“‹ ƒÀﬂ ƒÃ¿ (ƒ¿ÕÕ€≈  Œ“Œ–€≈ ÃŒ√”“ » Õ≈ œŒÕ¿ƒŒ¡»“‹—ﬂ)
    RTS
.ballrotatezero         *—œ≈÷»¿À‹ÕŒ≈ ¬≈“¬À≈Õ»≈ ƒÀﬂ œŒÀŒ∆≈Õ»ﬂ ÿ¿–¿ 0
    MOVE.W #$9580,D1        *«¿ƒ¬»√¿≈Ã œŒ—À≈ƒÕ≈≈ œŒÀŒ∆≈Õ»≈
    MOVE.W #$96F1,D2

    BSET #11,(A2)        *«≈– ¿À»Ã ÿ¿–
    BSET #12,(A2)

    BRA .ballrotateend      *œ≈–≈ƒ¿®Ã –≈«”À‹“¿“



BALLDRAW
    MOVE.L #VDPCONTROL,A4
    MOVE.L #$58080003,(A4)      *«¿œ–Œ— ¬»ƒ≈Œ◊»œ Õ¿ «¿œ»—‹ ÿ¿–¿
    MOVE.L #$FF9FDF,A0
       

    MOVE.L #VDPDATA,A2
    MOVE.L #$FF9FEE,A3                  *«¿ƒ¬»√¿≈Ã ¿ƒ–≈— Õ¿◊¿À¿ “¿¡À»÷€ *«¿Õﬂ“€ ¿ƒ–≈—¿ FF9FEE>FF9FF6 œŒƒ “¿¡À»÷” —œ–¿…“Œ¬

    MOVE.L (A3)+,(A2)                   *¡≈–®Ã «Õ¿◊≈Õ»≈ Y
    MOVE.L (A3),(A2)                   *«¿ƒ¬»√¿≈Ã ¿ƒ–≈— –¿«¬Œ–Œ“¿ » À»Õ ¿
    *MOVE.W VDPCONTROL,D0    *ƒÀﬂ ¡”ƒ”ﬁŸ≈… œ–Œ¬≈– » —“ŒÀ ÕŒ¬≈Õ»ﬂ

    *jmp stop
    
     
    BTST #0,(A0)         *œ–Œ¬≈– ¿ ‘À¿√¿ ƒÃ¿ » œ–€∆Œ 
    BEQ .RT    
    
    move.w #$8F01,(A4)  *¿¬“Œ—ÀŒ∆≈Õ»≈ 1
    move.w #$937E,(A4)
    move.w #$9400,(A4)  *ƒÀ»ÕÕ¿
    move.w $FF9FE2,(A4)              *œŒ«»÷»ﬂ Ãﬂ◊¿ ◊≈–≈«  ¿∆ƒ€≈ 9580
    move.w $FF9FE4,(A4)
    move.w #$97C0,(A4)  *»—“Œ◊Õ» 
    move.l #$720000C2,(A4) *¬€’Œƒ
    MOVE.B #0,(A0)       *Œ“◊»—“ ¿ ‘À¿√¿ ƒÃ¿ 
.RT    *jmp stop
    RTS
*LEVEL0==========================================================================================
LEVEL0
    
    *÷» ÀŒ“–ŒÕ ƒÀﬂ œ≈–≈ÕŒ—¿ “¿…ÀÃ¿œ¿ («¿√Œ“Œ¬À≈ÕÕŒ√Œ ¬Œ ¬–≈Ãﬂ DMA)
    BSR.W MIKUSETUP	*”—“¿ÕŒ¬ » —œ–¿…“¿ –≈Ã”
	*BSR.B BALLINIT	*«¿√–”«◊»  ÿ¿–¿   ∆≈À¿“≈À‹ÕŒ ƒ≈–∆¿“‹ œ¿–Œ… (› ŒÕŒÃ»ﬂ –≈—”–—Œ¬)
    MOVE.L #VRAMTILEMAPB,D6
    JSR LOADTORAMLEVEL0TILEMAP *–¿—œ¿ Œ¬€¬¿≈Ã “¿…ÀÃ¿œ ¬ RAM
	
	BSR.W DMAWAIT

   
	MOVE.W #$8F02,(VDPCONTROL)
    BSR PREPVRAM    
    MOVE.L #$FFA000,A2 *¿ƒ–≈— “¿…ÀÃ¿œ¿ ¬ RAM
    MOVE.L #VDPDATA,A3 *¿ƒ–≈— œŒ–“¿ ¬»ƒ≈Œ◊»œ¿
    MOVEQ #19,D0 *÷» ÀŒ“–ŒÕ —“–Œ◊Õ€…
    MOVEQ #29,D1 *÷» ÀŒ“–ŒÕ  ¿ƒ–Œ¬€…
.L  
    MOVE.L (A2)+,(A3) *“ŒÀ ¿≈Ã 2 “¿…À¿
    DBRA D0,.L      *÷» À»Ã—ﬂ œŒ ¿ Õ≈ ¬€ƒ¿ƒ»Ã ¬—ﬁ —“–Œ ”
    ADD.W #128,D6   *ƒŒ¡¿¬Àﬂ≈Ã ¿ƒ–≈— ƒŒ —À≈ƒ —“–Œ »
    BSR.W PREPVRAM    *√Œ“Œ¬»Ã ¬»ƒ≈Œœ¿Ãﬂ“‹
    
    MOVEQ #19,D0    *ƒŒ¡¿¬Àﬂ≈Ã —“–Œ◊Õ€’ ÷» ÀŒ¬
    
    DBRA D1,.L      *÷» À»Ã—ﬂ œŒ ¿ Õ≈ ¬€¬≈ƒ≈Ã ¬—≈ —“–Œ »
    
    
    *«¿√–”« ¿ “¿…ÀŒ¬
    LEA LEVEL0BTILES,A0 *¿ƒ–≈— “¿…ÀŒ¬
    MOVE.L #32,D6 *Œ“—“”œ 1 “¿…À
    JSR PREPVRAM    *√Œ“Œ¬»Ã ¬»ƒ≈Œœ¿Ãﬂ“‹
        
    JSR Nem_Decomp *–¿—œ¿ Œ¬ ¿ œ–ﬂÃ ¬ ¬»ƒ≈Œœ¿Ãﬂ“‹
	
    
    *œ¿À»“–¿ + ¬€’Œƒ »« ◊®–ÕŒ√Œ    

    MOVE.L #RAM+96,A0 œŒ«»÷»ﬂ ¬ RAM ƒÀﬂ ÷¬≈“¿
    LEA LEVEL0BPALITRA,A1
    MOVEQ #7,D7
.PL
    MOVE.L (A1)+,(A0)+ «¿√–”« ¿ œ¿À»“–€
    DBRA D7,.PL

   

    MOVEQ #0,D7 *Œ“◊»—“ ¿ ƒÀﬂ —◊®“◊» ¿  ¿ƒ–Œ¬
    LEA .LOOPJ,A6 
    JMP FADETOPAL
    
    
.GAMELOOP
       
    JSR MIKU    *Œ¡–¿¡Œ“ ¿ –≈…Ã”
    JSR BALLMATH    *Œ¡—◊®“ ÿ¿–¿
    
    
    
    JSR FRAMECOUNT *œŒƒ—◊®“  ¿ƒ–Œ¬ ¬ D7 
    JSR VBLANKSTART
    *JSR DMASPRITETABLE *Œ¡—À”∆»¬¿Õ»≈ “¿¡À»÷€ —œ–¿…“Œ¬
    JSR BALLDRAW  *Œ“–»—Œ¬ ¿ ÿ¿–¿
       
   
.LOOPJ                          *“Œ◊ ¿ ƒÀﬂ œ–≈ƒŒ“¬–¿Ÿ≈Õ»ﬂ ¬—ﬂ »’ √Àﬁ Œ¬ —Œ —œ–¿…“ŒÃ
    JSR Player_ReadControlsDual *—◊»“€¬¿≈Õ»≈ ƒ∆Œ…—“» ¿ ¬ D0 
    *JMP STOP     *“Œ◊ ¿ Œ—“¿ÕŒ¬ » ƒÀﬂ ƒ∆Œ…—“» ¿
    JSR DMAWAIT
    JSR VBLANKEND
    
         
       
    JMP .GAMELOOP
*DMASPRITETABLE
        *DMA ƒÀﬂ œ≈–≈ÕŒ—¿ —œ–¿…“Œ¬Œ… “¿¡À»÷€ ¬ ¬»ƒ≈Œœ¿Ãﬂ“‹ 
*    MOVE.L #VDPCONTROL,A0 *œ≈–≈ÕŒ—  ŒÕ“–ŒÀﬂ ¬ AO ƒÀﬂ  ŒÃœ¿ “ÕŒ—“»  Œƒ¿ :)
*    MOVE.W #$8F02,(A0)  *”—“¿ÕŒ¬ ¿ ¿¬“Œ—ÀŒ∆≈Õ»ﬂ Õ¿ 2
    
*    move.w #$9300+(($11F>>1)&$FF),VDPCONTROL Õ»∆Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€
*    move.w #$9400+((($0000>>1)&$FF00)>>8),VDPCONTROL ¬≈–’Õ≈≈ —ÀŒ¬Œ ƒÀ»ÕÕ€
*    move.w #$9500+(($00>>1)&$FF),VDPCONTROL Õ»∆Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
*    move.w #$9600+((($D800>>1)&$FF00)>>8),VDPCONTROL —–≈ƒÕ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
*    move.w #$9700+((($FF0000>>1)&$7F0000)>>16),VDPCONTROL ¬≈–’Õ»… ¿ƒ–≈— »—“Œ◊Õ» ¿
    
*    move.l #$40000080+(($D800&$3FFF)<<16)+(($D800&$C000)>>14),VDPCONTROL ¿ƒ–≈— Õ¿«Õ¿◊≈Õ»ﬂ+«¿œ”—  DMA
    
    
*    RTS

LEVEL0BTILES INCBIN "tilemap\res\level0btiles.bin"
LEVEL0BTILEMAP INCBIN "tilemap\res\level0btilemap.bin"
LEVEL0BPALITRA INCBIN "tilemap\res\level0bpalitra.bin"
    
MENUWINDOWTILES INCBIN "tilemap\res\menuwindowtile.bin"
MENUWINDOWTILEMAP INCBIN "tilemap\res\menuwindowtilemap.bin"
MENUTEXT INCBIN "tilemap\res\menutext.bin"


*===================================================================================================================
    
RTBLOGOTILES
    INCBIN "tilemap\res\RTBLOGOTILES.BIN"

     
*==============================================================================================================
 
    INCLUDE "MONITOR.X68" *œ–Œ√–¿ÃÃ¿ ÃŒÕ»“Œ–¿ ƒÀﬂ Œ“À¿ƒ »   
    INCLUDE "SMTP\GEMS.A" *«‚ÛÍÓ‚ÓÈ ‰‡È‚Â+Á‡Ô˜‡ÒÚË  
  

   
    

*=========================================================================================================
 

    



*================================================================================================
    





    END    START        ; last line of source












    
    
    
    


    
    
    
























































































































































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
