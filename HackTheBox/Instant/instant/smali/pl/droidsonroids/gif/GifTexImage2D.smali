.class public Lpl/droidsonroids/gif/GifTexImage2D;
.super Ljava/lang/Object;
.source "GifTexImage2D.java"


# instance fields
.field private final mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;


# direct methods
.method public constructor <init>(Lpl/droidsonroids/gif/InputSource;Lpl/droidsonroids/gif/GifOptions;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p2, :cond_0

    .line 35
    new-instance p2, Lpl/droidsonroids/gif/GifOptions;

    invoke-direct {p2}, Lpl/droidsonroids/gif/GifOptions;-><init>()V

    .line 37
    :cond_0
    invoke-virtual {p1}, Lpl/droidsonroids/gif/InputSource;->open()Lpl/droidsonroids/gif/GifInfoHandle;

    move-result-object p1

    iput-object p1, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 38
    iget-char v0, p2, Lpl/droidsonroids/gif/GifOptions;->inSampleSize:C

    iget-boolean p2, p2, Lpl/droidsonroids/gif/GifOptions;->inIsOpaque:Z

    invoke-virtual {p1, v0, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->setOptions(CZ)V

    .line 39
    invoke-virtual {p1}, Lpl/droidsonroids/gif/GifInfoHandle;->initTexImageDescriptor()V

    return-void
.end method


# virtual methods
.method protected final finalize()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 158
    :try_start_0
    invoke-virtual {p0}, Lpl/droidsonroids/gif/GifTexImage2D;->recycle()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void

    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 161
    throw v0
.end method

.method public getCurrentFrameIndex()I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 74
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getCurrentFrameIndex()I

    move-result v0

    return v0
.end method

.method public getDuration()I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 152
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getDuration()I

    move-result v0

    return v0
.end method

.method public getFrameDuration(I)I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 50
    invoke-virtual {v0, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->getFrameDuration(I)I

    move-result p1

    return p1
.end method

.method public getHeight()I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 143
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getHeight()I

    move-result v0

    return v0
.end method

.method public getNumberOfFrames()I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 67
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getNumberOfFrames()I

    move-result v0

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 136
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->getWidth()I

    move-result v0

    return v0
.end method

.method public glTexImage2D(II)V
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 95
    invoke-virtual {v0, p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->glTexImage2D(II)V

    return-void
.end method

.method public glTexSubImage2D(II)V
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 106
    invoke-virtual {v0, p1, p2}, Lpl/droidsonroids/gif/GifInfoHandle;->glTexSubImage2D(II)V

    return-void
.end method

.method public recycle()V
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    if-eqz v0, :cond_0

    .line 128
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->recycle()V

    :cond_0
    return-void
.end method

.method public seekToFrame(I)V
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 60
    invoke-virtual {v0, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->seekToFrameGL(I)V

    return-void
.end method

.method public setSpeed(F)V
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 84
    invoke-virtual {v0, p1}, Lpl/droidsonroids/gif/GifInfoHandle;->setSpeedFactor(F)V

    return-void
.end method

.method public startDecoderThread()V
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 113
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->startDecoderThread()V

    return-void
.end method

.method public stopDecoderThread()V
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/GifTexImage2D;->mGifInfoHandle:Lpl/droidsonroids/gif/GifInfoHandle;

    .line 120
    invoke-virtual {v0}, Lpl/droidsonroids/gif/GifInfoHandle;->stopDecoderThread()V

    return-void
.end method
