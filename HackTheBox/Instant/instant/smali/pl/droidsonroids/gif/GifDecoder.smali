.class public Lpl/droidsonroids/gif/GifDecoder;
.super Ljava/lang/Object;
.source "GifDecoder.java"


# instance fields
.field private final mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;


# direct methods
.method public constructor <init>(Lpl/droidsonroids/gif/InputSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, v0}, Lpl/droidsonroids/gif/GifDecoder;-><init>(Lpl/droidsonroids/gif/InputSource;Lpl/droidsonroids/gif/GifOptions;)V

    return-void
.end method

.method public constructor <init>(Lpl/droidsonroids/gif/InputSource;Lpl/droidsonroids/gif/GifOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-virtual {p1}, Lpl/droidsonroids/gif/InputSource;->open()Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object p1

    iput-object p1, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    if-eqz p2, :cond_0

    .line 41
    iget-char v0, p2, Lpl/droidsonroids/gif/GifOptions;->inSampleSize:C

    iget-boolean p2, p2, Lpl/droidsonroids/gif/GifOptions;->inIsOpaque:Z

    invoke-virtual {p1, v0, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->setOptions(CZ)V

    :cond_0
    return-void
.end method

.method private checkBuffer(Landroid/graphics/Bitmap;)V
    .locals 3

    .line 161
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_2

    .line 164
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v1

    if-lt v0, v1, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iget-object v1, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    invoke-virtual {v1}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v1

    if-lt v0, v1, :cond_1

    .line 167
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_0

    return-void

    .line 168
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Only Config.ARGB_8888 is supported. Current bitmap config: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Bitmap ia too small, size must be greater than or equal to GIF size"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 162
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Bitmap is recycled"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public getAllocationByteCount()J
    .locals 2

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 102
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getAllocationByteCount()J

    move-result-wide v0

    return-wide v0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 51
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getComment()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDuration()I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 122
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getDuration()I

    move-result v0

    return v0
.end method

.method public getFrameDuration(I)I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 113
    invoke-virtual {v0, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getFrameDuration(I)I

    move-result p1

    return p1
.end method

.method public getHeight()I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 136
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v0

    return v0
.end method

.method public getLoopCount()I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 60
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getLoopCount()I

    move-result v0

    return v0
.end method

.method public getNumberOfFrames()I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 143
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getNumberOfFrames()I

    move-result v0

    return v0
.end method

.method public getSourceLength()J
    .locals 2

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 69
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getSourceLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getWidth()I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 129
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v0

    return v0
.end method

.method public isAnimated()Z
    .locals 2

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 150
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getNumberOfFrames()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifDecoder;->getDuration()I

    move-result v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public recycle()V
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 157
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->recycle()V

    return-void
.end method

.method public seekToFrame(ILandroid/graphics/Bitmap;)V
    .locals 1

    .line 92
    invoke-direct {p0, p2}, Lpl/droidsonroids/gif/GifDecoder;->checkBuffer(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 93
    invoke-virtual {v0, p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->seekToFrame(ILandroid/graphics/Bitmap;)V

    return-void
.end method

.method public seekToTime(ILandroid/graphics/Bitmap;)V
    .locals 1

    .line 80
    invoke-direct {p0, p2}, Lpl/droidsonroids/gif/GifDecoder;->checkBuffer(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lpl/droidsonroids/gif/GifDecoder;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 81
    invoke-virtual {v0, p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->seekToTime(ILandroid/graphics/Bitmap;)V

    return-void
.end method
