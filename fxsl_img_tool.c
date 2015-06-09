// * ===============================================================================
// * File         : fxsl_img_tool.c
// * Author       : Wang Hairun
// * Created Date : 06/08/2015 | 11:42:43 AM | Monday,June
// * Description  : image tool for convering tif format to raw format
// * ===============================================================================


// *******************************************************************
// Desc: include
//
// *******************************************************************
#include "tif_config.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <io.h>
#include "libport.h"

#include "tiffio.h"

// *******************************************************************
// Desc: define
//
// *******************************************************************
#define	streq(a,b)	(strcmp((a),(b)) == 0)
#define	strneq(a,b,n)	(strncmp(a,b,n) == 0)

#define	CopyField(tag, v) \
    if (TIFFGetField(in, tag, &v)) TIFFSetField(out, tag, v)
#define	CopyField2(tag, v1, v2) \
    if (TIFFGetField(in, tag, &v1, &v2)) TIFFSetField(out, tag, v1, v2)
#define	CopyField3(tag, v1, v2, v3) \
    if (TIFFGetField(in, tag, &v1, &v2, &v3)) TIFFSetField(out, tag, v1, v2, v3)
#define	CopyField4(tag, v1, v2, v3, v4) \
    if (TIFFGetField(in, tag, &v1, &v2, &v3, &v4)) TIFFSetField(out, tag, v1, v2, v3, v4)

#define	NTAGS	(sizeof (tags) / sizeof (tags[0]))
#define	CVT(x)		(((x) * 255L) / ((1L<<16)-1))
#define	pack(a,b)	((a)<<8 | (b))

/* x% weighting -> fraction of full color */
#define	PCT(x)	(((x)*255+127)/100)

// *******************************************************************
// Desc: variables
//
// *******************************************************************
int	RED = PCT(30);		/* 30% */
int	GREEN = PCT(59);	/* 59% */
int	BLUE = PCT(11);		/* 11% */

uint32	imagewidth;
uint32	imagelength;
int	    threshold = 128;

static uint16 compression = (uint16) -1;
static uint16 predictor = 0;
static int    jpegcolormode = JPEGCOLORMODE_RGB;
static int    quality = 75;		/* JPEG quality */

static int showdata = 0;		/* show data */
static int rawdata = 0;			/* show raw/decoded data */
static int showwords = 0;		/* show data as bytes/words */
static int readdata = 0;		/* read data in file */
static int stoponerr = 1;		/* stop on first read error */
static int reversedflag = 0;

FILE * fp;

char* stuff[] = 
{
    "usage: fxsl_img_tool [options] input.tif output.raw",
    "where options are:",
    "-c : none,lzw,zip",
    "-i : invert",
    NULL
};

static struct cpTag 
{
	uint16	tag;
	uint16	count;
	TIFFDataType type;
} tags[] = 
{
	{ TIFFTAG_SUBFILETYPE,		            1,           TIFF_LONG          },
	{ TIFFTAG_THRESHHOLDING,	            1,           TIFF_SHORT         },
	{ TIFFTAG_DOCUMENTNAME,		            1,           TIFF_ASCII         },
	{ TIFFTAG_IMAGEDESCRIPTION,	            1,           TIFF_ASCII         },
	{ TIFFTAG_MAKE,			                1,           TIFF_ASCII         },
	{ TIFFTAG_MODEL,		                1,           TIFF_ASCII         },
	{ TIFFTAG_MINSAMPLEVALUE,	            1,           TIFF_SHORT         },
	{ TIFFTAG_MAXSAMPLEVALUE,	            1,           TIFF_SHORT         },
	{ TIFFTAG_XRESOLUTION,		            1,           TIFF_RATIONAL      },
	{ TIFFTAG_YRESOLUTION,		            1,           TIFF_RATIONAL      },
	{ TIFFTAG_PAGENAME,		                1,           TIFF_ASCII         },
	{ TIFFTAG_XPOSITION,		            1,           TIFF_RATIONAL      },
	{ TIFFTAG_YPOSITION,		            1,           TIFF_RATIONAL      },
	{ TIFFTAG_RESOLUTIONUNIT,	            1,           TIFF_SHORT         },
	{ TIFFTAG_SOFTWARE,		                1,           TIFF_ASCII         },
	{ TIFFTAG_DATETIME,		                1,           TIFF_ASCII         },
	{ TIFFTAG_ARTIST,		                1,           TIFF_ASCII         },
	{ TIFFTAG_HOSTCOMPUTER,		            1,           TIFF_ASCII         },
	{ TIFFTAG_WHITEPOINT,		            2,           TIFF_RATIONAL      },
	{ TIFFTAG_PRIMARYCHROMATICITIES,        (uint16) -1, TIFF_RATIONAL      },
	{ TIFFTAG_HALFTONEHINTS,	            2,           TIFF_SHORT         },
	{ TIFFTAG_INKSET,		                1,           TIFF_SHORT         },
	{ TIFFTAG_DOTRANGE,		                2,           TIFF_SHORT         },
	{ TIFFTAG_TARGETPRINTER,	            1,           TIFF_ASCII         },
	{ TIFFTAG_SAMPLEFORMAT,		            1,           TIFF_SHORT         },
	{ TIFFTAG_YCBCRCOEFFICIENTS,	        (uint16) -1, TIFF_RATIONAL      },
	{ TIFFTAG_YCBCRSUBSAMPLING,	            2,           TIFF_SHORT         },
	{ TIFFTAG_YCBCRPOSITIONING,	            1,           TIFF_SHORT         },
	{ TIFFTAG_REFERENCEBLACKWHITE,	        (uint16) -1, TIFF_RATIONAL      },
	{ TIFFTAG_EXTRASAMPLES,		            (uint16) -1, TIFF_SHORT         },
	{ TIFFTAG_SMINSAMPLEVALUE,	            1,           TIFF_DOUBLE        },
	{ TIFFTAG_SMAXSAMPLEVALUE,	            1,           TIFF_DOUBLE        },
	{ TIFFTAG_STONITS,		                1,           TIFF_DOUBLE        },
};


// *******************************************************************
// Desc: Prototype
//
// *******************************************************************
static    void     usage(void);
static    int      processCompressOptions(char* opt);
static    void     cpTags(TIFF* in, TIFF* out);
static    void     cpTag(TIFF* in, TIFF* out, uint16 tag, uint16 count, TIFFDataType type);
static    int      checkcmap(TIFF* tif, int n, uint16* r, uint16* g, uint16* b);
static    void     compresspalette(unsigned char* out, unsigned char* data, uint32 n, uint16* rmap, uint16* gmap, uint16* bmap);
static    void     compresssep(unsigned char* out,unsigned char* r, unsigned char* g, unsigned char* b, uint32 n);
static    void     compresscontig(unsigned char* out, unsigned char* rgb, uint32 n);
static    void     fsdither(TIFF* in, TIFF* out);
static    void     tiffinfo(TIFF* tif, uint16 order, long flags, int is_image);
static    void     TIFFReadRawData(TIFF* tif, int bitrev);
static    void     ShowRawBytes(unsigned char* pp, uint32 n);
static    void     ShowRawWords(uint16* pp, uint32 n);
static    void     TIFFReadData(TIFF* tif);
static    void     TIFFReadContigTileData(TIFF* tif);
static    void     TIFFReadSeparateTileData(TIFF* tif);
static    void     TIFFReadContigStripData(TIFF* tif);
static    void     TIFFReadSeparateStripData(TIFF* tif);
static    void     ShowTile(uint32 row, uint32 col, tsample_t sample,unsigned char* pp, uint32 nrow, tsize_t rowsize);
#if 0
static    void     ShowStrip(tstrip_t strip, unsigned char* pp, uint32 nrow, tsize_t scanline);
#endif


/* *************************************************************************
 *Desc: Main Entry
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:46:49 AM | Monday,June
 **************************************************************************/
int main( int argc, char* argv[] )
{

	TIFF *in, *out;
    FILE * fp_;

	uint32 rowsperstrip = (uint32) -1;
	uint32 w, h;
	uint16 samplesperpixel;
	uint16 bitspersample;
	uint16 config;
	uint16 photometric;

	uint16* red;
	uint16* green;
	uint16* blue;

	tsize_t rowsize;

	register uint32 row;
	register tsample_t s;
	unsigned char *inbuf, *outbuf;
	char thing[1024];
	int c;

	extern int optind;
	extern char *optarg;

	uint16 fillorder = 0;
	uint16 shortv;
	float floatv;
    int dirnum = -1;
	uint16 order = 0;
	long flags = 0;
	uint64 diroff = 0;

    while ((c = getopt(argc, argv, "c:i")) != -1)
        switch (c)
        {
        case 'c':		/* compression scheme */
            showdata++;
			readdata++;
            if (!processCompressOptions(optarg))
            {
                usage();
            }
            break;
        case 'i':
            reversedflag++;
            break;
        case '?':
            usage();
            break;
        default:
            usage();
        }

    // fprintf(stderr,"%d=============%s:\n",argc,argv[optind]);
    // fprintf(stderr,"%d=============%d:\n",argc,optind);

	if (argc - optind < 2)
    {
		usage();
    }

    // ------------------------------------------------------------------ 
    // Desc: first step: turn original tiff to black and white
    // ------------------------------------------------------------------ 
	in = TIFFOpen(argv[optind], "r");
	if (in == NULL)
		return (-1);

	photometric = 0;
	TIFFGetField(in, TIFFTAG_PHOTOMETRIC, &photometric);
	if (photometric != PHOTOMETRIC_RGB && photometric != PHOTOMETRIC_PALETTE ) 
    {
		// fprintf(stderr,"%s: Bad photometric; can only handle RGB and Palette images.\n",argv[optind]);
		// return (-1);

#if 0
	    TIFFClose(in);
        {
            FILE *fpSrc, *fpDest;
            fpSrc = fopen(argv[optind], "rb");   
            if(fpSrc==NULL)
            {
                printf( "Source file open failure.");
                return 0;
            }

            fpDest = fopen("temp_bw.tif", "wb+"); 

            if(fpDest==NULL)
            {
                printf("Destination file open failure.");
                return 0;
            }
            while((c=fgetc(fpSrc))!=EOF)
            {   
                fputc(c, fpDest);
            }
            fclose(fpSrc); 
            fclose(fpDest);
        }
#endif

        char str[80] = {0};
        strcat(str,"cp ");
        strcat(str,argv[optind]);
        strcat(str," temp_bw.tif");
        system(str);
        goto phase2;
	}

	TIFFGetField(in, TIFFTAG_SAMPLESPERPIXEL, &samplesperpixel);
	if (samplesperpixel != 1 && samplesperpixel != 3) 
    {
		fprintf(stderr, "%s: Bad samples/pixel %u.\n",argv[optind], samplesperpixel);
		return (-1);
	}

	TIFFGetField(in, TIFFTAG_BITSPERSAMPLE, &bitspersample);
	if (bitspersample != 8) 
    {
		fprintf(stderr," %s: Sorry, only handle 8-bit samples.\n", argv[optind]);
		return (-1);
	}

	TIFFGetField(in, TIFFTAG_IMAGEWIDTH, &w);
	TIFFGetField(in, TIFFTAG_IMAGELENGTH, &h);
	TIFFGetField(in, TIFFTAG_PLANARCONFIG, &config);

	out = TIFFOpen("temp_bw.tif", "w");
	if (out == NULL)
		return (-1);

	TIFFSetField(out, TIFFTAG_IMAGEWIDTH, w);
	TIFFSetField(out, TIFFTAG_IMAGELENGTH, h);
	TIFFSetField(out, TIFFTAG_BITSPERSAMPLE, 8);
	TIFFSetField(out, TIFFTAG_SAMPLESPERPIXEL, 1);
	TIFFSetField(out, TIFFTAG_PLANARCONFIG, PLANARCONFIG_CONTIG);

	cpTags(in, out);

    if (compression != (uint16) -1) 
    {
        TIFFSetField(out, TIFFTAG_COMPRESSION, compression);
        switch (compression) 
        {
        case COMPRESSION_JPEG:
            TIFFSetField(out, TIFFTAG_JPEGQUALITY, quality);
            TIFFSetField(out, TIFFTAG_JPEGCOLORMODE, jpegcolormode);
            break;
        case COMPRESSION_LZW:
        case COMPRESSION_DEFLATE:
            if (predictor != 0)
                TIFFSetField(out, TIFFTAG_PREDICTOR, predictor);
            break;
        }
    }

	TIFFSetField(out, TIFFTAG_PHOTOMETRIC, PHOTOMETRIC_MINISBLACK);

	sprintf(thing, "B&W version of %s", argv[optind]);

	TIFFSetField(out, TIFFTAG_IMAGEDESCRIPTION, thing);
	TIFFSetField(out, TIFFTAG_SOFTWARE, "tiff2bw");

    outbuf = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(out));

    TIFFSetField(out, TIFFTAG_ROWSPERSTRIP,TIFFDefaultStripSize(out, rowsperstrip));

	switch (pack(photometric, config)) 
    {

	case pack(PHOTOMETRIC_PALETTE, PLANARCONFIG_CONTIG):

	case pack(PHOTOMETRIC_PALETTE, PLANARCONFIG_SEPARATE):
		TIFFGetField(in, TIFFTAG_COLORMAP, &red, &green, &blue);
		/*
		 * Convert 16-bit colormap to 8-bit (unless it looks
		 * like an old-style 8-bit colormap).
		 */
		if (checkcmap(in, 1<<bitspersample, red, green, blue) == 16) 
        {
			int i;

			for (i = (1<<bitspersample)-1; i >= 0; i--) 
            {
				red[i] = CVT(red[i]);
				green[i] = CVT(green[i]);
				blue[i] = CVT(blue[i]);
			}

		}

		inbuf = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(in));
		for (row = 0; row < h; row++) 
        {
			if (TIFFReadScanline(in, inbuf, row, 0) < 0)
				break;
			compresspalette(outbuf, inbuf, w, red, green, blue);
			if (TIFFWriteScanline(out, outbuf, row, 0) < 0)
				break;
		}
		break;

	case pack(PHOTOMETRIC_RGB, PLANARCONFIG_CONTIG):
		inbuf = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(in));
		for (row = 0; row < h; row++) 
        {
			if (TIFFReadScanline(in, inbuf, row, 0) < 0)
				break;
			compresscontig(outbuf, inbuf, w);
			if (TIFFWriteScanline(out, outbuf, row, 0) < 0)
				break;
		}
		break;

	case pack(PHOTOMETRIC_RGB, PLANARCONFIG_SEPARATE):
		rowsize = TIFFScanlineSize(in);
		inbuf = (unsigned char *)_TIFFmalloc(3*rowsize);
		for (row = 0; row < h; row++) 
        {
            for (s = 0; s < 3; s++)
                if (TIFFReadScanline(in,inbuf+s*rowsize, row, s) < 0)
                    return (-1);

            compresssep(outbuf,inbuf, inbuf+rowsize, inbuf+2*rowsize, w);

            if (TIFFWriteScanline(out, outbuf, row, 0) < 0)
				break;
		}
		break;
	}

	TIFFClose(out);
phase2:
	TIFFClose(in);

    // ------------------------------------------------------------------ 
    // Desc: Sencond Step: Make black and white tiff become 1 bit
    // ------------------------------------------------------------------ 

	in = TIFFOpen("temp_bw.tif", "r");
	if (in == NULL)
		return (-1);

    out = TIFFOpen("temp_bw_01.tif","w");
	if (out == NULL)
		return (-1);

	CopyField(TIFFTAG_IMAGEWIDTH, imagewidth);
	TIFFGetField(in, TIFFTAG_IMAGELENGTH, &imagelength);
	TIFFSetField(out, TIFFTAG_IMAGELENGTH, imagelength-1);
	TIFFSetField(out, TIFFTAG_BITSPERSAMPLE, 1);
	TIFFSetField(out, TIFFTAG_SAMPLESPERPIXEL, 1);
	TIFFSetField(out, TIFFTAG_PLANARCONFIG, PLANARCONFIG_CONTIG);
	TIFFSetField(out, TIFFTAG_COMPRESSION, compression);
	if (fillorder)
		TIFFSetField(out, TIFFTAG_FILLORDER, fillorder);
	else
		CopyField(TIFFTAG_FILLORDER, shortv);
	sprintf(thing, "Dithered B&W version of %s", argv[optind]);
	TIFFSetField(out, TIFFTAG_IMAGEDESCRIPTION, thing);
	CopyField(TIFFTAG_PHOTOMETRIC, shortv);
	CopyField(TIFFTAG_ORIENTATION, shortv);
	CopyField(TIFFTAG_XRESOLUTION, floatv);
	CopyField(TIFFTAG_YRESOLUTION, floatv);
	CopyField(TIFFTAG_RESOLUTIONUNIT, shortv);
        rowsperstrip = TIFFDefaultStripSize(out, rowsperstrip);
	TIFFSetField(out, TIFFTAG_ROWSPERSTRIP, rowsperstrip);

	fsdither(in, out);

	TIFFClose(in);
	TIFFClose(out);

    // ------------------------------------------------------------------ 
    // Desc: Third Step: Convert 1 bit black and white tiff to raw format
    // ------------------------------------------------------------------ 

    in = TIFFOpen("temp_bw_01.tif", "rc");
    if (in == NULL)
        return (-1);

    if(access(argv[optind+1], 0) == 0) 
    {
        if(remove(argv[optind+1]))   
            printf("Remove Error\n");   
    }

    fp_=fopen(argv[optind+1],"ab+");
    if(fp_ == NULL) 
        return 0;

    fp = fp_;

    if (dirnum != -1) 
    {
        if (TIFFSetDirectory(in, (tdir_t) dirnum))
            tiffinfo(in, order, flags, 1);
    } 
    else if (diroff != 0) 
    {
        if (TIFFSetSubDirectory(in, diroff))
            tiffinfo(in, order, flags, 1);
    }
    else 
    {
        do 
        {
            toff_t offset;

            // fprintf(stderr,"I am in do while\n");

            tiffinfo(in, order, flags, 1);

            if (TIFFGetField(in, TIFFTAG_EXIFIFD,&offset)) 
            {

                // fprintf(stderr,"I am in offset1\n");

                if (TIFFReadEXIFDirectory(in, offset)) 
                {
                    // fprintf(stderr,"I am in offset2\n");
                    tiffinfo(in, order, flags, 0);
                }
            }
        } 
        while (TIFFReadDirectory(in));
    }
    TIFFClose(in);
    fclose(fp);

    if(remove("temp_bw.tif"))   
        printf("Remove Error\n");   
    if(remove("temp_bw_01.tif"))   
        printf("Remove Error\n");   

    return (0);
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:51:06 AM | Monday,June
 **************************************************************************/
static int processCompressOptions(char* opt)
{
	if (streq(opt, "none"))
		compression = COMPRESSION_NONE;
	else if (streq(opt, "packbits"))
		compression = COMPRESSION_PACKBITS;
	else if (strneq(opt, "jpeg", 4)) 
    {
        char* cp = strchr(opt, ':');

        compression = COMPRESSION_JPEG;
        while( cp )
        {
            if (isdigit((int)cp[1]))
                quality = atoi(cp+1);
            else if (cp[1] == 'r' )
                jpegcolormode = JPEGCOLORMODE_RAW;
            else
                usage();

            cp = strchr(cp+1,':');
        }
    }
    else if (strneq(opt, "lzw", 3)) 
    {
		char* cp = strchr(opt, ':');
		if (cp)
			predictor = atoi(cp+1);
		compression = COMPRESSION_LZW;
	}
    else if (strneq(opt, "zip", 3)) 
    {
		char* cp = strchr(opt, ':');
		if (cp)
			predictor = atoi(cp+1);
		compression = COMPRESSION_DEFLATE;
	}
    else
		return (0);
	return (1);
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:51:17 AM | Monday,June
 **************************************************************************/
static void cpTags(TIFF* in, TIFF* out)
{
    struct cpTag *p;
    for (p = tags; p < &tags[NTAGS]; p++)
	cpTag(in, out, p->tag, p->count, p->type);
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:51:21 AM | Monday,June
 **************************************************************************/
static void cpTag(TIFF* in, TIFF* out, uint16 tag, uint16 count, TIFFDataType type)
{
	switch (type) 
    {
	case TIFF_SHORT:
		if (count == 1) 
        {
			uint16 shortv;
			CopyField(tag, shortv);
		}
        else if (count == 2) 
        {
			uint16 shortv1, shortv2;
			CopyField2(tag, shortv1, shortv2);
		}
        else if (count == 4) 
        {
			uint16 *tr, *tg, *tb, *ta;
			CopyField4(tag, tr, tg, tb, ta);
		}
        else if (count == (uint16) -1) 
        {
			uint16 shortv1;
			uint16* shortav;
			CopyField2(tag, shortv1, shortav);
		}
		break;
	case TIFF_LONG:
		{
            uint32 longv;
            CopyField(tag, longv);
        }
		break;
	case TIFF_RATIONAL:
		if (count == 1) 
        {
			float floatv;
			CopyField(tag, floatv);
		}
        else if (count == (uint16) -1) 
        {
			float* floatav;
			CopyField(tag, floatav);
		}
		break;
	case TIFF_ASCII:
		{
            char* stringv;
            CopyField(tag, stringv);
		}
		break;
	case TIFF_DOUBLE:
		if (count == 1) 
        {
			double doublev;
			CopyField(tag, doublev);
        }
        else if (count == (uint16) -1) 
        {
            double* doubleav;
            CopyField(tag, doubleav);
        }
        break;
    default:
        TIFFError(TIFFFileName(in),"Data type %d is not supported, tag %d skipped.",tag, type);
    }
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:51:31 AM | Monday,June
 **************************************************************************/
static int checkcmap(TIFF* tif, int n, uint16* r, uint16* g, uint16* b)
{
	while (n-- > 0)
		if (*r++ >= 256 || *g++ >= 256 || *b++ >= 256)
			return (16);
	TIFFWarning(TIFFFileName(tif), "Assuming 8-bit colormap");
	return (8);
}


/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:51:36 AM | Monday,June
 **************************************************************************/
static void compresspalette(unsigned char* out, unsigned char* data, uint32 n, uint16* rmap, uint16* gmap, uint16* bmap)
{
	register int v, red = RED, green = GREEN, blue = BLUE;

	while (n-- > 0) 
    {
		unsigned int ix = *data++;
		v = red*rmap[ix];
		v += green*gmap[ix];
		v += blue*bmap[ix];
		*out++ = v>>8;
	}
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:51:44 AM | Monday,June
 **************************************************************************/
static void compresssep(unsigned char* out,unsigned char* r, unsigned char* g, unsigned char* b, uint32 n)
{
	register uint32 red = RED, green = GREEN, blue = BLUE;

	while (n-- > 0)
		*out++ = (unsigned char)
			((red*(*r++) + green*(*g++) + blue*(*b++)) >> 8);
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:51:51 AM | Monday,June
 **************************************************************************/
static void compresscontig(unsigned char* out, unsigned char* rgb, uint32 n)
{
	register int v, red = RED, green = GREEN, blue = BLUE;

	while (n-- > 0) 
    {
		v = red*(*rgb++);
		v += green*(*rgb++);
		v += blue*(*rgb++);
		*out++ = v>>8;
	}
}

/* *************************************************************************
 *Desc: stuff must end with NULL 
 *
 *Author: Wang Hairun
 *
 *date: 06/04/2015 | 14:53:36 PM | Thursday,June
 ***************************************************************************/
static void usage(void)
{
    char buf[BUFSIZ];
    int i;

    setbuf(stderr, buf);
    fprintf(stderr, "%s\n\n", TIFFGetVersion());
    for (i = 0; stuff[i] != NULL; i++)
        fprintf(stderr, "%s\n", stuff[i]);
    exit(-1);
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:52:35 AM | Monday,June
 **************************************************************************/
static void fsdither(TIFF* in, TIFF* out)
{
	unsigned char *outline, *inputline, *inptr;
	short *thisline, *nextline, *tmpptr;
	register unsigned char	*outptr;
	register short *thisptr, *nextptr;
	register uint32 i, j;
	uint32 imax, jmax;
	int lastline, lastpixel;
	int bit;
	tsize_t outlinesize;

	imax = imagelength - 1;
	jmax = imagewidth - 1;
	inputline = (unsigned char *)_TIFFmalloc(TIFFScanlineSize(in));
	thisline = (short *)_TIFFmalloc(imagewidth * sizeof (short));
	nextline = (short *)_TIFFmalloc(imagewidth * sizeof (short));
	outlinesize = TIFFScanlineSize(out);
	outline = (unsigned char *) _TIFFmalloc(outlinesize);

	/*
	 * Get first line
	 */
	if (TIFFReadScanline(in, inputline, 0, 0) <= 0)
            goto skip_on_error;

	inptr = inputline;
	nextptr = nextline;
	for (j = 0; j < imagewidth; ++j)
		*nextptr++ = *inptr++;
	for (i = 1; i < imagelength; ++i) 
    {
		tmpptr = thisline;
		thisline = nextline;
		nextline = tmpptr;
		lastline = (i == imax);
		if (TIFFReadScanline(in, inputline, i, 0) <= 0)
			break;
		inptr = inputline;
		nextptr = nextline;
		for (j = 0; j < imagewidth; ++j)
			*nextptr++ = *inptr++;
		thisptr = thisline;
		nextptr = nextline;
		_TIFFmemset(outptr = outline, 0, outlinesize);
		bit = 0x80;
		for (j = 0; j < imagewidth; ++j) 
        {
			register int v;

			lastpixel = (j == jmax);
			v = *thisptr++;
			if (v < 0)
				v = 0;
			else if (v > 255)
				v = 255;
			if (v > threshold) 
            {
				*outptr |= bit;
				v -= 255;
			}
			bit >>= 1;
			if (bit == 0) 
            {
				outptr++;
				bit = 0x80;
			}
			if (!lastpixel)
				thisptr[0] += v * 7 / 16;
			if (!lastline) 
            {
				if (j != 0)
					nextptr[-1] += v * 3 / 16;
				*nextptr++ += v * 5 / 16;
				if (!lastpixel)
					nextptr[0] += v / 16;
			}
		}
		if (TIFFWriteScanline(out, outline, i-1, 0) < 0)
			break;
	}
  skip_on_error:
	_TIFFfree(inputline);
	_TIFFfree(thisline);
	_TIFFfree(nextline);
	_TIFFfree(outline);
}


/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:52:45 AM | Monday,June
 **************************************************************************/
static void tiffinfo(TIFF* tif, uint16 order, long flags, int is_image)
{
	// TIFFPrintDirectory(tif, stdout, flags);
    flags = flags;

	if (!readdata || !is_image)
		return;
	if (rawdata) 
    {
        // fprintf(stderr,"I am in rawdata\n");
		if (order) 
        {
			uint16 o;
			TIFFGetFieldDefaulted(tif,
			    TIFFTAG_FILLORDER, &o);
			TIFFReadRawData(tif, o != order);
		} 
        else
			TIFFReadRawData(tif, 0);
	} 
    else
    {
        // fprintf(stderr,"I am in else\n");
		if (order)
        {
            // fprintf(stderr,"I am in order\n");
			TIFFSetField(tif, TIFFTAG_FILLORDER, order);
        }
		TIFFReadData(tif);
	}
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:52:58 AM | Monday,June
 **************************************************************************/
static void TIFFReadRawData(TIFF* tif, int bitrev)
{
	tstrip_t nstrips = TIFFNumberOfStrips(tif);
	const char* what = TIFFIsTiled(tif) ? "Tile" : "Strip";
	uint64* stripbc;

	TIFFGetField(tif, TIFFTAG_STRIPBYTECOUNTS, &stripbc);
	if (nstrips > 0) 
    {
		uint32 bufsize = (uint32) stripbc[0];
		tdata_t buf = _TIFFmalloc(bufsize);
		tstrip_t s;

		for (s = 0; s < nstrips; s++) 
        {
			if (stripbc[s] > bufsize) 
            {
				buf = _TIFFrealloc(buf, (tmsize_t)stripbc[s]);
				bufsize = (uint32) stripbc[s];
			}
			if (buf == NULL) 
            {
				fprintf(stderr,
				   "Cannot allocate buffer to read strip %lu\n",
				    (unsigned long) s);
				break;
			}
			if (TIFFReadRawStrip(tif, s, buf, (tmsize_t) stripbc[s]) < 0) 
            {
				fprintf(stderr, "Error reading strip %lu\n",
				    (unsigned long) s);
				if (stoponerr)
					break;
			}
            else if (showdata) 
            {
				if (bitrev) 
                {
					TIFFReverseBits(buf, (tmsize_t)stripbc[s]);
					printf("%s %lu: (bit reversed)\n ",
					    what, (unsigned long) s);
				}
                else
					printf("%s %lu:\n ", what,(unsigned long) s);

				if (showwords)
					ShowRawWords((uint16*) buf, (uint32) stripbc[s]>>1);
				else
					ShowRawBytes((unsigned char*) buf, (uint32) stripbc[s]);
			}
		}
		if (buf != NULL)
			_TIFFfree(buf);
	}
}


/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:53:06 AM | Monday,June
 **************************************************************************/
static void ShowRawBytes(unsigned char* pp, uint32 n)
{
	uint32 i;

	for (i = 0; i < n; i++) 
    {
		printf(" %02x", *pp++);
		if (((i+1) % 24) == 0)
			printf("\n ");
	}
	putchar('\n');
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:53:18 AM | Monday,June
 **************************************************************************/
static void ShowRawWords(uint16* pp, uint32 n)
{
	uint32 i;

	for (i = 0; i < n; i++) 
    {
		printf(" %04x", *pp++);
		if (((i+1) % 15) == 0)
			printf("\n ");
	}
	putchar('\n');
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:53:22 AM | Monday,June
 **************************************************************************/
static void TIFFReadData(TIFF* tif)
{
	uint16 config = PLANARCONFIG_CONTIG;

    // fprintf(stderr,"I am in TIFFReadData\n");

	TIFFGetField(tif, TIFFTAG_PLANARCONFIG, &config);
	if (TIFFIsTiled(tif)) 
    {
        // fprintf(stderr,"I am in isTitled\n");

		if (config == PLANARCONFIG_CONTIG)
        {
            // fprintf(stderr,"I am in config1\n");
			TIFFReadContigTileData(tif);
        }
		else
        {
            // fprintf(stderr,"I am in config2\n");
			TIFFReadSeparateTileData(tif);
        }
	}
    else
    {
		if (config == PLANARCONFIG_CONTIG)
        {
            // fprintf(stderr,"I am in config3\n");
			TIFFReadContigStripData(tif);
        }
		else
        {
            // fprintf(stderr,"I am in config4\n");
			TIFFReadSeparateStripData(tif);
        }
	}
}


/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:53:28 AM | Monday,June
 **************************************************************************/
static void TIFFReadContigTileData(TIFF* tif)
{
	unsigned char *buf;
	tsize_t rowsize = TIFFTileRowSize(tif);

	buf = (unsigned char *)_TIFFmalloc(TIFFTileSize(tif));
	if (buf) {
		uint32 tw, th, w, h;
		uint32 row, col;

		TIFFGetField(tif, TIFFTAG_IMAGEWIDTH, &w);
		TIFFGetField(tif, TIFFTAG_IMAGELENGTH, &h);
		TIFFGetField(tif, TIFFTAG_TILEWIDTH, &tw);
		TIFFGetField(tif, TIFFTAG_TILELENGTH, &th);
		for (row = 0; row < h; row += th) {
			for (col = 0; col < w; col += tw) {
				if (TIFFReadTile(tif, buf, col, row, 0, 0) < 0) {
					if (stoponerr)
						break;
				} else if (showdata)
					ShowTile(row, col, (tsample_t) -1, buf, th, rowsize);
			}
		}
		_TIFFfree(buf);
	}
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:53:34 AM | Monday,June
 **************************************************************************/
static void TIFFReadSeparateTileData(TIFF* tif)
{
	unsigned char *buf;
	tsize_t rowsize = TIFFTileRowSize(tif);

	buf = (unsigned char *)_TIFFmalloc(TIFFTileSize(tif));
	if (buf) {
		uint32 tw, th, w, h;
		uint32 row, col;
		tsample_t s, samplesperpixel;

		TIFFGetField(tif, TIFFTAG_IMAGEWIDTH, &w);
		TIFFGetField(tif, TIFFTAG_IMAGELENGTH, &h);
		TIFFGetField(tif, TIFFTAG_TILEWIDTH, &tw);
		TIFFGetField(tif, TIFFTAG_TILELENGTH, &th);
		TIFFGetField(tif, TIFFTAG_SAMPLESPERPIXEL, &samplesperpixel);
		for (row = 0; row < h; row += th) {
			for (col = 0; col < w; col += tw) {
				for (s = 0; s < samplesperpixel; s++) {
					if (TIFFReadTile(tif, buf, col, row, 0, s) < 0) {
						if (stoponerr)
							break;
					} else if (showdata)
						ShowTile(row, col, s, buf, th, rowsize);
				}
			}
		}
		_TIFFfree(buf);
	}
}


/* *************************************************************************
 *Desc:  print tiff data to raw and make line dot number to be divided by 32
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:53:45 AM | Monday,June
 **************************************************************************/
static void TIFFReadContigStripData(TIFF* tif)
{
	unsigned char *buf;
	tsize_t scanline = TIFFScanlineSize(tif);

	buf = (unsigned char *)_TIFFmalloc(TIFFStripSize(tif));
	if (buf) 
    {
		uint32 row, h,w=0;
		uint32 rowsperstrip = (uint32)-1;

        TIFFGetField(tif, TIFFTAG_IMAGEWIDTH, &w);
        TIFFGetField(tif, TIFFTAG_IMAGELENGTH, &h);
		TIFFGetField(tif, TIFFTAG_ROWSPERSTRIP, &rowsperstrip);

        fprintf(stderr,"w:%d, h:%d\n",((w/32)+1)*32,h);
        fprintf(stderr,"scanline = %d\n",(int)scanline);

		for (row = 0; row < h; row += rowsperstrip) 
        {
			uint32 nrow = (row+rowsperstrip > h ? h-row : rowsperstrip);

			tstrip_t strip = TIFFComputeStrip(tif, row, 0);

			if(TIFFReadEncodedStrip(tif, strip, buf, nrow*scanline) < 0) 
            {
				if(stoponerr)
					break;
			}
            else if(showdata)
            {
				// ShowStrip(strip, buf, nrow, scanline);

                uint32 i;
                unsigned char* buf2;
                unsigned char addbit[4] = {0xff,0xff,0xff,0xff};

                int mod = w%32;
                int times = w/32;
                int firstbytes;
                int secondbytes;

                if(mod == 0)
                {
                    firstbytes = (times*32/8);
                    secondbytes = 0;
                }
                else 
                {
                    firstbytes = (times*32/8) + (mod/8+1);
                    secondbytes = 4-(mod/8+1);
                }

                buf2 = (unsigned char *)_TIFFmalloc(TIFFStripSize(tif));

                if(reversedflag)
                {
                    for(i=0;i<nrow*scanline;i++)
                    {
                        buf2[i] = ~buf[i];
                        if(((i+1)%scanline ==0)&&(mod!=0))
                            buf2[i] = buf2[i] & (0xff<<(8-mod%8));
                    }
                    for(i=0;i<4;i++)
                        addbit[i] = 0x00;
                }
                else
                {
                    for(i=0;i<nrow*scanline;i++)
                    {
                        buf2[i] = buf[i];
                        if(((i+1)%scanline ==0)&&(mod!=0))
                            buf2[i] = buf2[i] | (~(0xff<<(8-mod%8)));
                    }
                }

                if(mod == 0)
                {
                    fwrite((unsigned char*)buf2, scanline, nrow, fp);
                }
                else
                {
                    for(i=0;i<nrow;i++)
                    {
                        fwrite((unsigned char*)buf2,firstbytes, 1, fp);
                        fwrite((unsigned char*)addbit, secondbytes, 1, fp);
                        buf2+=firstbytes;
                    }
                }

		        _TIFFfree(buf2);
            }
		}

		_TIFFfree(buf);
	}
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:54:09 AM | Monday,June
 **************************************************************************/
static void TIFFReadSeparateStripData(TIFF* tif)
{
	unsigned char *buf;
	tsize_t scanline = TIFFScanlineSize(tif);

	buf = (unsigned char *)_TIFFmalloc(TIFFStripSize(tif));
	if (buf) 
    {
		uint32 row, h,w;
		uint32 rowsperstrip = (uint32)-1;
		tsample_t s, samplesperpixel;

		// TIFFGetField(tif, TIFFTAG_IMAGELENGTH, &h);
        
        TIFFGetField(tif, TIFFTAG_IMAGEWIDTH, &w);
        TIFFGetField(tif, TIFFTAG_IMAGELENGTH, &h);
		TIFFGetField(tif, TIFFTAG_ROWSPERSTRIP, &rowsperstrip);
		TIFFGetField(tif, TIFFTAG_SAMPLESPERPIXEL, &samplesperpixel);

        fprintf(stderr,"w:%d, h:%d\n",((w/32)+1)*32,h);
        fprintf(stderr,"scanline = %d\n",(int)scanline);

        for (row = 0; row < h; row += rowsperstrip) 
        {
			for (s = 0; s < samplesperpixel; s++) 
            {
				uint32 nrow = (row+rowsperstrip > h ?h-row : rowsperstrip);
				tstrip_t strip = TIFFComputeStrip(tif, row, s);
				if (TIFFReadEncodedStrip(tif, strip, buf, nrow*scanline) < 0) 
                {
					if (stoponerr)
						break;
				}
                else if (showdata)
                {
					// ShowStrip(strip, buf, nrow, scanline);

                    unsigned char* buf2;
                    uint32 i;
                    int mod = w%32;
                    int times = w/32;
                    int firstbytes;
                    int secondbytes;

                    if(mod == 0)
                    {
                        firstbytes = (times*32/8);
                        secondbytes = 0;
                    }
                    else 
                    {
                        firstbytes = (times*32/8) + (mod/8+1);
                        secondbytes = 4-(mod/8+1);
                    }


                    unsigned char addbit[4] = {0xff,0xff,0xff,0xff};


                    buf2 = (unsigned char *)_TIFFmalloc(TIFFStripSize(tif));

                    if(reversedflag)
                    {
                        for(i=0;i<nrow*scanline;i++)
                        {
                            buf2[i] = ~buf[i];
                            if(((i+1)%scanline == 0)&&(mod!=0))
                                buf2[i] = buf2[i] & (0xff<<(8-mod%8));
                        }
                        for(i=0;i<4;i++)
                            addbit[i] = 0x00;
                    }
                    else
                    {
                        for(i=0;i<nrow*scanline;i++)
                        {
                            buf2[i] = buf[i];
                            if(((i+1)%scanline ==0)&&(mod!=0))
                                buf2[i] = buf2[i] | (~(0xff<<(8-mod%8)));
                        }
                    }


                    if(mod == 0)
                    {
                        fwrite((unsigned char*)buf2, scanline, nrow, fp);
                    }
                    else
                    {
                        for(i=0;i<rowsperstrip;i++)
                        {
                            fwrite((unsigned char*)buf2,firstbytes, 1, fp);
                            fwrite((unsigned char*)addbit, secondbytes, 1, fp);
                            buf2+=firstbytes;
                        }
                    }

		            _TIFFfree(buf2);
                }
			}
		}

		_TIFFfree(buf);
	}
}

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:54:20 AM | Monday,June
 **************************************************************************/
static void ShowTile(uint32 row, uint32 col, tsample_t sample,unsigned char* pp, uint32 nrow, tsize_t rowsize)
{
    uint32 cc;

    printf("Tile (%lu,%lu", (unsigned long) row, (unsigned long) col);
    if (sample != (tsample_t) -1)
        printf(",%u", sample);
    printf("):\n");
    while (nrow-- > 0) 
    {
        for (cc = 0; cc < (uint32) rowsize; cc++) 
        {
            printf(" %02x", *pp++);
            if (((cc+1) % 24) == 0)
                putchar('\n');
        }
        putchar('\n');
    }
}


#if 0

/* *************************************************************************
 *Desc:
 *
 *Author: Wang Hairun
 *
 *date: 06/08/2015 | 11:54:29 AM | Monday,June
 **************************************************************************/
static void ShowStrip(tstrip_t strip, unsigned char* pp, uint32 nrow, tsize_t scanline)
{
	register tsize_t cc;

	// printf("Strip %lu:\n", (unsigned long) strip);
    strip = strip;
	printf("row: %d line: %d \n", nrow,(int)scanline);



	while (nrow-- > 0) 
    {
		for (cc = 0; cc < scanline; cc++) 
        {
			printf(" %02x", *pp++);
			if (((cc+1) % 24) == 0)
				putchar('\n');
		}
		putchar('\n');
	}
}
#endif
