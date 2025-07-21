.class Lcom/instantlabs/instant/ProfileActivity$2;
.super Ljava/lang/Object;
.source "ProfileActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/ProfileActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/instantlabs/instant/ProfileActivity;


# direct methods
.method constructor <init>(Lcom/instantlabs/instant/ProfileActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/instantlabs/instant/ProfileActivity$2;->this$0:Lcom/instantlabs/instant/ProfileActivity;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 102
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/instantlabs/instant/ProfileActivity$2;->this$0:Lcom/instantlabs/instant/ProfileActivity;

    const-class v1, Lcom/instantlabs/instant/TransactionActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v0, p0, Lcom/instantlabs/instant/ProfileActivity$2;->this$0:Lcom/instantlabs/instant/ProfileActivity;

    .line 103
    invoke-virtual {v0, p1}, Lcom/instantlabs/instant/ProfileActivity;->startActivity(Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/instantlabs/instant/ProfileActivity$2;->this$0:Lcom/instantlabs/instant/ProfileActivity;

    .line 104
    invoke-virtual {p1}, Lcom/instantlabs/instant/ProfileActivity;->finish()V

    return-void
.end method
