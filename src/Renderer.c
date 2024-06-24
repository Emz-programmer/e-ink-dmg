/*
    Custom display renderer for e-ink displays

    TODO: Explore how quickly partial refresh can be used
    TODO: Can we replicate localised full referesh using partial refresh?
    TODO: Hotswap between dynamic and partial refresh based off data diff
*/

#include "./config/EPD_1in54_V2.h"
#include "./config/GUI_Paint.h"
#include <stdio.h>
#include "Renderer.h"

int Renderer(void){
    if(DEV_Module_Init()!=0){
        return -1;
    }

    EPD_1IN54_V2_Init();
    EPD_1IN54_V2_Clear();

    printf("Hello World");

    test_render();

    return 0;
}

void test_render(void){
    //Partial refresh, plot 1 pixel at a time to make screen black...
    EPD_1IN54_V2_Clear();
    DEV_Delay_ms(2000);
    printf("Preparing scanlines");
    EPD_1IN54_V2_Init();
    int y_pos = 0;

    for(; y_pos < 200; y_pos++){
        render_row(y_pos);
    }   
}

void render_row(int y_pos){
    int x_pos = 0;

    for (; x_pos < 200; x_pos++){
        //plot pixel x_pos/y_pos
        Paint_SetPixel(x_pos, y_pos, BLACK);
    }
    EPD_1IN54_V2_Sleep();
}