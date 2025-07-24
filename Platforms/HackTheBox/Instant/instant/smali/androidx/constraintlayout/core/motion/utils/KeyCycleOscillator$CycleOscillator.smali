.class Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;
.super Ljava/lang/Object;
.source "KeyCycleOscillator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CycleOscillator"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "CycleOscillator"

.field static final UNSET:I = -0x1


# instance fields
.field private final OFFST:I

.field private final PHASE:I

.field private final VALUE:I

.field mCurveFit:Landroidx/constraintlayout/core/motion/utils/CurveFit;

.field mOffset:[F

.field mOscillator:Landroidx/constraintlayout/core/motion/utils/Oscillator;

.field mPathLength:F

.field mPeriod:[F

.field mPhase:[F

.field mPosition:[D

.field mScale:[F

.field mSplineSlopeCache:[D

.field mSplineValueCache:[D

.field mValues:[F

.field private final mVariesBy:I

.field mWaveShape:I


# direct methods
.method constructor <init>(ILjava/lang/String;II)V
    .locals 2

    .line 320
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 303
    new-instance v0, Landroidx/constraintlayout/core/motion/utils/Oscillator;

    invoke-direct {v0}, Landroidx/constraintlayout/core/motion/utils/Oscillator;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOscillator:Landroidx/constraintlayout/core/motion/utils/Oscillator;

    const/4 v1, 0x0

    iput v1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->OFFST:I

    const/4 v1, 0x1

    iput v1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->PHASE:I

    const/4 v1, 0x2

    iput v1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->VALUE:I

    iput p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mWaveShape:I

    iput p3, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mVariesBy:I

    .line 323
    invoke-virtual {v0, p1, p2}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->setType(ILjava/lang/String;)V

    .line 324
    new-array p1, p4, [F

    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mValues:[F

    .line 325
    new-array p1, p4, [D

    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPosition:[D

    .line 326
    new-array p1, p4, [F

    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPeriod:[F

    .line 327
    new-array p1, p4, [F

    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOffset:[F

    .line 328
    new-array p1, p4, [F

    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPhase:[F

    .line 329
    new-array p1, p4, [F

    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mScale:[F

    return-void
.end method


# virtual methods
.method public getLastPhase()D
    .locals 3

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineValueCache:[D

    const/4 v1, 0x1

    .line 348
    aget-wide v1, v0, v1

    return-wide v1
.end method

.method public getSlope(F)D
    .locals 13

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mCurveFit:Landroidx/constraintlayout/core/motion/utils/CurveFit;

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    float-to-double v4, p1

    iget-object v6, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineSlopeCache:[D

    .line 353
    invoke-virtual {v0, v4, v5, v6}, Landroidx/constraintlayout/core/motion/utils/CurveFit;->getSlope(D[D)V

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mCurveFit:Landroidx/constraintlayout/core/motion/utils/CurveFit;

    iget-object v6, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineValueCache:[D

    .line 354
    invoke-virtual {v0, v4, v5, v6}, Landroidx/constraintlayout/core/motion/utils/CurveFit;->getPos(D[D)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineSlopeCache:[D

    const-wide/16 v4, 0x0

    .line 356
    aput-wide v4, v0, v1

    .line 357
    aput-wide v4, v0, v3

    .line 358
    aput-wide v4, v0, v2

    :goto_0
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOscillator:Landroidx/constraintlayout/core/motion/utils/Oscillator;

    float-to-double v5, p1

    iget-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineValueCache:[D

    .line 360
    aget-wide v7, p1, v3

    invoke-virtual {v0, v5, v6, v7, v8}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->getValue(DD)D

    move-result-wide v11

    iget-object v4, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOscillator:Landroidx/constraintlayout/core/motion/utils/Oscillator;

    iget-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineValueCache:[D

    .line 361
    aget-wide v7, p1, v3

    iget-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineSlopeCache:[D

    aget-wide v9, p1, v3

    invoke-virtual/range {v4 .. v10}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->getSlope(DDD)D

    move-result-wide v3

    iget-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineSlopeCache:[D

    .line 362
    aget-wide v0, p1, v1

    aget-wide v5, p1, v2

    mul-double/2addr v11, v5

    add-double/2addr v0, v11

    iget-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineValueCache:[D

    aget-wide v5, p1, v2

    mul-double/2addr v3, v5

    add-double/2addr v0, v3

    return-wide v0
.end method

.method public getValues(F)D
    .locals 9

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mCurveFit:Landroidx/constraintlayout/core/motion/utils/CurveFit;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    float-to-double v4, p1

    iget-object v6, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineValueCache:[D

    .line 334
    invoke-virtual {v0, v4, v5, v6}, Landroidx/constraintlayout/core/motion/utils/CurveFit;->getPos(D[D)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineValueCache:[D

    iget-object v4, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOffset:[F

    .line 336
    aget v4, v4, v3

    float-to-double v4, v4

    aput-wide v4, v0, v3

    iget-object v4, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPhase:[F

    .line 337
    aget v4, v4, v3

    float-to-double v4, v4

    aput-wide v4, v0, v2

    iget-object v4, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mValues:[F

    .line 338
    aget v4, v4, v3

    float-to-double v4, v4

    aput-wide v4, v0, v1

    :goto_0
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineValueCache:[D

    .line 341
    aget-wide v3, v0, v3

    .line 342
    aget-wide v5, v0, v2

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOscillator:Landroidx/constraintlayout/core/motion/utils/Oscillator;

    float-to-double v7, p1

    .line 343
    invoke-virtual {v0, v7, v8, v5, v6}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->getValue(DD)D

    move-result-wide v5

    iget-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineValueCache:[D

    .line 344
    aget-wide v0, p1, v1

    mul-double/2addr v5, v0

    add-double/2addr v3, v5

    return-wide v3
.end method

.method public setPoint(IIFFFF)V
    .locals 5

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPosition:[D

    int-to-double v1, p2

    const-wide/high16 v3, 0x4059000000000000L    # 100.0

    div-double/2addr v1, v3

    .line 373
    aput-wide v1, v0, p1

    iget-object p2, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPeriod:[F

    .line 374
    aput p3, p2, p1

    iget-object p2, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOffset:[F

    .line 375
    aput p4, p2, p1

    iget-object p2, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPhase:[F

    .line 376
    aput p5, p2, p1

    iget-object p2, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mValues:[F

    .line 377
    aput p6, p2, p1

    return-void
.end method

.method public setup(F)V
    .locals 9

    iput p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPathLength:F

    iget-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPosition:[D

    .line 382
    array-length p1, p1

    const/4 v0, 0x3

    filled-new-array {p1, v0}, [I

    move-result-object p1

    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v0, p1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [[D

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mValues:[F

    .line 383
    array-length v1, v0

    const/4 v2, 0x2

    add-int/2addr v1, v2

    new-array v1, v1, [D

    iput-object v1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineValueCache:[D

    .line 384
    array-length v0, v0

    add-int/2addr v0, v2

    new-array v0, v0, [D

    iput-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mSplineSlopeCache:[D

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPosition:[D

    const/4 v1, 0x0

    .line 385
    aget-wide v3, v0, v1

    const-wide/16 v5, 0x0

    cmpl-double v0, v3, v5

    if-lez v0, :cond_0

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOscillator:Landroidx/constraintlayout/core/motion/utils/Oscillator;

    iget-object v3, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPeriod:[F

    .line 386
    aget v3, v3, v1

    invoke-virtual {v0, v5, v6, v3}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->addPoint(DF)V

    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPosition:[D

    .line 388
    array-length v3, v0

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    .line 389
    aget-wide v5, v0, v3

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    cmpg-double v0, v5, v7

    if-gez v0, :cond_1

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOscillator:Landroidx/constraintlayout/core/motion/utils/Oscillator;

    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPeriod:[F

    .line 390
    aget v3, v5, v3

    invoke-virtual {v0, v7, v8, v3}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->addPoint(DF)V

    :cond_1
    move v0, v1

    .line 393
    :goto_0
    array-length v3, p1

    if-ge v0, v3, :cond_2

    .line 394
    aget-object v3, p1, v0

    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOffset:[F

    aget v5, v5, v0

    float-to-double v5, v5

    aput-wide v5, v3, v1

    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPhase:[F

    .line 395
    aget v5, v5, v0

    float-to-double v5, v5

    aput-wide v5, v3, v4

    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mValues:[F

    .line 396
    aget v5, v5, v0

    float-to-double v5, v5

    aput-wide v5, v3, v2

    iget-object v3, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOscillator:Landroidx/constraintlayout/core/motion/utils/Oscillator;

    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPosition:[D

    .line 397
    aget-wide v6, v5, v0

    iget-object v5, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPeriod:[F

    aget v5, v5, v0

    invoke-virtual {v3, v6, v7, v5}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->addPoint(DF)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mOscillator:Landroidx/constraintlayout/core/motion/utils/Oscillator;

    .line 401
    invoke-virtual {v0}, Landroidx/constraintlayout/core/motion/utils/Oscillator;->normalize()V

    iget-object v0, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mPosition:[D

    .line 402
    array-length v2, v0

    if-le v2, v4, :cond_3

    .line 403
    invoke-static {v1, v0, p1}, Landroidx/constraintlayout/core/motion/utils/CurveFit;->get(I[D[[D)Landroidx/constraintlayout/core/motion/utils/CurveFit;

    move-result-object p1

    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mCurveFit:Landroidx/constraintlayout/core/motion/utils/CurveFit;

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    iput-object p1, p0, Landroidx/constraintlayout/core/motion/utils/KeyCycleOscillator$CycleOscillator;->mCurveFit:Landroidx/constraintlayout/core/motion/utils/CurveFit;

    :goto_1
    return-void
.end method
