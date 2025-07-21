.class Lcom/instantlabs/instant/RegisterActivity$1;
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

.field final synthetic val$email:Landroid/widget/EditText;

.field final synthetic val$password:Landroid/widget/EditText;

.field final synthetic val$pin:Landroid/widget/EditText;

.field final synthetic val$username:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/instantlabs/instant/RegisterActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$1;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    iput-object p2, p0, Lcom/instantlabs/instant/RegisterActivity$1;->val$username:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/instantlabs/instant/RegisterActivity$1;->val$password:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/instantlabs/instant/RegisterActivity$1;->val$email:Landroid/widget/EditText;

    iput-object p5, p0, Lcom/instantlabs/instant/RegisterActivity$1;->val$pin:Landroid/widget/EditText;

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    iget-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$1;->val$username:Landroid/widget/EditText;

    .line 45
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/instantlabs/instant/RegisterActivity$1;->val$password:Landroid/widget/EditText;

    .line 46
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/instantlabs/instant/RegisterActivity$1;->val$email:Landroid/widget/EditText;

    .line 47
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/instantlabs/instant/RegisterActivity$1;->val$pin:Landroid/widget/EditText;

    .line 48
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 49
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/instantlabs/instant/RegisterActivity$1;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    .line 52
    invoke-static {v3, p1, v1, v0, v2}, Lcom/instantlabs/instant/RegisterActivity;->access$000(Lcom/instantlabs/instant/RegisterActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/instantlabs/instant/RegisterActivity$1;->this$0:Lcom/instantlabs/instant/RegisterActivity;

    const-string v0, "Please Fill The Form!"

    const/4 v1, 0x0

    .line 50
    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_1
    return-void
.end method
