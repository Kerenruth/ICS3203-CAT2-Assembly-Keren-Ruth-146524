section .data
    msg_input db "Enter a number: ", 0           ; Prompt for user input
    msg_positive db "POSITIVE", 0               ; Message for positive numbers
    msg_negative db "NEGATIVE", 0               ; Message for negative numbers
    msg_zero db "ZERO", 0                       ; Message for zero

section .bss
    input resb 4                                ; Buffer to store input

section .text
    global _start

_start:
    ; Print prompt message
    mov eax, 4                 ; syscall: write
    mov ebx, 1                 ; file descriptor: stdout
    mov ecx, msg_input         ; Address of the message
    mov edx, 16                ; Length of the message
    int 0x80                   ; Call kernel

    ; Read user input
    mov eax, 3                 ; syscall: read
    mov ebx, 0                 ; file descriptor: stdin
    mov ecx, input             ; Address of input buffer
    mov edx, 4                 ; Maximum length: 4 bytes
    int 0x80                   ; Call kernel

    ; Convert ASCII input to integer
    mov esi, input             ; ESI points to the input buffer
    xor eax, eax               ; Clear EAX (result accumulator)
    xor ebx, ebx               ; Clear EBX (sign flag)

convert_to_integer:
    movzx ecx, byte [esi]      ; Load the current byte into ECX
    cmp ecx, 10                ; Check if it's a newline
    je check_sign              ; If newline, stop conversion
    cmp ecx, '-'               ; Check if it's a negative sign
    je is_negative_input       ; If yes, set sign flag
    sub ecx, '0'               ; Convert ASCII to integer
    imul eax, eax, 10          ; Multiply current result by 10
    add eax, ecx               ; Add the new digit to result
    inc esi                    ; Move to the next byte
    jmp convert_to_integer     ; Repeat for next character

is_negative_input:
    inc esi                    ; Skip the negative sign
    mov bl, 1                  ; Set sign flag
    jmp convert_to_integer     ; Continue conversion

check_sign:
    cmp bl, 1                  ; Check if the sign flag is set
    jne evaluate               ; If not negative, proceed
    neg eax                    ; Negate the result for negative numbers

evaluate:
    ; Evaluate the number and branch accordingly
    cmp eax, 0
    je is_zero
    jl is_negative
    jmp is_positive

is_positive:
    mov eax, 4                 ; syscall: write
    mov ebx, 1                 ; file descriptor: stdout
    mov ecx, msg_positive      ; Address of "POSITIVE"
    mov edx, 8                 ; Length of "POSITIVE"
    int 0x80                   ; Call kernel
    jmp exit                   ; Exit program

is_negative:
    mov eax, 4                 ; syscall: write
    mov ebx, 1                 ; file descriptor: stdout
    mov ecx, msg_negative      ; Address of "NEGATIVE"
    mov edx, 8                 ; Length of "NEGATIVE"
    int 0x80                   ; Call kernel
    jmp exit                   ; Exit program

is_zero:
    mov eax, 4                 ; syscall: write
    mov ebx, 1                 ; file descriptor: stdout
    mov ecx, msg_zero          ; Address of "ZERO"
    mov edx, 4                 ; Length of "ZERO"
    int 0x80                   ; Call kernel

exit:
    mov eax, 1                 ; syscall: exit
    xor ebx, ebx               ; Exit code 0
    int 0x80                   ; Call kernel
