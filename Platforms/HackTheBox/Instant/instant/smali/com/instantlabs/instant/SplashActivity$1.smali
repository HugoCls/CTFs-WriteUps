.class Lcom/instantlabs/instant/SplashActivity$1;
.super Ljava/lang/Object;
.source "SplashActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/SplashActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/instantlabs/instant/SplashActivity;


# direct methods
.method constructor <init>(Lcom/instantlabs/instant/SplashActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/instantlabs/instant/SplashActivity$1;->this$0:Lcom/instantlabs/instant/SplashActivity;

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 19
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/instantlabs/instant/SplashActivity$1;->this$0:Lcom/instantlabs/instant/SplashActivity;

    const-class v2, Lcom/instantlabs/instant/LoginActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/instantlabs/instant/SplashActivity$1;->this$0:Lcom/instantlabs/instant/SplashActivity;

    .line 20
    invoke-virtual {v1, v0}, Lcom/instantlabs/instant/SplashActivity;->startActivity(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/instantlabs/instant/SplashActivity$1;->this$0:Lcom/instantlabs/instant/SplashActivity;

    .line 21
    invoke-virtual {v0}, Lcom/instantlabs/instant/SplashActivity;->finish()V

    return-void
.end method
