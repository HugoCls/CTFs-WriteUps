.class Lcom/instantlabs/instant/ForgotPasswordActivity$1;
.super Ljava/lang/Object;
.source "ForgotPasswordActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/ForgotPasswordActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/instantlabs/instant/ForgotPasswordActivity;


# direct methods
.method constructor <init>(Lcom/instantlabs/instant/ForgotPasswordActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/instantlabs/instant/ForgotPasswordActivity$1;->this$0:Lcom/instantlabs/instant/ForgotPasswordActivity;

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 21
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/instantlabs/instant/ForgotPasswordActivity$1;->this$0:Lcom/instantlabs/instant/ForgotPasswordActivity;

    const-class v1, Lcom/instantlabs/instant/LoginActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v0, p0, Lcom/instantlabs/instant/ForgotPasswordActivity$1;->this$0:Lcom/instantlabs/instant/ForgotPasswordActivity;

    .line 22
    invoke-virtual {v0, p1}, Lcom/instantlabs/instant/ForgotPasswordActivity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/instantlabs/instant/ForgotPasswordActivity$1;->this$0:Lcom/instantlabs/instant/ForgotPasswordActivity;

    .line 23
    invoke-virtual {p1}, Lcom/instantlabs/instant/ForgotPasswordActivity;->finish()V

    return-void
.end method
