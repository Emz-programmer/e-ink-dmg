/*
    Custom display renderer for e-ink displays

    TODO: Explore how quickly partial refresh can be used
    TODO: Can we replicate localised full referesh using partial refresh?
    TODO: Hotswap between dynamic and partial refresh based off data diff
*/

#include "./config/EPD_1in54_V2.h"
#include <stdio.h>
#include "Renderer.h"

void Renderer(void)
{
    EPD_1IN54_V2_Init();
    
    printf("Hello World");

    return;
}