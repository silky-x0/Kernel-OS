// Our main kernel program

void printf(char* str){
    
}

void kernelMain(void* multiboot_structure, unsigned int magicNumber){
    printf("Hey this works right?");

    while(1);  //infinite loops, we'd never want our kernel to stop
}
