.class Lcom/instantlabs/instant/TransactionActivity$1;
.super Ljava/lang/Object;
.source "TransactionActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/instantlabs/instant/TransactionActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/instantlabs/instant/TransactionActivity;

.field final synthetic val$access_token:Ljava/lang/String;

.field final synthetic val$amount:Landroid/widget/EditText;

.field final synthetic val$pin:Landroid/widget/EditText;

.field final synthetic val$reason:Landroid/widget/EditText;

.field final synthetic val$wallet_id:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/instantlabs/instant/TransactionActivity;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Landroid/widget/EditText;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/instantlabs/instant/TransactionActivity$1;->this$0:Lcom/instantlabs/instant/TransactionActivity;

    iput-object p2, p0, Lcom/instantlabs/instant/TransactionActivity$1;->val$wallet_id:Landroid/widget/EditText;

    iput-object p3, p0, Lcom/instantlabs/instant/TransactionActivity$1;->val$amount:Landroid/widget/EditText;

    iput-object p4, p0, Lcom/instantlabs/instant/TransactionActivity$1;->val$reason:Landroid/widget/EditText;

    iput-object p5, p0, Lcom/instantlabs/instant/TransactionActivity$1;->val$pin:Landroid/widget/EditText;

    iput-object p6, p0, Lcom/instantlabs/instant/TransactionActivity$1;->val$access_token:Ljava/lang/String;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    iget-object p1, p0, Lcom/instantlabs/instant/TransactionActivity$1;->val$wallet_id:Landroid/widget/EditText;

    .line 52
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object p1, p0, Lcom/instantlabs/instant/TransactionActivity$1;->val$amount:Landroid/widget/EditText;

    .line 53
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object p1, p0, Lcom/instantlabs/instant/TransactionActivity$1;->val$reason:Landroid/widget/EditText;

    .line 54
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object p1, p0, Lcom/instantlabs/instant/TransactionActivity$1;->val$pin:Landroid/widget/EditText;

    .line 55
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 57
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/instantlabs/instant/TransactionActivity$1;->this$0:Lcom/instantlabs/instant/TransactionActivity;

    iget-object v4, p0, Lcom/instantlabs/instant/TransactionActivity$1;->val$access_token:Ljava/lang/String;

    .line 60
    invoke-static/range {v0 .. v5}, Lcom/instantlabs/instant/TransactionActivity;->access$000(Lcom/instantlabs/instant/TransactionActivity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/instantlabs/instant/TransactionActivity$1;->this$0:Lcom/instantlabs/instant/TransactionActivity;

    const-string v0, "Input Required"

    const/4 v1, 0x0

    .line 58
    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :goto_1
    return-void
.end method
