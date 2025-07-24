.class Lcom/instantlabs/instant/RegisterActivity$2;
.super Ljava/lang/Object;
.source "RegisterActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/RegisterActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/instantlabs/instant/RegisterActivity;


# direct methods
.method constructor <init>(Lcom/instantlabs/instant/RegisterActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$2;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 60
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/instantlabs/instant/RegisterActivity$2;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    const-class v1, Lcom/instantlabs/instant/LoginActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v0, p0, Lcom/instantlabs/instant/RegisterActivity$2;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    .line 61
    invoke-virtual {v0, p1}, Lcom/instantlabs/instant/RegisterActivity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$2;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    .line 62
    invoke-virtual {p1}, Lcom/instantlabs/instant/RegisterActivity;->finish()V

    return-void
.end method
