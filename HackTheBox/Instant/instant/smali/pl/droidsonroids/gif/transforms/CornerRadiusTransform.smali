.class public Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;
.super Ljava/lang/Object;
.source "CornerRadiusTransform.java"

# interfaces
.implements Lpl/droidsonroids/gif/transforms/Transform;


# instance fields
.field private mCornerRadius:F

.field private final mDstRectF:Landroid/graphics/RectF;

.field private mShader:Landroid/graphics/Shader;


# direct methods
.method public constructor <init>(F)V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    .line 28
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->setCornerRadiusSafely(F)V

    return-void
.end method

.method private setCornerRadiusSafely(F)V
    .locals 1

    const/4 v0, 0x0

    .line 41
    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iget v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    iput p1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    const/4 p1, 0x0

    iput-object p1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    :cond_0
    return-void
.end method


# virtual methods
.method public getBounds()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getCornerRadius()F
    .locals 1

    iget v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    return v0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1

    iget-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    .line 68
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroid/graphics/Paint;Landroid/graphics/Bitmap;)V
    .locals 3

    iget v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    iget-object v1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    .line 75
    invoke-virtual {p1, p3, v0, v1, p2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void

    :cond_0
    iget-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    if-nez v0, :cond_1

    .line 79
    new-instance v0, Landroid/graphics/BitmapShader;

    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, p3, v1, v2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    .line 80
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iget-object v1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    .line 81
    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->setTranslate(FF)V

    iget-object v1, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    .line 82
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget-object v2, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    int-to-float p3, p3

    div-float/2addr v2, p3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    iget-object p3, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    .line 83
    invoke-virtual {p3, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    :cond_1
    iget-object p3, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mShader:Landroid/graphics/Shader;

    .line 85
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget-object p3, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mDstRectF:Landroid/graphics/RectF;

    iget v0, p0, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->mCornerRadius:F

    .line 86
    invoke-virtual {p1, p3, v0, v0, p2}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public setCornerRadius(F)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lpl/droidsonroids/gif/transforms/CornerRadiusTransform;->setCornerRadiusSafely(F)V

    return-void
.end method
