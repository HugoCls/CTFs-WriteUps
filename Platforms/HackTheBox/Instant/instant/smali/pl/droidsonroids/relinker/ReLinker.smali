.class public Lpl/droidsonroids/relinker/ReLinker;
.super Ljava/lang/Object;
.source "ReLinker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lpl/droidsonroids/relinker/ReLinker$LibraryInstaller;,
        Lpl/droidsonroids/relinker/ReLinker$LibraryLoader;,
        Lpl/droidsonroids/relinker/ReLinker$Logger;,
        Lpl/droidsonroids/relinker/ReLinker$LoadListener;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static force()Lpl/droidsonroids/relinker/ReLinkerInstance;
    .locals 1

    .line 74
    new-instance v0, Lpl/droidsonroids/relinker/ReLinkerInstance;

    invoke-direct {v0}, Lpl/droidsonroids/relinker/ReLinkerInstance;-><init>()V

    invoke-virtual {v0}, Lpl/droidsonroids/relinker/ReLinkerInstance;->force()Lpl/droidsonroids/relinker/ReLinkerInstance;

    move-result-object v0

    return-object v0
.end method

.method public static loadLibrary(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 51
    invoke-static {p0, p1, v0, v0}, Lpl/droidsonroids/relinker/ReLinker;->loadLibrary(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lpl/droidsonroids/relinker/ReLinker$LoadListener;)V

    return-void
.end method

.method public static loadLibrary(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 57
    invoke-static {p0, p1, p2, v0}, Lpl/droidsonroids/relinker/ReLinker;->loadLibrary(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lpl/droidsonroids/relinker/ReLinker$LoadListener;)V

    return-void
.end method

.method public static loadLibrary(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lpl/droidsonroids/relinker/ReLinker$LoadListener;)V
    .locals 1

    .line 70
    new-instance v0, Lpl/droidsonroids/relinker/ReLinkerInstance;

    invoke-direct {v0}, Lpl/droidsonroids/relinker/ReLinkerInstance;-><init>()V

    invoke-virtual {v0, p0, p1, p2, p3}, Lpl/droidsonroids/relinker/ReLinkerInstance;->loadLibrary(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lpl/droidsonroids/relinker/ReLinker$LoadListener;)V

    return-void
.end method

.method public static loadLibrary(Landroid/content/Context;Ljava/lang/String;Lpl/droidsonroids/relinker/ReLinker$LoadListener;)V
    .locals 1

    const/4 v0, 0x0

    .line 63
    invoke-static {p0, p1, v0, p2}, Lpl/droidsonroids/relinker/ReLinker;->loadLibrary(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lpl/droidsonroids/relinker/ReLinker$LoadListener;)V

    return-void
.end method

.method public static log(Lpl/droidsonroids/relinker/ReLinker$Logger;)Lpl/droidsonroids/relinker/ReLinkerInstance;
    .locals 1

    .line 78
    new-instance v0, Lpl/droidsonroids/relinker/ReLinkerInstance;

    invoke-direct {v0}, Lpl/droidsonroids/relinker/ReLinkerInstance;-><init>()V

    invoke-virtual {v0, p0}, Lpl/droidsonroids/relinker/ReLinkerInstance;->log(Lpl/droidsonroids/relinker/ReLinker$Logger;)Lpl/droidsonroids/relinker/ReLinkerInstance;

    move-result-object p0

    return-object p0
.end method

.method public static recursively()Lpl/droidsonroids/relinker/ReLinkerInstance;
    .locals 1

    .line 82
    new-instance v0, Lpl/droidsonroids/relinker/ReLinkerInstance;

    invoke-direct {v0}, Lpl/droidsonroids/relinker/ReLinkerInstance;-><init>()V

    invoke-virtual {v0}, Lpl/droidsonroids/relinker/ReLinkerInstance;->recursively()Lpl/droidsonroids/relinker/ReLinkerInstance;

    move-result-object v0

    return-object v0
.end method
