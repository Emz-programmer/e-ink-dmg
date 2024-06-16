/*
    Custom display renderer for e-ink displays

    TODO: Explore how quickly partial refresh can be used
    TODO: Can we replicate localised full referesh using partial refresh?
    TODO: Hotswap between dynamic and partial refresh based off data diff
*/

#include "EPD_1in54_V2.h"


int Renderer(void)
{
    EPD_1in54b_V2_Init();
    Paint_Clear(WHITE);

    Paint_DrawPoints(5, 10, BLACK, DOT_PIXEL_1X1 DOT_STYLE_DFT);

    return 0;
}