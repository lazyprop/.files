/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Source Code Pro:size=13",
    "JoyPixels:pixelsize=8:antialias=true:autohint=true"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char col_black[]            = "#000000";
static const char col_gray1[]            = "#121212";
static const char col_gray2[]            = "#2a2a2a";
static const char col_gray3[]            = "#dbdbdb";
static const char col_gray4[]            = "#efefef";
static const char col_yellow1[]          = "#ffc978";
static const char col_yellow2[]          = "#b3610b";
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { col_gray4, col_gray1 },
	[SchemeSel] = { col_gray1, col_gray4 },
	[SchemeNormHighlight] = { col_yellow1, col_gray1 },
	[SchemeSelHighlight] = { col_yellow2, col_gray4 },
	[SchemeOut] = { col_black, "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 30;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static const unsigned int border_width = 5;
