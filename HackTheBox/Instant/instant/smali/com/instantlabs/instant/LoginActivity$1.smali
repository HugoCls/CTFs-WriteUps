.class Lcom/instantlabs/instant/LoginActivity$1;
.super Ljava/lang/Object;
.source "LoginActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/LoginActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/instantlabs/instant/LoginActivity;

.field final synthetic val$etPassword:Landroid/widget/EditText;

.field final synthetic val$etUsername:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/instantlabs/instant/LoginActivity;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/instantlabs/instant/LoginActivity$1;->this$0:Lcom/instantlabs/instant/LoginActivity;

    iput-object p2, p0, Lcom/instantlabs/instant/LoginActivity$1;->val$etUsername:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/instantlabs/instant/LoginActivity$1;->val$etPassword:Landroid/widget/EditText;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/instantlabs/instant/LoginActivity$1;->val$etUsername:Landroid/widget/EditText;

    .line 50
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/instantlabs/instant/LoginActivity$1;->val$etPassword:Landroid/widget/EditText;

    .line 51
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 52
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/instantlabs/instant/LoginActivity$1;->this$0:Lcom/instantlabs/instant/LoginActivity;

    .line 55
    invoke-static {v1, p1, v0}, Lcom/instantlabs/instant/LoginActivity;->access$000(Lcom/instantlabs/instant/LoginActivity;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/instantlabs/instant/LoginActivity$1;->this$0:Lcom/instantlabs/instant/LoginActivity;

    const-string v0, "Input required"

    const/4 v1, 0x0

    .line 53
    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_1
    return-void
.end method
